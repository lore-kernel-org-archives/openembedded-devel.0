Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.293.1585090151533401776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=HmC7I/Bs;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJyTgW2FNjI1M3YMK+AbImnWzmn6PMf7k9GaT58OJGMB32LW4yymMhnaE9ZP3tDGpA4anRl50dGTHmxeqPnUxa9CZoyGmHBgAF6jJOWhlwTkVINlSZNvjNs9PVXm8c3Oh4sASdl0WbvDE96q94UN4QEJpAUJPX4Q766VClK52NzcOEUMXjHLhi/Dhw99FxRrjfT1aP8Sv70OB9khuZ6lSUZfvpCMFVXw+0ybmwFPNvim956ezCIigdik968dBGyatcZxqalRRfoRFYqo2g33+lQbKXC6F2Jt7bzHwxCRoKrsX/b/CbobtzTxn8J7JAzvp6013YhW3RoJ9vGPU/a9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxWFmELA4rMTZ6FbOL8lsID5/q8OpBdfOGI4uwpyC/w=;
 b=YZ+Ehcr/0vQgkUXI5QdPAvHwVw1Q9RRZeZqj/ZMpvFcodqlaVoXHQhNyFily+7rkGimTb11uARDRIRnUY5H6ZphOkBBDjJ/CaAvKDP2RYE+HhhsoIsdgXJ70j8TyWJRCAOuap36BiIHaUI8p6q2F0L9a0C8G1x0Ty0lD1ERJFt3kJ9TQOiYAVtQKMGQtraHhDopTri6wfj3orDO8CaY2eQJxYvlnzyVF3DCI3A//m1g5scz+hmQwFbPLBjKmDgCT5sc5H57TFFw/Nm9Il1i52Wh/4S+f9RhBPT3u7MEBoI2/7W4CdhE2NVziu31lCIyeq02VEs+NNZbak3EcDga7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxWFmELA4rMTZ6FbOL8lsID5/q8OpBdfOGI4uwpyC/w=;
 b=HmC7I/BsmNlIE5A/ViC/w7oab+gP4BbhhljJp0AjLD/wIpl1IHblUwIvAYbkHDLtYXUmdTbQUydDgkQSiD4K8uTKCnZopDL3ZjPOGeZP5VBXspfIWj0+3OJW4EROm1hEJPdiDqxBhSV71pSHF/YKbdgUL6vhqrCPGSca1+pG+xQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:13 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:13 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 13/17] python3-mpmath: add recipe for 1.10
Date: Tue, 24 Mar 2020 15:48:39 -0700
Message-ID: <20200324224843.752394-14-mkelly@xevo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 03c6d345-23d7-43bd-0048-08d7d04592df
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB21696BABC854085CE530C2DFABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(966005)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	45e6jcsoTAH2PgNvQXJxEpS/X5VkKrWo+IDMW/nRjWb0Fmk6qKpGQfNf+kf0PUKiLyVdP+YTDv7XWckllk6XvgsE8RBF7K+nx8CoK4Vx7ghwMZi3D8soA3jXMcYt75TmfAKxoBodpKXXVeocQXwE/Z06THwA0nyBgnFKuhpIUxmo5hzpXJSOb/eevCf5kawkM9KnDkO/H5LL4BE6CEWYfyl6gVBCqVOpQ8BU28sY4xLNvZFp87pxaMTM/6eqqM2uX2SQQQHGCOdCTNvII3NmZh9oi0r/4u/dR4WlTAdYNdjnWuQozsrBbnUTGAghAlGk0JBx245C6Z+Bi4BTDs7/wh+pLXV7eV3+9peuqKvbUdWB+pfwJ3tRTA7CAaGGGO/TpYhIk62tzsFf/Q7/L7DIJzo8ou381Wufico+vtRhaSnJDJfGqbwk7vaXIHEOF4FomV3DRw01dviU8bvBTYAY54zjxSimn3/oj+hbPUYlZVz7RSU2tC8v7bDqFYLqHLXB4mfORObeg17hH+TLjtULxg==
X-MS-Exchange-AntiSpam-MessageData: 
	K8cV8VflU8FJjBZ6Rq/xp/fiSli03xBdLtGmelKO95S4Lqg7HiibgSITfygbMlshRt46VfjYeaPL1OOEt2RAN1cfoEEXbxgheFPNpnDTVmyAMsSxUG47+a4DZyLTnnEuHTc45j/wii0wvKvwMZKE4A==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c6d345-23d7-43bd-0048-08d7d04592df
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:13.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CB4wUgIokEoW1VMClid1P6kcbDDQ/U4aojQ2MVmyLxSSnjOxBUZDBlsJHgJeKaDc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This is a dependency for python3-sympy.

This recipe is adapted from one in meta-jupyter, which is also
MIT-licensed.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-mpmath_1.1.0.bb               | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mpmath_1.1.=
0.bb

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb b/=
meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb
new file mode 100644
index 000000000..7879a85cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb
@@ -0,0 +1,16 @@
+# This recipe is adapted from one in meta-jupyter:
+# https://github.com/Xilinx/meta-jupyter/blob/master/recipes-python/python=
3-mpmath_0.19.bb
+
+SUMMARY =3D "Python library for arbitrary-precision floating-point arithme=
tic"
+HOMEPAGE =3D "https://pypi.org/project/mpmath/"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Defe9feb00df0b763941f2b1bbac7c40=
2"
+
+SRC_URI[md5sum] =3D "acb1cdddf38e16084628065b174ddbfe"
+SRC_URI[sha256sum] =3D "fc17abe05fbab3382b61a123c398508183406fa132e0223874=
578e20946499f6"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "python3-image"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

