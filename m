Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF190C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:16:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.103])
 by mx.groups.io with SMTP id smtpd.web09.9181.1645179401031732762
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=U3D2FOy5;
 spf=pass (domain: arri.de, ip: 40.107.20.103, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIlTLefh44JxYypdGdrA0Bm3EE5FTrrw4l39jQl2skXUXNRcD2UCKGQOsa7QZFBcXr0jsX6UpPrQ9drq9iFgOKL38MrtTNmKDQdLo5f1k2NWaTjq3fGvwzyTR8d8ZRcGQwrY81yTEehfW2tV89Nkgwgn1USkIZGDJGtordQYGQsLW83lOzIDXZ66PxE2WcHG2yqEl8LgZCMDM9s4uyHYn+jMx8O22XtpY/r6dDNrIL2Gg4cpI1hEoDVFVhc+b7UhIWASSZZerCp7W6LzhEAv7fntPL1GhgpfGQrCeHTFYtg2xiXd84ZF8Sk0SoTX2gKHQWu23EZVItPHQxFQGxyQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPA0LxTzN3pu979ZYZMO5nEVPwyqZT5cAD7C/KuetTo=;
 b=S8OUYk/vSljy90ORfiul7uHmtlEDneCb2/pRQjFvT2McTS28JnaIVyrJDp9LFrFJJkqk9sWhCXe3i2A3g9zYwrA5jiZfdgR9ujMj2kO28dRjLGXmjKRVmRyaADlO6FBmWRY8nJr4pEJyF4ghDAEjkYU1zb19eEEcsdHoYiTMpSNqJeyVDh2YwMhXoe4GTIvGsq/ywfl11YCRSwpjoeghBZCI89Rupd7h5DVvT7INLSNRUlpvrRc80Sy0dr380DTUDWIvKtCNBUdLsWKEmqDU4XkJUMRD02HJfZ5C0kcKaC+RzRJ0ptovKVJfyxkwfdTFITphZlcPn+NEjWvoNwILUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=baylibre.com smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPA0LxTzN3pu979ZYZMO5nEVPwyqZT5cAD7C/KuetTo=;
 b=U3D2FOy5MJhLhn3BmKz8mo/bSVaavNoBHW+I03VqusBIoxzenOZGuveYJPVh4UtJNLAmSmScf4QiP31xXUibFHtpflbePXb5dtNMwzMiAYkSlyHId8DmD/lLCKNG00tJ3dAFIOQ4skLcgKQAli1lIJLSjCdtbqnCyxwnZ/vwNvM=
Received: from AM6P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::14)
 by PAXPR07MB8371.eurprd07.prod.outlook.com (2603:10a6:102:229::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.7; Fri, 18 Feb
 2022 10:16:36 +0000
Received: from AM5EUR02FT061.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::66) by AM6P192CA0001.outlook.office365.com
 (2603:10a6:209:83::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Fri, 18 Feb 2022 10:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT061.mail.protection.outlook.com (10.152.9.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 18 Feb 2022 10:16:36 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 18 Feb
 2022 11:16:36 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Fri, 18 Feb 2022 11:16:36 +0100
Received: from localhost.de (192.168.54.90) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 18 Feb 2022 11:16:35
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Christian Eggers
	<ceggers@arri.de>
Subject: [meta-python][PATCH] python3-dt-schema: remove recipe
Date: Fri, 18 Feb 2022 11:16:19 +0100
Message-ID: <20220218101619.4536-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.90]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a1d0189-f496-437e-cc00-08d9f2c7bf0d
X-MS-TrafficTypeDiagnostic: PAXPR07MB8371:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR07MB83712DA3127C9856A2B1630BBF379@PAXPR07MB8371.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mj6hfcJBsyMtmMe0aPKp+5yVwIPhegFMM++45E7sA3q9zMX/zjMTgvj9qbqWhlotCJcw/GcMbc+SDIKQFw7rPHA+3YdUaP+yild8TLjqawxgcBQ10EqR154+vah8YQDcMFt+x9Sa/Y7A1qoODzEEd44tFG9d00f6WI2bkW0aKXA5F+aSsIgF5+DwA4It7JnDHRu7DV6IKiW6MNOMw05ZuQakymHLADMxaAvrOiAE7m1lmkV2AbGF3JnI2COMYOjlNfNbRJ31wy9OnhGcV5atYg8BwPhtClhKcSTKr8e/OaJjKPgstTBxjo1VBKc6XvQdLL/7H0zEJ25clv6gvBTJX5Tx3oTyDH6aCrx6ODB4hPcyndivCOieSysqARn3TmybO6y/UzF+Rd3o9WVHNl3jTrCnULokPHNPqqsgtXO2zmrMKO7QDMghPiDi1GRqhHsKX5KpA61G/eB65AN2aeJYz5RIp0+oEKXdlKGF9nHxIFKrTajjz9A5WLQkXWcumi7IpY5YXr1PtbORoXlWc0LOyIOG/FrHOml2HPiZ+F1s5lG16fB0kygqwlZZ/4k+wb7jF+1bNvPGD3B7OMgBkAOcKRSILRDXIbb6c//B7cb7ocHRLKiMvjDIrAMey8Qiqaw0wCCpB6vymIVvtbW3pugbJAB2AZrPlKP32VjcVjvfjs6quTa6eBQEpRI75Y8T18+yXBZEkH/xAAVjwEBLBiZEtQ7V10O5vIgLFe/7+vAF1CAOvcPNuuBBzMQ9yZ280R0BQczQMXYp7cQ8GDbGpUTuTVFaZ2C2nLtT9bZKHi75rMs=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(36756003)(86362001)(70586007)(40460700003)(16526019)(508600001)(2906002)(36860700001)(336012)(426003)(5660300002)(356005)(26005)(4001150100001)(186003)(6666004)(82310400004)(81166007)(8676002)(4326008)(83380400001)(54906003)(316002)(6916009)(107886003)(2616005)(1076003)(47076005)(8936002)(36900700001)(529864003);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 10:16:36.6987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a1d0189-f496-437e-cc00-08d9f2c7bf0d
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT061.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8371
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 10:16:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95373

Since 2021-11-23 this is on oe-core:
d56fcb5806 ("python: introduce python3-dtschema")

The recipe in oe-core is named python3-dtschema (without dash between
'dt' and 'schema'). It points to the correct GIT repository and uses a
much more recent version.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../python/python3-dt-schema_git.bb               | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dt-schema_g=
it.bb

diff --git a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb b=
/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
deleted file mode 100644
index 305cfa6b0f2a..000000000000
--- a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "Tooling for devicetree validation using YAML and jsonschema"
-AUTHOR =3D "Rob Herring"
-
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D2;endline=3D3;md5=3Dc795=
d4924c5f739424fa8d9b569c6659"
-
-inherit setuptools3
-
-SRC_URI =3D "git://github.com/robherring/dt-schema.git;branch=3Dmaster;pro=
tocol=3Dhttps"
-SRCREV =3D "5009e47c1c76e48871f5988e08dad61f3c91196b"
-PV =3D "0.1+git${SRCPV}"
-
-S =3D "${WORKDIR}/git"
-
-RDEPENDS:${PN} =3D "python3-jsonschema python3-ruamel-yaml"
--=20
2.34.1


