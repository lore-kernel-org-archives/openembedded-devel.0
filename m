Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id B5D6C6DEF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 08:00:54 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w7so9032035lbi.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 00:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qL5pVfx/E3dn5zI0JmzOxACO3RVygTvMyA/f1l+d2bY=;
	b=fB8EOZp5pkd3TUnK2oQ5UGG/WSOKKdhcRe84XfVs7M5aKnkjWMMEW5Mo4JBiZBtdE2
	cJEDa+Zsw1usYWcGPXStXlBabVCww+q2Upin8XrQgkoblN17sOFqIP4fX/GVLiQHsFuO
	WrwgabWOLzY9iG1usvOc4/KKCfHgNluUXYEZNO1UWVa5L1cQBXxOYvCcZcnJR6VBzWBf
	F4fI2yPCEOOEHqVDKyNCwwReB4Q9y7ONqQSENRIpQCX/8RVNGvLHeWBP5nhp9iZmmyne
	TIo8VsF05WgWeS3OgJ7zjZ78oUIJrrPcdwFSOFjrGdju/4lKag7dTfuGwz1j53A/inna
	GO5g==
X-Gm-Message-State: ALoCoQlHgf4/hoVY8R+gBCQswIqeDWIfqSkbTKA3xPkmMutWBFJ3clBhpcrFwo9ExIO+96wulJfm
X-Received: by 10.112.157.194 with SMTP id wo2mr51733lbb.78.1386144053590;
	Wed, 04 Dec 2013 00:00:53 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id i8sm38907579lbh.2.2013.12.04.00.00.51
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Dec 2013 00:00:52 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Dec 2013 10:00:39 +0200
Message-Id: <1386144039-26620-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] acpica: update recipe to 20131115 release
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
X-List-Received-Date: Wed, 04 Dec 2013 08:00:55 -0000

drop fix-parallel-build.patch
update md5sum/sha256sum
refresh no-werro.patch

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-extended/acpica/acpica_20130823.bb | 37 ----------
 meta-oe/recipes-extended/acpica/acpica_20131115.bb | 36 ++++++++++
 .../acpica/files/fix-parallel-build.patch          | 80 ----------------------
 .../recipes-extended/acpica/files/no-werror.patch  | 26 +++----
 4 files changed, 47 insertions(+), 132 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/acpica/acpica_20130823.bb
 create mode 100644 meta-oe/recipes-extended/acpica/acpica_20131115.bb
 delete mode 100644 meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch

