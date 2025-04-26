Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1932CC369D8
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:56:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7362.1745668606121793167
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IPt62RDM;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so5923032a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745668604; x=1746273404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tB16WhQHVo2Bib9ys098uuY3phYscS1zBdXJDR3ejY=;
        b=IPt62RDMCgqn7sy2QWJ1N76ym9zKCxAa8fJZHF52VSgsfXzPyjHM2oHkIjOByMWqzo
         Ae+DHFVOeOMZb64H50i1eVXbSRmwmZiTcSDLQSeOlvUudWFMp5Ek0jXijetNIXty17Nj
         AI9l4E2xExi5oP8Y+afKIEGkixT+31RjHvrYYtL00oWRriS/Rd3ZxqIPN0WDK4/Ch/Uo
         WoCEElo/ijAEwVboWZ7Sb5sV6dcZ13gkufkd2mRkFdBKEOtZ+ZFTJ8RGVUYWYN8BTHM2
         mFGg6H+83vccUR5+gx2AcAwcECjYfItm/naDpjYMygUGfaot4zEtLiR21S1ItVzUtHsJ
         s84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745668604; x=1746273404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tB16WhQHVo2Bib9ys098uuY3phYscS1zBdXJDR3ejY=;
        b=FBNBECsgtK9GMBns172LaJDf/CCkuIvB8oWrui8YYJNoLjir/s/aBNwjZgTS/YRBcy
         rWnnJ+8JXDpliDQLpiN9pVJ8lTVoMVFBjdrtKy5a64dq3JYm7izGDJqWRk+Sq8BC78YA
         eTOGDQCby1kJIQfV/lzSAmNx+uMP5Y6iVemLYgmLbiafvIXL+QzjpApM11dCU/MDDR5B
         MktWS9M1Qolik8PP7Hy5KzcAt5fdaWMB6+i/12QUmP3xt9aB+Of3WJHEutUCnAoSup4g
         lthIHR9zf1tUv4fl+X0PbbTp5DY8tJBEB0cJPqCQusgaqmNGmVufpKvHxPtwkqN/nMlK
         lV0g==
X-Gm-Message-State: AOJu0YzYMbqDqNwucORCv6GcMsu0pASNafaWZNtxUpkoI4QKa2UgSWQK
	nbRdFam/JlC4gk4TX5vWPDGt8GaSOwrX6F0JmaU9R4PvMB39pX4oxx5TPrjd
X-Gm-Gg: ASbGnctXsffw2Czhv1Q8pPevqpV+qQg6oM7ynqW6Ekz2Q561oSRHzf/XSty2E5psjgm
	lDscvrwLNz9dTt7f4njkyksA1oW1M68TI7RlI0lcUDPCIu8yWMMuU4e13VImk+md7cpR2tBvjvC
	SteKW/xCyaiG7ArFHHPr1bDU4r3qccvrXAkG6vbdQLCF48NxMTTZ+c3sO3dPHWBXMwSCJE37CWQ
	4/NSdz8K773Rz/BNbAT5nvzgbbLPLYqoTkWo0ARYnM8c7AkpwbxYsUz8VQF22lG5UDNjqpMwS9P
	O9m8ASwQ/sf+4XVkGOn/n8eayjD153vVzgcrDPuWnvS6H863BBPD9kK24nQqQfg2tIoyMPnS5A=
	=
X-Google-Smtp-Source: AGHT+IGxE1UIeYulC5W7YXECMyPtf/mwNnSxqYxGM3b0LeTpN/FwfsHIeShFNPEwoW2SSYLoZYBhaQ==
X-Received: by 2002:a05:6402:26c5:b0:5e5:b572:a6d6 with SMTP id 4fb4d7f45d1cf-5f7395f1f3fmr1895188a12.10.1745668604237;
        Sat, 26 Apr 2025 04:56:44 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f7016f658csm2621437a12.41.2025.04.26.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:56:43 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 6/8] linux-atm: Fix build with gcc-15
Date: Sat, 26 Apr 2025 13:56:21 +0200
Message-ID: <20250426115623.2732743-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426115623.2732743-1-martin.jansa@gmail.com>
References: <20250426115623.2732743-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117147

From: Martin Jansa <martin.jansa@gmail.com>

* taken from:
  https://github.com/sbwml/package_network_utils_linux-atm/blob/1d1c3f884daf9ee4bce077f3db9d990617683669/patches/901-linux-atm-dont-use-bool-keyword.patch

* fixes:
  http://errors.yoctoproject.org/Errors/Details/852979/

