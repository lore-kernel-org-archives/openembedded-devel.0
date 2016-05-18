Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0088.outbound.protection.outlook.com [157.56.112.88])
	by mail.openembedded.org (Postfix) with ESMTP id 66C1273CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 21:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3WfecC+zTWnJOCW8yKXcGfSL9M0aZnsLzfvw+v+EBdo=;
	b=XXL6C5VovkVDQbJj6t9YYFXwK2B1+tFHkwtIPqz7F+tvFZPkU2SHh0acgsQC+DaC+o0YTD6aqoECw7IBBLWNfyfP2B8zTbsVRMebnLyGtP4N+wBNdAWYySzL5ipaDqIay9guoXjkAPvOHmNpikr0YVC838i5Qit+J/nv6Yh9BEc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	HE1PR04MB1578.eurprd04.prod.outlook.com (10.164.48.140) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Wed, 18 May 2016 21:24:46 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 May 2016 16:22:55 -0500
Message-ID: <1463606575-24741-2-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463606575-24741-1-git-send-email-neenareddy.busireddy@nxp.com>
References: <1463606575-24741-1-git-send-email-neenareddy.busireddy@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: SN1PR07CA0041.namprd07.prod.outlook.com (10.162.170.179) To
	HE1PR04MB1578.eurprd04.prod.outlook.com (10.164.48.140)
X-MS-Office365-Filtering-Correlation-Id: 7414a1aa-153e-4288-7a64-08d37f62d67e
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1578;
	2:ItSyv4qMaZaEpJKQVwltxMxGtF7/QLjIBypFdDEIVK4IrRTKL33pxxHD2TcFBWFXvXZgn769ev4vX/OxBT0cT4CRQn63Gsv8g1tDZFcza7kncVGMTXm/rKqketYkfMuryTu/2Gc0cOUXOrxqllCWCEkBagEYbtb0s2OKgCbzG7q7MXJNIACWDEfCclRLU2ux;
	3:rDnbc9WcsqTw613jidDm0KXX1R+2aCHkFuPERDVFJDwZTlf8vgyFPvZHzuGSf242Vtlf78iz22eBeXFwtbdS7DGsVu2Q55rfHsFZCMEExDOnLkoKhnAd/wVMXjDuGP69;
	25:tFsYkd9CrBb2ZqZwkoTug4NrgKrcfEv13jPQ1K+xT6LWn+56xZwfoXWliCCc6dlPRr2jHtb0yXMU66jD8SvlAJQFYKk5gvRX0b9F5ZzzaUqQ2PDUuZhc5U+h3Bb0wlqJ2liGwSFm3PELnf9tdom4AwupUqsL0vzXqpzbM9ayjyMGDYKg8znAdbrhkyXbxOOdzH7kzab0RiYrPZsxI23b7Pbl4SldRvzyd5JjDTW/9Yo/CPEIz0w/sxS8Ym77QItllPr/u4bCoYRI+4ok7adPtPU15z09hQeWXbbmJNt6+0e9rOKj0v7+2zSBJjhCQSsxFDRjW0fz/xY/LJTJEpHlb1x1WzG+UfXNL4ZqIr2Z2BFnVpqjlzvTSClOC1DOVTDiao4aVH7eGJTnGb0Ko8NNLcbRXSs+o6lAzTZY8XPMxjA=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR04MB1578;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1578;
	20:2uxL4VIYdTFMLses6xxUc37Nl3Mlf2VzBp2dIQGLpP1oSt5UKt5vAE5eyZZhSWMIZ7prFj4Z6zbLOk5OYMRXBkwkv2+cJM/Pv5THDUMrk3BmSGlPgSTTY6mR/HKLnoFv0Ono9y+Hf3EoG/+N4IW0UeTwun0yXqFwKmusZyTz0wcfr6gPa62/JTJgXo/UfEs/Ekk3kh1WQo6dTh0mfpUL07gz4eZiIBtN4BjYiytnIhrlFJ9yEA9fGk8av4m+dBDApMy5kexffA1rZta8TrEtOUPeuMExtsoAMSPkU6JRkTCUffYkngLuUhxZhpjphV7yD0zlKDrStv9gEi0BBupUHsyA2spnVgU3dxQ3Dmqk8hyaQDEsflqs9mwFn5LexCRgeUfRwR3iYsUkRhG8p9zhhnXfu+g5FTG1ZHsoY7OW3p6HYGTyrRjlmE6gaoIBe2aapts5/PuZjbkS+jvhvFTGD2VctXT6SK/zKLPdiAyXNhFm5GrNcQ+vpuvTvdAcMCUy;
	4:ri2SBoNtfGErPQZ6EtxwVW342JcqZbw0D482+ZAcfN1eC5UhvD3Mz5RNsTsEQ2kObjLCf0WP8KK6HB4XM6LZW4bKltmrYj8hUuD5qFiMZ1KinzhS7A4n9TadzVdl71lBX8fDJ9j7T19FngYw+PbS9ZjPkMwjiYJtkX13o3NxtfjmiWHPS0ZoIIUNhnvmYR/wg9rQ8cp/A2P3rW7bNj/h4QhkNIT/HLIhUgWC5eY1y4umzc7FkW6iQM56o0Iz1ghokeLXjMek2+9FShV92vcLfm0WEW2TRCpTheEbQM63wZqsNGQos58WusGdqJq/2rYaHSEw/z3fmmDnwhQ4bA+iEsgBRTQW58cVND/JwJGJ3Ti0ZQWcmdL0fW8TyrNkwldCmBZ+GAGLVo8U2GfSW0tefQ==
