Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.85])
 by mx.groups.io with SMTP id smtpd.web12.9411.1613489171501571837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 07:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=cd5gVNVY;
 spf=pass (domain: kpit.com, ip: 40.107.138.85, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RveqsP1SkPtC7zHFuXif6aldDiupB2eCq/6PxyZsaDZDZAM+ISLh1AMYYkvfbOsI/Pf9IgsxLqYbS9cnxUkB/Z7cUvmwOQA/w7x2uhBO/5VFdYVX7/y0ZsEUJJNjve9vF6tPiEUa3osZ0gBpJxLhSAxVRYlqAD8xtgrWk8I2l7BOYZxxIDijwv0W/Cw/MXQ88PSAUL+B0mF2PL5I/TdZ2nXSzPnAKUa7YX2/RdluGMDcti7lAW9RHAKz1e5EWDIJgm5agnQsLvJYgTu6MyXLG3o9u31CLVZ8ia0z6fRfNQwaxjp9vqg6/F5WznW7L+awa1sSpaug144vzRiFnkvoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0jjGmpSNsRuRKpV18Ysh8Kv+SNTi3MKyLEdLmO5/Es=;
 b=O35eIRe7ql1N6soYTTf2yTz7U8MRfstB2KZlFfOOJzmwBYvaVhi0nqjh42Nx6gwGeJhaLxqGa0IgM2ZiVKG3RtzXuDekt4fnUjnLDVEtCJ1W8HuYXV41MvUu6708w2hTnQLFjaFphJ4q9DcOPaMAeD2i7DwIfqQaOBvL1rRn+LrEjh8Odm+lQcgTRXsVaUEU8SF0n+89L+Lp25k2nBFbpKdZ7g6Sl00A+XRu4MnqQP/Rp4t9S5KHoDfVWyGjWTkoG1WPwc+gYcjtVd5MIlN8fz+Tht428eCpkIjhaRvtJRntFMDbZB4MfRoXQ54I3ESaJohLvw/fdDb/IoElu+1ooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0jjGmpSNsRuRKpV18Ysh8Kv+SNTi3MKyLEdLmO5/Es=;
 b=cd5gVNVYWADqtt3dur/i2x0cqYu6GXFLBrurG9RAbQ9BAkqL3KAMjZWf1N+bC6qms8aIBXuzlY3S/LcOGpBO43kMdWlcyGapQ+kE2xkHKfqohD/ddM024m2ptePMDxyRgNi7ARyMohyXDbneaiEl9srLNBlmQpHnH/VAxUWXnk4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BMXPR01MB4085.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:64::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36; Tue, 16 Feb
 2021 15:26:06 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7%7]) with mapi id 15.20.3846.039; Tue, 16 Feb 2021
 15:26:06 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-20907
