Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3FAC6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:42:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.50609.1680255741610540351
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=345418c051=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32V8IgjC018153
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbymqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:20 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32V9WqWl007717
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:20 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbymqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 09:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFzgarTGd9IqyfNJDGVDdJE6eR5elN/2xGdue1HlollLlg5MCUVkhdDZECzJ9eu+Qumb2t3GF4UqPiMA6h6J0r6kgsI9oDWOEsUXctIL2iSZKkRrz4/Rz6QAH2O9d2mox0ReXVjv0OMVmXvJW6EHx6dtqhZYvYVQ91L22adoTlSAjcwyOcq2JElV8N/IdtaNYy2V764QJLOHvDqUX8IcMYCSpqzg9OLvLY2z/mZkVtGCRLfh3BhDzAjdobdgEWH/58d6aUDa5JaP3vXpINCtqipnX7DJTsYifAHa5BRtZHdrSBJ4x4guQzhbfNLEnYkHFUmzo+srhJQ2XFwg3RtY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQv0RToIpfkCefRJkqIwwIZjycPj4gSqhN6QKQP0EHg=;
 b=V532zccMFBS5yn58kkYEaG1rqxccxewxAIBdkKrzLVC3pwBZxfC0ChuoKT8FO+W1i0OPD/RSvcBpW58PWwpW2QAWjtG9QPH5uWutxyyHP9w/6ti6fjDALpRt/n5wSXLvQI8PdQu9IdG3AtjxJLkTgYqwDYHzyJLsJ0Bsw0cjMZX99dr+vWH2MkyAVmnTZYufq99aAgPVTA0G8vM2TSCiy4rEECJLrjJsGaokK3NQ1EJ640Qolmhj96e/E59WTcVHSTUyGP8ZuYm6I/NDfcOXvTMmTbN810FqZ/1w4Mv05eB/Wp+dAG2R/FrVP32TmzTev/R1Ie/C5pdFxcZB8dLSVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 09:42:07 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::e7a3:6c1:4c52:897a]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::e7a3:6c1:4c52:897a%6]) with mapi id 15.20.6254.021; Fri, 31 Mar 2023
 09:42:07 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-oe][PATCH v4 3/3] mosh: add support of protobuf 4.22.x