X-Microsoft-Antispam-PRVS: <HE1PR04MB15784A1CD970EC3B5F09A34791490@HE1PR04MB1578.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:HE1PR04MB1578; BCL:0; PCL:0; RULEID:; SRVR:HE1PR04MB1578; 
X-Forefront-PRVS: 0946DC87A1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(2906002)(6116002)(4326007)(42186005)(110136002)(586003)(3846002)(66066001)(19580395003)(47776003)(48376002)(86362001)(36756003)(81166006)(575784001)(450100001)(5003940100001)(8676002)(50466002)(189998001)(5008740100001)(50986999)(50226002)(76176999)(92566002)(77096005)(5004730100002)(2950100001)(229853001)(2351001)(15975445007)(33646002)(19580405001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR04MB1578;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR04MB1578;
	23:PtNJJ9bMwJyvHc4evoJY4GwagUa4n8qA/DgwaW6Oo?=
	=?us-ascii?Q?CS07LKXr3+vXHiQ2cqCDKjjtO24e3P1iC2YR+Bz4s9xfY997GyV3LDDXPmCy?=
	=?us-ascii?Q?KWPm05DhnGQtaxEkOiRA0ErWAAev8FGlWxNkJ3XIcj/8cpkU370UnSnayfV2?=
	=?us-ascii?Q?KhgRu0s+pnd/LzdOo18EUAbSbCL1D+Ha/B2WmfAsHRNenw73SrtaqN/ttb/m?=
	=?us-ascii?Q?lW/2+EJhcvQm2ZhjCr+QdRkouG8/QKy6iz7yOIdICK59dcbDpJYOXrzqnan8?=
	=?us-ascii?Q?uX3HBgMgUL0L1Lo9OCp9YpG8SYd8HUb8Yl8rj5c+sLkkD94lXXQ54Q2LVkP/?=
	=?us-ascii?Q?u6u4s0ykSkSSdqRXg8kSaqbhJgEte6KpZontZ9Sv8eqO0as9PUsl8//bxR4o?=
	=?us-ascii?Q?VNtq+LmDInLRcDMf4wiaGOGHX/IM8sQv+IegMJMGLE4E4XAquUOMOKrO8ulK?=
	=?us-ascii?Q?/Bma0s3fzKCa+qBKlSk0gxj6KADh2lCzkISARyPm7yvn5p0sHHjJH82s7F0G?=
	=?us-ascii?Q?W1lpaiPaI1FR1wKDIqBvdP1BYtcAK4D6Z/1z59JvMuteEOsFF52kxxlr1f1R?=
	=?us-ascii?Q?s8Ab5iFJUFyD+5Hxu+VCVzeYbOnj3gWVjumSxIe3A0xCthsXhb9xzv97fPUi?=
	=?us-ascii?Q?ccgO0O9OIzT/pVd8juoA6ypQ+Y2oVikd61BdXkexobbpcUisA/ev4up3R/OV?=
	=?us-ascii?Q?yUk7vsi1rSB22KGcMCHZHu61AXFYh99i94CraETLUm3hLl4OgzA/JEz/Cvl7?=
	=?us-ascii?Q?MFy5mrSV5DKm/VXqCzfBdcdh37Dm87S1/L4+u1o54nzGhF2SchKjMwNMRKab?=
	=?us-ascii?Q?WZNUCk2KD5x1Q22PlfVpsBx5xemVfgJcnElFCXki8On3Cymf9QkCTfe/eaPb?=
	=?us-ascii?Q?SdvkBjuqyr/GOoc1TcNkd3jF6Vcn2B/U2YrF+a/z52Ksh84P5oMz0X1PP9MS?=
	=?us-ascii?Q?GCl49ShBzw552QecVv+8opBKFJqyR95jYvvITc+Pg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1578;
	5:bzB4fA6WpCg6PkS8J2Ye7jDXW2AexOCi1ictE6jSsksVc0Yi6+XcRJqgsJN7ESJYAufbpe9RLBhwxw/DFJHgTAgdVIy8/xJWJzETy9zCpqZB/DU4RQSXnVf0w5CUuRfJ2PJvRaKKZ9dTKtYmZlHCOw==;
	24:v4hmPM6ajDMw8c6wIPyOO9XHOg2IRRKQNSHzzFUAli/5sMJoF2xiIGJBzmBwvT6eaOnCk35LdZtg0UdfHZ6XvnzQRFrvd+/4V5HxLi/D/DI=;
	7:6ocvrCCJTcx2YLSvpGVdpSTR1HanmWquLoK3rtuYMbSy9c6vVqTT8xVdPrek3MDJkA8HbhKeLtvcLlC21brze08O0bhvM6FcFlR+QuNDnjM6nOHZs5ZzUhjOQYZb+CtO3UtWJomAdn7Vt0GDLVE+HQuXr3fXV8I1/PJnwNQ11qjxyLbujN/16cpYnHnvIgTH
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2016 21:24:46.5101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB1578
Subject: [meta-oe][PATCH v3 2/2] freeglut: Add a recipe freeglut to replace mesa-glut
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 21:24:50 -0000
Content-Type: text/plain

FreeGLUT is a free-software/open-source alternative to the OpenGL
Utility Toolkit (GLUT) library.
More information about this library can be found in
http://freeglut.sourceforge.net/

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
new file mode 100644
index 0000000..389d3fb
--- /dev/null
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "FreeGLUT is a free-software/open-source alternative to the OpenGL \
+               Utility Toolkit (GLUT) library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
+
+SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "90c3ca4dd9d51cf32276bc5344ec9754"
+SRC_URI[sha256sum] = "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2"
+
+inherit cmake distro_features_check
+
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PROVIDES += "mesa-glut"
+
+DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
-- 
1.9.1


