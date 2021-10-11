Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7614BC4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.2785.1633977724880624556
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g7agWeMr;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id t2so59133843wrb.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ixWBc4HHVb+I4vGbHLXq+8+lWP3S5SZ0fR2dGaNwWI4=;
        b=g7agWeMr9vrex8GTyhFeYJgHz/HKUPYMtw+1awolFferVkk/SeYQjLeYnuk/l0bErv
         F9PwNyL12+xBNSLsxufEBVvOrbhR+ASkZ5z6f+LsOB6M5kGjXunqwVX0EsjiXMCh/VoF
         fsSwjJht1ttd64HQk1S6mG8/UO/IgGHuR2VElCSsYA3k23BcYjxJY7iUTamcv7YP9Lbr
         MZv+TjPctTpscwzbk58aocoICbl95HzDtmpA41OmtMxaD5PTSjn3OA24eimlxSKBYQds
         PD27QBXizXMj65DvQZa06w5bqTa92yPDZGxTlB5yoexIor+EvCs3OXyEyMRscfhI64gQ
         hKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ixWBc4HHVb+I4vGbHLXq+8+lWP3S5SZ0fR2dGaNwWI4=;
        b=LwvRb/bYcVQyT4IVOWVQt8zG7HkaHelNlBT9szQ0bwsRHFCQhUv7IcI+CVMIR4LKES
         JWfWs68ezEKHgQ4n0aCfAULDgq0ON0DUEY0GtKpLllG4mbH0HIjXdy11SXnCqV8GJxfO
         im+UPoADDVjAKKqcKjlDTPoBXX4+RRyKy67u1PDSpxJ4ZTIoTepjCB69HhP1zR57HnO3
         9jhynJkPqlxaiPyLtZJ0gAeETWAOvFVaVwstfjHIWBmoY3DYlHItlwl8/DBkiPSEUwgV
         68WmgS0tOAvnURG8dzzcUGxozSa/cw1Q2Jj05kryy6+1I8T6rx8QKPtYNLezecKz6fD9
         6JVA==
X-Gm-Message-State: AOAM533gsp1frDuIdmx3hTD0H3haRWd7mi67myZzQuJp9lxRuSwSaYwH
	AH4NtxRTY6mPmfivjfgoFd2t8sqN5FzSWQ==
X-Google-Smtp-Source: 
 ABdhPJxVKntiAoAR9jmiife2Uc+awQo6ck+wtxPgtn9xIGuuxXTmrGABFue9aGNXnL0FLORAJIfSsA==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr26165418wre.387.1633977723435;
        Mon, 11 Oct 2021 11:42:03 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:42:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
Subject: [PATCH 23/24] luaposix: update 33.4.0 -> 35.1
Date: Mon, 11 Oct 2021 20:41:39 +0200
Message-Id: <20211011184140.653609-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93237

Drop autotools/makefile patch and change the build system to luke,
as upstream uses that now.

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ace-condition-between-test-and-mkdir.patch | 75 -------------------
 .../luaposix/luaposix_33.4.0.bb               | 21 ------
 .../luaposix/luaposix_35.1.bb                 | 24 ++++++
 3 files changed, 24 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch
 delete mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
 create mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch b/meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch
