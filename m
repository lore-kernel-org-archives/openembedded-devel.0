Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F29ACCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:27 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13712.1762853906250890078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXGAxDGb;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b98983bae80so2388154a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853905; x=1763458705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExzG+6ocoaGSVZ3/YoYMWdQjzFniUv9ApKwzLZxN9gI=;
        b=MXGAxDGbwcQl63QISUDCIlrl1MZ75gTxEJCTfVDMGAKbwMFIxhD4uWOmWU4Hc6muCL
         KjS1DfCH5luXnOtpoumvReKUW3Rko5eQdBohQjCm3xUQpLB3yMaqZ/+G0wMYr9X1Ro3J
         EsT4sefQF7VtxwejOwnU/JV7XUh6PZcGcEdUN2vN2rHxEK/Tg51kAUNc+cBY5Qu9jp9Q
         dkcJxu/n5uVWTeu1tS74DSp50YAfo1mEhhnwoOORkHVip69G/vFllk4sKd1oUeFe6bR1
         FR4Ci7gR5GaAmzqprTTFih6DQo6XIcVYG3aA0uyD3X/eK+FaepfN7/x8t34SbFmOSiBb
         Lgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853905; x=1763458705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ExzG+6ocoaGSVZ3/YoYMWdQjzFniUv9ApKwzLZxN9gI=;
        b=YOs10fZjEuP2zErBgj8TjRqkCdW7gHVlGQe4UxAd5kDyMyJZXnFuWVppjjVHVuHueS
         yIqmW9cAUNUzGq8KvKUa4OBH1LlmMY/Gr6YCXX6tkCt4BeXpth/r6ZK74QepvOYBzwWP
         BOn/McKk7ckKE3VDfcot35vTTxm7gfxskKpaqKVk8szc6/lRQ1LmtBp7hkbjQrMSUfWi
         LaWVzIQTzH+wArV+taC5l7zc7qgTLtn4X5UQg6G38I7imXtLSXTMtJ7IaVHoxfwIpY7n
         80OdWixwsrKcR4BrSxOL+xK5PUGQbz4rYnvSCJVlP9S4gQmoXnnuFs3GpnkYLTWZMcfh
         /VsQ==
X-Gm-Message-State: AOJu0YxOrnqqHOXSWX0Ey+Xmz6YjMG0HWmxixHmpGonnC+TXc2ilbKk7
	iCi5dxd9BvqWewQg3v939UjOjOC2nigCVfxCODZYZoxcbv8hvSm2hkPB772iPThsNPc=
X-Gm-Gg: ASbGncsbW0A+OUqMLPA0LQTVThIXdB5WYebKA9KpyJ25kYQ+lsmeokHR1mvEjWSrPl3
	QWUcimEs94bTX2C1lyELU4sR8vtA046uOnmv/AquhsQnUglX+ZC8K2rNq39B3STbgQAyVGXzaU3
	gahZLbCHzqS4JCsh+C6zt9F3Uuf4ciwUNJYwkRkDoyurC43IyXBfCZNUauCBKJHM+6lmsUMZFrm
	+c42RCa42AVjbdMcO3+anuSCrQTzMbs+9vKU20fzILd2WZRhidFbvVJ0c+eoS6dQrPz9LvBgahA
	IehI6CdQUWaz4vkT/Xz66kebzZYHb/8ZDotbtTJllU+FX0DwVAnyecITUlTebXbpG+9lGIWzqZD
	EbRRFkF7Oat9WMNCNLazdZS9rc8ca/mLWYnueXTvY+8GNseeEm8zvTXb1/algXTEkRjlsdQJ+5d
	uyX2boHWCPzaOR1w==
X-Google-Smtp-Source: AGHT+IHdtwK+Wl1fug3YVmiXHaCQ96LVZ7wicVH6rLpQIXps3rgXZrNTJSQl735I55q3Xpsg38dsCw==
X-Received: by 2002:a17:902:d583:b0:298:250b:19eb with SMTP id d9443c01a7336-298250b1a49mr71084365ad.60.1762853905429;
        Tue, 11 Nov 2025 01:38:25 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 18/18] freeradius: upgrade 3.2.5 -> 3.2.6
Date: Tue, 11 Nov 2025 22:37:33 +1300
Message-ID: <20251111093733.1393568-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121521

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_6

