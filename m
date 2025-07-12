Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26070C83F1A
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 07:05:14 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.31905.1752303909159067435
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 00:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxmio+ot;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so2392134a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 00:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752303908; x=1752908708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IlTeUkQ0zN0AxIx+QvhwSctwegOFq/fiVY8rexrbQ8c=;
        b=hxmio+otFFTwurY/eW/4es6bf88pz1UBTt+74juwiZ9TOsadRci8H2DiExR75ypAFu
         whe3UTHzHSGOIoljfR/vtUNEq/naO0+NLv4+IJaZSkCAzO1tZeIok1sjzvfHsM7QjjjC
         6rSf5lCtGA1QahW+5bmfH7DBtbkYEvxgUGcWPI2pP0FysywRqAjHgDShJn/LCOC+yoUN
         SxK55grIxyfm9uzo5C9i4IGhtQiacGeZv0jHNyMDoEQD68u31sQGM/H1wneorAujZPT3
         sgP1pp6sQ25tbe91H3jUtQXwfID9Btx0DuiZLr8R2Gad2qSMJ0DU57r0frnJjtEqPuHr
         boRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752303908; x=1752908708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlTeUkQ0zN0AxIx+QvhwSctwegOFq/fiVY8rexrbQ8c=;
        b=gcXO05nv62JKatdq72IMKsReKReo63Ia6uRQoDo5cRdMmEGqc2B9hLXkcE4zrY+jJH
         UIb1jlSYacsIke+DqpwqsyvL3WjRHDGWmkR+zQeQCxvr9JWYwHyt5Yw1l7SJ1tLysXv2
         7DxszIAv3mw58xr+C5gRSrhxH5epIFNb+vfRx8kSQwwmJkFOINEQ35pSsIWw/zeMN6y8
         3Snmm8ETlXFkX20+28FZiQRg92WyP8vBpRLC0nqdx/K0YxkJNBLzP6E8letZVlS4y76W
         dQgO8nhEmv16U1biRiHDtLErq1hxM3LSfKeMUSsjSwkMGmwNOV/R623H2RLugxfClfDA
         hzNA==
X-Gm-Message-State: AOJu0Ywx2zLccZ+1+8CIpZ8Zv77atZw41/wyTMPiPGFCZxb/sKTUQwgB
	V6oNCHtUctmzQVSEqchTTxa569Y1JILZ+Jouv51mIzX6wLiD7f4d5Uf1fqElhquH
X-Gm-Gg: ASbGncu8YIy4ylWCCb6Nf/pR0Ey7dUJ+q6NiVaDlrX+7klqMTKWXsNoifOEKn5r0ygD
	DjOyTzuqqDx+DQ7GPsTIJ1XrpRew07a+swxlNlPanvCgVOx0YMuHjrJVBlIHKajNIoLgLrQg68X
	JFf8lusdlQ03xdZHfMHl5RGbSqxXgpPmot+q8Hg3/ZzMeycGh5XNWTGgFDEsIi7vsOAkNn5lHgl
	p1R57g8/Qv1JcT45iEz2QxkwUI/2K8VzwZQ02t6S04y4ceerccNGTC41PrX3KmMvvfufQ0kz7qF
	Mdx6RCalhUia9YuvpUyc5ojLgSpilnPhkVDCEro2g+MGAzTw8t3kSYEQfoTfBlvT3us2mAc39TP
	j32+1qQoffvuWMg==
X-Google-Smtp-Source: AGHT+IGQFQ8Zeq0QN97yOkB5ADB/tyE/sZgdNwZOjijZavi2T+H/wEiH6B2pFRXNonNypjzolrmaIg==
X-Received: by 2002:a17:903:1b2e:b0:236:15b7:62e4 with SMTP id d9443c01a7336-23df093c654mr89422945ad.38.1752303908160;
        Sat, 12 Jul 2025 00:05:08 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad295sm58231785ad.81.2025.07.12.00.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 00:05:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] hiawatha: Upgrade to 11.7
Date: Sat, 12 Jul 2025 00:05:05 -0700
Message-ID: <20250712070505.4140314-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 07:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118469

Enable TLS support
Fix build with cmake4+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{hiawatha_11.2.bb => hiawatha_11.7.bb}       | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_11.2.bb => hiawatha_11.7.bb} (88%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
similarity index 88%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
index 098c07e954..fac1498b3b 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[sha256sum] = "99c64f76927f93469f062ab76b74eb79a397ea4be12da86bf746b2bb57cf1bc5"
+SRC_URI[sha256sum] = "8bc180ae3b986d02466f081efeefdb1595d96783f581fded2a9b198752ab7ae1"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
@@ -19,12 +19,12 @@ SYSTEMD_SERVICE:${PN} = "hiawatha.service"
 
 inherit cmake update-rc.d systemd
 
+
 CFLAGS += "-std=gnu17"
 
 EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
                   -DENABLE_CACHE=OFF \
                   -DENABLE_DEBUG=OFF \
-                  -DENABLE_TLS=OFF \
                   -DENABLE_TOOLKIT=OFF \
                   -DENABLE_CHROOT=OFF \
                   -DENABLE_XSLT=ON \
@@ -34,7 +34,9 @@ EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
                   -DCMAKE_INSTALL_SBINDIR=${sbindir} \
                   -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
                   -DCMAKE_INSTALL_LIBDIR=${libdir} \
-                  -DCMAKE_INSTALL_FULL_LOCALSTATEDIR=${localstatedir}"
+                  -DCMAKE_INSTALL_FULL_LOCALSTATEDIR=${localstatedir} \
+                  -DENABLE_TLS=ON \
+                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5"
 
 do_install:append() {
     # Copy over init script and sed in the correct sbin path
@@ -78,5 +80,11 @@ CONFFILES:${PN} = " \
     ${sysconfdir}/hiawatha/php-fcgi.conf \
 "
 
+PACKAGES =+ "${PN}-letsencrypt"
+
+FILES:${PN}-letsencrypt += "${sbindir}/lefh ${libdir}/hiawatha/letsencrypt"
+
 FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
-FILES:${PN}-dev = "${libdir}/hiawatha/*${SOLIBSDEV}"
+FILES:${PN}-dev += "${libdir}/hiawatha/*${SOLIBSDEV}"
+
+RDEPENDS:${PN}-letsencrypt += "php-cli"

