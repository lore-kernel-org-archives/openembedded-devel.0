Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EF4C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 19:15:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1177.1639682120502258143
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 11:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bpp9SY4c;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79840fd348=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BGIXuUr028170
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 11:15:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=aRS06megWy3BR++c9fcGkrMAxDBjdbjEQZ50kgAx/Qw=;
 b=bpp9SY4cy7tGiogz8UxXMgmxt5IKml9K76r1un+cDh3cTtihYQ8+MyiFsR4egkHpG7vJ
 OC/UB/zsTF+0twJcc31gN6phcYMKBwMm0L+niNt7LaWgGS4ngyWPkTjkP3liHhw4LZ4h
 Gpd5iLgt/VsEwKiJ+2nLNVZM5QTHyZBcBLUn+CxVlj3kpUEhpUhYF/XbacYKRpYLVwfk
 NMPZou8C4EhCZHvNC+ujQQIyS3rcTat77jycq7kqa0thehpaWHZu9YR/BDxd+o/LOBMF
 WgSSPJzw5LlZjieho8B0vy/NqtX3ELAQu7yCziz46dKZqVbHTth2+dYmUjqnBbIhgc/l Gg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cyyup0haq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 11:15:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMN8YGhFCtIxpB4xyeOAtgtCpQW31UlvIk6T/M3+FVHOa8GHC5DZXjfGABWDVfGMicq4/6Ue6hioCHFjhr0yBsl9PkVnU8YTrk9t+0smskQ5d4/XsIetzdt4+3NiTnDVzBhkh4xxRAbEQrXsNwPY8b7iAL4sIZT6RfSt55CoNa3bQOtc5/AH4dfHEH7pvecUwmt6o+uHCVepfd/yOjWjnau0YISm41D54+MgbS7lxurWsx0oE9gdhiWeZeM+CX0PFMSrWkHOFrbqxn6/XfgCj7gSVIrh4DtKljG6+AN8Cnca4H+MvfN6t2TtfLabkgSj+wsyeo+7BBf49w4hhec56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRS06megWy3BR++c9fcGkrMAxDBjdbjEQZ50kgAx/Qw=;
 b=R2s3OyoLo/alVNRhcm1QQhG9x99+SnN8jjrNrYKpkGcTXBygTgCPYh5w7+KTstCdb+o6qolHgofLHO3uOApU6gmBqO3tze872f47YT7EPCDUnMnqd0LO1Z8tFP4PDhmVOPorW6YZ9ad92YRWGTtyPUk4SUjl7odSHjxEvrVlrw52UR00vKpDiEuVI4JUCn/IRHMioUzpXlbGMmx7OYWPYfZ0JO1LLeD2vvh8FQufh3p1UzwBsKg9E1tr2H/UH/lyuC4qFN79DdLaez9qrBO5YOktu/htKi/T7/OBJgboLMjNGuKSTfO+d1rXNBGzlW7PecUQSl6MDUJqqU/o7GAAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 19:15:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::381c:4755:45c6:141]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::381c:4755:45c6:141%7]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 19:15:16 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libnftnl: add ptest
