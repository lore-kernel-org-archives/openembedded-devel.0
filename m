Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5235C4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web11.5148.1699341186160309680
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=VsuGvgQh;
 spf=pass (domain: axis.com, ip: 40.107.20.53, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfuVQkLDM6GzR0teYN0eKBqdI++nI4XQtaTbe9O+VvjFQzHrOlGMZ3kfqDyJEVilXwb+KEQeeZKrXcFDmRnlB6rjdJi+/RM2xC/KeTq0MebkaKheew2NYsi7C9f4C0gL8PBE+nRVJqIpcQWotRBjhA4j52c6quyM8jtBLBLQ32ii7YbxoFEMvrjysHChDspA8Ik5N9c1AiF2d8gJxq+B2k4RBlILCgAroNX0nOwdOyshfjOZL403lJqzddOBLDNlF7MnJx5tKPoRIEbtx3XyZhOhqKt+Zw2RmHTwCAcj8NE0SwvtekDzhlbV0QZRK1Qmzc+lCxpe4+oPg5XS1UyGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQqmAipmtmY5JnIbKZKBPqH4zL1zwN28BD0xgqserII=;
 b=QAYrYpfF17nHQREdFgQsqeIb9lcFAc7bkTTNmjaMWIq8HdXTPUqbMQZXXsX5Fh/+10q+MP67ce44wEyg/aziFBs0pTEOvFP5sikPUgdAa0ddlUScpV9MtqVxMAq5jw7rz/VXbZMMNei04ExkTsb9ga62u2rDo8uT5ah3fblb3/9EqysMWQAmHO5gQmQSykxvbeeuD7IsGpk/c2vekM46AZC0mTZUwz+/adem3KTrgIgqDV9AiDtu0uBVI5CH/NxDcZFxYaw84ToVYL0MfDNIMydOtriw6jBdaiSG0KbqoXid9+okA+49Jc3JG/2sEDnEam1aZp/uKJUJvvlab121Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQqmAipmtmY5JnIbKZKBPqH4zL1zwN28BD0xgqserII=;
 b=VsuGvgQhgY0QcD6NVzBk9wuXziJ5s4w+7oZ7GitJ/ibxe0GAuOmsHHU9Co2G9cu1ngaGDwgkuW3RECT0DqVewNEHkdWrScdocvqJ++enVH0nvvaWuJU9Z9fa+jh6gVoLrzlXyLURsq49EC6cHfZbVJTvD8W0wRfKAQK6iSAGk+0=
Received: from AS9PR06CA0719.eurprd06.prod.outlook.com (2603:10a6:20b:49f::23)
 by PA6PR02MB10738.eurprd02.prod.outlook.com (2603:10a6:102:3cf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 07:13:03 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::22) by AS9PR06CA0719.outlook.office365.com
 (2603:10a6:20b:49f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:13:03 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:50 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:50 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 662CFFBD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CoYB1519738
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CoG91519737
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 11/16] xarchiver: Specify the version in the recipe file name
Date: Tue, 7 Nov 2023 08:12:35 +0100
Message-ID: <20231107071240.1519631-11-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|PA6PR02MB10738:EE_
X-MS-Office365-Filtering-Correlation-Id: 6209665d-9ad1-42d6-a5f7-08dbdf60fb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zdpx+Vd8p+2pW/pvQYDagM8cQ0RTlrTq9DhDXgjPb+j1v5r2UCzrhaO/oxxP7D424tBGqII32DUMn1JYrxU6jL32VsN8pBKTt+qApSEEa++KZqxqD0OJzjaqnBQEbQtPX3V6MtdDilAIGWKWaXovudDC+PuIJyHEaCKRl90krd8LAVfaYzwmz+Tp2gTI5t533uuhEFHUSj+R88ttGM/MeNfbOxplSw6ShhpFB2Muoy6mwsqfjo6gxH4Wf07US/WGhPLB5gzdYogIOUzXPNCq/db2RaE5XSGPPAHy0bsq6dNLSBVJGBOvMM8oAenTzuRn5Sa+TE2IPHMUFu0B/CXVKbdRR4q1z/WWXc5PjpgZspjXNbU8VX2b4ohyZ5MWG2Nrhf/8ULvQDQss0VrLHNt9nyTXMWL5kPIWhg4Lu3ImKdEI31p10AA1b5RVy8B1iDkvCOwOAQS25vLSfkDww8dlvW4zzQI1fBklmt5UXvDkmuTdwP7fwWxinwSbEyhcwfPBP2U8ZBSwZJSeHaMlbLPLecki1ynXUmEx5MhMlKg5eaHW7p4+dBqlet4l3b7mUA5mBbJte/dqZVHa12dcM53O+pOnuHyo6BkBurMIsLfIlD/PVjO8UOs50pUxGKaV8fm8gq8UsOzrqO9Wc+71LPpav7f7RUyCQ1WZxiPJEgQ0vd8eTvlS2okrJxxQf9bp8pL/imZwy96a0BSqUssgjUBeJLt9zZToxBben/Ni5sdAMaBW7wkNyySG+Wr5rCaW2eZdnXdQ7ROrYo0U7cHnCFyjmg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(40480700001)(2906002)(356005)(8676002)(81166007)(36860700001)(5660300002)(83380400001)(47076005)(8936002)(41300700001)(40460700003)(336012)(426003)(82740400003)(70206006)(70586007)(2616005)(1076003)(316002)(42186006)(6916009)(6666004)(26005)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:13:03.3749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6209665d-9ad1-42d6-a5f7-08dbdf60fb99
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10738
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106435

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../xarchiver/{xarchiver_git.bb =3D> xarchiver_0.5.4.21.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xarchiver/{xarchiver_git.bb =3D> xarchiver_0=
.5.4.21.bb} (98%)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/=
recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
similarity index 98%
rename from meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
rename to meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
index e325e5d02..abb5c14e6 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "gtk+3 glib-2.0 xfce4-dev-tools-native intltool=
-native"
=20
 SRC_URI =3D "git://github.com/ib/xarchiver.git;branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "55f923ebc623bcc8f53368543847350a23688189"
-PV =3D "0.5.4.21"
+
 S =3D "${WORKDIR}/git"
=20
 inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-xdg

