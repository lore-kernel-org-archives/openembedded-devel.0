Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A601C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 08:16:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7840.1720513008559554552
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 01:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=792037c54b=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4694XCRP017879
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jul 2024 08:16:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x2hbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 08:16:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZZSe2DJ/ZoidX12VVGhXxmE/GTENwHSYSzTC7pvJpIgUAnLkJrr1l116MssoKSK11Kk2Et/z6felc4PGx2qYsnnWERbqJVGQJYMDI/qptk+RGcRvfLX62Gb6Cc50eKlKwwSVvDoyBPj2zt/dgkTxnL466o6RWhVkODEdrxOHQpsamYmZ2efrZIMOkL62Ju98AVsZfVfqIUi8i/tbA+eKBWGy8zUOrkfsk3pDFkOBQynCBAWu/hxOfTmJF7Ru3BecRFWLmkpTQ3sx3+XaFFpTxT1M3vMhZ9GXZQP4URl9JF3GhpwxRf6rFcFF7gvFVf6TPRStMp87wQTCNsa99pmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KoEVlAVRkev9Rs6pju6iNlgzssXy//9eI6T9q1dvxs=;
 b=hIc61vL/aLttfcEVRx9wyvlCqyJGm7FQwZjzw4y2rWaeOhYPB6jWweoGjhhYX9vIT6MWfY8rj0QSwpWxxAJb+5exC9gExQrpnlgKegQYL+I4H00DK0F4dLsYOw1yGlOWlO2Hai8Rz2dFP5OdPMDvgm8Sgp2mGHRDejB3E3QVBmtSiNBg+j87+1TTkGvuIRnxScNIJfBMhN/CIct24kkcwVKj7Z/SdjYUSRhwMRR/y2IV3OlA9eOMcwSskFLbfczFo7vwmXracMCrBpxyv1aHM/Z2aByhHB4wlmi87VSA+ObEqcuhFV+MBsfUxb9uIJTGSj2RLRYM0/dNBvx5A7lMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB6890.namprd11.prod.outlook.com (2603:10b6:930:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 08:16:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 08:16:43 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] libdbd-mysql-perl: avoid invoking assert_lib at do_configure stage
