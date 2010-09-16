Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1Ow2sY-0004w2-IU
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 03:03:20 +0200
Received: by pzk37 with SMTP id 37so229023pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 18:02:20 -0700 (PDT)
Received: by 10.142.127.16 with SMTP id z16mr2200976wfc.3.1284598940294; Wed,
	15 Sep 2010 18:02:20 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.142.188.10 with HTTP; Wed, 15 Sep 2010 18:02:00 -0700 (PDT)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Thu, 16 Sep 2010 10:02:00 +0900
X-Google-Sender-Auth: TO7nIVBf3e3EBHYACNTJ3Yacoa4
Message-ID: <AANLkTi=oYvz=GBa_1uSF4Vpuzv+50K=f+XiPVi7rGnp6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2 v2] sh: provide patch of __set_fpscr in libc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Sep 2010 01:03:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

This provides a patch maintaining __fpscr_values in libc.
This is taken in in Debian and codesourcery.

This patch is necessary to have compatibility in these and openemdedded.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 recipes/eglibc/eglibc_2.10.bb                     |    3 +-
 recipes/eglibc/eglibc_2.11.bb                     |    3 +-
 recipes/eglibc/eglibc_2.12.bb                     |    3 +-
 recipes/eglibc/eglibc_2.9.bb                      |    3 +-
 recipes/eglibc/eglibc_svn.bb                      |    1 +
 recipes/eglibc/files/sh4_local-fpscr_values.patch |   32 +++++++++++++++++++++
 6 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 recipes/eglibc/files/sh4_local-fpscr_values.patch

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index 94835b6..6ac4fda 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.10"
-PR = "${INC_PR}.10"
+PR = "${INC_PR}.11"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10152"
 EGLIBC_BRANCH="eglibc-2_10"
@@ -13,6 +13,7 @@ SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr.patch \
+           file://sh4_local-fpscr_values.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index dafc301..d96b658 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.11"
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10690"
 EGLIBC_BRANCH="eglibc-2_11"
@@ -13,6 +13,7 @@ SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr.patch \
+           file://sh4_local-fpscr_values.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index e0a0ebe..c6acea2 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.12"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 PR_append = "+svnr${SRCPV}"
 SRCREV="11306"
 EGLIBC_BRANCH="eglibc-2_12"
@@ -13,6 +13,7 @@ SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr_2.12.patch \
+           file://sh4_local-fpscr_values.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index 39ee76d..cd2b5e6 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.9"
-PR = "${INC_PR}.10"
+PR = "${INC_PR}.11"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10153"
 EGLIBC_BRANCH="eglibc-2_9"
@@ -13,6 +13,7 @@ SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr.patch \
+           file://sh4_local-fpscr_values.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
index a37c3ed..32679a0 100644
--- a/recipes/eglibc/eglibc_svn.bb
+++ b/recipes/eglibc/eglibc_svn.bb
@@ -11,6 +11,7 @@ SRC_URI = "svn://svn.eglibc.org;module=${EGLIBC_BRANCH} \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://sh4_set_fpscr_2.12.patch \
+           file://sh4_local-fpscr_values.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/files/sh4_local-fpscr_values.patch
b/recipes/eglibc/files/sh4_local-fpscr_values.patch
new file mode 100644
index 0000000..1685f6f
--- /dev/null
+++ b/recipes/eglibc/files/sh4_local-fpscr_values.patch
@@ -0,0 +1,32 @@
+---
+ sysdeps/unix/sysv/linux/sh/Versions |    1 +
+ sysdeps/unix/sysv/linux/sh/sysdep.S |   11 +++++++++++
+ 2 files changed, 12 insertions(+)
+
+--- a/sysdeps/unix/sysv/linux/sh/Versions
++++ b/sysdeps/unix/sysv/linux/sh/Versions
+@@ -2,6 +2,7 @@
+   GLIBC_2.2 {
+     # functions used in other libraries
+     __xstat64; __fxstat64; __lxstat64;
++    __fpscr_values;
+
+     # a*
+     alphasort64;
+--- a/sysdeps/unix/sysv/linux/sh/sysdep.S
++++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
+@@ -32,3 +32,14 @@
+
+ #define __syscall_error __syscall_error_1
+ #include <sysdeps/unix/sh/sysdep.S>
++
++       .data
++       .align 3
++       .globl ___fpscr_values
++       .type ___fpscr_values, @object
++       .size ___fpscr_values, 8
++___fpscr_values:
++       .long 0
++       .long 0x80000
++weak_alias (___fpscr_values, __fpscr_values)
++
-- 
1.7.1


