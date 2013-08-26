Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6F89D6BB2E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 10:33:20 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id u10so2251910lbi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/6x5LjNEtzvcSpsBiy0GqDdN5tfjgMWCl8Tv4oyP+Q0=;
	b=D9mFWmeSg1XwgG1a78fQyjCgqJpmxcQ8j3MySfu0iRzqrfWzMejvygSuB+Pjas5qNo
	ut8dbdItuZ086XuvgyTM3bGXUqDicXwdQWmUwEbO2obecFvCFOlGH4uuPnETHzICrPCA
	dQLYh4IxfVvL0R7QOLuq+KZRCkSkBmtnQyJbS/gWn4B4N5ySiTFnSCaDSrBRAsvkeV/b
	4Nks1HlZuVCJpfW9PVeaufnDtAog+6gW+F9lAE+pYhjJ7zLv0f0h1Ma9KS1iF6149ySn
	TLHbs1qgo/63tIYnR8b/HmVJpFGdMZ4XzCgAk4K8gYLiTMY43hUTSZXeQwT6hMHwI30g
	X2kg==
X-Gm-Message-State: ALoCoQmzjBuv4Z0cx1xOgwZqTgcsudi8HpC5K95pvX8nXrHf7MdvhRLZYYx3Rx1LCHspKYBjrdcL
X-Received: by 10.152.116.7 with SMTP id js7mr13263089lab.11.1377513200524;
	Mon, 26 Aug 2013 03:33:20 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id ap7sm5461308lac.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 03:33:20 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2013 13:33:13 +0300
Message-Id: <1377513195-21664-2-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
References: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH 1/3] acpica: fix parallel build
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
X-List-Received-Date: Mon, 26 Aug 2013 10:33:21 -0000

The compilation of the iasl utility fails when `make -j<N>' > 1.  This
commit cleans up the rules in generate/unix/iasl such that a `make -j'
will succeed.

Signed-off-by: Andrew McDermott <andrew.mcdermott@linaro.org>
---
 meta-oe/recipes-extended/acpica/acpica_20130626.bb |  3 +-
 .../acpica/files/fix-parallel-build.patch          | 80 ++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch

diff --git a/meta-oe/recipes-extended/acpica/acpica_20130626.bb b/meta-oe/recipes-extended/acpica/acpica_20130626.bb
index 65eadac..bf38fa3 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20130626.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20130626.bb
@@ -17,7 +17,8 @@ PR="r1"
 
 SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://cross-compile.patch \
-    file://no-werror.patch"
+    file://no-werror.patch \
+    file://fix-parallel-build.patch"
 
 SRC_URI[md5sum] = "b7112b3deffef8fe25aac7810cc419a9"
 SRC_URI[sha256sum] = "888dda6227265c396a686624f971c51693c2bba84f24c634536234c8dca7b465"
diff --git a/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch b/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch
new file mode 100644
index 0000000..42e3fb1
--- /dev/null
+++ b/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch
@@ -0,0 +1,80 @@
+diff --git a/generate/unix/iasl/Makefile b/generate/unix/iasl/Makefile
+index e9520ed..1b73d7a 100644
+--- a/generate/unix/iasl/Makefile
++++ b/generate/unix/iasl/Makefile
+@@ -212,13 +212,10 @@ INTERMEDIATES = \
+ MISC = \
+ 	$(OBJDIR)/aslcompilerparse.h\
+ 	$(OBJDIR)/aslcompiler.y.h\
+-	$(OBJDIR)/aslcompilerparse.output\
+ 	$(OBJDIR)/dtparserparse.h\
+ 	$(OBJDIR)/dtparser.y.h\
+-	$(OBJDIR)/dtparserparse.output\
+ 	$(OBJDIR)/prparserparse.h\
+-	$(OBJDIR)/prparser.y.h\
+-	$(OBJDIR)/prparserparse.output
++	$(OBJDIR)/prparser.y.h
+ 
+ #
+ # Flags specific to iASL compiler
+@@ -240,21 +237,29 @@ include ../Makefile.rules
+ $(OBJDIR)/aslcompilerlex.c :   $(ASL_COMPILER)/aslcompiler.l $(ASL_COMPILER)/aslsupport.l
+ 	$(LEX) $(LFLAGS) -PAslCompiler -o$@ $(ASL_COMPILER)/aslcompiler.l
+ 
+-$(OBJDIR)/aslcompilerparse.c $(OBJDIR)/aslcompilerparse.h : $(ASL_COMPILER)/aslcompiler.y
++$(OBJDIR)/aslcompilerparse.c : $(ASL_COMPILER)/aslcompiler.y
+ 	$(YACC) $(YFLAGS) -pAslCompiler -o$@ $?
+ 
+ $(OBJDIR)/dtparserlex.c :      $(ASL_COMPILER)/dtparser.l
+ 	$(LEX) $(LFLAGS) -PDtParser -o$@ $?
+ 
+-$(OBJDIR)/dtparserparse.c $(OBJDIR)/dtparserparse.h : $(ASL_COMPILER)/dtparser.y
++$(OBJDIR)/dtparserparse.c : $(ASL_COMPILER)/dtparser.y
+ 	$(YACC) $(YFLAGS) -pDtParser -o$@ $?
+ 
+ $(OBJDIR)/prparserlex.c :      $(ASL_COMPILER)/prparser.l
+ 	$(LEX) $(LFLAGS) -PPrParser -o$@ $?
+ 
+-$(OBJDIR)/prparserparse.c $(OBJDIR)/prparserparse.h : $(ASL_COMPILER)/prparser.y
++$(OBJDIR)/prparserparse.c : $(ASL_COMPILER)/prparser.y
+ 	$(YACC) $(YFLAGS) -pPrParser -o$@ $?
+ 
++$(OBJDIR)/aslcompilerparse.h : $(OBJDIR)/aslcompilerparse.c
++	touch $@
++
++$(OBJDIR)/dtparserparse.h : $(OBJDIR)/dtparserparse.c
++	touch $@
++
++$(OBJDIR)/prparserparse.h:  $(OBJDIR)/prparserparse.c
++	touch $@
+ 
+ #
+ # Rename the headers produced by bison/yacc
+@@ -279,19 +284,21 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prparserparse.h
+ # by the utilities above and they are not necessarily ANSI C, etc.
+ #
+ $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
+-	$(CC) -c $(CFLAGS) -Wall -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
+-	$(CC) -c $(CFLAGS) -Wall -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
+-	$(CC) -c $(CFLAGS) -Wall -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
+-	$(CC) -c $(CFLAGS) -Wall -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
+-	$(CC) -c $(CFLAGS) -Wall -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
+ 
+ $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
+-	$(CC) -c $(CFLAGS) -Wall -o$@ $?
++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
++
++$(OBJECTS): $(HEADERS)
-- 
1.8.1.2


