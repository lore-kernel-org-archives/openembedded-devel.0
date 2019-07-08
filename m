Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4814365CE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 06:40:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x686emBm007270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jul 2019 23:40:48 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 23:40:47 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 14:38:53 +0800
Message-ID: <20190708063901.13914-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 1/9] keyutils: add new recipe
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
X-List-Received-Date: Mon, 08 Jul 2019 06:40:47 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

keyutils is utilities to control the kernel key
management facility and to provide a mechanism by
which the kernel call back to userspace to get a
key instantiated.

It's required by ecryptfs-utils.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ix-error-report-by-adding-default-message.patch | 42 ++++++++++++++++++++
 files/keyutils-test-fix-output-format.patch        | 41 ++++++++++++++++++++
 files/keyutils-use-relative-path-for-link.patch    | 28 ++++++++++++++
 files/run-ptest                                    |  3 ++
 keyutils_1.5.10.bb                                 | 45 ++++++++++++++++++++++
 5 files changed, 159 insertions(+)
 create mode 100644 files/keyutils-fix-error-report-by-adding-default-message.patch
 create mode 100644 files/keyutils-test-fix-output-format.patch
 create mode 100644 files/keyutils-use-relative-path-for-link.patch
 create mode 100755 files/run-ptest
 create mode 100644 keyutils_1.5.10.bb

