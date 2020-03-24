Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.41])
 by mx.groups.io with SMTP id smtpd.web11.283.1585090157105649637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=QE1BBtRk;
 spf=pass (domain: xevo.com, ip: 40.107.92.41, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KocTphhiJxDxnGvbRyrFhBSGCcENGOu08Wrf0t/fUmBzRsrZevPIX/AyEGTwL0qyqPFnfmMbSifOBbyKfjo1zep7OsWkmC9XdSBb1Rh+/8oE7+b280wXynnoAmfA0Gbb84an6jIisHeMGMFW8TIPb5GkZVgGE0gFVA70aC4CwaQYujehgMBgd3hBmp3kq1NFxmhGG5gs38+ZgJJBnZUuHhbCyCDmaxo1pwlWOMsq7JUcKBGXNY/047+dzPOCMegxU39JzN736czoJc3R9Zcrdoyhx1OFPJc488iQqp4X3k4uUfofL4JnjGOffJb8G2n+Vap9KuJv4xP2UU4yZXAuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HbnUXJbeqsHgYepxdeKVrXvl+OT4qnWl0Czag5FHGc=;
 b=hbtmF4KQK260wZRB9kOO6O6AAMrOcAN/zj639I+TNIuaGdp3FRExmifdIa0gPTP2iNy1fYJZbozeNhRATr3Wj+MathdGs1dPzACouO9aFsHeRKNGYLEjxrquJPF7niPeLltIRfek6Z2Pl9dxQQxnBNP+eGu5wX4u/UkgczdNC73Crd2Bay3j0ZTeBVq5kY7dKY2rPOCp6PAZkrAR4yxjFDDVTkmsA7yI8Y0VYNwyBKMAM6tHVX6BFxSXgejpK0i+/rgJwE4UyvCzNu56RLkjIiDjJeUCMeedp/YWIPequVhCs+k6+mqJYOmPWczAbB9veIBw0Jk+8a/J8pVXj1sZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HbnUXJbeqsHgYepxdeKVrXvl+OT4qnWl0Czag5FHGc=;
 b=QE1BBtRkltUKJcMDB/CUnihF/mZ09rxo4nDSGPFK5M8M7kMcKBQUJHR7SgEMc9NzU0Hwbco64eSjOkQrF2KNoP8fTWL9t2+mBYrtAe4Tl9jj/34EE++hY/dld2nq5vtLW3rC2tfHFSq0x5Tp3d4YQ/SJ9xZw6ZMArsQI3m2Zaxw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
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
Subject: [meta-python][PATCH 16/17] python3-lockfile: add recipe for 0.12.2
Date: Tue, 24 Mar 2020 15:48:42 -0700
Message-ID: <20200324224843.752394-17-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:15 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b34f75b-0df3-449e-813f-08d7d045943c
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2091512F78A9801866D00B8AABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(966005)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(6486002)(86362001)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SuNalwUM8Hx2aDUli8SaGzzA76exZTCIUbPQk3HPqAufIMNGmZ/NE6ECdUjRZ/QSDTW6oye32NL3JuKl3bjRvPFxnPLmsermvMO/A61Yktlk/xg3H/qHInrYI2QWYxcs9Gh9ALR9t9CN9BBo0caXYfSl19RxctEHvlm3zX7IoHBxvMsyGvxLKyjKfHzjdtftBkh5kHJQ6A+qXxbvI58ec1jl2059TA4Zf0s0ZhWNLxa0xquXknEK9cCpwP5HyxhQ/GhPm7EEJArPVX4h6/VorWYccHwUMVnw/8moT+aos/FIis718TYoMOCbYgLeeJzdbwnz5ZM1OEyGf1M+bZKKli0MWVT826e/29Ud1gyCYZ42SHb+iwJYJSu2K/vcR/KsaXf1qykll1YHPEfNPqwXRjhQOpQFjR+FyuphrmoTcWg0foJVidlx+oaFSU0wFUibB3IT9ofpw6V2E5e/oM21MN/d3t36+KAedBgUVjnxQc+CmFd282ZnCtVOcX+6u+sPfN3omIbhCUwF+wf5dhEn2g==
X-MS-Exchange-AntiSpam-MessageData: 
	Er5HisrqpzZ13v+6fUaawm1xYYfIVg/Dc6HX2jfqhg0ziu22/ZXmUbgyWHgtX1X7Q6DUstOcpCtC7rmjU9pQvS2gT9zaEYYJOkI5MiQWOScoVLu1Vd6iLwlNkPItGlg4/ZGikVY8M8QYA6VCr2VB4w==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b34f75b-0df3-449e-813f-08d7d045943c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:15.8476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mx9aQSn2tKv9x2TQ5cPTsLvvMdSU8YFCAvN/Rw502eM7cq3YrN5/8aw/a1kZwG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-lockfile_0.12.2.bb           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lockfile_0.=
12.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb=
 b/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb
new file mode 100644
index 000000000..30b1297e7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb
@@ -0,0 +1,17 @@
+# This recipe is originally from meta-openstack:
+# https://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/meta=
-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
+
+SUMMARY =3D "Platform-independent file locking module"
+HOMEPAGE =3D "https://pypi.org/project/lockfile/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2340dffbbfea534b58f1349984eeef7=
2"
+
+SRC_URI[md5sum] =3D "a6a1a82957a23afdf44cfdd039b65ff9"
+SRC_URI[sha256sum] =3D "6aed02de03cba24efabcd600b30540140634fc06cfa603822d=
508d5361e9f799"
+
+inherit pypi setuptools3
+
+DEPENDS +=3D "python3-distutils-extra-native python3-pbr-native"
+RDEPENDS_${PN} +=3D "python3-sqlite3"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

