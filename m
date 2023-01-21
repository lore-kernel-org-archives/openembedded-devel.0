Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E7AC52D77
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2130.1674324096164790802
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WY9oIply;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id k18so7977023pll.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qLb2Z04vbsEulA2V4ZSwDQL5vYciiWsIlo+5oPAFro=;
        b=WY9oIplydMOsEU8oze181FwlMEmnshQBCmRWuO4jpsmuNyyIGYgEawzbfK0UYnDXbd
         o2pZbF+uaWjwKTUoI6WIfxhiir6U+vLJ77hqT38kd6hwNvBA/x2v0jAv3EoJWbu3I+bC
         GIAow8uq76Q1bdo7Yr3J2CJBAXM8tE7+wjZAr4vSbHC3Ypf/k344G+FnCQS0SS+4pU+L
         CrtQTDZMIbjT6XGcFK93xnnjhXXLBfTbikA9GIYFqkgiEMXFChcKUhZXhvdWY5xOFhGz
         oMkf5F5pCNzwaKV2UsJnNlmO15azNM4fizcClHoFFbaN2eXIVqn4DSyxMtZRBNaQWb2X
         CNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qLb2Z04vbsEulA2V4ZSwDQL5vYciiWsIlo+5oPAFro=;
        b=02ftNawpLCiaciv/Dyzkk30fzxgzD2L4Scu4U49ZUXoc8ucT/sJ27UcuQmjB9m7VSP
         leAFveiLLAas2jDhaE8MBZSQd0HBbsT0JqBJuWG12tCMI4m49hnvRC63D18QFRkLMlL9
         cFSe5gRmQh2EZrDd5QZHkpA1czoxasLw/D1a3+4yq5cD56PXJ673sVtDjUHT8BUANOh+
         bLht7BOJc6dXk/dEzcqZy6U75/VxErynpnFZOXOfWRkDvsjWxOpVJHg9BOQ7W/orqvX0
         yMovN4Gl/KocYpl23vb7HvW2Nhiq4ThlBYi3vtBd/yAu2kWRW7dUp//FX72Vv3gCX+vM
         WBGw==
X-Gm-Message-State: AFqh2krGiIoXWpUTcipDjeH+3hfv6ywmFk1ikBiMUU0/Gl5ELVPkYV6x
	mLzDnIQiu1m2pEb6DTNPVWuBG9IO3DJWQQ==
X-Google-Smtp-Source: AMrXdXuODqjSAvbhbpbQ4b1VciZn10QT/C32O4DW8S+s11BTavoe1+9cxhRuPCWU1iTYi1Jr0rBqMg==
X-Received: by 2002:a17:90b:3695:b0:229:189c:c48e with SMTP id mj21-20020a17090b369500b00229189cc48emr20964252pjb.17.1674324100130;
        Sat, 21 Jan 2023 10:01:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 20/30] libol: Drop recipe
Date: Sat, 21 Jan 2023 10:01:11 -0800
Message-Id: <20230121180121.1229895-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100687

In past it was needed by syslog-ng until it was bundled into syslog-ng
and once syslog-ng was upgraded [1] this recipe became more or less unused

This package is now included in the syslog-ng 1.6.x or newer release tarball

[1] https://git.openembedded.org/meta-openembedded/commit/?id=1a6e16bcb1145df51b15c19df0d7ef655b683f5e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../libol/libol/configure.patch               | 14 -------------
 meta-oe/recipes-support/libol/libol_0.3.18.bb | 20 -------------------
 3 files changed, 35 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libol/libol/configure.patch
 delete mode 100644 meta-oe/recipes-support/libol/libol_0.3.18.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 20291b576d..34689fb48b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -827,7 +827,6 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     liblinebreak \
     mailcap \
     liboauth \
-    libol \
     mg \
     monit \
     mscgen \
diff --git a/meta-oe/recipes-support/libol/libol/configure.patch b/meta-oe/recipes-support/libol/libol/configure.patch
deleted file mode 100644
index 87695fb06d..0000000000
--- a/meta-oe/recipes-support/libol/libol/configure.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: libol-0.3.18/configure.in
-===================================================================
---- libol-0.3.18.orig/configure.in	2006-03-27 14:44:52.000000000 +0000
-+++ libol-0.3.18/configure.in	2014-07-18 07:05:56.029481372 +0000
-@@ -1,7 +1,7 @@
- dnl Process this file with autoconf to produce a configure script.
--AC_INIT(src/abstract_io.c)
-+AC_INIT(libol, "0.3.18")
- 
--AM_INIT_AUTOMAKE(libol, "0.3.18", 1)
-+AM_INIT_AUTOMAKE([foreign])
- if test -n "$SNAPSHOT_VERSION"; then
-         VERSION=$VERSION+$SNAPSHOT_VERSION
- fi
diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
deleted file mode 100644
index 21a56264e4..0000000000
--- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "A tiny C support library"
-HOMEPAGE = "https://my.balabit.com/downloads/libol"
-SECTION = "libs"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-
-SRC_URI = "http://www.balabit.com/downloads/libol/0.3/${BP}.tar.gz \
-           file://configure.patch"
-SRC_URI[md5sum] = "cbadf4b7ea276dfa85acc38a1cc5ff17"
-SRC_URI[sha256sum] = "9de3bf13297ff882e02a1e6e5f6bf760a544aff92a9d8a1cf4328a32005cefe7"
-
-inherit autotools binconfig
-
-do_compile:prepend() {
-    install ${S}/utils/make_class.in ${B}/utils
-}
-
-do_install:append() {
-    rm -fr ${D}${bindir}
-}
-- 
2.39.1


