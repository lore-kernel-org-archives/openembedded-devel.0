Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB50CC3DA40
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 23:39:32 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.2590.1689723566724518386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 16:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Aktgp9qZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so8908751a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 16:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689723565; x=1692315565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXZd6k4D18nGX03fPIdC6Ai9GYq9WleZj+AzZOplxlI=;
        b=Aktgp9qZm1C1Y/4BpfX3FUx2Gzq9lzPLXy9znB+pgpjSu4NiyVVRX1v6XRMEYPrWxY
         fQPvkY8JKQEZJMUFNlzYjQzFNqbT+R2n8LSj3nNgWXl0PzBA79qDbLCWWF3AAHbMwnT5
         OWx1ocTTQ4qjON/xYzdcmL8vlB8qZbzbkOaGl+IxDjokpaozZKbSYyKg2jV9l4T5coVM
         xUQzLDxSgRfZcCoVNlaHD1/EJXhkteb4YBzel4rgB2/S4fGM2DZeVhrbMZ4CKPK3Wj3H
         KwaAiHrR5sKSg2cruWmtKOGN4Q1yVYZ5dauaqg4z7ulqbB5B26xoiUzfKv735jlav94l
         +eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689723565; x=1692315565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXZd6k4D18nGX03fPIdC6Ai9GYq9WleZj+AzZOplxlI=;
        b=OykyFd9KHeiq8yhwCeJ8BdwAZsx7BT6KXGQxOkTvTwNoJaSb/j7B3Gy9GZnvU2WTTR
         WonvAeXJulwOpg+qEnagNso4Q49gLxlBOg57KSnoz+9g1/000Z17Tuwtd+6Sf5dgAOP4
         ZKbpD7jyS6NLLsNlIihXqOTDVn5FI19UhkxqHbZISNkqgX7g2+N/Mu8GkNGPaFxTy5Pd
         6g9+gFXWc9tOUoUww3rE2I+HRdkZw6s+ywcFUh5nFLk1LrqrWgk6YvGPT9d90eAkzpTn
         jFVPjCnja+AgqHkOhy+Xoe+1Hrl6GIS08e1WtAMg6yLE8FhW9bX94NVUmnLz55pL+Oc2
         Rv3w==
X-Gm-Message-State: ABy/qLapz9OH8RTWr8cDgs2L4JJqEeB+UMbP7/rctrpqPf13fFuHCsmV
	Qir6vsf94dM5XBU40grKd5IAyDyL2CM=
X-Google-Smtp-Source: APBJJlGjKyIn8rS1w9mWF2INjXFYSNMWypw2lyOXmaiXLwLk4NNdvnL0i/CQ+veQdFa6ZYmNhKOaQA==
X-Received: by 2002:aa7:d412:0:b0:51d:e4b6:ff6b with SMTP id z18-20020aa7d412000000b0051de4b6ff6bmr907550edq.33.1689723564897;
        Tue, 18 Jul 2023 16:39:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n17-20020aa7c791000000b005215eb17bb7sm1829163eds.88.2023.07.18.16.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 16:39:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv3 3/3] libtomcrypt: add PACKAGECONFIG for ltm enabled by default
Date: Wed, 19 Jul 2023 01:38:40 +0200
Message-ID: <20230718233840.2461756-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718233840.2461756-1-Martin.Jansa@gmail.com>
References: <20230718233840.2461756-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 23:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103953

* enabled by default, because that's what dropbear expects and fails
  without as shown in:
  http://errors.yoctoproject.org/Errors/Details/720460/
  dropbear/2022.83-r0/crypto_desc.c:72: undefined reference to `ltm_desc'

* add comment about the LICENSE
* use EXTRA_OEMAKE

* FYI: if you need to use this in dunfell (for whatever reason e.g. to
  avoid CVE-2019-17362 in dropbear which contains bundled libtomcrypt),
  then you need to add:

  # Only needed for dunfell, fixed in kirkstone with:
  # https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=4b308773eca7570ce5007e8f953b56252c17fdb1
  DEPENDS += "libtool-cross"
  EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool'"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v3: add libtool-cross dependency to fix cross compilation (dunfell needs LIBTOOL
    to be set in EXTRA_OEMAKE because of ${HOST_SYS} prefix), but the dependency
    is needed for all releases when cross compiling

 .../libtomcrypt/libtomcrypt_1.18.2.bb         | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
index 8b73cdda85..5479007d92 100644
--- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
@@ -1,10 +1,19 @@
 SUMMARY = "LibTomCrypt is a public domain open source cryptographic toolkit"
 HOMEPAGE = "https://www.libtom.net/LibTomCrypt"
 SECTION = "libs"
+# Unlicense isn't very accurate for this revision, it was WTFPL in 0.18.0-rc1:
+# https://github.com/libtom/libtomcrypt/commit/77e31fb6a980212e90b9a50f116dc5a7bd91e527
+# then updated to dual license PD and WTFPL also in 0.18.0-rc1:
+# https://github.com/libtom/libtomcrypt/commit/412b2ee1fccc3a0df58f93f372c90d6d0f93bfc9
+# and then updated again to Unlicense after the 0.18.2 tag (it's only in develop branch):
+# https://github.com/libtom/libtomcrypt/commit/3630bee6fc0f73dd9c7923fd43f8ae15a2c0fb70
+# but keep using Unlicense to avoid triggering people with WTFPL license:
+# https://groups.google.com/g/libtom/c/17Z7xkECULM
+# and this comment can be removed next time libtomcrypt is updated
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71baacc459522324ef3e2b9e052e8180"
 
-DEPENDS += "libtool-cross"
+DEPENDS = "libtool-cross"
 
 SRC_URI = "git://github.com/libtom/libtomcrypt.git;protocol=https;branch=master \
    file://CVE-2019-17362.patch \
@@ -14,10 +23,19 @@ SRCREV = "7e7eb695d581782f04b24dc444cbfde86af59853"
 
 S = "${WORKDIR}/git"
 
+inherit pkgconfig
+
+PACKAGECONFIG ??= "ltm"
+PACKAGECONFIG[ltm] = ",,libtommath"
+
+CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'ltm', '-DUSE_LTM -DLTM_DESC', '', d)}"
+
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' 'CFLAGS=${CFLAGS}'"
+
 do_compile() {
     oe_runmake -f makefile.shared
 }
 
 do_install() {
-    oe_runmake -f makefile.shared 'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' install
+    oe_runmake -f makefile.shared install
 }

