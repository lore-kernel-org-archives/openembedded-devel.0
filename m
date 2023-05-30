Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623FCC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 14:16:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.11361.1685456181799650831
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 May 2023 07:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AKalEq6T;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f6ffc2b314so16793685e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685456180; x=1688048180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=51U/Oi5A7sMIVa84iMCAyYaSqs3iBROumP9jjgvmmEE=;
        b=AKalEq6TXcOg3/SWP1rIZ+9nhJG+IJa9+Zpb/aSDkW41OsxcxWxTMeBYoJ3bpvbGBw
         zvOuiLjfBM3i3sWY/HLtZ2Ya9lSPDrHgj391lo4kFMVibnUmIvqLDZE9ILYrtAXcfHcZ
         rz4CGi6SA1+l1O4PF8FthacsUyqZxOOZG+Sgmyqtn7lYqd8tu4PdSgF28M3QRNCLtW1U
         yP8J5QlVRUi8GrrxgdkQ+GzloSUb/wVihBZWwPpFo0WW+oY6SehlEn9+6+ODQDVgWT1j
         Ugk7/yjfpdYtpA6toA87eJswsQ8+M9C4khYgHiNzkgcjib9o4DAL6XJ+fsXOiUdZpnQJ
         0HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685456180; x=1688048180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51U/Oi5A7sMIVa84iMCAyYaSqs3iBROumP9jjgvmmEE=;
        b=Ge64NDoBeJyuqdHaj3Fl5e4y9HC60B1KQ8rDv8407Qb9d5gw5p2fvqptmeqX2hRsDV
         gvV8PT3Hw1LZg8V3n04Kfxr8LLbmRyIJcbaUz8kh6AfglJpHH+MVmllW58w1adak/IGa
         Fs4iyyXgJwXuTBxrsSrsr5q+iJe9ft3/4dZdG5fqC3frvAEsqi7iXxkcI5O6SIxSa8r1
         yte8cvgSgtU4k08RHMDMzxUDMrah+y7zRTplW1UBKM7w0SbgDNf5X0GwKcQPuDwGLPYs
         CAmoK0JY2yjaB1PrlZ/Zb78V5UMdnX9d+5KBhBWBIsSKGHFNZcnE1ibk/rrr365wsaDx
         yoGg==
X-Gm-Message-State: AC+VfDxl5DGAZ7unZ7/+CmVrKlQ15D8pbtIdXt43MYuoh8DnMb3QZ1kN
	MogoyCu7GzCG1pEQQOs+iOyvQBOTkzI=
X-Google-Smtp-Source: ACHHUZ5qksR+k7sBds2My8OBr9uS2oqKzJT5UD4s07mpSgOLkLxGLgUsYRsIDTqfaXXIjUN+i5VSKw==
X-Received: by 2002:a05:600c:2208:b0:3f6:d90:3db with SMTP id z8-20020a05600c220800b003f60d9003dbmr1855343wml.3.1685456180016;
        Tue, 30 May 2023 07:16:20 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b003eddc6aa5fasm21152583wmd.39.2023.05.30.07.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:16:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] switchtec-user: fix installed-vs-shipped with multilib
Date: Tue, 30 May 2023 16:16:09 +0200
Message-Id: <20230530141609.14693-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 14:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102897

* fixes:
  ERROR: QA Issue: switchtec-user: Files/directories were installed but not shipped in any package:
    /usr/lib/libswitchtec.a
    /usr/lib/libswitchtec.so
    /usr/lib/libswitchtec.so.4.0
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  switchtec-user: 3 installed and not shipped files. [installed-vs-shipped]

  when libdir is e.g. /usr/lib64

  The Makefile.in defines default LIBDIR with DESTDIR:
  LIBDIR ?= $(DESTDIR)$(PREFIX)/lib
  so include ${D} here as well

* use 4 spaces for indentation and ' instead of " so that it doesn't
  need backslashes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../switchtec-user/switchtec-user_4.1.bb              | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb
index 6d5c9f1a67..443e5bc493 100644
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb
@@ -3,12 +3,13 @@ HOMEPAGE = "https://github.com/Microsemi/switchtec-user"
 SECTION = "console/utils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6b07c89629cff2990d2e8e1f4c2382"
+
 DEPENDS = "ncurses openssl"
-SRCREV = "762ba441d2c02685f98e5f56e984db033bab279a"
 
+SRCREV = "762ba441d2c02685f98e5f56e984db033bab279a"
 SRC_URI = " \
-        git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master \
-        file://0001-cli-Fix-format-security-warning.patch \
+    git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master \
+    file://0001-cli-Fix-format-security-warning.patch \
 "
 SRC_URI[sha256sum] = "f98c1fe23e1d7a11fb23e8bcf9b563929fc805ea669191a7fd525ad16519f655"
 
@@ -16,8 +17,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
-EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LDCONFIG=\"true\""
+EXTRA_OEMAKE = "DESTDIR='${D}' PREFIX='${prefix}' LDCONFIG='true' LIBDIR='${D}${libdir}'"
 
 do_install () {
-        oe_runmake install
+     oe_runmake install
 }
-- 
2.40.1


