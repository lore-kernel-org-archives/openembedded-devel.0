Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903E7C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 06:43:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7579.1708497814015881895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 22:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JEmeMMyP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2781bf2bed=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L6DdZE023376
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 22:43:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=U6MWeuhzARyBFndpU/
	+2F4+XqtzNUa0jeBhPXOew/G0=; b=JEmeMMyPLCBBSPACGHgvwFbE49Xk+m1S8N
	ICsPT0oiRcx6yA2wD7j8dkJPU7cFc6yGCDVt4FcDX6dcphQi/7wd2SJAPw+srChJ
	XYNJKuz9WWLgrY+3X5QZPwfPhfwC985Cr36roq9g1VONUa/6To1BGT+ZatJ2NQ+e
	8y3eOh5m33+728/v2adBvpRw4eRuNPVqQI9Unnnhk4Ry17QA+5yDv4qNuHlPZuFR
	3Uj1znpYQ/ZCktkdUfJp1mNaGFDtECfH9WuiDk7R+xpsOauRDXM8WyiqldBiCr6/
	IqdpJSSNE5P8jRXNaWRwvxCuBAjqKePr77vhgUCT3ZT/j93+i9og==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20crfq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 22:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EehRlEobMe59MTubGK2qfMvIHirh84Jo0VooJVXqSRCRKS+UHoSqNB5LdZDngLYh3Lu+kUlS9u5aBJ2t2tlWuRtw7qGS12g9Puma+Vrk7z1Fo3HDb6syVfFtnKoJZSkh25ZSUvKkQDoxqgD0DYDC79eEVqd9oaeNEkIj0NETbu/LyxhF9mVzw7aVdVxQTT3UgAY0VLuOiLjnfxIH72WjYtYSPKleJd4uPkRBuozmVCtbKB4yP5G0lvq/6TxXCo5HmyT5u67NYcmqk/nZ1TuIOJG+ZUQI2k/RPSMpf1/6EKKkvHtjNeZacxwbTlltcHHZ6rw0cq3kUO3nVB+nz66Qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6MWeuhzARyBFndpU/+2F4+XqtzNUa0jeBhPXOew/G0=;
 b=Cei40jqmK6WWs9r+TU1PN+GbLROYENHY1elJDUEcRFs5Gqd7jH9GeItuwbS694huBSX3PslANViriAhZGvI3E6J66BDrZ2WSGr0+I3REP21hYdQtfSp4jmQSrLmxWntoknKtkH63cKpjyp/1/hM82+5q/+92HzAZxll/MXKSU6zaiq4Eq4JMfB+Mao8RaW+ZL9H5ABJPAeUlRku+qcQByOjVKw7o4gbWaZTk8Pz2EAKujOVVTfngany10ZCXuQrIri9BI/qxRdv5PWd1RSEZh+IESfpSaQ/jTccNuE0bMhb79Nxqlx41dtS1RvdvJYPx+leFIxhjbf7vow/btjKWdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 06:43:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 06:43:31 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] unixodbc: fix odbc.pc file generation