Refresh patch 0008-libtool-do-not-use-jlibtool.patch due to upstream commit:
https://github.com/FreeRADIUS/freeradius-server/commit/315f09e4ebde14f171f107020f05473dbc9ac8f6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0008-libtool-do-not-use-jlibtool.patch    | 105 +++++++++++++-----
 ...reeradius_3.2.5.bb => freeradius_3.2.6.bb} |   2 +-
 2 files changed, 80 insertions(+), 27 deletions(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.5.bb => freeradius_3.2.6.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch b/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
index 559b857b63..b85f26c70d 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
@@ -1,4 +1,4 @@
-From d0fa5b259c2dc942d0a43a9cf1bfc32f40c184f9 Mon Sep 17 00:00:00 2001
+From fa211ce85ff385d670562ec7332fb350d8c02e2b Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 7 Jan 2016 22:37:30 -0800
 Subject: [PATCH] libtool: do not use jlibtool
@@ -11,27 +11,27 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
- Make.inc.in        |  4 ++--
- scripts/boiler.mk  |  2 ++
- scripts/install.mk | 14 +++++++-------
- scripts/libtool.mk | 22 ++++++++++++++++------
- 4 files changed, 27 insertions(+), 15 deletions(-)
+ Make.inc.in        |  3 +-
+ scripts/boiler.mk  |  4 ++-
+ scripts/install.mk | 14 +++++-----
+ scripts/libtool.mk | 69 +++++++++++++++++++++++++++-------------------
+ 4 files changed, 52 insertions(+), 38 deletions(-)
 
 diff --git a/Make.inc.in b/Make.inc.in
-index 05f82776ff..e78f3fe9dc 100644
+index fefb022a26..e78f3fe9dc 100644
 --- a/Make.inc.in
 +++ b/Make.inc.in
-@@ -57,7 +57,7 @@ CPPFLAGS	= @CPPFLAGS@
+@@ -57,6 +57,7 @@ CPPFLAGS	= @CPPFLAGS@
  LIBPREFIX	= @LIBPREFIX@
  EXEEXT		= @EXEEXT@
  
--LIBTOOL		= JLIBTOOL
 +LIBTOOL		= @LIBTOOL@
  ACLOCAL		= @ACLOCAL@
  AUTOCONF	= @AUTOCONF@
  AUTOHEADER	= @AUTOHEADER@
-@@ -168,7 +168,7 @@ ANALYZE.c       := @clang_path@
+@@ -167,7 +168,7 @@ ANALYZE.c       := @clang_path@
  #
  ifeq "$(USE_SHARED_LIBS)" "yes"
  	TESTBINDIR = ./$(BUILD_DIR)/bin/local
@@ -41,25 +41,34 @@ index 05f82776ff..e78f3fe9dc 100644
  	TESTBINDIR = ./$(BUILD_DIR)/bin
  	TESTBIN    = ./$(BUILD_DIR)/bin
 diff --git a/scripts/boiler.mk b/scripts/boiler.mk
-index 2ce0c18f34..567cc0f22f 100644
+index 9d70104747..f436163583 100644
 --- a/scripts/boiler.mk
 +++ b/scripts/boiler.mk
-@@ -272,6 +272,7 @@ define COMPILE_C_CMDS
+@@ -271,6 +271,7 @@ define COMPILE_C_CMDS
  	$(Q)$(ECHO) CC $<
  	$(Q)$(strip ${COMPILE.c} -o $@ -c -MD ${CPPFLAGS} ${CFLAGS} ${SRC_CFLAGS} ${INCDIRS} \
  	    $(addprefix -I, ${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} $<)
-+	${Q}mv $(dir $@)/.libs/$(notdir $*.d) ${BUILD_DIR}/objs/$*.d
++    ${Q}mv $(dir $@)/.libs/$(notdir $*.d) ${BUILD_DIR}/objs/$*.d
  endef
  else
  #
-@@ -287,6 +288,7 @@ define COMPILE_C_CMDS
+@@ -286,6 +287,7 @@ define COMPILE_C_CMDS
  	$(Q)cppcheck --enable=style -q ${CHECKFLAGS} $(filter -isystem%,${SRC_CFLAGS}) \
  	     $(filter -I%,${SRC_CFLAGS}) $(filter -D%,${SRC_CFLAGS}) ${INCDIRS} \
  	     $(addprefix -I,${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} --suppress=variableScope --suppress=invalidscanf $<
-+	${Q}mv $(dir $@)/.libs/$(notdir $*.d) ${BUILD_DIR}/objs/$*.d
++    ${Q}mv $(dir $@)/.libs/$(notdir $*.d) ${BUILD_DIR}/objs/$*.d
  endef
  endif
  
+@@ -603,7 +605,7 @@ $(BUILD_DIR):
+ 
+ # Define compilers and linkers
+ #
+-BOOTSTRAP_BUILD = 
++BOOTSTRAP_BUILD =
+ COMPILE.c = ${CC}
+ COMPILE.cxx = ${CXX}
+ CPP = cc -E
 diff --git a/scripts/install.mk b/scripts/install.mk
 index 916411563b..e38c1ed697 100644
 --- a/scripts/install.mk
@@ -116,21 +125,67 @@ index 916411563b..e38c1ed697 100644
  
  
 diff --git a/scripts/libtool.mk b/scripts/libtool.mk
-index 381127ec2d..e83d7e6ad7 100644
+index 64c2fe0804..5ee5f321b9 100644
 --- a/scripts/libtool.mk
 +++ b/scripts/libtool.mk
-@@ -60,7 +60,9 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
-     # Tell GNU Make to use this value, rather than anything specified
-     # on the command line.
-     override LIBTOOL := ${JLIBTOOL}
--endif    # else we're not using jlibtool
+@@ -29,29 +29,33 @@ ifeq "$(findstring darwin,$(HOSTINFO))" "darwin"
+ 	JLIBTOOL_DEFS += -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
+ endif
+ 
+-JLIBTOOL := ${BUILD_DIR}/make/jlibtool
+-
+-# Add a rule to build jlibtool BEFORE any other targets.  This
+-# means that we can use it to build the later targets.
+-all install: ${JLIBTOOL}
+-
+-# Note that we need to use a compilation rule that does NOT
+-# include referencing ${LIBTOOL}, as we don't have a jlibtool
+-# binary!
+-${JLIBTOOL}: ${top_makedir}/jlibtool.c
+-	$(Q)mkdir -p $(dir $@)
+-	$(Q)echo CC jlibtool.c
+-	$(Q)${CC} $< -o $@ ${JLIBTOOL_DEFS}
+-
+-clean: jlibtool_clean
+-
+-.PHONY: jlibtool_clean
+-jlibtool_clean:
+-	$(Q)rm -f ${JLIBTOOL}
+-
+-# Tell GNU Make to use this value, rather than anything specified
+-# on the command line.
+-override LIBTOOL := ${JLIBTOOL}
++ifeq "${LIBTOOL}" "JLIBTOOL"
++    JLIBTOOL := ${BUILD_DIR}/make/jlibtool
++
++    # Add a rule to build jlibtool BEFORE any other targets.  This
++    # means that we can use it to build the later targets.
++    all install: ${JLIBTOOL}
++
++    # Note that we need to use a compilation rule that does NOT
++    # include referencing ${LIBTOOL}, as we don't have a jlibtool
++    # binary!
++    ${JLIBTOOL}: ${top_makedir}/jlibtool.c
++        $(Q)mkdir -p $(dir $@)
++        $(Q)echo CC jlibtool.c
++        $(Q)${CC} $< -o $@ ${JLIBTOOL_DEFS}
++
++    clean: jlibtool_clean
++
++    .PHONY: jlibtool_clean
++    jlibtool_clean:
++        $(Q)rm -f ${JLIBTOOL}
++
++    # Tell GNU Make to use this value, rather than anything specified
++    # on the command line.
++    override LIBTOOL := ${JLIBTOOL}
 +else    # else we're not using jlibtool
 +    all install: ${LIBTOOL}
 +endif
  
  # When using libtool, it produces a '.libs' directory.  Ensure that it
  # is removed on "make clean", too.
-@@ -74,11 +76,19 @@ clean: .libs_clean
+@@ -65,12 +69,19 @@ clean: .libs_clean
  # Re-define compilers and linkers
  #
  OBJ_EXT = lo
@@ -139,6 +194,7 @@ index 381127ec2d..e83d7e6ad7 100644
 -LINK.c = ${LIBTOOL} --silent --mode=link ${CC}
 -LINK.cxx = ${LIBTOOL} --mode=link ${CXX}
 -PROGRAM_INSTALL = ${LIBTOOL} --silent --mode=install ${INSTALL}
+-
 +ifeq "${LIBTOOL}" "JLIBTOOL"
 +    COMPILE.c = ${LIBTOOL} --silent --mode=compile ${CC}
 +    COMPILE.cxx = ${LIBTOOL} --mode=compile ${CXX}
@@ -153,8 +209,5 @@ index 381127ec2d..e83d7e6ad7 100644
 +    PROGRAM_INSTALL = ${LIBTOOL} --mode=install ${INSTALL}
 +endif
  
- 
  # LIBTOOL_ENDINGS - Given a library ending in ".a" or ".so", replace that
--- 
-2.25.1
-
+ #   extension with ".la".
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.6.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.2.6.bb
index 70f2496170..9c75bc0d3d 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.5.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.6.bb
@@ -39,7 +39,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "a7acce80f5ba2271d9aeb737a4a91a5bf8317f31"
+SRCREV = "a696279897f9e87c2fb2b1b8388da5a4aa09835f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 

