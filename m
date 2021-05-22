Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.1839.1621647333777222530
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r1w6LyxR;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id o5so16296296edc.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+BS3TvbgYMI71S5Tjs0lRatErPuTq9oh3qeXpY0q6qI=;
        b=r1w6LyxRNz6omLvY2V6Vj4HIW40aCnifUmtV0cBxBp5MXrbWHCouui2EibdG4rPO8q
         BL069L4SvskMmQ+/LUIZ+PBzG2RKP0AjAXahDBJ/gElzePlTQQSzskPzeLav0mnHOUMJ
         28jnWqG7n20+4eqPB5GKFZ2nhL00e+s5ff2Z7iU7clZaz8L9uxdj6hJ65odVwl6P1TR3
         htyxXscAEDDt+yeiVN21450xa43PIWv6M0FjUMgKOQE2ThkAasQl4VC4HqoefreoRF8a
         N3HaRs0juOZ/ayr57yA++eQl5b4RXpTJ91Yaslv1Yw3jY0rTe7qwC/EBNsfwwqgXWSbT
         FqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+BS3TvbgYMI71S5Tjs0lRatErPuTq9oh3qeXpY0q6qI=;
        b=GX0xvnFTaatObJN4gWKQ/QewZ/iOdf7Tpn3mpYSx2KHBqhW5jzHpZ6gkaVIz+x+pKB
         96xbFjpEH6yKNR8lg9RoLrQdIGz2oLSbyyCq8wNBXBW68JPpxGyEilTouG4wOR1z+zRP
         zPX/ivY2QA1bG1y/hl2tSVJyGa0833I3EfGWO0j1MYILPcWRA1cmOqav+lSLOgMIMJof
         nTLpKdtEuU4RxIiLcy8YO2jJzD5/0dl81jymXK+JBDS/iphriA9jTssuhbQsK2PuBrML
         WRZ7apSkN4870M/Qv1lhTAIcHNTCju3xm6rAdUPxhyfkSGPYApI5YMoiveBur1aOrS1x
         ILaQ==
X-Gm-Message-State: AOAM530S7DSh7elaQmPaWrY/t9ibDLvAX92UBIZ88PyHX26A2AWfOXcE
	2PZqPGs9P90Cb8vtDnJ4BeeW5GqQE50=
X-Google-Smtp-Source: ABdhPJyqFhHQRV0EGuRxqt5jerwRJlnjR/1l4r5VubDsXxFIUk5yolgJM+jC4CDnXxO+/oEizKppXA==
X-Received: by 2002:a50:ff08:: with SMTP id a8mr13482565edu.46.1621647332265;
        Fri, 21 May 2021 18:35:32 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:31 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/17] zsh: upgrade 5.4.2 -> 5.8
Date: Sat, 22 May 2021 03:35:07 +0200
Message-Id: <20210522013521.588774-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* without autotools-brokensep install fails for several isssues. Started to fix
  them but stooped after third
* remove some odd/orphaned code in recipe

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../zsh/{zsh_5.4.2.bb => zsh_5.8.bb}           | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-shells/zsh/{zsh_5.4.2.bb => zsh_5.8.bb} (75%)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
similarity index 75%
rename from meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
rename to meta-oe/recipes-shells/zsh/zsh_5.8.bb
index aa372b70a..6fc5f4d99 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=1a4c4cda3e8096d2fd483ff2f4514fec"
 
 DEPENDS = "ncurses bison-native libcap libpcre gdbm groff-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "dfe156fd69b0d8d1745ecf6d6e02e047"
-SRC_URI[sha256sum] = "957bcdb2c57f64c02f673693ea5a7518ef24b6557aeb3a4ce222cefa6d74acc9"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/5.8/${BP}.tar.xz"
+SRC_URI[sha256sum] = "dcc4b54cc5565670a65581760261c163d720991f0d06486da61f8d839b52de27"
 
-inherit autotools gettext update-alternatives
+inherit autotools-brokensep gettext update-alternatives manpages
 
 EXTRA_OECONF = " \
     --bindir=${base_bindir} \
@@ -47,19 +46,8 @@ do_configure () {
     oe_runconf
 }
 
-do_install_append () {
-    rm -fr ${D}/usr/share
-    rmdir --ignore-fail-on-non-empty ${D}/usr
-}
-
 pkg_postinst_${PN} () {
     touch $D${sysconfdir}/shells
     grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysconfdir}/shells
     grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
 }
-
-FILES_${PN}-dbg += "\
-    ${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
-    ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
-    ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
-"
-- 
2.31.1