diff --git a/files/keyutils-fix-error-report-by-adding-default-message.patch b/files/keyutils-fix-error-report-by-adding-default-message.patch
new file mode 100644
index 000000000..acd91c01c
--- /dev/null
+++ b/files/keyutils-fix-error-report-by-adding-default-message.patch
@@ -0,0 +1,42 @@
+fix keyutils test error report
+
+Upstream-Status: Pending
+
+"Permission denied" may be the reason of EKEYEXPIRED and EKEYREVOKED.
+"Required key not available" may be the reason of EKEYREVOKED.
+EXPIRED and REVOKED are 2 status of kernel security keys features.
+But the userspace keyutils lib will output the error message, which may
+have several reasons.
+
+Signed-off-by: Han Chao <chan@windriver.com>
+
+diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
+index bbca00a..739e9d0 100644
+--- a/tests/toolbox.inc.sh
++++ b/tests/toolbox.inc.sh
+@@ -227,11 +227,12 @@ function expect_error ()
+ 	    ;;
+ 	EKEYEXPIRED)
+ 	    my_err="Key has expired"
+-	    alt_err="Unknown error 127"
++	    alt_err="Permission denied"
+ 	    ;;
+ 	EKEYREVOKED)
+ 	    my_err="Key has been revoked"
+-	    alt_err="Unknown error 128"
++	    alt_err="Permission denied"
++	    alt2_err="Required key not available"
+ 	    ;;
+ 	EKEYREJECTED)
+ 	    my_err="Key has been rejected"
+@@ -249,6 +250,9 @@ function expect_error ()
+     elif [ "x$alt_err" != "x" ] && expr "$my_errmsg" : ".*: $alt_err" >&/dev/null
+     then
+ 	:
++    elif [ "x$alt2_err" != "x" ] && expr "$my_errmsg" : ".*: $alt2_err" >&/dev/null
++    then
++	:
+     elif [ "x$old_err" != "x" ] && expr "$my_errmsg" : ".*: $old_err" >&/dev/null
+     then
+ 	:
+
diff --git a/files/keyutils-test-fix-output-format.patch b/files/keyutils-test-fix-output-format.patch
new file mode 100644
index 000000000..a4ffd50ce
--- /dev/null
+++ b/files/keyutils-test-fix-output-format.patch
@@ -0,0 +1,41 @@
+From 49b6321368e4bd3cd233d045cd09004ddd7968b2 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 15 May 2017 14:52:00 +0800
+Subject: [PATCH] keyutils: fix output format
+
+keyutils ptest output format is incorrect, according to yocto
+Development Manual
+(http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
+5.10.6. Testing Packages With ptestThe test generates output in the format used by Automake:
+<result>: <testname>
+where the result can be PASS, FAIL, or SKIP, and the testname can be any
+identifying string.
+So we should change the test result format to match yocto ptest rules.
+
+Upstream-Status: Inappropriate [OE ptest specific]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ tests/runtest.sh | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/runtest.sh b/tests/runtest.sh
+index b6eaa7c..84263fb 100644
+--- a/tests/runtest.sh
++++ b/tests/runtest.sh
+@@ -21,6 +21,11 @@ for i in ${TESTS}; do
+     echo "### RUNNING TEST $i"
+     if [[ $AUTOMATED != 0 ]] ; then
+         bash ./runtest.sh
++        if [ $? != 0 ]; then
++            echo "FAIL: $i"
++        else
++            echo "PASS: $i"
++        fi
+     else
+         bash ./runtest.sh || exit 1
+     fi
+-- 
+2.11.0
+
diff --git a/files/keyutils-use-relative-path-for-link.patch b/files/keyutils-use-relative-path-for-link.patch
new file mode 100644
index 000000000..dde1af44a
--- /dev/null
+++ b/files/keyutils-use-relative-path-for-link.patch
@@ -0,0 +1,28 @@
+Subject: [PATCH] keyutils: use relative path for link
+
+The absolute path of the symlink will be invalid
+when populated in sysroot, so use relative path instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 824bbbf..8ce3a13 100644
+--- a/Makefile
++++ b/Makefile
+@@ -167,7 +167,7 @@ ifeq ($(NO_SOLIB),0)
+ 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
+ 	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
+ 	mkdir -p $(DESTDIR)$(USRLIBDIR)
+-	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
++	$(LNS) $(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
+ endif
+ 	$(INSTALL) -D keyctl $(DESTDIR)$(BINDIR)/keyctl
+ 	$(INSTALL) -D request-key $(DESTDIR)$(SBINDIR)/request-key
+-- 
+2.11.0
+
diff --git a/files/run-ptest b/files/run-ptest
new file mode 100755
index 000000000..305707f65
--- /dev/null
+++ b/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+export AUTOMATED=1
+make -C tests run
diff --git a/keyutils_1.5.10.bb b/keyutils_1.5.10.bb
new file mode 100644
index 000000000..2ead8fa19
--- /dev/null
+++ b/keyutils_1.5.10.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Linux Key Management Utilities"
+DESCRIPTION = "\
+    Utilities to control the kernel key management facility and to provide \
+    a mechanism by which the kernel call back to userspace to get a key \
+    instantiated. \
+    "
+HOMEPAGE = "http://people.redhat.com/dhowells/keyutils"
+SECTION = "base"
+
+LICENSE = "LGPLv2.1+ & GPLv2.0+"
+
+LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
+                    file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
+
+
+inherit siteinfo ptest
+
+SRC_URI = "http://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
+           file://keyutils-use-relative-path-for-link.patch \
+           file://keyutils-test-fix-output-format.patch \
+           file://keyutils-fix-error-report-by-adding-default-message.patch \
+           file://run-ptest \
+           "
+
+SRC_URI[md5sum] = "3771676319bc7b84b1549b5c63ff5243"
+SRC_URI[sha256sum] = "115c3deae7f181778fd0e0ffaa2dad1bf1fe2f5677cf2e0e348cdb7a1c93afb6"
+
+EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
+    NO_ARLIB=1 \
+    LIBDIR=${base_libdir} \
+    USRLIBDIR=${base_libdir} \
+    BUILDFOR=${SITEINFO_BITS}-bit \
+    NO_GLIBC_KEYERR=1 \
+    "
+
+do_install () {
+    oe_runmake DESTDIR=${D} install
+}
+
+do_install_ptest () {
+    cp -r ${S}/tests ${D}${PTEST_PATH}/
+    sed -i -e 's/OSDIST=Unknown/OSDIST=${DISTRO}/' ${D}${PTEST_PATH}/tests/prepare.inc.sh
+}
+
+RDEPENDS_${PN}-ptest += "glibc-utils"
-- 
2.14.4