Date: Tue,  9 Jul 2024 01:16:31 -0700
Message-Id: <20240709081631.458784-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aebd2a2-5038-4107-7f92-08dc9fef77a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JlJBZhqsrFk3P2w6zCJMao3jasvLKFYXwDuD4Gw7NqUneyk2HptUEFughkhe?=
 =?us-ascii?Q?5xmmjJgBQhhTGfXFL4RrtK9t++48kosVUHpNA/kzK5kLkQQRjxQKD58sEowD?=
 =?us-ascii?Q?bhjRU50B0DexHmc+nfj5oNHOXfGBdZf0sCmE86THwWc1ih9O+WaRqY2IBg3U?=
 =?us-ascii?Q?hwPE8lJhIgHBWhuoB0UXCgCH+6ROqT9VKUwOoHmR20ssFId6s2P7tKqsIIkz?=
 =?us-ascii?Q?m3+TlKcttG3eb2gF791O1RtbG7rap3QlI2yj2iPrbX3Lu+AquwU06+0w+jZw?=
 =?us-ascii?Q?lzP+lyJE9UIrzg4g4iVmSNgeLTP2diqxl+EAFMXbkkIfmvDxZEVmcnzLBLkU?=
 =?us-ascii?Q?pdIaL5j6UrMJ8utRdDS67CuyN87pUGyTA9AT0Jn7Ob4FG0ADSMa0Tjzsvejm?=
 =?us-ascii?Q?6qK1RhVk9OhHQ6xxl3cu4/yldglHlcUrAIsfZJegRDhPxypYuqKBJuV7rWAc?=
 =?us-ascii?Q?Q+KsM/UxTFQO/Ps25OMtTnRFPC8TdHYvo750Un+sVFYnnwHjhO1EpLEsoD/Q?=
 =?us-ascii?Q?o5tn6O1kPo87TmN8ZGg6WioAK6yH6/BbOrykMoIQZ6T13wW2o/hA/Z53pzt/?=
 =?us-ascii?Q?PGn0l00jKeSIDuXg2eC3JkySLl9TazpQLY9M/yhglGuAaHxvmuDD/NZi778B?=
 =?us-ascii?Q?+c6vPHF/JT5QwHZ4iZI13zeWsQL63fuvQ8g8ognoX8Qfiemg9VeHTtf6lmjG?=
 =?us-ascii?Q?WZKFJydku4NpiSTcIEO40XePlN5pdO8WvyM86aZMomOeTeDPBeAgSTu9ITPI?=
 =?us-ascii?Q?CNwY1LwokuzTWHiDGtGkxD0gKNCdSq/RZTe55ORpeEtrN+bZ7dbi3w0S0ZYV?=
 =?us-ascii?Q?1J5OGnHzOuiW2431Z/4oiUijAeMJOubAt0EVNMm/ARYA2ZyCtNXBrH1V+DNA?=
 =?us-ascii?Q?DX6EgxbHv+ElG0jIkk0xytBlqKbKsEJwUL8EDpqcXcMExKImFzNlgrOyUyqi?=
 =?us-ascii?Q?FwQn/0iKpM4N+qV9Qtu6uYsrSZJMuBfafxof6XbobfNFWvvdnnjyPvaRrR2A?=
 =?us-ascii?Q?t/ASGZZpDDNry7VSy3lnX++xCinHs5v/k8LVzXKh1Kg5cnz+iMkkJ3lSNB6b?=
 =?us-ascii?Q?kXTJgJw8Pr7qMaiBRCyD1WDzYu4Y2qAYZDBOWLaEyvzK1tE7FcmQKlGs2xAM?=
 =?us-ascii?Q?wO279ZkEFo/zgsaEOWJ5+DKsSpQLnrDRAKlfRyPSLtcysK4DDPvR46TDMt+o?=
 =?us-ascii?Q?Vn7J8V7Xt7ScPQK+7Tmtt+KimmTo21tsoHXMrGn3soZFSscKfLn0Yg5sPpAt?=
 =?us-ascii?Q?ycZ+Z6N4bUVTi1PdvHHwwOC3SVsCEe0bFhYx76eblbj4acYWI4DuLAHhD6j0?=
 =?us-ascii?Q?P8RTyliYKibI6wlHwCEii4VgM5zF/IAiCG2QCJplAlwcYf+wJqd0wFSNVi7j?=
 =?us-ascii?Q?Z0oMlirJobnz7apfNu5bJH3ha43CNytoCtfG6+3jjgthSTo3KQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?02n/365dwcZicyuWIHKiwJfX17P+qMlsl/PHbjHxEwO8zPbsMZ1QzdnVfvkZ?=
 =?us-ascii?Q?wVDZJRDu6LjpMoDG47aEQXcYjZTfKgfw0PHNxumwbkXGZ1l3kIHfUXjUjoHM?=
 =?us-ascii?Q?S0XoGQ+HEEcVTrAgEJjYglbtKDMmq8IPEbah+THd98vCl7ITWliFk8ipsAc3?=
 =?us-ascii?Q?V0dawkY0B5NM0ReIBfhtHFJy/MZaxQmsvvbtckcVX7lHTav/VaPhEdJ20kGU?=
 =?us-ascii?Q?BlZky/Bik66W5yJj9Vq2gFyM90BMRg9XAtUGZ8YKvhQA+ErahDkumWiCXkKk?=
 =?us-ascii?Q?GRzOBJF4bidctF25y07RV/BKxdHoOG5fIDfpfuU2s6QXypHZazK/aVaUOZFA?=
 =?us-ascii?Q?P2Dh4jltV5H/mc3P86awKqYt8l7Wfls9sDP2ZUzVFYc/KN2O+6fexqGlzmue?=
 =?us-ascii?Q?wqsq0e2xV6oPJvakIrUpfxLYaZ1d5dYhsQZtEvcCReKU7yYqdchN/lTUr4Wx?=
 =?us-ascii?Q?Mcl84PwyMLF+RSlYm+vBs4AmnUNsPJ23fBMsWT5nJBWtn/fwSFDYfy3Fj0D7?=
 =?us-ascii?Q?ygxWzd3Jmi1yjc9vb0mYbR4DibVvwjqEHfPanjUJjMYwJvf84AroMdKqmI+m?=
 =?us-ascii?Q?7sxOyTFI1UXMiFgt1/RwQ+QNvo0d78eGF96mZ1n8sW9L/AlPf2Ke2LGsQDvD?=
 =?us-ascii?Q?jRM3uCuAwnRV+jsrhx5m0rl/TrqnbVYcqPKh9Xy2Wl+8iUqGQnTUPW+qByEO?=
 =?us-ascii?Q?5wCQFX1FcXh1r2TYsLVS8PSEaoFd1GAM9SuaPYYWws3rQzF8rsSTmd4fgKn4?=
 =?us-ascii?Q?aOKB5pS3/moxQXw2FQclds9bF5BBhsbINnD4/Hp7T1eY1byGX1Fg/He+mEan?=
 =?us-ascii?Q?KRFPYN+DtAKox/wMMV16T3mHfwgCmEnkvq8CDYHZqCOAk6KbS6jtfYH1ojoZ?=
 =?us-ascii?Q?/EnjVSAg7LV0boSBkqyqT2le16F0zOKLcny7gESOnlFPiIEJX3M11fWUt8nD?=
 =?us-ascii?Q?l8d/8ElreFEY8qZyFHPfta7z2NrP/Rf2Pl5yrC0MxL/cHaSiUacQp6s1VjeO?=
 =?us-ascii?Q?8xUB1l04+fGFaNceRRMvokPezwChs3+twUD5KcQYDVlMzzJfMNKB5yBAElk6?=
 =?us-ascii?Q?OThrLR5EsnVxfPu3zd6ktjZqpYLxP1VgoMOEXb+uNIjnO/eUmDkkCPfam0Tt?=
 =?us-ascii?Q?KkETipka7z8noiFb6SOySvDdzkUe518vy6KKT0UZoUYlufCx4s4KDqpiOEwx?=
 =?us-ascii?Q?5l8pydqJQdRpsP4FdM9zawjA4w1hGnyhJNaWr6nmU5rzLUcc00w7U1OOpD78?=
 =?us-ascii?Q?4yb2LSYkTaPQTuaajXGFF/JPIrnBG8sEEsesQV7VW12nISKZk8UPuEYi1J74?=
 =?us-ascii?Q?zlfffpwyG/XHX3vRtnw7hNMdA6MtzqTqDQbUMyCHa5dkQ/YWKuGhITdFw5DW?=
 =?us-ascii?Q?01/faq6Fyy18suJYE8ngsxTPUYEVjPgwP3pKEE9WrUpZKQARtwOmFISzHtl0?=
 =?us-ascii?Q?gZ8c+uNZOHCe+umYqlDZ6rzsbhPwdrB15mDo0vvzYvBfkmK1HXBrYTcnPbMx?=
 =?us-ascii?Q?+/xA6TaiR7wJyw8MEnJEnL4oqKaVnIF24GWDHs68G/eTZpvnnNSkLGlVBa5U?=
 =?us-ascii?Q?8SDavnhZAGI4bsfcL6B+4R5l69DJFvp1EaEXE9nHlZ5Qodr20DkwpFQTzn+b?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aebd2a2-5038-4107-7f92-08dc9fef77a0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:16:43.4237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4366jufxQ6G+5e+9rk9ZG6Z16cvaPm4na5rpSzGjLtLFJWXzSvMlUX2XN0PxxyWxuVwUrzdfoqL/uQQKHULxjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6890
