Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC12C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:27:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web10.16436.1709742465067896800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kS69Td8P;
 spf=pass (domain: axis.com, ip: 40.107.20.85, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebTBxISr+WRd5m9cGuLl0yr3/p8lVQ0kesZslPSemEXHTR1xiuDRkKTqJrXn+R7YeJ8t806wR/lAEKGljGVTjcJ09hrk8b8VpZENSC2iCzFsBZg/+z4oZt3PDdFOTd484/HCIifnBI7cNHJpcLdlkCl98DnZtu8WvLzD0OEWPp1wRzfckez9WELud+lNHxcYw7JVNBaUGJKeZpRSdf/tIF4r34ZZsp69Zzboa2GVea4pD605tV8rE/86YSJIcZmjmvAfgXou6gFRVgOfRNmlUMtC10P1tHrGp1lypQCincFsucbNEmEf4ju3pssYe7K/oDIiOpwEZRG3cbhqjFhoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v5mFDfF2+zN5oeZmezHj2WUkGKm6U3EMdTCJAKJus8=;
 b=nF+g8LypFU2CVld2tAKIRPrxxu486VGPsfP5O6Oc5H3NY8IYKTrxfbe6giySSVpkEgp3ULecNEvUfZxsgrnX9gefhPJwekc12KumQNYpn0kMnLfmoKN3a/4ByxDBY9XWtSFDLHdjL1J0IwNByiYvf6EZduVSFJ/7IjKKwx2F67sB7Glqg67zGSEvYQOCCFlbzfxJEypmr6Nn6CtoBGsPTuEjlSs4eDcBDq/nhr7huMHBsDU4/v2P0kHcDFqQDL33LgzKfrwuaB7aKIOSHGUIc8TWrt/d20m2be5hQkZuG8MGqGiMLbgaFCltvfgmtoPdFI/1sEY1tk4cT0jceuNcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v5mFDfF2+zN5oeZmezHj2WUkGKm6U3EMdTCJAKJus8=;
 b=kS69Td8PNuakmE3ouYzO9E7qAvsIZo9SYoa0bzdqQ9KI5AqozE+Neb/61kWSDPy2Hu8Y06hnSTtGE29oQoiIlPuqGnZ5hyUnN7mxzDv2S9wnJp9heBNxwX748ceRidBkLmkSoJQl1En6a9Ot+5U7oi0ODXb9CUmaXF1ed0w0SKA=
Received: from AS8PR07CA0049.eurprd07.prod.outlook.com (2603:10a6:20b:459::30)
 by AS2PR02MB10375.eurprd02.prod.outlook.com (2603:10a6:20b:546::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 16:27:42 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:459:cafe::f8) by AS8PR07CA0049.outlook.office365.com
 (2603:10a6:20b:459::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 16:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 16:27:42 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Mar
 2024 17:27:40 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Mar
 2024 17:27:39 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Mar 2024 17:27:39 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id CF22A15C35
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:27:39 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 426GRd9g1722422
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 17:27:39 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 426GRd521722421
	for openembedded-devel@lists.openembedded.org; Wed, 6 Mar 2024 17:27:39 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] abseil-cpp: Split so-files into separate packages
Date: Wed, 6 Mar 2024 17:27:37 +0100
Message-ID: <20240306162737.1722284-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306162737.1722284-1-pkj@axis.com>
References: <20240306162737.1722284-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|AS2PR02MB10375:EE_
X-MS-Office365-Filtering-Correlation-Id: d3504d0b-f81f-4027-0336-08dc3dfa5936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aUOLHYCJgiFkA/mf5jLOmYB/X/xtmm22RT8y4RPq9OaX8bLKWqAdwdSkFVKsBlAnTRbXum+fXrAbFXW7awEhL3oyeiaeOPcVg2NVQhWwVK8bLEvNbl9kQfmP2UixcQAPz3rI6lf7fN0OxMwo8i2+NcuJv4SpGJMIWn+zVWoWbKds7LwndjqE2WdVs4fEvQPCCaWOKs5HLPSWx7MTyZDjMQ65DvbhO+Bgl39eyrPET9xCEzhfYfBiKSWzrrxkGkIMb5jydEg55KZAagxuO1yjbpiMCbxCmtcuKRZ41iGgndlqCgf1oUs1oNWPQJk9YV/rfs6HcQoWXYLchefhT7Dkd2dppKXbPXp0v/dtKIrPG72c1F44ceziy/TP7SC50o6bKzFo+wGIxBkb2JJDO8N0xGFYQmO9zoPMnJNtRA+GR40b/dSN9qqGSzjUKY+3x1C6lWCOTqKUy69YmIOikRXxngxlXJBToUvp6/mcMlOscXiH70KH2bTOI+3eTjfjk+B7PNVKYJhGXm/DPN7Td3hGUxn7NQl2Oi12M7xE2gXBbJLiokOeW6/pNKyNDQQ9uJex+sfRyc2FDQd5KycDz3TEsXuvMnKtZESQj6nxz0TU0Jx52q1V6/tsbsflw7TBqNL20+mGV65hKqf5FLHPaFIM0Jbucg6kXKIXGrsuAq5up91cTaCAfWA8ZngBznQ0iFpecE4tFtqX6PQj/cxYieMM2mejCD5vQYItwNIgskfEsa0H1TsFSYhfG7UkO3QPdKl3
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:27:42.7129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3504d0b-f81f-4027-0336-08dc3dfa5936
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10375
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 16:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109169

From: Ola x Nilsson <olani@axis.com>

Use PACKAGES_DYNAMIC and PACKAGESPLITFUNCS to put each shared object
into its own package named libabsl-*.
The shared objects depend on each other which means you still get a
lot of them if you link against a single one.

The main package abseil-cpp RDEPENDS on all of the libabsl-* packages.

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../abseil-cpp/abseil-cpp_20230802.1.bb       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb b=
/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
index 667693a4c..17db7b2e4 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
@@ -28,4 +28,27 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
=20
 SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
=20
+PACKAGES_DYNAMIC =3D "^libabsl-*"
+PACKAGES_DYNAMIC:class-native =3D ""
+
+PACKAGESPLITFUNCS =3D+ "split_dynamic_packages"
+
+python split_dynamic_packages() {
+    libdir =3D d.getVar('libdir')
+
+    libpackages =3D do_split_packages(
+        d,
+        root=3Dlibdir,
+        file_regex=3Dr'^libabsl_(.*)\.so\..*$',
+        output_pattern=3D'libabsl-%s',
+        description=3D"abseil shared library %s",
+        prepend=3DTrue,
+        extra_depends=3D'',
+    )
+    if libpackages:
+        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(libpackag=
es))
+}
+
+ALLOW_EMPTY:${PN} =3D "1"
+
 BBCLASSEXTEND =3D "native nativesdk"

