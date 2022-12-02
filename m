Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A2CC4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:22:52 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.79932.1669998165957249026
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Dec 2022 08:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sw9NJLsR;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so5574102pjj.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 08:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Xk/XNVpJW286byLbJqAQ8ymYWhKJIS4dv2EAS3NVpk=;
        b=Sw9NJLsR7sm5dI3uRy6S2bYKhJg5/T4DopisOT5FHMmQ3663L5tF8A7Xb9Z0LlFw8G
         lZOeQAB4W7Xz7JSrj5UZSUVN81pJGcmi/bIUb6cj7En3cyuNmyfMMsb4hOgVXd7Z3Gul
         WFUqKEpliaQJgN1zeKrS+mJgYcz0C2OXr7gQwbxFvFBCx/3Xlp5E1VnG1ABLdbih5FnO
         rGyxuwdFz8fFnC7BRpctA6kyDnzfXSInEJvSPbhxlHq0jF/n9vHDajN2M6fOv/8+Tb0L
         XZwoBHsyUEYWYLEO4JcLR4T5plphjTRyte/CKZ4vbID21vMqdt8cckhuMX5DFiv/kIgQ
         EkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Xk/XNVpJW286byLbJqAQ8ymYWhKJIS4dv2EAS3NVpk=;
        b=f+lnq6navTGz/Gu95jRMUkGzWqGrr/eL+gH/Oe6ORRXdmhBCL/znnEhGfM61oHwNg+
         vDloPqQEgfCnvE+mOU45yQGfEq/uikxepmR4RnjJA3BAoRPhHZGzPCpowMj4qYEuyG+b
         lVOFWjUPtBoh54WsDJthh7ryBwv64BNqdgEiKspjuGdAg+cDixwj3xscmjbgKcc567fB
         jIOUVQ7cVefuE8AgOryhPNgQrf2W63k3yNsUz6nhHjmTe2XRY8FKxkva/IUIeLPOWg28
         j2RTqw91N8u7KeQ3wwz3gcf9iR8G1U4ywKJWyGGq3izl9GuA2bqZWOnMfAAsK5WAAkdG
         7tkw==
X-Gm-Message-State: ANoB5pkWn7F9T6+yXaDCC9U9NM1DRdlkhuQPZ3PMcA5mhY0pq4/Gk5em
	2Odlbb2SVUjSvjpYRNx73eMAqwRSFPA=
X-Google-Smtp-Source: AA0mqf6jw5wRur708lgERNZVraXMT9YnHCH7LwpHRJEJ3XQNqQrfFN3oBtd0qBqZa5inTm4z7UYiKg==
X-Received: by 2002:a17:902:6b8c:b0:189:8134:1fd with SMTP id p12-20020a1709026b8c00b00189813401fdmr28409768plk.174.1669998164915;
        Fri, 02 Dec 2022 08:22:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id z32-20020a17090a6d2300b002190eabb890sm6798020pjj.25.2022.12.02.08.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:22:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fwts: Upgrade to 22.11.00
Date: Fri,  2 Dec 2022 08:22:42 -0800
Message-Id: <20221202162242.461203-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 16:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99914