In file included from load_lex.l:11:
../../../linux-atm-2.5.2/src/lane/load_lex.h:27:10: error: two or more data types in declaration specifiers
   27 |   Bool_t bool;
      |          ^~~~
../../../linux-atm-2.5.2/src/lane/load_lex.h:27:14: warning: declaration does not declare anything
   27 |   Bool_t bool;
      |              ^
In file included from ../../../linux-atm-2.5.2/src/lane/load.c:29:
../../../linux-atm-2.5.2/src/lane/load_lex.h:27:10: error: two or more data types in declaration specifiers
   27 |   Bool_t bool;
      |          ^~~~
../../../linux-atm-2.5.2/src/lane/load_lex.h:27:14: warning: declaration does not declare anything
   27 |   Bool_t bool;
      |              ^
load_lex.l: In function 'yylex':
load_lex.l:47:11: error: expected identifier before 'bool'
load_lex.l:51:11: error: expected identifier before 'bool'
../../../linux-atm-2.5.2/src/lane/load.c: In function 'load_vars':
../../../linux-atm-2.5.2/src/lane/load.c:501:29: error: expected identifier before 'bool'
  501 |                    g_return.bool==BL_TRUE?"True":"False");
      |                             ^~~~
../../../linux-atm-2.5.2/src/lane/load.c:502:51: error: expected identifier before 'bool'
  502 |         set_var_bool(curr_unit, varname, g_return.bool);
      |                                                   ^~~~
make[3]: *** [Makefile:513: load.o] Error 1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-Fix-implicit-declaration-error.patch | 44 +++++++++
 .../0002-Fix-build-with-gcc-15.patch          | 91 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  6 +-
 3 files changed, 137 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-Fix-implicit-declaration-error.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0002-Fix-build-with-gcc-15.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-Fix-implicit-declaration-error.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-Fix-implicit-declaration-error.patch
