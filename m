Return-Path: <mranostay@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 28074608BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2013 03:52:31 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id 15so2105413pdi.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2013 20:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=exqogSo8iT/8vLUj0Ce++LrAbus6oW2uMwe6j/r+QVU=;
	b=ChZpZkmDTspS1EElvhVfm3Rjga53Sk0K9n4FruzUaoFBGnjqEzWuzUt2FZTS2tpBdX
	jOy6YJOMXWCd7MK4whznv3jtO9SZUYqU3dGmOtlOjm15AZsykQzcLg7MdYSd6DjFToya
	WBRTsea2rUBr8EYKIQpRrkxHBKwsQYTx/2qcb2rJLfjAPHxZdxaTqemtHDfuUAQtHcZ+
	USM5m6MSkLPTWtjcd/qOPfd5ycPXV/0GIvbTbnFhtR3Ey1UFZL19ldp4q+87NUaQZwbh
	lVQq2em/yCrvMKc9Y7N3nCeabx7dPQvFrm25y0LrAOPYhT+GEj4jJ0RlMnCxU4mje5Wi
	YXOw==
X-Received: by 10.66.2.164 with SMTP id 4mr3951383pav.55.1375933951874;
	Wed, 07 Aug 2013 20:52:31 -0700 (PDT)
Received: from localhost.localdomain (c-76-105-193-198.hsd1.or.comcast.net.
	[76.105.193.198]) by mx.google.com with ESMTPSA id
	qh10sm11442185pbb.33.2013.08.07.20.52.30 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Aug 2013 20:52:31 -0700 (PDT)
From: Matt Ranostay <mranostay@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Aug 2013 03:51:48 +0000
Message-Id: <1375933908-14676-1-git-send-email-mranostay@gmail.com>
X-Mailer: git-send-email 1.8.2.rc3.6.g407929c
Cc: Naresh Bhat <naresh.bhat@linaro.org>
Subject: [PATCH] sdk: add acpica recipe
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
X-List-Received-Date: Thu, 08 Aug 2013 03:52:31 -0000

From: Fathi Boudra <fathi.boudra@linaro.org>

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Matt Ranostay <mranostay@gmail.com>
---
 meta-oe/recipes-extended/acpica/acpica_20130626.bb | 37 ++++++++++++++++++++++
 .../acpica/files/cross-compile.patch               | 19 +++++++++++
 .../recipes-extended/acpica/files/no-werror.patch  | 36 +++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-extended/acpica/acpica_20130626.bb
 create mode 100644 meta-oe/recipes-extended/acpica/files/cross-compile.patch
 create mode 100644 meta-oe/recipes-extended/acpica/files/no-werror.patch

diff --git a/meta-oe/recipes-extended/acpica/acpica_20130626.bb b/meta-oe/recipes-extended/acpica/acpica_20130626.bb
new file mode 100644
index 0000000..65eadac
--- /dev/null
+++ b/meta-oe/recipes-extended/acpica/acpica_20130626.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
+OS-independent reference implementation of the Advanced Configuration and \
+Power Interface Specification (ACPI). ACPICA code contains those portions of \
+ACPI meant to be directly integrated into the host OS as a kernel-resident \
+subsystem, and a small set of tools to assist in developing and debugging \
+ACPI tables."
+SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
+HOMEPAGE = "http://www.acpica.org/"
+SECTION = "console/tools"
+LICENSE = "BSD | GPLv2"
+LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
+DEPENDS="bison \
+    flex"
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+PR="r1"
+
+SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
+    file://cross-compile.patch \
+    file://no-werror.patch"
+
+SRC_URI[md5sum] = "b7112b3deffef8fe25aac7810cc419a9"
+SRC_URI[sha256sum] = "888dda6227265c396a686624f971c51693c2bba84f24c634536234c8dca7b465"
+
+S="${WORKDIR}/acpica-unix2-${PV}"
+
+EXTRA_OEMAKE = "'OPT_CFLAGS=-Wall'"
+
+do_install() {
+    install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
+    install -D -p -m0755 generate/unix/bin*/acpibin ${D}${bindir}/acpibin
+    install -D -p -m0755 generate/unix/bin*/acpiexec ${D}${bindir}/acpiexec
+    install -D -p -m0755 generate/unix/bin*/acpihelp ${D}${bindir}/acpihelp
+    install -D -p -m0755 generate/unix/bin*/acpinames ${D}${bindir}/acpinames
+    install -D -p -m0755 generate/unix/bin*/acpisrc ${D}${bindir}/acpisrc
+    install -D -p -m0755 generate/unix/bin*/acpixtract ${D}${bindir}/acpixtract
+}
diff --git a/meta-oe/recipes-extended/acpica/files/cross-compile.patch b/meta-oe/recipes-extended/acpica/files/cross-compile.patch
new file mode 100644
index 0000000..f2917ca
--- /dev/null
+++ b/meta-oe/recipes-extended/acpica/files/cross-compile.patch
@@ -0,0 +1,19 @@
+Description: add cross compile support
+Forwarded: not-needed
+Author: Fathi Boudra <fathi.boudra@linaro.org>
+
+---
+ generate/unix/Makefile.config |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/generate/unix/Makefile.config
++++ b/generate/unix/Makefile.config
+@@ -35,7 +35,7 @@
+ .SUFFIXES :
+ PROGS = acpibin acpidump acpiexec acpihelp acpinames acpisrc acpixtract iasl
+ HOST ?= _CYGWIN
+-CC =    gcc
++CC ?=    $(CROSS_COMPILE)gcc
+ 
+ #
+ # Common defines
diff --git a/meta-oe/recipes-extended/acpica/files/no-werror.patch b/meta-oe/recipes-extended/acpica/files/no-werror.patch
new file mode 100644
index 0000000..9f96552
--- /dev/null
+++ b/meta-oe/recipes-extended/acpica/files/no-werror.patch
@@ -0,0 +1,36 @@
+Description: remove -Werror flag
+Forwarded: not-needed
+Author: Fathi Boudra <fathi.boudra@linaro.org>
+
+---
+ generate/unix/iasl/Makefile |   12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+--- a/generate/unix/iasl/Makefile
++++ b/generate/unix/iasl/Makefile
+@@ -279,19 +279,19 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prpars
+ # by the utilities above and they are not necessarily ANSI C, etc.
+ #
+ $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+ 
+ $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+ 
+ $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+ 
+ $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+ 
+ $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+ 
+ $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $?
-- 
1.8.2.rc3.6.g407929c


