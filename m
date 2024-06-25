Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27271C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 16:21:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.177899.1719332451234148923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 09:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69067f35fc=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PAqvJ4023812
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 16:20:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5ty8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 16:20:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 09:20:49 -0700
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Jun 2024 09:20:48 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libee: remove recipe since libee is obsolete
Date: Tue, 25 Jun 2024 12:20:48 -0400
Message-ID: <20240625162048.666209-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Zm4SE6jC3MmmOGPU3j2TbwiTnIfpNe4m
X-Proofpoint-GUID: Zm4SE6jC3MmmOGPU3j2TbwiTnIfpNe4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406250119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 16:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111077

From: Randy MacLeod <Randy.MacLeod@windriver.com>

libee had been used by rsyslog but the library never relly panned out.

It has been declared to be obsolete:
   Early versions of rsyslog and liblognorm used it for representing structured content.
   However, this is long gone. We do not know of any other user. So libee should be of
   no further interest and is provided here solely for historical reasons.
https://github.com/rsyslog/libee

Also remove references to libee in:
   meta-oe/conf/include/ptest-packagelists-meta-oe.inc
   meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 -
 .../packagegroups/packagegroup-meta-oe.bb     |  2 -
 meta-oe/recipes-support/libee/libee.inc       | 39 -------------------
 meta-oe/recipes-support/libee/libee/ezapi1.sh | 14 -------
 .../libee/libee/libee-parallel-make.patch     | 20 ----------
 meta-oe/recipes-support/libee/libee/run-ptest |  3 --
 meta-oe/recipes-support/libee/libee_0.4.1.bb  |  4 --
 7 files changed, 83 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libee/libee.inc
 delete mode 100755 meta-oe/recipes-support/libee/libee/ezapi1.sh
 delete mode 100644 meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
 delete mode 100755 meta-oe/recipes-support/libee/libee/run-ptest
 delete mode 100644 meta-oe/recipes-support/libee/libee_0.4.1.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index eaa86c411..01bf975a1 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -17,7 +17,6 @@ PTESTS_FAST_META_OE = "\
     jq \
     leveldb \
     libcereal \
-    libee \
     libgpiod \
     libio-pty-perl \
     libmanette \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index bc40f56b9..e11afcd4e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -811,7 +811,6 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     libcanberra \
     libssh \
     libssh2 \
-    libee \
     libusbgx-config \
     libusbgx \
     lockdev \
@@ -972,7 +971,6 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages = "\
     oprofile-ptest \
     libteam-ptest \
     uthash-ptest \
-    libee-ptest \
     poco-ptest \
     cmocka-ptest \
     minicoredumper-ptest \
diff --git a/meta-oe/recipes-support/libee/libee.inc b/meta-oe/recipes-support/libee/libee.inc
deleted file mode 100644
index 592109b95..000000000
--- a/meta-oe/recipes-support/libee/libee.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "An Event Expression Library inspired by CEE"
-DESCRIPTION = "The core idea of libee is to provide a small \
-but hopefully convenient API layer above the CEE standard."
-
-HOMEPAGE = "http://www.libee.org"
-SECTION = "base"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1c2687de35e36ba3b999136236a66cd6"
-
-SRC_URI = "http://www.libee.org/download/files/download/${BPN}-${PV}.tar.gz\
-           file://libee-parallel-make.patch \
-           file://run-ptest \
-           file://ezapi1.sh \
-"
-
-inherit autotools ptest pkgconfig
-
-DEPENDS += "libestr"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench', '', d)}"
-
-PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
-PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
-
-TESTDIR = "tests"
-
-# We presume the tests we are going to install so just build them directly.
-#
-do_compile_ptest() {
-    oe_runmake -C ${TESTDIR} genfile ezapi1
-}
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}
-    install -m 0755 ${B}/${TESTDIR}/genfile ${D}${PTEST_PATH}
-    install -m 0755 ${B}/${TESTDIR}/.libs/ezapi1 ${D}${PTEST_PATH}
-    install -m 0755 ${UNPACKDIR}/ezapi1.sh ${D}${PTEST_PATH}
-}
diff --git a/meta-oe/recipes-support/libee/libee/ezapi1.sh b/meta-oe/recipes-support/libee/libee/ezapi1.sh
deleted file mode 100755
index e9db5e614..000000000
--- a/meta-oe/recipes-support/libee/libee/ezapi1.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-#
-echo ---------------------------------------------------------------------------
-echo A very basic test for the event class
-echo ---------------------------------------------------------------------------
-rm -f infile
-./genfile 100 > infile
-./ezapi1 -iinfile
-if [ $? -ne 0 ] ; then
-   echo "FAIL: $0"
-   exit 1
-fi
-echo "PASS: $0"
-rm -f infile
diff --git a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch b/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
deleted file mode 100644
index 8bb23aafc..000000000
--- a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-fix parallel compiling problem
-
-without specifying libee_convert_DEPENDENCIES = libee.la, libee_convert
-can't find libee.la when linking as libee is not generated yet.
- 
-Upstream-Status: Pending
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
----
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 08aaa9e..f0c78f7 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -46,5 +46,6 @@ libee_la_LDFLAGS = -version-info 0:0:0
- libee_convert_SOURCES = convert.c
- libee_convert_CPPFLAGS =  -I$(top_srcdir) $(LIBEE_CFLAGS) $(LIBESTR_CFLAGS) $(LIBXML2_CFLAGS)
- libee_convert_LDADD = $(LIBEE_LIBS) $(LIBXML2_LIBS) $(LIBESTR_LIBS)
-+libee_convert_DEPENDENCIES = libee.la
- 
- include_HEADERS = 
diff --git a/meta-oe/recipes-support/libee/libee/run-ptest b/meta-oe/recipes-support/libee/libee/run-ptest
deleted file mode 100755
index 3cb660764..000000000
--- a/meta-oe/recipes-support/libee/libee/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-#
-./ezapi1.sh
diff --git a/meta-oe/recipes-support/libee/libee_0.4.1.bb b/meta-oe/recipes-support/libee/libee_0.4.1.bb
deleted file mode 100644
index ef2c20db5..000000000
--- a/meta-oe/recipes-support/libee/libee_0.4.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "7bbf4160876c12db6193c06e2badedb2"
-SRC_URI[sha256sum] = "c0dac01938593deee06c3d161e4eda4ecc0fd7317e1321bd96e301aceb7fb027"
-- 
2.34.1


