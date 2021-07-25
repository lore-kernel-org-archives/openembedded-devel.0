Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.14555.1627188760548862202
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lvxZsEPj;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so9461345pji.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Dm6u18F8Um1anYPKfXOIesZymphDP6YanPgD6IpzVfg=;
        b=lvxZsEPj6jzllNzqNF3rsl0jkGKe/cEnArZoJfQZl7jR5nbnSSHrxGK1+dgtGE/OA3
         ZflMDn56aC1jHmntp7YDFyotdE8xBsV2sUtI81NKRLm9HZ7aX4hyaWi/0CxGFn1XSmyg
         pmyCscIosNK3XC9aQ0uzTVtxpXJ//WPD73gstYcD7LyCiZRulaTilal47MpSegtjLf7P
         L9mlNG3T/lFGrprmATwRtexeal32STATItpb9Pl3VfXfC+yZbU05Cj631UMuFvkgHESf
         swD9vLh6HAgiD9w0im1unv/+DarP5GzC5XtIlNUFmvK1xrYLEt2YAqE1PFe1rbz/VVq2
         yxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dm6u18F8Um1anYPKfXOIesZymphDP6YanPgD6IpzVfg=;
        b=cEl5gJf0WySrAupQLi8R45BJSLHT71Yn+5UMIb+xydIF75pDFFDBXsQ26m1hFhcI4W
         7sL4/hR1082STYaZr9I6mKxw3rLLUdhiQ+3ZCfjfvuTVwyFM+xgBGDZlY3oK/we65CPa
         25pU8TNqmVcT2tl+CbnJk7NtDLbVzx+e5CxzOPCE9l0N4yQJOTy6zwPIhpo2Ng6Uykuj
         N3M2fkctxRAlmfo+xh1yPvfFOEDEhO1NlNX4sUpwwzDtWoxn1QaP0cchVEtPCMId2aB3
         QE1CW6/+xUyeAFD2NaDKVpz9x1fbDnkoMLrUIl/iquuU3ZumNvsffY9nSs7E43D6bV+k
         vezA==
X-Gm-Message-State: AOAM530696WuSDDbKQUa6fWTFKORmmffNgTfXMzb8sLLGopt8cctDkyC
	BtdtY6n5STuB0xefS7NN423Fx704LamORw==
X-Google-Smtp-Source: ABdhPJygM6KR9FQ8TJrht+COy5QRf4pg+dOHzmBrpmBH78IOwEVbJVpPRsRVdj7qhUdrR4OB95Ih1w==
X-Received: by 2002:a63:6307:: with SMTP id x7mr12211521pgb.106.1627188759980;
        Sat, 24 Jul 2021 21:52:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:39 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/15] vboxguestdrivers: upgrade 6.1.18 -> 6.1.20
Date: Sat, 24 Jul 2021 21:52:16 -0700
Message-Id: <17828d03d6cd65d5958d3be0a086b9c42e793c04.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
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
(cherry picked from commit 703daeb65f49c60636e835ad53fc354ca641ab3f)
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