deleted file mode 100644
index d8a9e3d2b..000000000
--- a/meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 4dfca036c96071bd2a2c80ff84719c6d37858373 Mon Sep 17 00:00:00 2001
-From: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
-Date: Fri, 17 Apr 2020 14:36:50 +0500
-Subject: [PATCH 1/1] fix: avoid race condition between test and mkdir
-
-when building in parallel the race condition, when the directory
-is tested for existence and it is created, can break the build
-
-Signed-off-by: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
----
- Makefile.in            | 6 +++---
- build-aux/rockspecs.mk | 2 +-
- local.mk               | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 9b51ef3..4722525 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -1637,7 +1637,7 @@ distclean-tags:
- 
- distdir: $(DISTFILES)
- 	$(am__remove_distdir)
--	test -d "$(distdir)" || mkdir "$(distdir)"
-+	$(MKDIR_P) "$(distdir)"
- 	@srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
- 	topsrcdirstrip=`echo "$(top_srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
- 	list='$(DISTFILES)'; \
-@@ -1975,7 +1975,7 @@ clean-local:
- 	rm -f $(posix_submodules)
- 
- $(allhtml): $(EXTRA_ext_posix_posix_la_SOURCES) $(ext_posix_posix_la_SOURCES)
--	test -d $(builddir)/doc || mkdir $(builddir)/doc
-+	$(MKDIR_P) $(builddir)/doc
- @HAVE_LDOC_TRUE@	$(LDOC) -c build-aux/config.ld -d $(abs_srcdir)/doc .
- @HAVE_LDOC_FALSE@	$(MKDIR_P) doc
- @HAVE_LDOC_FALSE@	touch doc/index.html doc/ldoc.css
-@@ -1983,7 +1983,7 @@ $(allhtml): $(EXTRA_ext_posix_posix_la_SOURCES) $(ext_posix_posix_la_SOURCES)
- doc: $(allhtml)
- 
- $(luarocks_config): Makefile.am
--	@test -d build-aux || mkdir build-aux
-+	@$(MKDIR_P) build-aux
- 	$(AM_V_GEN){						\
- 	  $(set_LUA_BINDIR);					\
- 	  echo 'rocks_trees = { "$(abs_srcdir)/luarocks" }';	\
-diff --git a/build-aux/rockspecs.mk b/build-aux/rockspecs.mk
-index ebd1dbf..c8fbdbc 100644
---- a/build-aux/rockspecs.mk
-+++ b/build-aux/rockspecs.mk
-@@ -62,7 +62,7 @@ LUA_INCDIR = `cd $$LUA_BINDIR/../include && pwd`
- LUA_LIBDIR = `cd $$LUA_BINDIR/../lib && pwd`
- 
- $(luarocks_config): Makefile.am
--	@test -d build-aux || mkdir build-aux
-+	@$(MKDIR_P) build-aux
- 	$(AM_V_GEN){						\
- 	  $(set_LUA_BINDIR);					\
- 	  echo 'rocks_trees = { "$(abs_srcdir)/luarocks" }';	\
-diff --git a/local.mk b/local.mk
-index d391ef7..80b22ce 100644
---- a/local.mk
-+++ b/local.mk
-@@ -255,7 +255,7 @@ dist_examples_DATA +=				\
- allhtml = $(dist_doc_DATA) $(dist_examples_DATA) $(dist_modules_DATA) $(dist_classes_DATA)
- 
- $(allhtml): $(EXTRA_ext_posix_posix_la_SOURCES) $(ext_posix_posix_la_SOURCES)
--	test -d $(builddir)/doc || mkdir $(builddir)/doc
-+	$(MKDIR_P) $(builddir)/doc
- if HAVE_LDOC
- 	$(LDOC) -c build-aux/config.ld -d $(abs_srcdir)/doc .
- else
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
deleted file mode 100644
index 720e2eab8..000000000
--- a/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "luaposix is a POSIX binding for Lua."
-LICENSE = "MIT"
-HOMEPAGE = "https://github.com/luaposix/luaposix"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7dd2aad04bb7ca212e69127ba8d58f9f"
-
-DEPENDS += "lua-native lua"
-
-SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release \
-           file://0001-fix-avoid-race-condition-between-test-and-mkdir.patch \
-"
-SRCREV = "8e4902ed81c922ed8f76a7ed85be1eaa3fd7e66d"
-S = "${WORKDIR}/git"
-LUA_VERSION = "5.3"
-
-inherit autotools pkgconfig
-
-do_install() {
-    oe_runmake 'DESTDIR=${D}' 'luadir=${datadir}/lua/${LUA_VERSION}' 'luaexecdir=${libdir}/lua/${LUA_VERSION}' install
-}
-
-FILES:${PN} = "${datadir}/lua/${LUA_VERSION} ${libdir}/lua/${LUA_VERSION}"
diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb b/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
new file mode 100644
index 000000000..5e933d4f5
--- /dev/null
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "luaposix is a POSIX binding for Lua."
+LICENSE = "MIT"
+HOMEPAGE = "https://github.com/luaposix/luaposix"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f81069e00c0cad249f20efe958276db1"
+
+DEPENDS += "lua-native lua libxcrypt"
+
+SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release-v35.1"
+SRCREV = "14043c5086ae738823a5dfbc9170d9e14193fbef"
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+do_compile() {
+    cd ${S}
+    ${S}/build-aux/luke
+}
+
+do_install() {
+    cd ${S}
+    ${S}/build-aux/luke install PREFIX=${D}/${prefix}
+}
+
+FILES:${PN} = "${datadir}/lua/ ${libdir}/lua/"
-- 
2.20.1