Forward port 0003-Remove-Werror-from-build.patch
Add a patch to fix parallel build race condition

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ble-parallel-builds-of-lex-bison-fil.patch | 68 +++++++++++++++++++
 .../fwts/0003-Remove-Werror-from-build.patch  |  8 +--
 .../{fwts_22.01.00.bb => fwts_22.11.00.bb}    |  5 +-
 3 files changed, 75 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch
 rename meta-oe/recipes-test/fwts/{fwts_22.01.00.bb => fwts_22.11.00.bb} (85%)

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch b/meta-oe/recipes-test/fwts/fwts/0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch
new file mode 100644
index 0000000000..90bee3e722
--- /dev/null
+++ b/meta-oe/recipes-test/fwts/fwts/0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch
@@ -0,0 +1,68 @@
+From 6135a318dd48787f1b6e1296c755d67575f44dc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Dec 2022 15:18:55 -0800
+Subject: [PATCH] libfwtsiasl: Disable parallel builds of lex/bison files
+
+Since they are using mv cmds they maybe conflicting with each other in
+highly parallelized build resulting in errors like
+
+| mv dtcompilerparser.tab.c dtcompilerparser.c
+| mv dtcompilerparser.tab.c dtcompilerparser.c
+| cp dtcompilerparser.tab.h dtcompilerparser.y.h
+| mv dtcompilerparser.tab.c dtcompilerparser.c
+| mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
+| make[3]: *** [Makefile:4196: dtcompilerparser.c] Error 1
+| make[3]: *** Waiting for unfinished jobs....
+| mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
+| make[3]: *** [Makefile:4194: dtcompilerparser.y.h] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libfwtsiasl/Makefile.am | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+--- a/src/libfwtsiasl/Makefile.am
++++ b/src/libfwtsiasl/Makefile.am
+@@ -58,32 +58,24 @@ aslcompiler.y: $(ASL_PARSER)
+ aslcompilerlex.c: $(ASL_LEXER)
+ 	${LEX} ${AM_LFLAGS} -PAslCompiler -o$@ $(top_srcdir)/src/acpica/source/compiler/aslcompiler.l
+ 
+-.NOTPARALLEL: aslcompiler.c
++.NOTPARALLEL: aslcompiler.c aslcompiler.y.h
+ aslcompiler.c aslcompiler.y.h: aslcompiler.y
+-	${YACC} ${AM_YFLAGS} -d -baslcompiler -pAslCompiler $^
+-	mv aslcompiler.tab.c aslcompiler.c
+-	cp aslcompiler.tab.h aslcompiler.y.h
++	${YACC} ${AM_YFLAGS} -d -baslcompiler -pAslCompiler --header=aslcompiler.y.h --output=aslcompiler.c $^
+ 
+-.NOTPARALLEL: dtcompilerparserlex.c
++.NOTPARALLEL: dtcompilerparserlex.c dtcompilerparser.c dtcompilerparser.y.h
+ dtcompilerparserlex.c dtcompilerparser.c dtcompilerparser.y.h: $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.l $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
+ 	${LEX} ${AM_LFLAGS} -PDtCompilerParser -odtcompilerparserlex.c $<
+-	${YACC} ${AM_YFLAGS} -bdtcompilerparser -pDtCompilerParser $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
+-	mv dtcompilerparser.tab.c dtcompilerparser.c
+-	cp dtcompilerparser.tab.h dtcompilerparser.y.h
++	${YACC} ${AM_YFLAGS} -bdtcompilerparser -pDtCompilerParser --header=dtcompilerparser.y.h --output=dtcompilerparser.c $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
+ 
+-.NOTPARALLEL: dtparserlex.c
++.NOTPARALLEL: dtparserlex.c dtparser.c dtparser.y.h
+ dtparserlex.c dtparser.c dtparser.y.h: $(top_srcdir)/src/acpica/source/compiler/dtparser.l $(top_srcdir)/src/acpica/source/compiler/dtparser.y
+ 	${LEX} ${AM_LFLAGS} -PDtParser -odtparserlex.c $<
+-	${YACC} ${AM_YFLAGS} -bdtparser -pDtParser $(top_srcdir)/src/acpica/source/compiler/dtparser.y
+-	mv dtparser.tab.c dtparser.c
+-	cp dtparser.tab.h dtparser.y.h
++	${YACC} ${AM_YFLAGS} -bdtparser -pDtParser --header=dtparser.y.h --output=dtparser.c $(top_srcdir)/src/acpica/source/compiler/dtparser.y
+ 
+-.NOTPARALLEL: prparserlex.c
++.NOTPARALLEL: prparserlex.c prparser.c prparser.y.h
+ prparserlex.c prparser.c prparser.y.h: $(top_srcdir)/src/acpica/source/compiler/prparser.l $(top_srcdir)/src/acpica/source/compiler/prparser.y
+ 	${LEX} ${AM_LFLAGS} -PPrParser -oprparserlex.c $<
+-	${YACC} ${AM_YFLAGS} -bprparser -pPrParser $(top_srcdir)/src/acpica/source/compiler/prparser.y
+-	mv prparser.tab.c prparser.c
+-	cp prparser.tab.h prparser.y.h
++	${YACC} ${AM_YFLAGS} -bprparser -pPrParser --header=prparser.y.h --output=prparser.c $(top_srcdir)/src/acpica/source/compiler/prparser.y
+ 
+ pkglib_LTLIBRARIES = libfwtsiasl.la
+ 
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
index 6dc45ba84b..610113e6fe 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
@@ -15,7 +15,7 @@ Upstream-Status: Pending
 @@ -13,7 +13,7 @@ AM_CPPFLAGS = \
  	-I$(top_srcdir)/efi_runtime			\
  	-I$(top_srcdir)/smccc_test			\
- 	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
+ 	-pthread					\
 -	-Wall -Werror -Wextra				\
 +	-Wall -Wextra					\
  	-Wno-address-of-packed-member			\
@@ -23,9 +23,9 @@ Upstream-Status: Pending
  	-Wno-long-long -Wredundant-decls -Wshadow	\
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
-@@ -25,7 +25,7 @@ AM_CPPFLAGS = \
- 	`pkg-config --silence-errors --cflags json-c`	\
- 	`pkg-config --cflags glib-2.0 gio-2.0` 		\
+@@ -22,7 +22,7 @@ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/src/acpica/source/include	\
+ 	-I$(top_srcdir)/src/acpica/source/compiler	\
  	-DDATAROOTDIR=\"$(datarootdir)\"		\
 -	-Wall -Werror -Wextra				\
 +	-Wall -Wextra					\
diff --git a/meta-oe/recipes-test/fwts/fwts_22.01.00.bb b/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
similarity index 85%
rename from meta-oe/recipes-test/fwts/fwts_22.01.00.bb
rename to meta-oe/recipes-test/fwts/fwts_22.11.00.bb
index 1f2d3e0521..f1028074d7 100644
--- a/meta-oe/recipes-test/fwts/fwts_22.01.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
@@ -11,12 +11,13 @@ SRC_URI = "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=${BP} \
            file://0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
            file://0005-Undefine-PAGE_SIZE.patch \
            file://0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
+           file://0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch \
            "
-SRC_URI[sha256sum] = "45045a095d9933d9ff39712372ab1f3078ca8e29c007b3f97b810cdb8c27b5c3"
+SRC_URI[sha256sum] = "4af4e1e0f1ae9313297af722d744ba47a81c81bc5bdeab3f4f40837a39e4b808"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 
-DEPENDS = "libpcre glib-2.0 dtc bison-native libbsd"
+DEPENDS = "libpcre glib-2.0 dtc bison-native flex-native libbsd"
 DEPENDS:append:libc-musl = " libexecinfo"
 
 inherit autotools bash-completion pkgconfig
-- 
2.38.1


