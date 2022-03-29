Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACEAC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 08:46:02 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.112])
 by mx.groups.io with SMTP id smtpd.web08.4285.1648543559140640272
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=go9F56OF;
 spf=pass (domain: arri.de, ip: 40.107.15.112, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9PNDTE57u9l58HqMoqocLG7WjnxGJIHawXRnLo1/1qlWsBZSVX8ltqehvUNLgP4rCUb+bWCk6Dl8K4B8U6P34kNniHcz0jFBFS1Uk+YF6O1Zbblj+biEsZ5YsLv2Q2Nwb8aHfT8TT1D4ZtyoM9NVpQh17oYl6rRT82cOLf7WVqZPDytuxNOP4ZkTHhLSN/1v71MWKXkpg/8K8IOQ2ybAbSdzA/3l6tB7//9DPInVVLgICdBzY3PLRYQHzytUUVTPEim9TP5Y+BGJW9JpGSJnHgTjMi2PsX/6Gjnd88ojv1XngFfaUOVj7NGItAbW3KJKIDr+L6BpCjPQIzbNelHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3iF0Jv1ERnj3MDSJ3Sxdz4eqvYJpjJieIoL7EtfM5g=;
 b=ZYRBYfp1I1Q3zype86Yk3wUqSbutdasDwlJlZiS08yF23FtUlWZxWHyiRdqGe/GSFaWNa/IgYXACGo3kciV9oaCKZSvT9XyrF99P9y28w+NczHQuJXbxHPpY7nMSjbKlF4iWAN0e490eR3gRBY4cpM01Tqmd86mejlWkc2nIZpAneDJcGEua5ux0SxQB8EKJ/k6i+fCXzplpNwZfGQwguUeZ1m/72kjhByJw4KICko3AxtTcZ2E1Bc74gTPXjphdo/FrcQeLvG+RXO6pEOI/IbEGhYV8Vt6DVlrNBhaNOGjxtpKd8P1FxqwysN2Jq1Kckq626d46ZR5d8flgQ6b5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3iF0Jv1ERnj3MDSJ3Sxdz4eqvYJpjJieIoL7EtfM5g=;
 b=go9F56OF+fRLfHXd7rcRMcw4OpXUJwhf/BY4dfrCRI2VkVQLJHbYMEQTnoGWojdK2VRzH06Or+yARBHUdYLo5sNb+A8edUGZyHzu6afu9J/PV/8guK+1A12MysUKDJ3zFe5Awoc8NsPsyYAJ2ijXsc98mQ35K/QbnPP8C0NqlQk=
Received: from SV0P279CA0004.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::9) by
 AM0PR0702MB3732.eurprd07.prod.outlook.com (2603:10a6:208:26::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.12; Tue, 29 Mar
 2022 08:45:56 +0000
Received: from HE1EUR02FT041.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::67) by SV0P279CA0004.outlook.office365.com
 (2603:10a6:f10:11::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Tue, 29 Mar 2022 08:45:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT041.mail.protection.outlook.com (10.152.11.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.18 via Frontend Transport; Tue, 29 Mar 2022 08:45:55 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.55.176) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 10:45:54 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] graphviz: don't clear PACKAGECONFIG for nativesdk
Date: Tue, 29 Mar 2022 10:45:47 +0200
Message-ID: <20220329084547.10060-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.176]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b696cc0-9c59-4514-ab35-08da116089ff
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3732:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR0702MB3732020AD964AB2D94B56109BF1E9@AM0PR0702MB3732.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ggC3wbyzP/qzxcr0JkEvEmqQbY0x7/N9BYUwxNU5qy6IkLaO5UIoTEMah/gdAE85i7a+XcdD/RO6DcmnnXcTJOz+hkIu8i6lZHAR5mBjY7Tyo4e4uvjWIbU0WHIizwD5NDHDHCQo+x5FXJDlHfMQ6mTncqhgkgVRfzGeRegISflIaH2qrZKy9vl5DslvcG7bCMbKkUcbNKgDyzFc1XOazmimUY5wvsZ0ujtYH15QtaTmnJxHYAmeYRgGF7dk9bYiHCvo42pqXHQS6s8pY5xfUDTIqh9E7TEKJSKlg0fW5d3fMJE+PdLbTaR/ejRBq1mOjsfPllNi8t0PlcX/HizblRS4w8DSBsOH7yGSNxGHaTBBCdkcCGAO/mvi2ZrjchTPr4pRjvIFVBS5aOQLg/X0uYAdNFNPuPfYFYSmoHnvB7ebB+3JVcbIkkmo/99wnBh5hyLPypog+/qyQ7uHAcO6m6Mat0WNcoc3PXugkHCltMMHbBK9rs8d9FwR2kZd3ANAgKW/gzjeeZPlluWS6iIKA0GmzMU/aIqCGjdJBfy0RpNBlHti45B7bR6IJv8isizc9y73Hbf31++jLlRzkNQTVfo5Dmf5Cz5ZgDeQehoMK4S76Gz5yc9RYfU4JQe26jn2hybK/RUZE4zJBge5iYaKbMgPN0VaEyBvJRnHZTldm0ESdToVA71KwYGk4kKKw2GVSSLy7nL2y3bkokIoE6PUIvy1i8JCCKXfE6FQS4E0YVmVbzEoti7jPhIexgigY3AzGQcnmvbG7wpULL0kjVzgSw==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(86362001)(6666004)(4326008)(4744005)(47076005)(81166007)(5660300002)(8676002)(508600001)(356005)(70206006)(70586007)(8936002)(16526019)(316002)(1076003)(36860700001)(107886003)(2906002)(6916009)(82310400004)(336012)(26005)(186003)(40460700003)(2616005)(426003)(83380400001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 08:45:55.5332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0b696cc0-9c59-4514-ab35-08da116089ff
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT041.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0702MB3732
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 08:46:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96253

librsvg is available again on nativesdk

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe=
/recipes-graphics/graphviz/graphviz_2.50.0.bb
index 0eca7fdba09c..0f44ea71bed6 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -32,7 +32,6 @@ SRC_URI:append:class-nativesdk =3D "\
 SRC_URI[sha256sum] =3D "6b16bf990df114195be669773a1dae975dbbffada45e1de284=
9ddeb5851bb9a8"
=20
 PACKAGECONFIG ??=3D "librsvg"
-PACKAGECONFIG:class-nativesdk ??=3D ""
 PACKAGECONFIG[librsvg] =3D "--with-librsvg,--without-librsvg,librsvg"
=20
 EXTRA_OECONF:append =3D " PS2PDF=3D/bin/echo"
--=20
2.34.1


