Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.61])
 by mx.groups.io with SMTP id smtpd.web10.304.1585090157773492125
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=G8/ltsah;
 spf=pass (domain: xevo.com, ip: 40.107.236.61, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlrgwtABg66JKACXUln/jLfYa93HmBHCHE9bEjFtQSUUbFOPtoPiS7J1sQ42WlhKUDDI3pDtjMytbat49LPSyA3Iw3SmGqLJbArAt9xB8ZMcHJiDc3VpQedu8TWapglLXvJAM9dFNp6UkeA7pc60d17PNhtECDQzfrkQgaW/o8jGGf8ujBz3yB6VXVKbmjDnep2r03t/Hi+c4/Js+FQI0/kVuJPMkwNVaxiO7LrY6bosDxfkcgoiM9zYT18p2JTkH6eX03KOz5QwR+G5Cfl1nLNqsu0rCYcA4lKURqtXdam7NeqXv7ia+ASTV1z2ME1wSLonO3bxH8r8ahgnexR0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEpcd9QREcyZawhTXrdel/0Pr8limsUi0Ev249k1bj0=;
 b=WdkPeQiZ6O4FY+6/1TeFETBba9z6lk6oXQrrXU/TxrIapTUld1mIpnGlrVf1Xgs02SvpTMz/3eVfIb3L1XL1R1O1sqAb+0rmrfee8++SyZHPC23G2I47aUdMjVVS0aKoJlog18wtEFhzxdUcNj+0kleIKtsskCbwM14LtryOb/5VSd7QiNWX0/UCWNbuvqjrAGaSOYXwryr8Zoez39k7+/oT03nh2rckyIQqqpOqN97c3FRZuIc7W0Vs7U4D02D7n38+vpJpshmvUMR6pLsglxchFfZnzr6EEW5GLixxh0imjUDdltBmFRcgWvkvIyFMV8H9klejqIrbbajopZD0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEpcd9QREcyZawhTXrdel/0Pr8limsUi0Ev249k1bj0=;
 b=G8/ltsah/L/+SoUFrdyqZG51geF38M959bdqPiYuL8Nb18GQ/CvAQ5jL1hdMaQt0fQBpHtYo9GJpeMLjpC4B0tJPSKXz70NVEw2N1pn313f3Eq/qyiiZrMk4B5n2pWNZguFjQIw7vyZSFHDnpoNaId6C0MQfmtbJX0YVu3XIYHc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:15 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:15 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 15/17] python3-uritemplate: add recipe for 3.0.1
Date: Tue, 24 Mar 2020 15:48:41 -0700
Message-ID: <20200324224843.752394-16-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:14 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47e69e1e-d604-47df-b0c2-08d7d04593ae
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB21693DF1CC2D2ADB0121CC46ABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(966005)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VqKFg/AKtITvsR7roasV+VZ81Dk49f2p+1WbbqqUKDeuBpieTEd61+m1VQrwpULrvftUbGiddy6OTroTWhs4nQMjhLGA1MfR9mmnjbF1Qi4DW50K1GQ6WbTeW+dCReOfgqZw3dk2ZkQ6vjKVCzZCLdrHrLD3MPHRZmZnzoWp4vufOcv9pRWhjjRpm6Fp627nbWae6r4Y1Q4MOujYQOjXpelPxgyCt1BMS++eKtufy5b9Il/Pxh79X4Jaogsrq6E47MXEo+DKi2m9opF8fDTCmt6ggBUG4ukGEQw2n6KgjAraCVdzqNy0xBXwIyLTdhidwljZXo09mMErXvk2p1pQKxRnOwMZ00/yAEf2zq6mQswv0ydL9mPsqGJvoJlh5cdNqf4UEr/rPIwVGcx1eUjpwDc5n5G2ccLrRoUJs2lg1cBiy+0WuE5lqVxK7FM2GuYlkdT8648DUx6HWYFYNxRYH2t3ZYXGj4j/tj9v6YyBG5xRG/jH0ctnI6zCsb7tyoX25cgP0uv70cadS6X3GSDV6w==
X-MS-Exchange-AntiSpam-MessageData: 
	KQkzs0cSUISH+GCB8owEOVTb2xAUN5cTiuNKV1Bt45gnzd4gLe9yNg5irG8kisSezTydqRL6mAAXdMtLFi1UVtagCybL+UBpA3aR7kDrtnOKL17GF7PjaoTcxF5vGSqc8bs3jNbUZZliBbZQYtB25g==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e69e1e-d604-47df-b0c2-08d7d04593ae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:14.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMWbw1j+/6hPo+cWnaeOo6jAInGfZYXdqWHlYSELXJeg/7u88tQzRh0w9fM7wvwp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This recipe originally comes from meta-openstack, but it's
dependency-less, so it may as well live here and get wider use.
meta-openstack is MIT-licensed, so the recipe is compatible.

Also bump the version to 3.0.1, from the 3.0.0 currently in
meta-openstack.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-uritemplate_3.0.1.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uritemplate=
_3.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.=
bb b/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
new file mode 100644
index 000000000..952e954c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
@@ -0,0 +1,14 @@
+# This recipe is originally from meta-openstack:
+# https://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/meta=
-openstack/recipes-devtools/python/python3-uritemplate_3.0.0.bb?h=3Dmaster
+
+SUMMARY =3D "Simple python library to deal with URI Templates."
+AUTHOR =3D "Ian Cordasco"
+LICENSE =3D "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f6d769bdcfacac3c1a1ffa568937fe=
0"
+
+SRC_URI[md5sum] =3D "869fb44fbd56713490db7272eb36c8ae"
+SRC_URI[sha256sum] =3D "5af8ad10cec94f215e3f48112de2022e1d5a37ed427fbd8865=
2fa908f2ab7cae"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