X-Proofpoint-ORIG-GUID: E8gufuW2uRKwmG4sQCFvUMjbbcI6KGAD
X-Proofpoint-GUID: E8gufuW2uRKwmG4sQCFvUMjbbcI6KGAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407090053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 08:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111281

From: Chen Qi <Qi.Chen@windriver.com>

The assert_lib from perl package will execute the generated binary.
This is not suitable for cross compilation environment such as OE.

In OE, if the libs are not available, the following do_compile task
will just fail.

So we should avoid invoking assert_lib at do_configure stage to avoid
error message like below in log.do_configure:

  /usr/lib64/ld-linux-aarch64.so.1: No such file or directory

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...void-running-assert_lib-at-configure.patch | 40 +++++++++++++++++++
 .../perl/libdbd-mysql-perl_4.050.bb           |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch
new file mode 100644
index 0000000000..2e010931d6
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch
@@ -0,0 +1,40 @@
+From 577cdd6a571cfed506ec902b9021e60a2b854e4a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sun, 7 Jul 2024 22:32:30 -0700
+Subject: [PATCH] Makefile.PL: avoid running assert_lib at configure
+
+The assert_lib will run the generated binary. When cross compiling,
+e.g., for qemuarm64, we'll see error like below:
+
+  /usr/lib64/ld-linux-aarch64.so.1: No such file or directory
+
+We should just skip library checking, because in OE, if these libs are
+not available, the do_compile process will fail anyway.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.PL | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/Makefile.PL b/Makefile.PL
+index a1b38f6..939cadc 100644
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -206,11 +206,7 @@ To change these settings, see 'perl Makefile.PL --help' and
+ MSG
+ 
+ print "Checking if libs are available for compiling...\n";
+-
+-assert_lib(
+-  LIBS => ($opt->{'embedded'} ? $opt->{'embedded'} : $opt->{libs}),
+-);
+-
++print "Skip checking libs at configure stage as we are cross compiling.\n";
+ print "Looks good.\n\n";
+ 
+ sleep 1;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
index fc505fe1e8..99a9fcf628 100644
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
@@ -15,7 +15,9 @@ DEPENDS += "libdev-checklib-perl-native libdbi-perl-native libmysqlclient"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d0a06964340e5c0cde88b7af611f755c"
 
 SRCREV = "9b5b70ea372f49fe9bc9e592dae3870596d1e3d6"
-SRC_URI = "git://github.com/perl5-dbi/DBD-mysql.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/perl5-dbi/DBD-mysql.git;protocol=https;branch=master \
+           file://0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


