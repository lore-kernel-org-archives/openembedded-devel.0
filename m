Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A7FC54791
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 19:19:57 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.19113.1710011987791485731
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Mar 2024 11:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQd8gRwI;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e5a232fe80so2202077b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 11:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710011987; x=1710616787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vq+xbkxo9JkBd/fnOwFsBSX2U4LHB/UIecq/Sg7Jf94=;
        b=cQd8gRwI5aeSClOc0IGp7g+HmmCstLcjgooVwrfb1H0IzqBIsKUV++/WpVJRJg7GSM
         qB9cFg6MFSwxNLRcb624DY5d8g9nn0dCMXBP17VvVN4y5uC/XmO57uNQ5bGMtIrPj/zM
         Z3Fi5dlVS4pQ5VI5jICtEWeJtbtAl4YyRY8kuMZ2RfiJymFabp13RRpYS7uJw15/yXM7
         RpNTH8WQL6XpL8Bdi3qfo5rf3fIEzRKvJrAov64aNm+zB7IJ5xNf6Rsopv7dCOQ3dz6R
         p2pbSBUgLAtZ3Krps+MIrCJp4xzkKnecM6QFLwZo8L/Q+8yF1XJGvDYgyGkKPR/8Tm0h
         fJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710011987; x=1710616787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq+xbkxo9JkBd/fnOwFsBSX2U4LHB/UIecq/Sg7Jf94=;
        b=kQDFb8eWKpelxVsIVmD/oiaLlbcxFgmBoWyHlQaUceit3Yhh/wOOQVY9fDs18eH7LY
         nqbEb9EJGbs+Terj+FD0KUgpa9jkXeTm9QLdaCeHFkwF6KEwvbJM/e9/5HN46DKpsFJF
         jjcsv0ahCmXP4P/i6/8r+iNR2IxVzsRRI2xMsAHFIJ7ipJqQVgX8y72brRhUyYE2iuve
         o5wsz9fL8M2dN3sYXIWm1vVOb/gmLrZrZWesFyvVokxeNyyXkNC76yRnmwXRYOgeMVjL
         /CuuTheipnNjc5BFkiups9s8kXo/c6UWfswy+hzgDw5B6kUc5Qu/iSLDzFHPHminVHES
         PAlQ==
X-Gm-Message-State: AOJu0Ywx1CsjFnq/qPoz207jnwrFEiJHylLhH+wYjYVu9AqMUsNNT2b7
	pPmFdXDQo43TZ+0W1zQr6z/Su1gGu9q4Hkq/Vu2wfWtLYveI9M5CAUtucH0c
X-Google-Smtp-Source: AGHT+IFTQn9fZM5Zp8Nbz8BnojvK1UaG3l1ntlZQODejIxubeQfHl/zQmKBMKlzoalE5SKbGlr+TIQ==
X-Received: by 2002:a05:6a00:4b02:b0:6e6:1df9:af92 with SMTP id kq2-20020a056a004b0200b006e61df9af92mr3215923pfb.14.1710011986781;
        Sat, 09 Mar 2024 11:19:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::bc23])
        by smtp.gmail.com with ESMTPSA id n1-20020aa78a41000000b006e672b48b49sm1549802pfa.157.2024.03.09.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 11:19:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] php: Upgrade to 8.2.16
Date: Sat,  9 Mar 2024 11:19:44 -0800
Message-ID: <20240309191944.1868764-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Mar 2024 19:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109248

License-Update: Copyright Year updated to 2024 [1]

[1] https://github.com/php/php-src/commit/2575e6b88c3d3bbd53383fb65057c9b7b029e264

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.9.bb => php_8.2.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.9.bb => php_8.2.16.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.9.bb b/meta-oe/recipes-devtools/php/php_8.2.16.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_8.2.9.bb
rename to meta-oe/recipes-devtools/php/php_8.2.16.bb
index e645a284d5..1cb378fb94 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.9.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ebd5be8e2a89f634486445bd164bef0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fd469cce1a919f0cc95bab7afb28d19d"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native"
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "48460b994ae7eb5096a310f44d13e865de1771104d4a550d53072be58a6f176c"
+SRC_URI[sha256sum] = "2658c1b8935ab6b53a7f209354602761ab07066e66920bc472b8815fd1b43f71"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.44.0