diff --git a/meta-oe/recipes-extended/acpica/acpica_20130823.bb b/meta-oe/recipes-extended/acpica/acpica_20130823.bb
deleted file mode 100644
index 15dbeba..0000000
--- a/meta-oe/recipes-extended/acpica/acpica_20130823.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
-DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
-OS-independent reference implementation of the Advanced Configuration and \
-Power Interface Specification (ACPI). ACPICA code contains those portions of \
-ACPI meant to be directly integrated into the host OS as a kernel-resident \
-subsystem, and a small set of tools to assist in developing and debugging \
-ACPI tables."
-HOMEPAGE = "http://www.acpica.org/"
-SECTION = "console/tools"
-LICENSE = "BSD | GPLv2"
-LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
-DEPENDS = "bison flex"
-PR="r1"
-
-SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
-    file://cross-compile.patch \
-    file://no-werror.patch \
-    file://fix-parallel-build.patch"
-
-SRC_URI[md5sum] = "6694a6a5baa4a23fba892b8ad23f3959"
-SRC_URI[sha256sum] = "dcaf8bcdd146006e7c480d4249e014e38eb2ae3e4d2d40f90ec454312cc7e4d1"
-
-S = "${WORKDIR}/acpica-unix2-${PV}"
-
-EXTRA_OEMAKE = "'OPT_CFLAGS=-Wall'"
-
-do_install() {
-    install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
-    install -D -p -m0755 generate/unix/bin*/acpibin ${D}${bindir}/acpibin
-    install -D -p -m0755 generate/unix/bin*/acpiexec ${D}${bindir}/acpiexec
-    install -D -p -m0755 generate/unix/bin*/acpihelp ${D}${bindir}/acpihelp
-    install -D -p -m0755 generate/unix/bin*/acpinames ${D}${bindir}/acpinames
-    install -D -p -m0755 generate/unix/bin*/acpisrc ${D}${bindir}/acpisrc
-    install -D -p -m0755 generate/unix/bin*/acpixtract ${D}${bindir}/acpixtract
-}
-
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
diff --git a/meta-oe/recipes-extended/acpica/acpica_20131115.bb b/meta-oe/recipes-extended/acpica/acpica_20131115.bb
new file mode 100644
index 0000000..8c9ecd4
--- /dev/null
+++ b/meta-oe/recipes-extended/acpica/acpica_20131115.bb
@@ -0,0 +1,36 @@
+SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
+DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
+OS-independent reference implementation of the Advanced Configuration and \
+Power Interface Specification (ACPI). ACPICA code contains those portions of \
+ACPI meant to be directly integrated into the host OS as a kernel-resident \
+subsystem, and a small set of tools to assist in developing and debugging \
+ACPI tables."
+HOMEPAGE = "http://www.acpica.org/"
+SECTION = "console/tools"
+LICENSE = "BSD | GPLv2"
+LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
+DEPENDS = "bison flex"
+
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
+    file://cross-compile.patch \
+    file://no-werror.patch \
+    "
+
+SRC_URI[md5sum] = "1bd5b14c4c567ca2a113c05f4b28f29c"
+SRC_URI[sha256sum] = "d699a880b84e04205eda2d5ad048c1c38a57289240caa5f0fb7ebdcd3aac83d2"
+
+S = "${WORKDIR}/acpica-unix2-${PV}"
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
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
diff --git a/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch b/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch
deleted file mode 100644
index 42e3fb1..0000000
--- a/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-diff --git a/generate/unix/iasl/Makefile b/generate/unix/iasl/Makefile
-index e9520ed..1b73d7a 100644
---- a/generate/unix/iasl/Makefile
-+++ b/generate/unix/iasl/Makefile
-@@ -212,13 +212,10 @@ INTERMEDIATES = \
- MISC = \
- 	$(OBJDIR)/aslcompilerparse.h\
- 	$(OBJDIR)/aslcompiler.y.h\
--	$(OBJDIR)/aslcompilerparse.output\
- 	$(OBJDIR)/dtparserparse.h\
- 	$(OBJDIR)/dtparser.y.h\
--	$(OBJDIR)/dtparserparse.output\
- 	$(OBJDIR)/prparserparse.h\
--	$(OBJDIR)/prparser.y.h\
--	$(OBJDIR)/prparserparse.output
-+	$(OBJDIR)/prparser.y.h
- 
- #
- # Flags specific to iASL compiler
-@@ -240,21 +237,29 @@ include ../Makefile.rules
- $(OBJDIR)/aslcompilerlex.c :   $(ASL_COMPILER)/aslcompiler.l $(ASL_COMPILER)/aslsupport.l
- 	$(LEX) $(LFLAGS) -PAslCompiler -o$@ $(ASL_COMPILER)/aslcompiler.l
- 
--$(OBJDIR)/aslcompilerparse.c $(OBJDIR)/aslcompilerparse.h : $(ASL_COMPILER)/aslcompiler.y
-+$(OBJDIR)/aslcompilerparse.c : $(ASL_COMPILER)/aslcompiler.y
- 	$(YACC) $(YFLAGS) -pAslCompiler -o$@ $?
- 
- $(OBJDIR)/dtparserlex.c :      $(ASL_COMPILER)/dtparser.l
- 	$(LEX) $(LFLAGS) -PDtParser -o$@ $?
- 
--$(OBJDIR)/dtparserparse.c $(OBJDIR)/dtparserparse.h : $(ASL_COMPILER)/dtparser.y
-+$(OBJDIR)/dtparserparse.c : $(ASL_COMPILER)/dtparser.y
- 	$(YACC) $(YFLAGS) -pDtParser -o$@ $?
- 
- $(OBJDIR)/prparserlex.c :      $(ASL_COMPILER)/prparser.l
- 	$(LEX) $(LFLAGS) -PPrParser -o$@ $?
- 
--$(OBJDIR)/prparserparse.c $(OBJDIR)/prparserparse.h : $(ASL_COMPILER)/prparser.y
-+$(OBJDIR)/prparserparse.c : $(ASL_COMPILER)/prparser.y
- 	$(YACC) $(YFLAGS) -pPrParser -o$@ $?
- 
-+$(OBJDIR)/aslcompilerparse.h : $(OBJDIR)/aslcompilerparse.c
-+	touch $@
-+
-+$(OBJDIR)/dtparserparse.h : $(OBJDIR)/dtparserparse.c
-+	touch $@
-+
-+$(OBJDIR)/prparserparse.h:  $(OBJDIR)/prparserparse.c
-+	touch $@
- 
- #
- # Rename the headers produced by bison/yacc
-@@ -279,19 +284,21 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prparserparse.h
- # by the utilities above and they are not necessarily ANSI C, etc.
- #
- $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
--	$(CC) -c $(CFLAGS) -Wall -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
--	$(CC) -c $(CFLAGS) -Wall -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
--	$(CC) -c $(CFLAGS) -Wall -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
--	$(CC) -c $(CFLAGS) -Wall -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
--	$(CC) -c $(CFLAGS) -Wall -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
--	$(CC) -c $(CFLAGS) -Wall -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
-+
-+$(OBJECTS): $(HEADERS)
diff --git a/meta-oe/recipes-extended/acpica/files/no-werror.patch b/meta-oe/recipes-extended/acpica/files/no-werror.patch
index 9f96552..5d28f47 100644
--- a/meta-oe/recipes-extended/acpica/files/no-werror.patch
+++ b/meta-oe/recipes-extended/acpica/files/no-werror.patch
@@ -8,29 +8,25 @@ Author: Fathi Boudra <fathi.boudra@linaro.org>
 
 --- a/generate/unix/iasl/Makefile
 +++ b/generate/unix/iasl/Makefile
-@@ -279,19 +279,19 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prpars
+@@ -266,19 +266,19 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prpars
  # by the utilities above and they are not necessarily ANSI C, etc.
  #
  $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
  
  $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
- 
- $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
--	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
-+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
+-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
-- 
1.8.1.2


