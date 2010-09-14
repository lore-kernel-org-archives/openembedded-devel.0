Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1OvQEa-0003WG-Q5
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 09:47:22 +0200
Received: by pzk37 with SMTP id 37so1996594pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 00:46:32 -0700 (PDT)
Received: by 10.142.185.5 with SMTP id i5mr573944wff.225.1284450392155; Tue,
	14 Sep 2010 00:46:32 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.142.188.10 with HTTP; Tue, 14 Sep 2010 00:46:12 -0700 (PDT)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Tue, 14 Sep 2010 16:46:12 +0900
X-Google-Sender-Auth: Mh3o1xSiiOlS05_NWz_8ZCk23pA
Message-ID: <AANLkTikv=KA8R9FLpwyig+W9K-dAaSSN0Fw36dRQz7Rs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sh: provide patch of __set_fpscr in libc
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
X-List-Received-Date: Tue, 14 Sep 2010 07:47:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

This provides a patch maintaining __fpscr_values in libc.
This patch is taken in in Debian and codesourcery.

This patch is necessary to have compatibility in these and openemdedded.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 recipes/eglibc/eglibc_2.10.bb                     |    1 +
 recipes/eglibc/eglibc_2.11.bb                     |    1 +
 recipes/eglibc/eglibc_2.12.bb                     |    1 +
 recipes/eglibc/eglibc_2.9.bb                      |    1 +
 recipes/eglibc/files/sh4_local-fpscr_values.patch |   32 +++++++++++++++++++++
 5 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/eglibc/files/sh4_local-fpscr_values.patch

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index 1f7ec02..0b457e1 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
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
index c65bf22..1950d88 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
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
index 8dbcde0..a76d630 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
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
index 5df7eb8..3c0d1e1 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -13,6 +13,7 @@ SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr.patch \
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