Date: Thu, 16 Dec 2021 14:15:04 -0500
Message-Id: <20211216191504.3999-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e087a376-0cca-45c9-206c-08d9c0c86481
X-MS-TrafficTypeDiagnostic: BY5PR11MB3895:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB38958E02C3FB5F21B4DE3E9C9F779@BY5PR11MB3895.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xSuZc1h93L8orGDd0BP5cetS4EsVj+i6O4/8TjuOPLBfwoFw7vE2blowuRMFFfOPuH7jdVHTQpU3b0wWIL0ULg+q32oogEGE0zdrskyOE4dJBhSCcu119wiBiZF45wMcREG0y0+EbiUj6Hy+8G/0f+fCmlFKt2bwYxO3NdP+2qTM3I245U5NcSFt+wLdA2G9qYatwwywCXtUwsrt4y7mzlLktzaT0QmpQ3gZkanSTHc88SKDNSjMgHDCoGXMnV6Y8TZ1I6csBuSu6BjG0RNyUn00Mh9KjigBiggQQ/8SvamaE/Gxs2Qb/couBd4vrRBE9ONFoetb2vIu2oyxY5pDh09QohuJlwbcuELAt9VEoInfau/il7fz/+K2M/KWjHMd+TnDK6kPQHWugO5wVvfmYpxhYVkbtcc1qOXSijIcw/t97v/l8+iFMm4IHchr8+t1YQXPuYK6LgQG2QwraIYzIP30JBcIcJsSCUsIP2q74XMb1VinhUn68M6MGYp7UrVGvN+SIDfbYjwdZbSeU/fzk+QDCJ8hhpwr9LpYpjB2aAyDda9PoJV8xr+N+J0bllaFBgJDfYnW2bcjHkcGASZjgDif0DFhSsYwlPfPrLDQgUwPi+OCWG83xsoHx7QYLxoJMcRCN/PvJ0fb9CW9MDV/ch8WZoJGH39dE2oMe8Qi5NGy0tDoFBaDKdjLOuRhjahfddZUhu6DXpevrg5uie2qIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(2616005)(508600001)(44832011)(83380400001)(6916009)(8936002)(52116002)(6512007)(186003)(5660300002)(26005)(8676002)(38350700002)(6506007)(66556008)(66476007)(38100700002)(1076003)(66946007)(6666004)(86362001)(316002)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+74JZTvU9N4DM6aOSIDIHIC0qIrtqtSgNfHbaq+popBDajZvSKoMxPfhlz9s?=
 =?us-ascii?Q?8aeqPcpdR7bRyr56IPVk7BP6dgwM2P53RVXd8RtgXl0uOzfRkx/ACrHFrMuz?=
 =?us-ascii?Q?He/3Lx6Taf0IUZ0bWqgs7sSJ8BStSMNwWUVYaygMLA54pyboZo1aeb3FuS2w?=
 =?us-ascii?Q?2fFV5jUFvN08QiuntitNLk5W7FdyMSTVRGMo4BA/iKem5eWN2PGAQUnZSVS1?=
 =?us-ascii?Q?AHDDtPxy9rTxod7DoyjbclyzNroXh040ZTbc8sIZRX8y2U2jZMUVWB6xbJrL?=
 =?us-ascii?Q?kgLiXMPnkpbd8NdamUZeoM2DNXXdyG6XBXpBqE/bg4zbXEUvxzh3WWjjl/w6?=
 =?us-ascii?Q?Xxd5RS/q/BEKRmvnnikP+bIm0QnW69hlkCl0cgr56zJWc6aBHTtyhziunJEH?=
 =?us-ascii?Q?FdenujWQ9tWLl1mO1mEz8YbSlWbnguPcCUlNgau2MVgOebvLX+Ym9VSA8w+G?=
 =?us-ascii?Q?91dJux+5mn92zmWH+0verUoc3oGiBsCCwKVI+90nIB6vuhDNnDUGAFkNo4YO?=
 =?us-ascii?Q?PPYbkKaqV4S0MT58kCKIVnij5WDpjGn9BJhMq8bQK6V5Uvc3kRKyFzVq/YiH?=
 =?us-ascii?Q?nn00LNLC5iOlSSwSqgm2ZdhIo3XZq4JrFIkdjzztUF+2miail7Mz9HFA5X73?=
 =?us-ascii?Q?R0gMx7b6tqDcCGVep2a4BrOQ2DgfDxLw+64ri9pczcvA5VninXlE5NzfCzGO?=
 =?us-ascii?Q?FzBAzHxPIgt4QDi5jw7lglv4xLxG+BxOFq5Ah+mt2J3MLhPFCn5f36jMlznn?=
 =?us-ascii?Q?e6WC9Q/2NUSQqEJCBn7F45v5+1zfaX51Fzkpnr15Cp8xI1gPvUQHy4Uej1X+?=
 =?us-ascii?Q?mGNTxE91GP4BGoAce4dcNGbWOW1UfXSszs8HpD5HLv55m4F1ryLD6P2/ydxW?=
 =?us-ascii?Q?vPhiOrVriTB+WS0E2DGe7kd8osn5UG+EHTUoTNxK0QuIfvIWSiF6pLAyZ7IH?=
 =?us-ascii?Q?18hXseuRoM3lt/Dus/3pk2nn3wdnvDGPt+buerS+kXOfAvB7IagpdOgGcFuT?=
 =?us-ascii?Q?gz3Og6n0YnOMHjdkrDGDpxB5rES4clI0UfwvmSGd4D3B9P5P9yVIU8EsfqbU?=
 =?us-ascii?Q?htTulRDSCQuXvbXNxr3K9VwSS/kWPX+NDoENmraCvDHO4in7HYksUNbl0cpa?=
 =?us-ascii?Q?8SD/TaDTEacbO+WyV/fXvKBTKSoQvePB3v0xMfjxEkttir1jFu9UmpFZBXYj?=
 =?us-ascii?Q?qIE1eOhp2L9ZERWlkbEblLDr2QtXxOFPMpmaGtdLE6XaNvPuMT2Ls4Yqc0+M?=
 =?us-ascii?Q?+B/AoZ9z4rU6GYIpSAZAzkPb0o8+vDv9/3ZYBxxPkN47Bynnxf8hOfxjSAOL?=
 =?us-ascii?Q?QDeqmDzbHi3tyf9r7Kzo8Gnyjmpp7L88kxIq5QwJiqPoWwDUsfVLvzECSwUN?=
 =?us-ascii?Q?NSxi7Hpm87kPzXAg95SDL4camxgWi5wQLNyHbaG4qMXOAAGNAUyUTNntW0si?=
 =?us-ascii?Q?ZOPi7KOHllxnBuOUcSVyLB96RYDCc//x1BhR3cOLsMdFZ/IDhxzSfEaJOuuo?=
 =?us-ascii?Q?Y16eMZkYzW7w/IqxOsBsOzDEOZmxkeiEGBMDLsGvJN1VX4zsAEaeIVUrvZVj?=
 =?us-ascii?Q?lQZp6QTEi1LrFcDQPr3dHK3STmhPQgZ4149E+TSs80EofG22e4dGzTT8NUZS?=
 =?us-ascii?Q?dSL4jm2k6LQ6oihr/5koRpnrPra3ER7G2WF672DnquVJU6S4fHx5w3+8ANax?=
 =?us-ascii?Q?oT4alA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e087a376-0cca-45c9-206c-08d9c0c86481
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 19:15:16.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5uoX6EnbCd9n+El3mc9+aFcme8lzLTDmiwpsc/ZkXIj5bnZxs7ZY7seHOFJjcjf1vfP1XjYYiINWvEXULIECNJ0fJrUPVRfkwMObCpBbrxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
X-Proofpoint-GUID: pURPRtrvCp2EIdx3icjNsPgtGboc1o9z
X-Proofpoint-ORIG-GUID: pURPRtrvCp2EIdx3icjNsPgtGboc1o9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_07,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 19:15:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94406

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../0001-configure.ac-Add-serial-tests.patch  | 33 +++++++++++++++++++
 .../libnftnl/libnftnl/run-ptest               |  2 ++
 .../recipes-filter/libnftnl/libnftnl_1.2.1.bb | 29 +++++++++++++++-
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
 create mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/run-ptest

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
new file mode 100644
index 000000000..049ad2d39
--- /dev/null
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
@@ -0,0 +1,33 @@
+From 1cb59c1fed33607e4fb2bee9144ce45276e9cc96 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 14 Dec 2021 12:31:12 -0500
+Subject: [PATCH] configure.ac: Add serial-tests
+
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+Upstream-Status: Inappropriate (default automake behavior incompatible with ptest)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8e68035..2704214 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -8,7 +8,9 @@ AC_CONFIG_HEADERS([config.h])
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ 
+ AM_INIT_AUTOMAKE([-Wall foreign tar-pax no-dist-gzip dist-bzip2
+-	1.6 subdir-objects])
++	1.6 subdir-objects serial-tests])
++
++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
+ 
+ dnl kernel style compile messages
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+-- 
+2.33.1
+
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/run-ptest b/meta-networking/recipes-filter/libnftnl/libnftnl/run-ptest
new file mode 100644
index 000000000..133cf92d0
--- /dev/null
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -C tests -k runtest-TESTS
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
index 16de8589a..ec4619e7b 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
@@ -7,8 +7,35 @@ DEPENDS = "libmnl"
 SRCREV = "09456c720e9c00eecc08e41ac6b7c291b3821ee5"
 SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
+           file://0001-configure.ac-Add-serial-tests.patch \
+           file://run-ptest \
            "
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
+
+RDEPENDS:${PN}-ptest += " bash python3-core make"
+ 
+TESTDIR = "tests"
+
+do_compile_ptest() {
+    cp -rf ${S}/build-aux .
+    oe_runmake buildtest-TESTS
+}
+ 
+do_install_ptest() {
+    cp -rf ${B}/build-aux ${D}${PTEST_PATH}
+    install -d ${D}${PTEST_PATH}/${TESTDIR}
+    cp -rf ${B}/${TESTDIR}/Makefile ${D}${PTEST_PATH}/${TESTDIR}
+
+    # the binaries compiled in ${TESTDIR} will look for a compiler to
+    # use, which will cause failures. Substitute the binaries in
+    # ${TESTDIR}/.libs instead
+    cp -rf ${B}/${TESTDIR}/.libs/* ${D}${PTEST_PATH}/${TESTDIR}
+
+    # Alter the Makefile so that it does not try and rebuild anything in
+    # other nonexistent paths before running the actual tests
+    sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+}
+
-- 
2.33.0


