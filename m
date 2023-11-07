Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0D4C04A68
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.43])
 by mx.groups.io with SMTP id smtpd.web10.5509.1699341172828518943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=rduOJWGP;
 spf=pass (domain: axis.com, ip: 40.107.104.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfidQkJ3LgxOAtor9q4/+7HJYDfCXpxu9r41DB4nspK68BXwJqWs8Lx8svaztQqMABHkC6wAKNgdyVfwqBfEDeC55wYd+a7wHMPOjaViU5IeZQ84svkCtGRSCGGe+6pNfpVddy5h8A1XmDQHLDaHNhkjt4m8SO6+liztZ9J+Nd3KkOil0Is3NVTL6TL4SVe/3OILkfEmcUYnJ4NUfEcYdD1Di/Fce/yfeGRcxIRKsq8DM/xffAVDeFg0OPSlfdxnnjdaL1kTVmKZjBfvr8wz6RmKIgzAMy7KDWgUgxn9cvNcoT8kxmFIGDb0aPlneNAxnd4g7MkGJbYlcZFdMeyicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stWtmCLbK4Dek0/OgHSEzTxY5DsVmfyo/GfZh/FIj4A=;
 b=GeJ72xz+lDVgPzLHPcvRK//w5SSWpXDPmUKpt7jcR2/vQEtXdsz+IHm2qoO6svPX2utWHGr4V6S99UbO4sHW2N8lwChd3dzrXDICewyjRLP0Alh6z/GQlqvkRvpKaA7A99e/BgDe35Fas6PrNYWNcLLIqKz6dYItasyCdsuM9kB6ocVlLP+e3foMczp9rG8OVpsXQT31BojWp9u9YOXoxQhSfS+x/5/GQblQkRa3+cgc4Rk+WzghK0N0J+8QsdfRnO+0CqKM7CGSmUuz+VwpV3tMn9q2SNULxSKHogyF3Cd+odtFAaqY3j6XXfVGgwY254YIUcs9sZHlysswekk2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stWtmCLbK4Dek0/OgHSEzTxY5DsVmfyo/GfZh/FIj4A=;
 b=rduOJWGPzw+m4MaRWS8F+37Q3XJ2hrVJHBWCCFkY+yw7JbpaQJTv02Tf4deGkwuEHoKGiE4oOCzxKUEhX9yF8srF3bYSVfxvF9zxSDCGKyB66o92Nd0i8UlIWx7vfMLybMLLuzal3UWo8s42SR2WINnfdvWJ3WrLYz6ho28EoX4=
Received: from AS9PR06CA0716.eurprd06.prod.outlook.com (2603:10a6:20b:49f::24)
 by AS4PR02MB10360.eurprd02.prod.outlook.com (2603:10a6:20b:4f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 07:12:50 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::37) by AS9PR06CA0716.outlook.office365.com
 (2603:10a6:20b:49f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:12:49 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:48 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:48 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E2271FBD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:48 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77Cmsu1519695
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:48 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77Cml01519694
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:48 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 01/16] jack: Revert to 1.9.22
Date: Tue, 7 Nov 2023 08:12:25 +0100
Message-ID: <20231107071240.1519631-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|AS4PR02MB10360:EE_
X-MS-Office365-Filtering-Correlation-Id: d5150f9a-4625-4ebf-c7b4-08dbdf60f343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vsLRosY66EQK1E0FxnwNf6LL8qiGbaxRd9oI1HZdQeIe9eOJqQUuazX9iT5gA+JuSEy+F6BXMogcwc3hOhC7/DvZ1pwNKoYtqFS+ALJ92Jcdkfjo/O9Da4VrB0/qpw8IDRDb6GOBk/EDU19u6DJBc1cEIuJO63l+W0FWNE7Jvo5CCqy1SrTzQU9uTyRHq1ixK4/BaSvN4ck15vNtAX3ZtF9qyNJqHlyVwixAEvuw4RUtpRINR9kfkZ6y7QJMvZMF9d7/gdkHuYFK6faUYEHho7cs8a3/EvLkb5G2Kzb7GUtCZnX4JFIopHLnaV3ERECJ3ix0K4ydxdD3XE9cM2Oxy0gZ0LeK0foo88sJUjLWapO6h2EZUVvtKWG/2ocpFqNheLbaiG5uYEyxXzpvNn2zhUUhD9IJKER7U0SQv27FKNTbUG0FiZAiHEy4Eh1fv2je/XhUrFxUpyWAm++QboCzipYXFBrTL1mI1R4hVGN6x7UFi4oQ9TnVMBrRzpDas1q0yc1lF8PHWwzFxU5RHJsrgDnmjBhkS6idlC4dtuLIXHwXSOq4ohOs6TrSK3SZdqVnZWW2Z7gRf7eWARkeBlIfNkFYp7cdsNSAg5nbylkCGpXyrjxhcZFtIttoVKBQnVbJ/4AH/RPlZjAZKQqHzkrVViVSNO4VBfhvpOqqa3q1+L9VPY6IJvej4COoJTQX35UJLoGcEPLHFduEtI//4BNTbPUOZA50m8S4WsjPs2iJa+jQQLkgQh+UtG7kMi0X4DvBA/Yeg7VMLORNtqy1jR1+0g==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(336012)(426003)(6666004)(2616005)(26005)(47076005)(41300700001)(1076003)(356005)(81166007)(36756003)(82740400003)(5660300002)(2906002)(83380400001)(36860700001)(8676002)(8936002)(6916009)(70586007)(478600001)(42186006)(316002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:49.3904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5150f9a-4625-4ebf-c7b4-08dbdf60f343
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB10360
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106424

There is no version "2". The tag "jack2-control-api-relicense-nedko"
incorrectly triggered AUH to identify it as version "2". Additionally,
the previous recipe version "1.19.22" was also incorrect. It should
actually have been "1.9.22".

License-Update: Update the licenses based on analysis of the code
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../jack/{jack_2.bb =3D> jack_1.9.22.bb}          | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-multimedia/jack/{jack_2.bb =3D> jack_1.9.22.bb} (67=
%)

diff --git a/meta-oe/recipes-multimedia/jack/jack_2.bb b/meta-oe/recipes-mu=
ltimedia/jack/jack_1.9.22.bb
similarity index 67%
rename from meta-oe/recipes-multimedia/jack/jack_2.bb
rename to meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
index 1d197b32c..b5c52a6ed 100644
--- a/meta-oe/recipes-multimedia/jack/jack_2.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
@@ -6,15 +6,20 @@ flow model and lock-free programming techniques for graph=
 access have \
 been used to have a more dynamic and robust system."
 SECTION =3D "libs/multimedia"
=20
-LICENSE =3D "GPL-2.0-or-later | LGPL-2.1-or-later | MIT | AFL-2.1"
-LIC_FILES_CHKSUM =3D "file://common/jack/control.h;beginline=3D2;endline=
=3D21;md5=3D9edb8b99b7a0dcd49dbf8741444f123d \
-                    file://common/jack/jack.h;beginline=3D1;endline=3D19;m=
d5=3D6b736ed6b810592b135480a5e853392e \
-                    "
+LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D " \
+    file://common/JackControlAPI.cpp;beginline=3D5;endline=3D19;md5=3D9d19=
21199e203163f160313243f853d6 \
+    file://common/JackControlAPI.h;beginline=3D4;endline=3D18;md5=3D9d1921=
199e203163f160313243f853d6 \
+    file://common/jack/jack.h;beginline=3D2;endline=3D17;md5=3D0a668d22ce6=
61159cad28d1c3b8e66af \
+    file://common/JackServer.h;beginline=3D2;endline=3D17;md5=3D9bf0870727=
804a994ee2d19fd368d940 \
+"
=20
 DEPENDS =3D "libsamplerate0 libsndfile1"
=20
-SRC_URI =3D "git://github.com/jackaudio/jack2.git;branch=3Ddevelop;protoco=
l=3Dhttps"
-SRCREV =3D "520dfa0ac5a72d292f5b9fc5835926f925129764"
+SRC_URI =3D "git://github.com/jackaudio/jack2.git;branch=3Dmaster;protocol=
=3Dhttps"
+SRCREV =3D "4f58969432339a250ce87fe855fb962c67d00ddb"
+
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 S =3D "${WORKDIR}/git"
=20

