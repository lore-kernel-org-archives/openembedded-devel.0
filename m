Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.293.1585090151533401776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=NpGJn8Dp;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O853zWb3hB9r5Qw+LE36MW+L0hfge6ZsfRtyKraOQgMX7LNSXeDKl/AQbYih8t3gUHme+Q3cROilmSYr2c25EU/A42rhwyj7oZiv/VUNUdFCzLuR/N6Mhr7H6GA+5XIOHR1jeV5+5ZgkOF2YZ0mKNcfb9mvIsmcS/IsujNgWJUeKCrnaTqWTTj4ftsBft2ZVn9Ay3t7TqdEFsRoiuUMkPEeOD1YGMv1zTyiuelmj2ifURr1tFDjZFsq5mb4DkeGQ/u4XnPNIjG8b30k8FrN7qgGKedd0+2nWYDjm9ABwxp4gvyyor84o3MrPLyM1wOq3M6nwx92HZ6cp6uL65Uvd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwjnMLlXPy9nvnDEv/CJKORI0jf+4ddOlfRe8vdASdA=;
 b=Cg0my18rPvUlX8adp5MdC7Ught88qoK7e3gb0DUNLU/UeEPoFsmluwuDTeGPoln7kcUfntLoHtCo11TYREjrPNBjSXPN9TrgjS+PrjJz4AyuIy63lR0iKvToevtGDjShdIZYbkcn3DrXLvAuBxQww2YNuFAIjb0l3zw5rR9/QuONVYB2tdqk+83BNc+A0p+FRXJtIPYvXyddvly9fYHSVPC+lE9uOUWKpz9SJxMFuQEr9/APjumTjCGe8//W3J5AoyobuR6qoU7WLW8aVj4gjKz3nm9EFNi5tDo9THbHQJh5NzGOl19BzslW10VAiHGAgaPcrNk7TDrrbhc9yOSEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwjnMLlXPy9nvnDEv/CJKORI0jf+4ddOlfRe8vdASdA=;
 b=NpGJn8DpL0CiNgqY5ZuTYbIDBFP7Drw9wCzOAGSoGvGyD9h/FqegHkK2s4Os7JmzzUiDF40ieRaecwmzFOxhdtBzsh50getQODHV3FXPeKmOjCf7TW2sZ0e2J3bFKfwrgGu4VUWABl98uH1qnF3URWgxP918CJDSwA9XSC5bYbc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:14 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:14 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 14/17] python3-sympy: add recipe for 1.5.1
Date: Tue, 24 Mar 2020 15:48:40 -0700
Message-ID: <20200324224843.752394-15-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:13 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37e6f6bc-7bbb-4e9b-61c7-08d7d0459358
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB216973A2A26FA95C65993431ABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(966005)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fn6DQoL1jeMIS2AdjkFfy6lVuwkq8SgFfbi9SiC4R5/sDfIp9DRsqs3i2eDbwzN+4bAAqymivxp5Ut0LAqaDY4cAAdPkCRUje5V7UPvB/ofhQqIJm8ilqb+inMSYt+mZwLIAVPRtZFqOvPzjln2L0BSzO6yAYfySwbkUrDerKv69nEi1V7+DquInFxJSZbiycJvhd1r00V8rhn8ufyF7b74HJRu3nrUzRyHwxhirna5L8U6eFMCO3su7ZlIaJFZEkPwlw5rl557Op6Nz4CeNP9Te2XQvsNsg2N4gJauVm2VlorQcit0nVn2fqqVDJEmFkdvqpA/LjFcTIJ9jmCzRJ0a1MyrlGzHXmF6g4pySZaHQla0MlgrxfZIckZIJoRgLMOYqxhiWYeCrVgFyJpQE+EvQxMAGVk5wZjRdnOazN65q79phM7rz9FGULHnpuThxOoTuMGzACnQBTWmTzBlV537R2UpdcFuQs6KATUrNmjTwHrvAXcEdBz0rOQgXMbAie7uU9uqSy5hVdnEVJLcgEA==
X-MS-Exchange-AntiSpam-MessageData: 
	1TKHen2W/XpR6TmBsuEspHYEkkEMaU3mAm/hvqs4C/6Sn5Iz9AdDfGKGNvFylgZRZ3bVGBO9Y2BUYNQ+J7kkpedSq2s4VPNZHtPYvRzUPvDInXhxV4dyq0vguNmUb0km2rUaxEuKrV//kD1LZTmuaA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e6f6bc-7bbb-4e9b-61c7-08d7d0459358
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:14.2956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7EHCf5AY5vyKk5aNkCH9vwEmqfkSXGlPZQcZZnenaM1HwPiWejccgwaKXmGivTH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This recipe is adapted from one in meta-jupyter, which is also
MIT-licensed.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-sympy_1.5.1.bb                | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sympy_1.5.1=
.bb

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb b/m=
eta-python/recipes-devtools/python/python3-sympy_1.5.1.bb
new file mode 100644
index 000000000..c0c382a51
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb
@@ -0,0 +1,16 @@
+# This recipe is adapted from one in meta-jupyter:
+# https://github.com/Xilinx/meta-jupyter/blob/master/recipes-python/python=
3-sympy_1.1.bb
+
+SUMMARY =3D "Computer algebra system (CAS) in Python"
+HOMEPAGE =3D "https://pypi.org/project/sympy/"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D611b41534dbf5aa01d7c827bf667ef6=
6"
+
+SRC_URI[md5sum] =3D "b11b310c3e1642bf66e51038cb3c0021"
+SRC_URI[sha256sum] =3D "d77901d748287d15281f5ffe5b0fef62dd38f357c2b827c44f=
f07f35695f4e7e"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "python3-mpmath"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

