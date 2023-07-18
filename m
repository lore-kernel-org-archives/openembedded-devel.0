Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78463EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 12:10:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.5912.1689682214846227432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 05:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DJz+MN/u;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9926623e367so796887166b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689682213; x=1692274213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAu45IMlhll2V+T7jsPZQ3vKeMSHlWZ7MV1AhHqMC3E=;
        b=DJz+MN/uaSciCz2/Tt8mEOnrHuF2fyn5AH0+RN4PaSJxX+811vEVpy6VaLFO0vDNEu
         Wy2KOuG0Fguh5LAc7mcH02wgCF6DYPUXRKc9qtpZ1HmtQZRNrxahkVUV6I6c5dNLSkhr
         lmteg48K3UpmnzPRD1eTPmB19N77nNIbAVaGLhlTMEkX8gZhUo9gEJdUP9ydHUmFx0Tz
         WeZI594jUWjqi7FveCbkt/7md3830/d7sonbk/LW0YA4Wlk5J9eTMptCX7FZoCuQOul5
         w9OdR/CzL0CTob/P6ASTynxA/2NpYTIh109GIW3yyoQ6ogo7k99N78Npn4UYO07dqqLm
         bavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689682213; x=1692274213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAu45IMlhll2V+T7jsPZQ3vKeMSHlWZ7MV1AhHqMC3E=;
        b=BNTNXtupsDrlAgi2f5MysdUP1XTqlY6cBdw7cR3xxgwsWjt1Vk9OKln/W00/NDaXZi
         Un8VjfDugBIvVoJ+UbQhYIIYfm2dMurER8DAhcJia2HXotcsjMb3h7s0A3wyjs7Hpkct
         l5wWksxcJSyYYnAv/V9gdjtsbG0SnxMXbOd3zV+7DW8M0+jxYKhfaslZxeohEA5g+/r7
         yhKsG4kUWlMsOujX5mlizmEp/FSDwSQ/76EIxdydBnsw/O7IYm/xAxF8Knl4xmwdCPdP
         hBX/Lo5z4Ady7ElukR83ENiIzvtobJIdP39JuGNLU/SRKTxg00ftUmJVPNG2h0S1+jXM
         jfSA==
X-Gm-Message-State: ABy/qLbUB2UFoifxIxeGpjVQ4/KSL5NBYUt4W+JGqNAwHvqdD+aziK2S
	3L0PBjBSM+Q3jpz8JgdXc0iT2c0hLAY=
X-Google-Smtp-Source: APBJJlGU1ZfHzIUblAfn+gsnjs87gw54eSRt2Kp4pxXMMG9OD1xgcwY+6SGSw3whgcwKRzjZREPbmw==
X-Received: by 2002:a17:906:7a43:b0:997:e7ce:1e88 with SMTP id i3-20020a1709067a4300b00997e7ce1e88mr514336ejo.52.1689682213134;
        Tue, 18 Jul 2023 05:10:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906489200b0098654d3c270sm965128ejq.52.2023.07.18.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:10:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] libtomcrypt: add PACKAGECONFIG for ltm enabled by default
Date: Tue, 18 Jul 2023 14:09:38 +0200
Message-ID: <20230718120938.2048623-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718120938.2048623-1-Martin.Jansa@gmail.com>
References: <20230718120938.2048623-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 12:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103942

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
 .../libtomcrypt/libtomcrypt_1.18.2.bb         | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
index 8b73cdda85..274f94356f 100644
--- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
@@ -1,11 +1,18 @@
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
-
 SRC_URI = "git://github.com/libtom/libtomcrypt.git;protocol=https;branch=master \
    file://CVE-2019-17362.patch \
 "
@@ -14,10 +21,18 @@ SRCREV = "7e7eb695d581782f04b24dc444cbfde86af59853"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= "ltm"
+PACKAGECONFIG[ltm] = ",,libtommath"
+
+CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'ltm', '-DUSE_LTM -DLTM_DESC', '', d)}"
+
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' 'CFLAGS=${CFLAGS}'"
+EXTRA_OEMAKE += "${@bb.utils.contains('PACKAGECONFIG', 'ltm', 'EXTRALIBS=${STAGING_LIBDIR}/libtommath.a', '', d)}"
+
 do_compile() {
     oe_runmake -f makefile.shared
 }
 
 do_install() {
-    oe_runmake -f makefile.shared 'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' install
+    oe_runmake -f makefile.shared install
 }
-- 
2.41.0


