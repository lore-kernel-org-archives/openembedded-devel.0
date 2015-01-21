Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 457F572C1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 02:21:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0L2LgVS019451
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 20 Jan 2015 18:21:42 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 20 Jan 2015 18:21:42 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Wed, 21 Jan 2015 10:21:29 +0800
Message-ID: <1421806889-30564-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1421806889-30564-1-git-send-email-kai.kang@windriver.com>
References: <1421806889-30564-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] lksctp-tools: add ptest subpackage and other updates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Jan 2015 02:21:48 -0000
Content-Type: text/plain

Some updates for lksctp-tools:

* add ptest subpackage
* only blacklist lksctp-tools when gold ld is used. Refer to:
https://bugs.gentoo.org/show_bug.cgi?id=530318
* update licenses and add homepage.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../lksctp-tools/lksctp-tools/run-ptest             |  5 +++++
 .../lksctp-tools/lksctp-tools/v4test.sh             | 11 +++++++++++
 .../lksctp-tools/lksctp-tools/v6test.sh             | 11 +++++++++++
 .../lksctp-tools/lksctp-tools_1.0.16.bb             | 21 +++++++++++++++++----
 4 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/run-ptest
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/v4test.sh
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/v6test.sh

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/run-ptest b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/run-ptest
new file mode 100644
index 0000000..e67f18e
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+sh v4test.sh
+sh v6test.sh
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v4test.sh b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v4test.sh
new file mode 100644
index 0000000..5130856
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v4test.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+echo "v4test starting:"
+for t in $(find -maxdepth 1 -type f \! -name test\*_v6 -name test\*); do
+  echo "$t";
+  if $t; then
+    echo "PASS: $t"; echo "";
+  else
+    echo "FAIL: $t"; echo "";
+  fi
+  sleep 1;
+done
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v6test.sh b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v6test.sh
new file mode 100644
index 0000000..3a667df
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v6test.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+echo "v6test starting:"
+for t in $(find -maxdepth 1 -name test\*_v6); do
+  echo "$t";
+  if $t; then
+    echo "PASS: $t"; echo "";
+  else
+    echo "FAIL: $t"; echo "";
+  fi
+  sleep 1;
+done
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
index ded6d08..1651eb8 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -1,13 +1,18 @@
 SUMMARY = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
+HOMEPAGE = "http://lksctp.org"
 SECTION = "libs"
-LICENSE = "LGPLv2"
+LICENSE = "LGPLv2.1 & GPLv2"
 
 LIC_FILES_CHKSUM = " \
     file://COPYING.lib;md5=0a1b79af951c42a9c8573533fbba9a92 \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
+           file://run-ptest \
+           file://v4test.sh \
+           file://v6test.sh \
+          "
 
 SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
 SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
@@ -16,13 +21,21 @@ SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symbol sctp_connectx has undefined version
 #| collect2: error: ld returned 1 exit status
 #| make[4]: *** [libsctp.la] Error 1
-PNBLACKLIST[lksctp-tools] ?= "BROKEN: fails to link against sctp_connectx symbol"
+PNBLACKLIST[lksctp-tools] ?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
 
 S = "${WORKDIR}/${BP}"
 
 BBCLASSEXTEND = "native"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig ptest
+
+do_install_ptest () {
+	install -m 0755 ${WORKDIR}/v4test.sh ${D}${PTEST_PATH}
+	install -m 0755 ${WORKDIR}/v6test.sh ${D}${PTEST_PATH}
+	for testcase in `find ${B}/src/apps/.libs ${B}/src/func_tests/.libs -maxdepth 1 -type f -executable`; do
+		install $testcase ${D}${PTEST_PATH}
+	done
+}
 
 SOLIBVERSION="${PV}"
 SOLIBMAJORVERSION="1"
-- 
2.1.1


