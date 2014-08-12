Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA0116059A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 06:26:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7C6QHWB028936
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Aug 2014 23:26:17 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 11 Aug 2014 23:26:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Aug 2014 14:26:13 +0800
Message-ID: <3eca262511b4cb75daa0839a60e3d8e2589883d4.1407824502.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407824502.git.hongxu.jia@windriver.com>
References: <cover.1407824502.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] syslog-ng: fix do_compi1e of qemuarm while DEBUG_BUILD
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
X-List-Received-Date: Tue, 12 Aug 2014 06:26:18 -0000
Content-Type: text/plain

The thread local storage caused arm-gcc broken while compiling
syslog-ng with option '-g -O'.
...
dnscache.s: Assembler messages:
dnscache.s:100: Error: invalid operands (.text and *UND* sections) for `-'
...

Add option --enable-thread-tls in configure to explicitly disable
thread local storage for arm while DEBUG_BUILD enabled.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...c-add-option-enable-thread-tls-to-manage-.patch | 50 ++++++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  5 +++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch b/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
new file mode 100644
index 0000000..cc8d110
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
@@ -0,0 +1,50 @@
+configure.ac: add option --enable-thread-tls to manage thread ssl support
+
+Add option --enable-thread-tls to manage the including of thread
+local storage, so we could explicitly disable it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 474e094..cedca54 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -120,6 +120,9 @@ AC_ARG_ENABLE(memtrace,
+ AC_ARG_ENABLE(ssl,
+               [  --enable-ssl        Enable SSL support.],,enable_ssl="auto")
+ 
++AC_ARG_ENABLE(thread-tls,
++              [  --enable-thread-tls        Enable Thread Transport Layer Security support.],,enable_thread_tls="no")
++
+ AC_ARG_ENABLE(dynamic-linking,
+               [  --enable-dynamic-linking        Link everything dynamically.],,enable_dynamic_linking="auto")
+ 
+@@ -381,12 +384,14 @@ dnl ***************************************************************************
+ dnl Is the __thread keyword available?
+ dnl ***************************************************************************
+ 
+-AC_LINK_IFELSE([AC_LANG_PROGRAM(
+-[[#include <pthread.h>
+-__thread int a;
+-]],
+-[a=0;])],
+-[ac_cv_have_tls=yes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whether Transport Layer Security is supported by the system")])
++if test "x$enable_thread_tls" != "xno"; then
++    AC_LINK_IFELSE([AC_LANG_PROGRAM(
++    [[#include <pthread.h>
++    __thread int a;
++    ]],
++    [a=0;])],
++    [ac_cv_have_tls=yes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whether Transport Layer Security is supported by the system")])
++fi
+ 
+ dnl ***************************************************************************
+ dnl How to do static linking?
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 3cedba6..99cbc09 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -18,6 +18,7 @@ SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source
            file://syslog-ng.conf \
            file://initscript \
            file://volatiles.03_syslog-ng \
+           file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
 "
 
 inherit autotools systemd pkgconfig update-rc.d update-alternatives
@@ -32,8 +33,12 @@ EXTRA_OECONF = " \
     --with-sysroot=${STAGING_DIR_HOST} \
     --with-libmongo-client=no --disable-mongodb \
     --with-librabbitmq-client=no \
+    ${CONFIG_TLS} \
 "
 
+CONFIG_TLS = "--enable-thread-tls"
+CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", " --disable-thread-tls", " --enable-thread-tls", d )}"
+
 PACKAGECONFIG ??= "openssl \
     ${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-- 
1.9.1