Date: Wed, 21 Feb 2024 14:43:14 +0800
Message-Id: <20240221064314.3635222-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: d10f8bd4-6f6f-4071-a1b8-08dc32a86af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IYYx9Xw1avdRCVy0kBZwx2FuKrOMkX5Q7j0gQQkWX10QIGp7EulZJ/iJVT6wQsIcQWoKgbe3YLuQuI4MCv9LIhJUAjayj0y6KUyvxTb25Oc7QddiYr9Mepdv9qrDJ8Wp11RzEkld8zKvK3luSaphvQFPej//1HfPzissv8HJb/v65ArhUBd5tOrll3RLuO3USoevG7PbRRyBdTVAfSZ8qATuTtWWVItmxcCaFts+sFTermcFrJ59aUkHA9ofW9ePE89WFMlYGwQZeaPtO/QLZ24di7nez6tmuJjfphi65c3MC9OwF34YYV9pJZBnmXwVcrzxaVWlfDr11Y37//5gRWDRYl8vE9I7qyayX6MgE3zwoTBuMFb4syj+dWwgDpm/3PQP8rmZqGAjC1JPY1aeZsdfAgBTWEu3K9IpjWLu+TWjDzXbxR/hQTW1oQfpOBcgpOlaJM+iVbSeeHCE7plTlJKWXbqa52PrdgycOwi40qKzd0+M6uUIsLRODxvUOzX82+ODlLPpRKPfkv/1CChD9H9e7dyPZMDAgYULFbvHsNOQPAq0j/3lGLVXN2IiCQ0iC65SQjPsIvqrwX88WRyw30sDcNkWlJjfRvYaCD+nxS8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jbrtzjwXsrJ58gW9NPkhLlYZPXZeUuZLQTcwN8ffio6yAnSWktD1aGlzbb/K?=
 =?us-ascii?Q?67oQDL7zvi2yBPspmNQT3ucDnkl/wsN+48LI3OmsCex8b35GtitGCzT+a/c+?=
 =?us-ascii?Q?YhVF1hgPbG5dxEVhB2KJ/PPQNM3kMbBA0przeFYUQTH/wmQj4El0e6MBOpBY?=
 =?us-ascii?Q?Sl090z28JAiHDeEJ8kc0TnF+Rx2+dd2uwXwFCH/CP3YWJ59O1TeXqjLnE1DL?=
 =?us-ascii?Q?tnWGfrt+G9L+vzmyX6YC22AXl0nbGnNEo+5HJAUsWxCQ6bOO6x7P1FqPxPJG?=
 =?us-ascii?Q?nRgRZRcdqAkqD4ZI9fdN7tcGVOK7Q+eej2wbzBu2nUEUQ2CKqRWE7BV8FwyB?=
 =?us-ascii?Q?SfFd4nWVwtGic/hjMFURYNvpKvmcL+XHqSzF/GX49+u+mVlhkNv3b31thgUU?=
 =?us-ascii?Q?eBpkcIpTfIiSZk/XwIEGOs+6atihLGJOTKsQ4WHTNblyMJyNNF4tnEPqnhdb?=
 =?us-ascii?Q?Ki6j1lhgmWr0bplsfslX16sIl1MUGTzfBGs9AYqttOL7hvtu5xsVMUxl6ih7?=
 =?us-ascii?Q?Aaoo46Q4tRa37KGh+mUHXRdRbmICOFAHkOfw3gU00c9paeSn2XV4oI5YScP8?=
 =?us-ascii?Q?TvpejVLbkEwq1YXJZYU5rjgw9bUoEb6F55Z/B7fkizyAMPIps49Vmg/C2l9+?=
 =?us-ascii?Q?5A5OBEFj5e0Y8tgSDRrItal350xS30sbxRF+4OT9mi6in2cst8/bSvKfaXyY?=
 =?us-ascii?Q?IUjUupyPtY9DWDEG4HYXzSU1s3mOmUtTyqQRr7opSpHNzQ/6zvUAwqHy5Y4C?=
 =?us-ascii?Q?9rLxCGKWd/QxKMPM0GLBHWuhNV+Hly634lpIXEsV0uY99P4+jXT+IRHxG8rM?=
 =?us-ascii?Q?28P0S01E6+9aiRilB7oPaumBFQ0tqzsVJGfSBKDmdpISLkqfl9xi4GK0oKj4?=
 =?us-ascii?Q?V835LUtGUfjxWydndVFIi2YmNvlpINo5sx4b3I/ow5GhLPVKgcWAK5FQONU9?=
 =?us-ascii?Q?MJspkfuw/3etArhHOVuKzPThpGc86L5fVIZd0yFqtjUWzFHsQtZTTbbpQICp?=
 =?us-ascii?Q?yrl91trpxSyGmdhZSi7Jb5q3tTLItjpG0G0btod6gfMtxHvmtWnsjVyJJC08?=
 =?us-ascii?Q?+1y6XgtnTEgWjMEbuj8GofH0nyMyFEvgymCJfEMkgk34lyXmB4L+SKDTFbrL?=
 =?us-ascii?Q?/3pUxhDIfscM991+bMRgBohR95fKnJZOyIisKPsqUumFvrpnrELjFnF00QQE?=
 =?us-ascii?Q?/mRdGlM5O0etxhzta0QNTmUrJC0y8aX/hm+HnAlebcnCiAzwyhutgNaRvqBQ?=
 =?us-ascii?Q?r1GSDvYAW6BLTs82pgmrfM9c2ZvnNbZatqPnaDPm5bH36fbVq9W2Z+D6kcUb?=
 =?us-ascii?Q?5CBBfcnLg49O45a1t1Viza6AqQ3Stg319hCCv/ay4FGn6OItlSnPXHQ+3fcs?=
 =?us-ascii?Q?PARfy5e7hOnlmReU84Auwq85l01WU+P2veJoXpciVPvsUIJ4iHBg696RT+Ib?=
 =?us-ascii?Q?Dg5p7yfVgSrVNssXseLfV16wp8CWR70N0JDgrQp7T+BZXDPEzpsMxrPE6hHX?=
 =?us-ascii?Q?9s2a36oqQDrw2a2scXWUGPWuJutC4dkexDXJ3FfnBhxC/WhreXARRLhEk/jl?=
 =?us-ascii?Q?595fqF90eIFAn3FhTArFX+1/UOAg0SgxLDLa6zKq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10f8bd4-6f6f-4071-a1b8-08dc32a86af3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 06:43:31.1492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SthcGhihXRilkp1ScKMwXFpPp00s2YgYL21yFKJMJDsv+8tcwhb/FmNKmpieSiFM9jCXSbX2PQMaj8Hm+jxxPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
