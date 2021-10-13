Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3054EC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 04:56:12 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.3797.1634100971186835753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 21:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IGqgYvt5;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso3472600pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 21:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vTnxHK9CH9XUP8sPA2Mz3lnDVpcbiLCRGGEJ7ZbQFBE=;
        b=IGqgYvt5i4VETDUAWoxaBKzhq8u235wPKl3pyaUfDvFsWTMs/9+X3UInVrcbXpr1oi
         J1Jfk3mBATAUPKy865MCKBrff6+LQhBt9TDL4n1Mgj9VhnJTPvWWT0AxecX2MD9khaUT
         OGJ1eW16uCgKA2pYfBVzprAf6JTFXcjaP7DvEl2aRXAkOP6wkZ6U09uCv5fIL+DqN3Bb
         oibf4ojJJ3PJvVwzY2brQPRmwt93BRDAdQlfiHiEAwP/Qzi6E7G5weZmYIXIge9nZIUH
         0ktgnCd52qWFLe++DuGVf7SQS1ZvhFgbcP1Ceuz/9XLnjdCsVOp9sCeQJxkXVxLAle3G
         koRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vTnxHK9CH9XUP8sPA2Mz3lnDVpcbiLCRGGEJ7ZbQFBE=;
        b=zAzutRTrRnoGzqVOsrnaHryuEDG8g2gXOhzpUtXW6sWMMaL8lZZ75L7oBjelY08ixw
         dgmmB28wlECjFy3T1dx/oArvfjyQH/WwgYvKp6v+6rEgjCzGWqdxBEbMu9B/wy189lrL
         Xw3x1i+HASgIEv6xhxHZK3Sq1m4Csa92dcCxX9WpDYfT/WAZsUiPB1AoK7htUEF1DrZm
         8faHGw6jShGusirBLLGYlK7f0NQhQdf21OqTsOzQF5prU+lpCKTdqcQERe9iMpT0Xc5p
         rvemz76E2hm7efG/k/MOqHvGTsgVZYlomgDp/AFQGpRWWwLsRrgzhRNdZHxDrENXobgg
         cO9A==
X-Gm-Message-State: AOAM530DTUcTxtMBX3zBXWODSAyr+6aqopLH8C0B2d5sTiKppjdAjd7d
	Aw+s2JAy2lFRJLzTcSAeLW+OFnB2iHH3zg==
X-Google-Smtp-Source: 
 ABdhPJxA7/S7bTosckZfKYF/+o60bVfKxu/CuRiuEDtpkIlCH4cAn690VelMhIsL8NepK7cxNtr25A==
X-Received: by 2002:a17:902:a613:b0:13d:d95c:c892 with SMTP id
 u19-20020a170902a61300b0013dd95cc892mr33615034plq.35.1634100970473;
        Tue, 12 Oct 2021 21:56:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 x30sm8516257pfj.219.2021.10.12.21.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 21:56:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] luaposix: Upgrade to 35.1
Date: Tue, 12 Oct 2021 21:56:06 -0700
Message-Id: <20211013045607.399687-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013045607.399687-1-raj.khem@gmail.com>
References: <20211013045607.399687-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 04:56:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93265

automake has been dropped therefore switch to using luke build system
Drop automake specific patch which is no longer needed
Use lua 5.4 since thats whats provided in oe-core

License-Update: File renamed to LICENSE and copyright year changed to
2021

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ace-condition-between-test-and-mkdir.patch | 75 -------------------
 .../luaposix/luaposix_33.4.0.bb               | 21 ------
 .../luaposix/luaposix_35.1.bb                 | 27 +++++++
 3 files changed, 27 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch
 delete mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
 create mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch b/meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch
deleted file mode 100644
index d8a9e3d2b7..0000000000
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
index 9a66d8fb28..0000000000
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
-LUA_VERSION = "5.4"
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
index 0000000000..5c7d4c9199
--- /dev/null
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "luaposix is a POSIX binding for Lua."
+LICENSE = "MIT"
+HOMEPAGE = "https://github.com/luaposix/luaposix"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f81069e00c0cad249f20efe958276db1"
+
+DEPENDS += "lua-native lua"
+
+SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release-v${PV} \
+"
+SRCREV = "14043c5086ae738823a5dfbc9170d9e14193fbef"
+S = "${WORKDIR}/git"
+LUA_VERSION = "5.4"
+
+B = "${S}"
+
+inherit pkgconfig
+
+do_compile() {
+  ${S}/build-aux/luke
+}
+
+do_install() {
+    ${S}/build-aux/luke PREFIX=${D}${prefix} install
+}
+
+FILES:${PN} = "${datadir}/lua/${LUA_VERSION} \
+               ${libdir}/lua/${LUA_VERSION}"
-- 
2.33.0


