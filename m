Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D4EC64E96
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.11625.1650480893122958134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 11:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ctGRJKwJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id bx5so2777874pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkonj+UCeat9VKXqoA+sonEuyexeoNVjiFl2QogdpqQ=;
        b=ctGRJKwJdLY0qPcLUpQUD31YT1C2Nbu9A538doIIKhsPh4PkzWZ/m47M1Eg7idVrMH
         TkVTWLo6J7tjFEAkMoFzoqvMewC3QK3gWNec5fJiNRataAsaisuVS+2vqFTbZl+BSv28
         cdjH4UfoS+p8NZ6XKKmfU9exuJCGW8oDkSd+HDElXxVkqmwDo9oURKmISRU8pdwuf/xs
         7722GYDwTf2qy7WsUmV8vGLdRZBb/ct5WLiBGcNwOp81JYrKeBG62MAwnklTui+0h03G
         f45Htdv4ygx/jRHisX5IFpOhBNHpXlCNNZeFzWY/wTJmkR5rvfhtQfkYTjHNVB+k74Rp
         G7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkonj+UCeat9VKXqoA+sonEuyexeoNVjiFl2QogdpqQ=;
        b=DnFJZCsWaFAeRKWIQ7PIdHSqMoZKi0/SvQu4tQP3PivgzAXPEV74K71uQd/T8Gp8BZ
         j9u6lqlO7n6ZEOZI4cXRBikMMf031b3KSCFcX4gATyvHzvwQCbWAvSbXdT5MXghIn/Nw
         Sf3nOFx5XvqpjyNS48LPdEe7behHv9wlrpZi1iRrdOH43AnsEcdKG4tEFJmwhcjBh1cP
         szr6zNoiUOAylj/oF7r42+oLnBO/iKMPNgsKxNtE4IC799A1rJn9t8p77j8Ea+8rQvSU
         FXVVnUKQuddz7ry/Qf8QHaCF5YcEz+OoBggSnRwneAU/t8UaoklpVuwd/Dc3Cna/f4sn
         D6kg==
X-Gm-Message-State: AOAM532XdTXiv7WE6V4EG8VGXBD89U9+QOyBtnwmrTPvZ1YoWNr4U7Ie
	jy1sviADTxFnDN3IA1Z0rA7lgrja1Cy/PQ==
X-Google-Smtp-Source: 
 ABdhPJxw5ZepvRT6mjAyPurDEAASZ8qp7+4QZrBOEyzKEksxYrpYRwX94y3O9zYBcaC8XVbO6ae7lg==
X-Received: by 2002:a17:902:8f94:b0:151:64c5:7759 with SMTP id
 z20-20020a1709028f9400b0015164c57759mr22125854plo.4.1650480892295;
        Wed, 20 Apr 2022 11:54:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 k4-20020a17090a3e8400b001cd37f6c0b7sm111071pjc.46.2022.04.20.11.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:54:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs-91: Add option to use system ICU
Date: Wed, 20 Apr 2022 11:54:49 -0700
Message-Id: <20220420185449.2618610-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96718

ARM needs to use system icu, otherwise build fails with gcc-12

firefox-91.8.0/intl/icu/source/common/stringtriebuilder.cpp:388: more undefined references to `std::type_info::operator==(std::type_info const&) const' follow
| collect2: error: ld returned 1 exit status

Keep using vendored ICU on mips since this breaks build for gjs
introspection code which is run under qemu-user

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
index d0accfaae4..af9256860c 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
@@ -22,7 +22,8 @@ S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
 inherit pkgconfig perlnative python3native rust
 
-DEPENDS += "zlib cargo-native python3"
+DEPENDS += "zlib cargo-native python3 icu"
+DEPENDS:remove:mipsarch = "icu"
 
 B = "${WORKDIR}/build"
 
@@ -39,8 +40,9 @@ export AS = "${CC}"
 export RUSTFLAGS
 
 JIT ?= ""
-
 JIT:mipsarch = "--disable-jit"
+ICU ?= "--with-system-icu"
+ICU:mipsarch = ""
 
 do_configure() {
     cd ${B}
@@ -52,8 +54,8 @@ do_configure() {
         --libdir=${libdir} \
         --disable-jemalloc \
         --disable-strip \
-        ${JIT}
-
+        ${JIT} \
+        ${ICU}
 }
 
 do_install() {
-- 
2.36.0