X-Proofpoint-GUID: 83pTUkOTAazRK7l4s9eY7GJQj0Qs2xFC
X-Proofpoint-ORIG-GUID: 83pTUkOTAazRK7l4s9eY7GJQj0Qs2xFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 06:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108958

From: Chen Qi <Qi.Chen@windriver.com>

The build process currently succeeds but the odbc.pc file is not correctly
generated.

The error message is like below in log.do_compile and log.do_install:

  /bin/bash: line 1: ../exe/odbc_config: cannot execute binary file: Exec format error

I can see the message comes from the following line in exe/Makefile.am:

@sed "s![@]ODBC_ULEN[@]!`$(top_builddir)/exe/odbc_config$(EXEEXT) --ulen`!" \
          $(top_builddir)/DriverManager/odbc.pc > $(top_builddir)/exe/odbc.pc.tmp

It's running the exe/odbc_config program we built out. But the binary is for the target
platform and if we run it on the build host, we get that error message. The resulting ulen
and build_cflags in the final odbc.pc file are also empty.

Fix the issue by using qemu usermode to launch the target binary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...add-CROSS_LAUNCHER-to-run-odbc_confi.patch | 54 +++++++++++++++++++
 .../unixodbc/unixodbc_2.3.11.bb               | 18 ++++++-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch

