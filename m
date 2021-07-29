Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.17210.1627601823674703735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VEOheADd;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id nh14so773621pjb.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+z6WhS0uCoqOyrpoc9Vy8bZbraHczH/elefiFprZtzA=;
        b=VEOheADd3/IzyHQmwCcL5rwCPYEb8ckjJIdoddKYy0Ww17dsq+PLD0Hiyra3ohBLGx
         YUkoG479eaR9ySfzRA/SgIi9Yu4z1VLQS2wkl8HvkiVljHucSeb1JUAc+RdcIwZT/7gg
         zVAe5y5lWTygTAvtkh7wKN+Kf68p5tfkzBbTN4fSEc/HnqsUkQU25hNRBk+WNpqBAaoi
         Cr8DYR7F31Dt0s41l1jP6IW9wF/4VrEDAUNEeZw2zFotLG+FZ7Gcxh/rILfwJSIyck4t
         Y9K1865+r7kvwQDpjZUhg4Oa5tt2mLJX4Xww/X8HOY1nWaLK5FuC/yphTEWpk/MeapkX
         fkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+z6WhS0uCoqOyrpoc9Vy8bZbraHczH/elefiFprZtzA=;
        b=eXRHea9UyBNVZGHvLP1ZRZnLH+IBEeeiHgy4Jo4NdYoprLdp8i8Ay5VjATdL0XTdwE
         E5//5sMiNQOdyemrQgQ+6Pc4p/fMbyE6FHehcHrNZUigjzsB3357ulTpmbA3n8mCxvTH
         mv5rmPP30oM1PjFCAy7V98g6QRqrIChyEM5xzqsqZeJbOOwdp/zzVimN8UVy1Xqpx9An
         P2oK8KwtUd8s++m0QiQgjsGpNlGj+qwMPEKPCJqDtQzeDosHBbX9hrlfn08ciOOevQD3
         caKAmJlDyyLnlU/Q8lWYfzYcRvSB2F+rAg9S6WQn1EpHhb20MWv2MRQHp3Z+3GyMRXKB
         2XoA==
X-Gm-Message-State: AOAM5335cQfFEE2hNC4DkWDO4hMdwUdrONwYdgHBvW2mGErKjcmgrEk5
	hv7GGH6MiHgrHOmf2hbXrk//sUPD65XbEw==
X-Google-Smtp-Source: ABdhPJwOnN9K2QnIazWQB6XH+AHkK6jr06LiRIzExO+/2Twt7Rkhv972wP8R7W6nfZlJkTBOU6TK1g==
X-Received: by 2002:a17:90a:19db:: with SMTP id 27mr17953320pjj.216.1627601823183;
        Thu, 29 Jul 2021 16:37:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.37.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 11/15] vboxguestdrivers: upgrade 6.1.18 -> 6.1.20
Date: Thu, 29 Jul 2021 16:36:44 -0700
Message-Id: <703daeb65f49c60636e835ad53fc354ca641ab3f.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco <costamagna.gianfranco@gmail.com>

Drop all patches, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 37537bda8c4775ce1c390d1a9a5b2f5fab89bfc7)
[Stable branch]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../vboxguestdrivers/kernel-5.10.patch        | 23 -------------------
 ...s_6.1.18.bb => vboxguestdrivers_6.1.20.bb} |  5 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.18.bb => vboxguestdrivers_6.1.20.bb} (94%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
deleted file mode 100644
index a6b0a04545..0000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Origin: https://www.mail-archive.com/pld-cvs-commit@lists.pld-linux.org/msg461494.html
-From 80bfab5ec8575703ef26b442a3af2d030793ebde Mon Sep 17 00:00:00 2001
-From: =?utf8?q?Jan=20R=C4=99korajski?= <baggins@pld-linux.org>
-Date: Thu, 24 Dec 2020 23:03:55 +0100
-Subject: [PATCH] - DECLCALLBACK generates incorrect code on ix86, remove it
-
----
- kernel-5.10.patch | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/kernel-5.10.patch b/kernel-5.10.patch
-index b28d6e0..729235d 100644
---- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
-+++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
-@@ -536,7 +536,7 @@ typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;
-  * @param   uAddr               The address to apply the new protection to.
-  * @param   pvUser              The opaque user data.
-  */
--static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uAddr, void *pvUser)
-+static int rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uAddr, void *pvUser)
- {
-     PCLNXAPPLYPGRANGE pArgs = (PCLNXAPPLYPGRANGE)pvUser;
-     PRTR0MEMOBJLNX pMemLnx = pArgs->pMemLnx;
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb
similarity index 94%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb
index 1def1a3115..9df2e3960e 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb
@@ -13,11 +13,10 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://kernel-5.10.patch \
     file://add__divmoddi4.patch \
 "
-SRC_URI[md5sum] = "c61001386eb3822ab8f06d688a82e84b"
-SRC_URI[sha256sum] = "108d42b9b391b7a332a33df1662cf7b0e9d9a80f3079d16288d8b9487f427d40"
+SRC_URI[md5sum] = "f2fe05e72c37d40afb36b9fb3aa38b78"
+SRC_URI[sha256sum] = "e690c91974a2e7a5aca2c0939ad514382f9a2136797a5e0b96aab778e42bc8a7"
 
 S ?= "${WORKDIR}/vbox_module"
 S_task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1