Date: Fri, 31 Mar 2023 17:41:45 +0800
Message-Id: <20230331094145.2362159-4-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331094145.2362159-1-xiangyu.chen@eng.windriver.com>
References: <20230331094145.2362159-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c9b94c-21fb-4cdc-cef9-08db31cc3129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EQwcwjO+KtE1srJl9/f4jewMuSO6L2dM8Bp5oz7jnW/Xl2RCldK0B617zaCV/TPPYoWKO367XGb1r38Wk8fp245Em1zVURGOYZh6MAaUWxuZzBfMLmdhPVY4LNcNH61jeaDzc6XkPw7vG0u436/6Xc/HZxF3N+vnVI039JkLuLHJ/RC4bFHyFkUnNUC5aURFG/ggb8W1o9LlTmiLVn0yniB/4OTfUrvRF5lcdyFayVUapReu5cm6A+x8odCPRKRuMcaxKLTdeOkizm1qgX81E1xFElgS/mze0u8U0maZad3iLe6w6dMqYontdxX2LbEb8EquUdR4X4E2ZVbg0Rnd02Jlt2+Q0b7TQ9iFp1szSgJ6DMYaZwm6H4H0kLDNLwYDy11SgTJyIh2awS+rp0htjwaujcy+Xdw8keiJ5As+/5l71rFVCZleuu9xqiLYR/iF8/vmTlc0mYgGzMg59Mp6wu5aOPOpK9mLyXZN0ogEdo6C+aIyEJrSL3WBvmXipSbjeUzgcdXoyhooHhPvgmOk5K7b6N1EKYIXMrWOiBlaPao8zcZfMvduDX0G5Q2i8izRJZewN26XZ/8X3GuJRSNjGT/1/2rTWuSlJckGRWuizAM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39850400004)(346002)(396003)(451199021)(83380400001)(2616005)(26005)(6486002)(6512007)(6506007)(1076003)(52116002)(6666004)(478600001)(66476007)(316002)(186003)(83170400001)(66946007)(66556008)(8936002)(8676002)(5660300002)(41300700001)(38350700002)(38100700002)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GCdPheSJHtf/jXtABkO14K+9U+HgsChv5Y5MS9s0dq1hsEfv4mJRA1Gs+d0l?=
 =?us-ascii?Q?JgqC0Q4g9ZHQpUCPeGMCnTeh5YleJky/Y/novN9MFdWCF3ZbMHOWC6F/2R9H?=
 =?us-ascii?Q?WoJ4afcyjls57ycFmeIYSzFyR1R1to8kRVkd2gFwxshE9gN2LdxM36eSX6Wv?=
 =?us-ascii?Q?nF70v+jEP5IHVPtv2jRco7D0QebMYxvQlNkyeCqGEj1bCaKEipOhXWLPRr64?=
 =?us-ascii?Q?OFMQ9jh8s+RMhif/ZNYBqUFMxZfgBpzs5RrYs4Zep+fxpDEJjlvLdTENqxpp?=
 =?us-ascii?Q?dhEpd7sGK/10H6EylrYLwr4WQYSUeYR2XfTX7QE4n4XzonALvJp5BME+mIe/?=
 =?us-ascii?Q?A114CMbxmdkZS5rsxeFvGtbdKywM4ImqJoXn/4TXYgQ1IJ86GmGjnOm41BgA?=
 =?us-ascii?Q?EzlyUzUyv8rg3QJPAxxmEmki8DNToaA4JKI3l4jxsHaJbyTMOtIXS8FUfS0z?=
 =?us-ascii?Q?0GpT7ORjSgt1qStDuE4AI3rys73i+dljJlX2MW6pAfM36OVA6fjmTgedMDe0?=
 =?us-ascii?Q?SOKfHuYUaDLHttdAe80VTNPzHb8sDOoOUuQtrPbTMEPNqnzrBYN9BGBvRGSE?=
 =?us-ascii?Q?1HUsCKNwRxUq/YPDHQqfWCGIZk6wjq3bhRN87I/dTnPW8lSGgqcMKTR/51fi?=
 =?us-ascii?Q?1fBCYfhMTmcQ8VL/Z1o0cQ+Vx/j31QoCZyImhXlVf7ZwWOuoztXh+GWK8En3?=
 =?us-ascii?Q?wOau+3emUitnAa54cS7/T6a8t7Zn/tl+uSJ51i23JV+L+HnK0SJrKJEDMoyV?=
 =?us-ascii?Q?4fHmxTv34tl3Nmf8LqeYuLFXXRQryr8e3pQfm4m9jvHZjh2doqZofUYHX6Ha?=
 =?us-ascii?Q?0QVjbp3qT7iEeTokN4cLVfLDm6oBdzdYu3WzUl7/2hI0um3QsdkJ2A9u+e+5?=
 =?us-ascii?Q?o/t1NbaoNDFN/phfIrIhV1DZzE8ByGStLiECQFBGDZmjiU4pjUxzTXOG1X/P?=
 =?us-ascii?Q?ICfNrDCl9SRfW6TZCcy6LqZgO1qXMe7AOeOdrZlSqOWa73zKogOEMl29h/4i?=
 =?us-ascii?Q?FUMcp2ntfDlruz7QlJPwRyvdlDH6+HxobXwC0M2Z1PTQ7WXXoXMTiQqpA1Y7?=
 =?us-ascii?Q?V04eDFe7wBIPwr8WNy3unIFFVENXXN/qaaRfTtR43yac60lQdIv/AaiGyVGh?=
 =?us-ascii?Q?ohM6YCfF7uCbnLcNP1G2E3CU1TUwsVMMEYazCZiC4kX9R7yvPiP7K/Eb7gtE?=
 =?us-ascii?Q?XEE1mbFnTZ+J5UW/uqRxSbXYNY+rqAML5/Peq29nLGZXjBJAvyMowXFFHkT2?=
 =?us-ascii?Q?aRFqbN84Xt89oZdI17wLmc6WFTsoQvpAyJPLljqMN5CtDfOQp9082Tiy1kwY?=
 =?us-ascii?Q?aPaqCSOKqytSA0zzX0M6GhGgGn9iMaW8qyZOBcn/X5W6Sp97kKtScoIXsVS5?=
 =?us-ascii?Q?WVypDLXNnyL8teVWPNYrkDiguOVTYhpx5/In03Vp7Dk7VcaEvEQxKRbMNWMp?=
 =?us-ascii?Q?yNelpWi9wMs1L7WTSITPRoiBLvVyYHW8TIAkIQByVjLRCI06Q9ntwyQRRYGn?=
 =?us-ascii?Q?KdLMeTp1fuPjTVlThJbSuz8DnzvapuS61N4ZGiwHJ1bEXJOSb6iFcJenMA6q?=
 =?us-ascii?Q?N/FKOdR2oBylx5CylaBWaxygPNm0412Odh0TZt7t0PctOE/wmArMMIfiVPSD?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c9b94c-21fb-4cdc-cef9-08db31cc3129
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:42:07.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKZoRzz9G+XiMwuFRgmYY89UdJ8RD6oizVFrjERn6fn4G5TIR06Q8HHE2MW+59OYnf8A6xCVsCi2TqPC8fDOfFW8wuUvuscFU45sfTbGbr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
X-Proofpoint-GUID: rkhkuVXYjg0Nbik5kh74aA2kDaM8XIqA
X-Proofpoint-ORIG-GUID: tFeHOKrBESm0VtOv-XYl47QX3qYvkMhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_05,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101851

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...re.ac-add-support-of-protobuf-4.22.x.patch | 63 +++++++++++++++++++
 .../recipes-connectivity/mosh/mosh_1.4.0.bb   |  7 ++-
 2 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch

diff --git a/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch b/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
new file mode 100644
index 000000000..088124391
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
@@ -0,0 +1,63 @@
+From d9a1a6aac5a3b270449d09ec0d2a556807ab9287 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 29 Mar 2023 13:53:44 +0800
+Subject: [PATCH] configure.ac: add support of protobuf 4.22.x
+
+the protobuf 4.22x is using c++14 as default, this caused the mosh cannot compile anymore and report following error:
+
+....
+/usr/include/google/protobuf/port_def.inc:200:15: error: static assertion failed: Protobuf only supports C++14 and newer.
+| 200 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201402L), "Protobuf only supports C++14 and newer.");
+| | ^~~~~~~~~~~~~~~~~~~~~~
+....
+
+Upstream-Status: Pending [https://github.com/mobile-shell/mosh/pull/1266]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ configure.ac             | 8 ++++++++
+ src/frontend/Makefile.am | 2 +-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ee70c7b..5457009 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,6 +26,10 @@ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ AS_IF([pkg-config --atleast-version 3.6.0 protobuf],
+   [AX_CXX_COMPILE_STDCXX([11])])
+ 
++# If current protobuf 4.22+ update the requires to C++14.
++AS_IF([pkg-config --atleast-version 4.22.0 protobuf],
++  [AX_CXX_COMPILE_STDCXX([14])])
++
+ WARNING_CXXFLAGS=""
+ PICKY_CXXFLAGS=""
+ DISTCHECK_CXXFLAGS=""
+@@ -311,6 +315,10 @@ AC_CHECK_FUNCS(m4_normalize([
+   pledge
+   ]))
+ 
++AS_IF([pkg-config --atleast-version 4.22.0 protobuf],
++  [PKG_CHECK_MODULES([ABSL_LOG_INTERNAL_CHECK_OP], [absl_log_internal_check_op],[],
++     [AC_MSG_ERROR([Missing abseil-cpp library.])])])
++
+ # Start by trying to find the needed tinfo parts by pkg-config
+ PKG_CHECK_MODULES([TINFO], [tinfo],
+   [AC_DEFINE([HAVE_CURSES_H], [1], [Define to 1 if <curses.h> is present])],
+diff --git a/src/frontend/Makefile.am b/src/frontend/Makefile.am
+index 1aa83fd..399ecd6 100644
+--- a/src/frontend/Makefile.am
++++ b/src/frontend/Makefile.am
+@@ -1,7 +1,7 @@
+ AM_CPPFLAGS = -I$(srcdir)/../statesync -I$(srcdir)/../terminal -I$(srcdir)/../network -I$(srcdir)/../crypto -I../protobufs -I$(srcdir)/../util $(TINFO_CFLAGS) $(protobuf_CFLAGS) $(CRYPTO_CFLAGS)
+ AM_CXXFLAGS = $(WARNING_CXXFLAGS) $(PICKY_CXXFLAGS) $(HARDEN_CFLAGS) $(MISC_CXXFLAGS) $(CODE_COVERAGE_CXXFLAGS)
+ AM_LDFLAGS  = $(HARDEN_LDFLAGS) $(CODE_COVERAGE_LIBS)
+-LDADD = ../crypto/libmoshcrypto.a ../network/libmoshnetwork.a ../statesync/libmoshstatesync.a ../terminal/libmoshterminal.a ../util/libmoshutil.a ../protobufs/libmoshprotos.a -lm $(TINFO_LIBS) $(protobuf_LIBS) $(CRYPTO_LIBS)
++LDADD = ../crypto/libmoshcrypto.a ../network/libmoshnetwork.a ../statesync/libmoshstatesync.a ../terminal/libmoshterminal.a ../util/libmoshutil.a ../protobufs/libmoshprotos.a -lm $(TINFO_LIBS) $(protobuf_LIBS) $(CRYPTO_LIBS) $(ABSL_LOG_INTERNAL_CHECK_OP_LIBS)
+ 
+ mosh_server_LDADD = $(LDADD)
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index 4537a0941..4eb0dba23 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -12,9 +12,12 @@ HOMEPAGE = "http://mosh.mit.edu"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
+DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter abseil-cpp"
+
+SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz \
+           file://0001-configure.ac-add-support-of-protobuf-4.22.x.patch \
+           "
 
-SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
 SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd"
 
 inherit autotools pkgconfig
-- 
2.34.1