diff --git a/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch b/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
new file mode 100644
index 000000000..c763a9feb
--- /dev/null
+++ b/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
@@ -0,0 +1,54 @@
+From e886222c70d4b251f0785f670477b7aee938e5af Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 21 Feb 2024 13:55:41 +0800
+Subject: [PATCH] exe/Makefile.am: add CROSS_LAUNCHER to run odbc_config
+
+In case of cross compilation, the odbc_config cannot run, the error message
+would be like below:
+
+  /bin/bash: line 1: ../exe/odbc_config: cannot execute binary file: Exec format error
+
+Add CROSS_LAUNCHER to allow the possibility of running odbc_config correctly in
+case of cross compilation.
+
+For example, here's a possible value for it (Yocto project environment, aarch64 target).
+  export CROSS_LAUNCHER="PSEUDO_UNLOAD=1 qemu-aarch64 -r 5.15 \
+  -L /PATH/TO/unixodbc/2.3.11/recipe-sysroot \
+  -E LD_LIBRARY_PATH=/PATH/TO/unixodbc/2.3.11/recipe-sysroot//usr/lib:/PATH/TO/unixodbc/2.3.11/recipe-sysroot//usr/lib  "
+
+Other projects can use the launcher they like to allow correct generation of
+the odbc.pc file in cross compilation environment.
+
+Upstream-Status: Submitted [Personal Email, nick.gorham@easysoft.com]
+
+As said in the official website, https://www.unixodbc.org/, the way to report bug and send
+out patch is via personal email. So there's a public link above.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ exe/Makefile.am | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/exe/Makefile.am b/exe/Makefile.am
+index 03f3d5a..5f33cf2 100644
+--- a/exe/Makefile.am
++++ b/exe/Makefile.am
+@@ -59,11 +59,13 @@ slencheck_SOURCES = slencheck.c
+ dltest_DEPENDENCIES = $(LTDLDEPS)
+ dltest_LDADD = $(LIBLTDL)
+ 
++CROSS_LAUNCHER ?= ""
++
+ all-am:
+-	@sed "s![@]ODBC_ULEN[@]!`$(top_builddir)/exe/odbc_config$(EXEEXT) --ulen`!" \
++	@sed "s![@]ODBC_ULEN[@]!`$(CROSS_LAUNCHER)$(top_builddir)/exe/odbc_config$(EXEEXT) --ulen`!" \
+ 	  $(top_builddir)/DriverManager/odbc.pc > $(top_builddir)/exe/odbc.pc.tmp
+ 	@mv -f $(top_builddir)/exe/odbc.pc.tmp $(top_builddir)/DriverManager/odbc.pc
+-	@sed "s![@]ODBC_CFLAGS[@]!`$(top_builddir)/exe/odbc_config$(EXEEXT) --cflags | sed 's/ -I.*//'`!" \
++	@sed "s![@]ODBC_CFLAGS[@]!`$(CROSS_LAUNCHER)$(top_builddir)/exe/odbc_config$(EXEEXT) --cflags | sed 's/ -I.*//'`!" \
+ 	  $(top_builddir)/DriverManager/odbc.pc > $(top_builddir)/exe/odbc.pc.tmp
+ 	@mv -f $(top_builddir)/exe/odbc.pc.tmp $(top_builddir)/DriverManager/odbc.pc
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
index 3a9e390a2..0ab4f8864 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
@@ -10,23 +10,39 @@ DEPENDS = "libtool readline"
 
 SRC_URI = "https://www.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
+           file://0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch \
 "
 SRC_URI[sha256sum] = "d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c"
 
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools-brokensep multilib_header
+inherit autotools-brokensep multilib_header qemu
 
 S = "${WORKDIR}/unixODBC-${PV}"
 
 EXTRA_OEMAKE += "LIBS=-lltdl"
 
+DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
+QEMU_WRAPPER = "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+
 do_configure:prepend() {
     # old m4 files will cause libtool version don't match
     rm -rf m4/*
     rm -fr libltdl
 }
 
+do_compile:prepend() {
+    if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+	export CROSS_LAUNCHER="${QEMU_WRAPPER} "
+    fi
+}
+
+do_install:prepend() {
+    if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+	export CROSS_LAUNCHER="${QEMU_WRAPPER} "
+    fi
+}
+
 do_install:append() {
     oe_multilib_header unixodbc.h unixODBC/config.h unixODBC/unixodbc_conf.h
 }
-- 
2.34.1


