Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.2784.1618951585751643789
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 13:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4CsaK3i;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id s15so46735027edd.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 13:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uz02jf0hMDsj7eBHi6CT02dKh8Ox488ovUTx4xSGd2s=;
        b=L4CsaK3iEN0/7bdNMbFk0BUQhz4/MaI1dMmtzJD/14uyoHFsr6Wat/CStW2djFlLbR
         1mSbBwjZpQxyztf/NCTaBTE9gf8YtsAtf7HI01FNTlbo1MVmU27ivVrjpa1Qi4rROCHx
         GI2vebfvs71ZXkkNFxsf9msynixcVB1v+OK2KKJPSsU6dMRFfCd0nHuKtbw2nmk5BuzP
         mu6umxxo1pTngCb2xGl8SQcIAW+gXAZhx5RC3R46RtOlyiivwY9pK+aY+OyXGB9rPuhT
         vvi7mqLyPsEasW+6mKTtU6qVskbesnysp+eF/gDy9MGbt491clD48USiZVOkiBGfRv/7
         pd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uz02jf0hMDsj7eBHi6CT02dKh8Ox488ovUTx4xSGd2s=;
        b=IFfP34BqOkEUKI3zEKIfCgVt6WVq3e9MBV+jUcpJWN+TpVP7I9YXk3Y5jfgsBXPgv0
         K3xRuz8e5zkwDTZ0swdoZT1soy9tG1dIdNkUJoXnXZRo64SdqF8EhJjnVrJaVH+PT2TV
         QpCqqLCjEIiwQEltNsysitJ8edi4PK9NNSZkPkdSshninx4GuXAyn9HEX+51UgpJJISo
         b7nK9FV+gH6YxvPa2l0+9zhJGwAL8Mx1m7XL+NdKLaezKnSROMsKJUFVR3KaPJllIWUO
         IGXIqFquRT4uqWASTz30qsVMLEh83blBxiedB4Wja7OUBsDmemOrRu09MneZ1ANc59HH
         UERA==
X-Gm-Message-State: AOAM532RW+p+fWmyxMgmbKAw0D1Z3D/v+d76+HJhQZtsHE+agmLaAxX2
	ADJvNiGdu0KkpBMKclHZaNnG8/0T5mfqRHD0
X-Google-Smtp-Source: ABdhPJzhCAUYiIx3LJkoCuuRiuVXf4dK2iIhnGQ6glZVEHiZI+ZpxEO/qrcD2Jn1tDYCFa7p1aZ/mQ==
X-Received: by 2002:a50:ec97:: with SMTP id e23mr13618482edr.98.1618951583959;
        Tue, 20 Apr 2021 13:46:23 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan (mob-109-113-181-220.net.vodafone.it. [109.113.181.220])
        by smtp.gmail.com with ESMTPSA id dc24sm9147ejb.123.2021.04.20.13.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 13:46:23 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.18 -> 6.1.20
Date: Tue, 20 Apr 2021 22:46:21 +0200
Message-Id: <20210420204621.69168-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop all patches, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../vboxguestdrivers/kernel-5.10.patch        | 23 -------------------
 ...s_6.1.18.bb => vboxguestdrivers_6.1.20.bb} |  5 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.18.bb => vboxguestdrivers_6.1.20.bb} (94%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
deleted file mode 100644
index a6b0a0454..000000000
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
index 1def1a311..9df2e3960 100644
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