new file mode 100644
index 0000000000..1c5f79c9d8
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-Fix-implicit-declaration-error.patch
@@ -0,0 +1,44 @@
+From 1435d613ee632bd7a2aa15180acf06ff3723da41 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Sat, 26 Apr 2025 13:03:35 +0200
+Subject: [PATCH] Fix implicit-declaration error
+
+* taken from:
+  https://github.com/sbwml/package_network_utils_linux-atm/blob/main/patches/900-fix-implicit-declaration-error.patch
+
+* fixes:
+  http://errors.yoctoproject.org/Errors/Details/766901/
+  linux-atm-2.5.2/src/led/conn.c:414:57: error: passing argument 3 of 'accept' from incompatible pointer type [-Wincompatible-pointer-types]
+
+Upstream-Status: Inappropriate [Upstream is dead]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/led/conn.c     | 2 +-
+ src/maint/hediag.c | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/led/conn.c b/src/led/conn.c
+index 99da5e4..89639e1 100644
+--- a/src/led/conn.c
++++ b/src/led/conn.c
+@@ -405,7 +405,7 @@ Conn_t *accept_conn(Conn_t *conn)
+ {
+         Conn_t *new;
+         struct sockaddr_atmsvc addr;
+-        size_t len;
++        socklen_t len;
+         int fd;
+         char buff[MAX_ATM_ADDR_LEN+1];
+ 
+diff --git a/src/maint/hediag.c b/src/maint/hediag.c
+index a4f792f..3b1b7fb 100644
+--- a/src/maint/hediag.c
++++ b/src/maint/hediag.c
+@@ -9,6 +9,7 @@
+ #include <linux/atmdev.h>
+ #include <linux/sonet.h>
+ #include <linux/atm_he.h>
++#include <string.h>
+ 
+ struct reg_table {
+ 	unsigned addr;
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0002-Fix-build-with-gcc-15.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0002-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..1cbd6a5831
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0002-Fix-build-with-gcc-15.patch
@@ -0,0 +1,91 @@
+From 2a9d42b2b190d533cf126a93bcad842cea825bbe Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Sat, 26 Apr 2025 13:04:56 +0200
+Subject: [PATCH] Fix build with gcc-15
+
+* taken from:
+  https://github.com/sbwml/package_network_utils_linux-atm/blob/1d1c3f884daf9ee4bce077f3db9d990617683669/patches/901-linux-atm-dont-use-bool-keyword.patch
+
+* fixes:
+  http://errors.yoctoproject.org/Errors/Details/852979/
+
+In file included from load_lex.l:11:
+../../../linux-atm-2.5.2/src/lane/load_lex.h:27:10: error: two or more data types in declaration specifiers
+   27 |   Bool_t bool;
+      |          ^~~~
+../../../linux-atm-2.5.2/src/lane/load_lex.h:27:14: warning: declaration does not declare anything
+   27 |   Bool_t bool;
+      |              ^
+In file included from ../../../linux-atm-2.5.2/src/lane/load.c:29:
+../../../linux-atm-2.5.2/src/lane/load_lex.h:27:10: error: two or more data types in declaration specifiers
+   27 |   Bool_t bool;
+      |          ^~~~
+../../../linux-atm-2.5.2/src/lane/load_lex.h:27:14: warning: declaration does not declare anything
+   27 |   Bool_t bool;
+      |              ^
+load_lex.l: In function 'yylex':
+load_lex.l:47:11: error: expected identifier before 'bool'
+load_lex.l:51:11: error: expected identifier before 'bool'
+../../../linux-atm-2.5.2/src/lane/load.c: In function 'load_vars':
+../../../linux-atm-2.5.2/src/lane/load.c:501:29: error: expected identifier before 'bool'
+  501 |                    g_return.bool==BL_TRUE?"True":"False");
+      |                             ^~~~
+../../../linux-atm-2.5.2/src/lane/load.c:502:51: error: expected identifier before 'bool'
+  502 |         set_var_bool(curr_unit, varname, g_return.bool);
+      |                                                   ^~~~
+make[3]: *** [Makefile:513: load.o] Error 1
+
+Upstream-Status: Inappropriate [Upstream is dead]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/lane/load.c     | 4 ++--
+ src/lane/load_lex.h | 2 +-
+ src/lane/load_lex.l | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/lane/load.c b/src/lane/load.c
+index 39d4672..1cc2202 100644
+--- a/src/lane/load.c
++++ b/src/lane/load.c
+@@ -498,8 +498,8 @@ load_vars(const char *file)
+ 	break;
+       case BOOLEAN:
+ 	Debug_unit(&load_unit, "Variable is boolean: %s", 
+-		   g_return.bool==BL_TRUE?"True":"False");
+-	set_var_bool(curr_unit, varname, g_return.bool);
++		   g_return.b==BL_TRUE?"True":"False");
++	set_var_bool(curr_unit, varname, g_return.b);
+ 	break;
+       case INTEGER:
+ 	Debug_unit(&load_unit, "Variable is integer: %d", g_return.intti);
+diff --git a/src/lane/load_lex.h b/src/lane/load_lex.h
+index 2384e70..72b8f9b 100644
+--- a/src/lane/load_lex.h
++++ b/src/lane/load_lex.h
+@@ -24,7 +24,7 @@
+ #define END 0
+ 
+ typedef struct {
+-  Bool_t bool;
++  Bool_t b;
+   int intti;
+   AtmAddr_t *atmaddress;
+   LaneDestination_t *destaddr;
+diff --git a/src/lane/load_lex.l b/src/lane/load_lex.l
+index c184795..1d412e3 100644
+--- a/src/lane/load_lex.l
++++ b/src/lane/load_lex.l
+@@ -44,11 +44,11 @@ H [0-9a-fA-F]
+ 		 return ATMADDRESS;
+ 	        }
+ True	|
+-true		{g_return.bool = BL_TRUE;
++true		{g_return.b = BL_TRUE;
+ 		 return BOOLEAN;
+ 		}	
+ False	|
+-false		{g_return.bool = BL_FALSE;
++false		{g_return.b = BL_FALSE;
+ 		 return BOOLEAN;
+ 		}
+ \#.*		{}
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 391e0e4ab6..3d679d7dc7 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -16,6 +16,8 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://0001-make-Add-PREFIX-knob.patch \
            file://0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch \
            file://0001-configure-Check-for-symbol-from-libresolv-instead-of.patch \
+           file://0001-Fix-implicit-declaration-error.patch \
+           file://0002-Fix-build-with-gcc-15.patch \
            "
 
 SRC_URI:append:libc-musl = " file://musl-no-on_exit.patch"
@@ -32,7 +34,3 @@ inherit autotools pkgconfig
 EXTRA_OEMAKE += "ROOTPREFIX=${root_prefix}"
 
 FILES:${PN} += "${nonarch_base_libdir}/firmware"
-
-# http://errors.yoctoproject.org/Errors/Details/766901/
-# linux-atm-2.5.2/src/led/conn.c:414:57: error: passing argument 3 of 'accept' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"

