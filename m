Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4440C77B60
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 10:08:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20731.1680084515050824205
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 03:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34523aef51=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TA8Y62012350
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbvjpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:33 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32TA5iS3007171
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbvjpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 10:08:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPhKgzDGHO/2ALIXsUnUHGHT2fHA63nqmn5uSOCVCDBITQwScG8z6X6QRLeoP4rDut6z15CbInpHiRA0DzHSLOnpg2hWKTNFBRYN2XnUFFIxaTEbiDNQfIbfyG4HDik8CTMSedFgskWo6FqXutTj6ZtyUlg0Ul4tuLhQZmlueFYE6hRsGYaKQ6XCdjDcG+3CAPoS16jeengs41jgmbq5CMjEapOiwc0mhk/UPqsCXsWrRQbVTOma2suY487bpFfCczb8DqrXEMuYU+2NushRxXAIzUDhpvxKQn+UnMyD6A9nzddxLnONPehy4qrKMgqRuKH21QBFjqhKH0LIKNzX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQv0RToIpfkCefRJkqIwwIZjycPj4gSqhN6QKQP0EHg=;
 b=ep8V9K0T4KTDdcAWAISuBR3h0KRed1UkjqP6qkfrypUrPuDf1pxY5fLojumbd53SGPC0SzewNNQXMx5wMpxOF9AUplzwiMcw/i02yi+WPpznQPCSCXG+sryM2ZE7QxEyN7PmUu7r4+zZjBEHoeHyVcbAm8NaEqU7SOxDL49TRfmuOUqYkqzpktttAKNGNz6nIJRUY1BoT3gIyWb+bUo90At4YFTvvVDSH3TOM/LVoFOOTyWcLpaHjuGOr9xokuCxNb24QUH6ttFbPH+fnJjNLj9EE/xX3XQmIuDDEY+kc1bf97dpOSBlB9nSl3G4b8ZkQH63F7ObhokRUGjRhrQTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB6100.namprd11.prod.outlook.com (2603:10b6:208:3d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 10:08:30 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Wed, 29 Mar 2023
 10:08:30 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v3 3/3] mosh: add support of protobuf 4.22.x
