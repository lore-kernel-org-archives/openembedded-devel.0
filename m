Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C61C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 13:08:20 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web08.36367.1653916091094023840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 06:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UmZVhocN;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 5so2941415lju.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 06:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zMx6BYolvwGFnLAz2/KaByA2sOyu36oOnJa7SOMAxW4=;
        b=UmZVhocNpmmcJQHULchF4YfDJOYJUlVb+uvjTVE2SkTrsUNYhZSNUfpquQ1hUV/7oJ
         BE2JNY69l95Xw5dVUrlfQSoi8PVgtdcEci4N3RDSLxa6Z1w8MXywrvNkroN/HbpkOU76
         Tah7o0lViKfFATHiNYvlIK+QsJ22izCAQfMrs7c3JtLK9SEGn3eY7uXcnaFq6/B/Ey/M
         7ZIuU2goS0roou2XknA2E4B7P6o/T0Guutl7YU4Qdno/IZSPhpRlmRI1g2CFQUoFvOK1
         Jjv+qpBsIR5KO4V13f3JWtqTq79wES1w9K7YE0/gfHdq2opy8R9r8GNxNbEmILi1Zf5a
         ybOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zMx6BYolvwGFnLAz2/KaByA2sOyu36oOnJa7SOMAxW4=;
        b=UP9WS9F3Ujt0jnyRsAv71wA0dW4QrLxkhpVubf2tnT+DBGucqZrUPNLk3lGFxw/jVF
         hhbmNOmrZtZMkYYT82FDIM0ohQ/FD3RnNHTElImBydRyXtJ+utWlZ08MYh6+ZlGutBwX
         u5FnSGu2x8/lUHe8/tLq8eyKWAghavKJYkbUOfb0yEAAId5vQpYfgD0p87y0/dPVLJ7W
         CtOBx2mBpLQcl1fnSKN5vYeC8ynZIay9eSMwrFMo2MGKU253ERCTBqhOvdz9eiP2AH70
         rmfflvurAnW4YQW0LBX3rkJk0QhxPGaRiPMYvskHlJUTc+uDCla+n+abhm+eNarPUKhp
         wZ8Q==
X-Gm-Message-State: AOAM532FJo/u5aa+x6kVYIL4BC64jPrITwkt3A1vNGv1lNcRGhOz6OP/
	ad+REepIlBPSXaTSAp2q+yuUCdo/7fw=
X-Google-Smtp-Source: 
 ABdhPJzZbEVLKc7jc4gQCipF/2/Y9erjXJ59cqYcNnarxCBlUqcBCV37Xyix+VrO3nqTv9gIm3ptCQ==
X-Received: by 2002:a2e:9ec5:0:b0:24b:536b:7e28 with SMTP id
 h5-20020a2e9ec5000000b0024b536b7e28mr34363891ljk.120.1653916089020;
        Mon, 30 May 2022 06:08:09 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 t18-20020a2e4612000000b00253e1833e8bsm2521127lja.117.2022.05.30.06.08.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 06:08:08 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libtomcrypt: add recipe
Date: Mon, 30 May 2022 13:08:05 +0000
Message-Id: <20220530130805.2716465-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 13:08:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97332

LibTomCrypt is a fairly comprehensive, modular and portable cryptographic
toolkit that provides developers with a vast array of well known published
block ciphers, one-way hash functions, chaining modes, pseudo-random number
generators, public key cryptography and a plethora of other routines.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../libtomcrypt/libtomcrypt_1.18.2.bb         | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb

diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
new file mode 100644
index 000000000..357fd0ab8
--- /dev/null
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "LibTomCrypt is a public domain open source cryptographic toolkit"
+HOMEPAGE = "https://www.libtom.net/LibTomCrypt"
+SECTION = "libs"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=71baacc459522324ef3e2b9e052e8180"
+
+DEPENDS += "libtool-cross"
+
+SRC_URI = "git://github.com/libtom/libtomcrypt.git;protocol=https;branch=master"
+
+SRCREV = "7e7eb695d581782f04b24dc444cbfde86af59853"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    oe_runmake -f makefile.shared
+}
+
+do_install() {
+    oe_runmake -f makefile.shared 'PREFIX=${prefix}' 'DESTDIR=${D}' install
+}
-- 
2.25.1