Date: Tue, 16 Feb 2021 20:55:50 +0530
Message-Id: <20210216152550.31025-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [182.70.89.188]
X-ClientProxiedBy: BM1PR0101CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::16) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.70.89.188) by BM1PR0101CA0054.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend Transport; Tue, 16 Feb 2021 15:26:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99dc6538-2b4c-4d56-549b-08d8d28f2d7e
X-MS-TrafficTypeDiagnostic: BMXPR01MB4085:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB408558E2A35ADECA9248CE95F2879@BMXPR01MB4085.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4PaOVhoholEq8pTEOcmu3k4Gepht6C1zTgcOni05iB8CDV2Dv+nGi1i+ICRTJV6PT/SirGJ/xebUK4G7bnU9nfrlQsj6JTdzZi1aroJh3R5r2pBbP4XmN9lRCjKGuY0HgnX8RU2adFyOPAV0uurpoANQ2Ou5pLSgbzOj8GQxbHMXY0boUAtjQgWc42TrkdmQ5ue6bzbhYt4pe9CP+Cn/UbPHWAVUIcLwlCX5grtlKEaIdlXCSGi71hCPVGxEHHR5f/94Q+ono2H7RKtf5UWFn2hwwlUnzB6/1W82ve+AB+E7M2eGX5g0CfVLbJXhrHnmJPHMx0BdMtbIcnL5B3rtBkHt3l5laug9NVhu6C/5VlLsAEREP2Bc62uXrTT7Y23tATlMnC83uNZtZfA+yvgPHkX7DrMNdCITRMcMqGHS5OEB4VEFnfUzKQf4euCYvzq8qp67GN12MzYl6ogciaqldmHaXT0CEoPiYAKyDelWthTQp4JcgAaJ3SPerXcFWUWS6TDIT3AXBy2Xsd17XFq2LTzKfWwNN1LeZq0Hw7dl6vE02IggbEp9BpjnEmIq3dYKlAOhH/O54RAWTtajCX4nmMTifBSTC/J0CXU2hnTOdP483dqhz/lsRHKX6prLRNmUpSBIOL3swSl3ODngoMJzOBUzDo7bRPwc9vSyF0QHDPMYGFBJ20S+XmLgbV8tFSxG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(6506007)(2616005)(966005)(16526019)(66946007)(478600001)(186003)(956004)(2906002)(6486002)(52116002)(66574015)(6512007)(8676002)(36756003)(83380400001)(66556008)(26005)(66476007)(8936002)(69590400012)(107886003)(1076003)(86362001)(4326008)(6666004)(316002)(5660300002)(120606002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?RXAOC4SsyaMlk6xH5w7VDGNZD6Ndmf363Sk55eyINRGbrKc+OFAE1UktkwFn?=
 =?us-ascii?Q?1KQNOhjU1uAtXPkoZyh8iNbGIfzpVd/PsaI01Qa0mOSEqx3E6tE/yCjkQDPk?=
 =?us-ascii?Q?MR5klzv85l3KlQubjgNbfZN9/2nJ9AbNmXnBMGTFxZxEBtvywxJ0y677Vrrq?=
 =?us-ascii?Q?eX1Ma1kwtMJxxx9Dkh1ZpePL/AGt1T6+7KfBdH5563q4DcM+j1Pc+7I7646k?=
 =?us-ascii?Q?W9lGXLTSHenfWrINwSqgEL5hcSYF1yLV/knhuMnr2iDKSx1jw/hZmbRwfuZH?=
 =?us-ascii?Q?nC2cKQsTP9XZaxJzS/VqZ8At5H2cPDMQGFE9/FOgE1j36s7xVbK/oQ8yzDur?=
 =?us-ascii?Q?3GOzVsztSsyP+DGhjARhK3r+hFBS1EUoNC4xH/2Fo6yK6Zh3oGy8cq632cYI?=
 =?us-ascii?Q?FSo+R/Y2KiAvStRYYu5B3mzkRNf9LdGnPVYC3ZIqWHK5jtcLN9PNfpm7IzSd?=
 =?us-ascii?Q?3D03+0ikl8+TdM/da27ZuUxx9le4moZ2jMjQ1Kf8GdiKmgZpETKgddGZNYZN?=
 =?us-ascii?Q?XJ1kv3KcUwFmb1bWLfVjaDqXsq2MIPtvsVtIt3dmUmHEGebug1rzGBYZqgB3?=
 =?us-ascii?Q?7YCskz0cCxDmrLOcPhvumfDhwZ2mczcNxFJsBmiDkqLHkDXzRvkVB+fQLt7Z?=
 =?us-ascii?Q?QLQZDjgity/3K7TYdEyMbZwSfMVB2k8z4cA8D8ONzy8GKA+/f3mz63Es4TY9?=
 =?us-ascii?Q?6+8EtLnCVcJ+RKqa/jqEhcQF9dxZXx6rOCYx+UGwnoDNdNiZUztSIp2qJ1xP?=
 =?us-ascii?Q?nKspc/HukBRIyzo3s7VukRQnJTq1upic/kRDKqBlsyIGV8MaI6/opVGYGNcl?=
 =?us-ascii?Q?MM2RI+tcvyCK/+823TeQm+LX/vErkTmVSyDeqJOdrortR3aYkzuKRnExWaVP?=
 =?us-ascii?Q?z/GMCfgk4ILoaIFOfz15yfny6vkPQxGRkZZsrY+ft6muUbNWhCS2eEp6dEGY?=
 =?us-ascii?Q?9Lm1cVHg3uVXzUaNTiaKUTNi4oOreKJ5PtCbPA1M5dhE1xl9bYbdnZB+mS1M?=
 =?us-ascii?Q?JVq3t+jLJLiu6Lnr+Uo4QX039fRINcux748Y/ze8M+1FeL1S3FX/GKr1Cd0P?=
 =?us-ascii?Q?U56bJfw5M1hEEiOhiOU7XTlwgel/gNYihUMBa/KL2uFL1qk6QgZ7sTu7K8Fp?=
 =?us-ascii?Q?3+dNjJoUMQ81A3CnCMqR+fOJN7DD6f0pXr2DaxNSYVCKRg24wtfMURyCJyBC?=
 =?us-ascii?Q?6dtrdfrvdR/ifk2DC1eYd9cw4tY1rV7xDhGWRkxTZFx5I4cd2x5n41XhwoSE?=
 =?us-ascii?Q?/30W7jz/10H6XFQkwAf9wJpXeUi7vxjE8V52ISD1s8BoMbQdgTFrx4S7ghB7?=
 =?us-ascii?Q?0L1xsVyUbVmTVrl5GjH1GePG?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99dc6538-2b4c-4d56-549b-08d8d28f2d7e
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 15:26:06.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGgndkZFwETSR61jkcieGY6+zhfMNpSLFe8ldaUFhpARs/d7ACs/Y5RK82qQoXUu1KRszSoMzjcojI57+knOVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB4085
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

For python and python-native added patch to fix
CVE-2019-20907

Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
---
 recipes-devtools/python/python.inc            |  1 +
 .../python/python/CVE-2019-20907.patch        | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 recipes-devtools/python/python/CVE-2019-20907.patch

diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/p=
ython.inc
index a4ba0c5..4bf30ee 100644
--- a/recipes-devtools/python/python.inc
+++ b/recipes-devtools/python/python.inc
@@ -8,6 +8,7 @@ INC_PR =3D "r1"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D203a6dbc802ee896020a47161e75964=
2"

 SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+           file://CVE-2019-20907.patch \
            "

 SRC_URI[sha256sum] =3D "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808e=
d4594812edef43"
diff --git a/recipes-devtools/python/python/CVE-2019-20907.patch b/recipes-=
devtools/python/python/CVE-2019-20907.patch
new file mode 100644
index 0000000..4c24c53
--- /dev/null
+++ b/recipes-devtools/python/python/CVE-2019-20907.patch
@@ -0,0 +1,53 @@
+From f5481db4bebf9d53b79f29f960f4188af8ccdfde Mon Sep 17 00:00:00 2001
+From: Rishi <rishi_devan@mail.com>
+Date: Wed, 15 Jul 2020 13:51:00 +0200
+Subject: [PATCH] bpo-39017: Avoid infinite loop in the tarfile module
+ (GH-21454)
+
+Avoid infinite loop when reading specially crafted TAR files using the tar=
file module
+(CVE-2019-20907).
+---
+ Lib/tarfile.py                                    |   2 ++
+ Lib/test/test_tarfile.py                          |   7 +++++++
+ 2 files changed, 9 insertions(+)
+
+Upstream-Status: Backport[https://github.com/xzy3/cpython/commit/f5481db4b=
ebf9d53b79f29f960f4188af8ccdfde.patch]
+CVE: CVE-2019-20907
+Link: https://github.com/xzy3/cpython/commit/f5481db4bebf9d53b79f29f960f41=
88af8ccdfde.patch
+Comment: Second hunk refreshed and from the original patch skipped changes=
 for files
+Lib/test/recursion.tar and Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bp=
o-39017.x3Cg-9.rst
+as these files are not present in our source code.
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index e2b60532f693d..6769066cabd6f 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1249,6 +1249,8 @@ def _proc_pax(self, tarfile):
+
+             length, keyword =3D match.groups()
+             length =3D int(length)
++            if length =3D=3D 0:
++                raise InvalidHeaderError("invalid header")
+             value =3D buf[match.end(2) + 1:match.start(1) + length - 1]
+
+             # Normally, we could just use "utf-8" as the encoding and "st=
rict"
+
+
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 89bd738..c61d02b 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -321,6 +321,13 @@ class CommonReadTest(ReadTest):
+                 with self.assertRaisesRegexp(tarfile.ReadError, "unexpect=
ed end of data"):
+                     tar.extractfile(t).read()
+
++    def test_length_zero_header(self):
++        # bpo-39017 (CVE-2019-20907): reading a zero-length header should=
 fail
++        # with an exception
++        with self.assertRaisesRegex(tarfile.ReadError, "file could not be=
 opened successfully"):
++            with tarfile.open(support.findfile('recursion.tar')) as tar:
++                pass
++
+
+ class MiscReadTest(CommonReadTest):
+     taropen =3D tarfile.TarFile.taropen
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