Date: Wed, 29 Mar 2023 18:08:10 +0800
Message-Id: <20230329100810.705855-4-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329100810.705855-1-xiangyu.chen@eng.windriver.com>
References: <20230329100810.705855-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd8d0e4-b5aa-41e2-7022-08db303d8c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G2HZ5VrnilA5tzbxs6AnFFCfpda7s/BLhBMGsG+VrHxRXjLJXKgHc/XTnRH/QlU6KV6tJZLGvZshB0H3V2LAw92yL3spKDgRV7OPrFAV73JDcCsTxfLdNRz6SQCNFOiBfWt4oCQOcKwOblVSgfX0xEWcoUQe6LM6+S+4fZixZNTnYz1fNqZGJLwyUS4FBg4xvEqsEpVo7UIwOe6ldo7KvBogDoGLXgUoC3yi23OoZG0pkM/E/PJQdm6BvW4jgEdNZ7rGLadl/8f0lXTDF59aXQTPcEeg54huG+HXSVK0NgGMtqphcSRrCMFazqONbzY62szlzOSrxKvq1W3PzrSDWVgWHFFoAFCdt/H27Aj6dk11B9m88aCzCxeTGO5ue41YcX0aG4gaYF57R8obi/yaNGYljAs6ZKenS8QQlrN6prbhtRgP4unegoECjXxezVKOFtyIsvXjW8MiOa1/ZuzspUCJ2pdIPfLEuzETynR2LHiI9d6i1s685eLkvwuOAUsRT1Ei0J0vKwgVfxnliof2KcA5TMkxP3a996lzWxcJjQB+sqUi18KRp+uaz47jlYQ7iyGpgFpJmVVqkmFIt5LuZZDuhWLHLCtVzcHpv1jRKrg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(451199021)(83170400001)(2616005)(186003)(5660300002)(6506007)(1076003)(26005)(6512007)(8936002)(6666004)(6486002)(2906002)(83380400001)(41300700001)(52116002)(66946007)(38350700002)(316002)(44832011)(38100700002)(66556008)(66476007)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a0RpQlbmejWMme0fi8tYbs6qRwFjASxVg9UrWrkrYUc0hWvEKY6CYnb962n9?=
 =?us-ascii?Q?LJgeELbbTPX6d8lfLqjspDI3tei+cxBdKX5bfIPkV/4kMwE53p7FjJcfE+FO?=
 =?us-ascii?Q?ASboJNuhonc9o9RRnWiqzRMOdEG4Yl9B8mahmiMvQ9Oh+AfvxexDqRazknpZ?=
 =?us-ascii?Q?YUWIULOSpMxUgIi6Qj5xIHVFHWL98HWw1w25306RrdXq7/BTctsjsa0YkIBs?=
 =?us-ascii?Q?3p2ic65fZN50n9HmTTrYFrVkiZhWiVhCNOB/MkErze1Yf6zfMJodeXrfkGLa?=
 =?us-ascii?Q?4DAQZ/Bugf37qqiHCNdAxBsUner/KyyBF3dCl0XUF+NLhoZqtVXDaZh5y1HJ?=
 =?us-ascii?Q?knbHAP5gu+aFxyPRPoOvyeQCNiVk4THxShUYynd3tjNDDH1KczFZDnri0eRS?=
 =?us-ascii?Q?D27ZTIqsTIg5QSCDiwHaC7P5M2LibOUaOx7nN+hutfOs9rKhpLpwo+yQzz9r?=
 =?us-ascii?Q?RygysdKcO4U4fyeVbUAYHwInBTKo3gQY2E6SwerrJxkGirlUVO7MMDhog2+9?=
 =?us-ascii?Q?oHRxIjhP6s7fgHIXWGweXHQIS2okXws5MklY/e2bcNkTe/55rE4injlz/8EX?=
 =?us-ascii?Q?My7l1m9myA6divViOdyZ/+0YpNCp8GQlQiFHXQeYepjwpVVvMrSpgDeMswW0?=
 =?us-ascii?Q?0xJNfj/pqJVsESpm3F1ZrFK9vDs4Z+YxahSNuB5+LXUZYEhb0zyjgR6P39a6?=
 =?us-ascii?Q?dNzIbRKPaWiGeo+H8e7XZ0rLccgVbKgbKsbwIc7lgNlh7aaSVVqvHMD6B1nj?=
 =?us-ascii?Q?wVWzpwn0wsLwRyM5oLjfo2B7kMn52zaFR6E1/TU5cHFmvVoJGoieIJyrIERH?=
 =?us-ascii?Q?LCA0jUd4hVIyKGAv2wqkyAFgTIgghDAaiQqhqAjFWMqMTCZ3s4SeVrPGJzi6?=
 =?us-ascii?Q?qcxbyNickr/PBieonxseK4f7Lyj68meuB7ZtnPtpj51txCIwjeKrYOJY/oI2?=
 =?us-ascii?Q?Da+ppuX/cxWAqAdz1b4m+XZdYitjVBqtOl6OwZqbXH+34GOqs7/ZJ6pyJNNA?=
 =?us-ascii?Q?Ql3f16cNo7KACPk7CRRLYH1GwcO3vOMASM2ESigjps5CKLcm9TKuWiLqyEvp?=
 =?us-ascii?Q?DkUtb48BCVtzf0PTce0hTu+Tw+nNseck+487HD0bGXFEY8P201fhjU+FEkWe?=
 =?us-ascii?Q?XTiOc5iMD8cFOBaMNZWT1kYs1bClqW1IsZckuKp0y+OCjSmy+LpGchGFot2t?=
 =?us-ascii?Q?pzFuVUztVkgHvNf+hqXd5Zfa4HsXGwZli5UwxoS4fKLSeil9R4OiDdT1m/6G?=
 =?us-ascii?Q?/f41Z8998kSrkfWvU/5r5DygXEqrOWLBoYqDHnbCwycQJhvLr3VZ4A68Mr7f?=
 =?us-ascii?Q?u9Pka4seXTxoLQpJwYqbpq3FymN2Y+D01kY9Zyt9zeikA/eWtafMj1+BY3kl?=
 =?us-ascii?Q?U7xHYGqRFUxZqtEJ/E6xWpZaWMGEECU5nqrAW30qBT79YxJHpiLc0rBORy3e?=
 =?us-ascii?Q?08bUyJtQsDtCXeONrvO1OnQdbRTzwnmv5gknG8J5PX7/vTQn9T0ciJ9Z+OJq?=
 =?us-ascii?Q?c2UzAWHzvjFKrFiC61mUAbqPxcKkOB6iHTyUwimZRY4F//oq8lEU1oNsaGeA?=
 =?us-ascii?Q?IifX+B/54apZt24uLV8w9mTrvbzT0YeGk9jqNJ9RcnZuYxPzYCRmKp1kn8Dg?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd8d0e4-b5aa-41e2-7022-08db303d8c19
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:08:30.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yTuUqAzqquOLNbkvEZVgSOzc9n3kK+4BpWgFdR/daXAVzYY8RLQdP1AhNDiSXsvT/D09zPkjpPOE3gmhxk1e+Bpu7Zky0pjdTw2S5+6JS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6100
X-Proofpoint-GUID: CtUB4-jzBOewaZHmXtNwTu0oHoT7nhml
X-Proofpoint-ORIG-GUID: _BdKE-Q0y6pmtLGDwEfuSxmtRTwxwecP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_04,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 10:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101813

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


