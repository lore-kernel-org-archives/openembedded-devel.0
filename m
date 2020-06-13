Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.14454.1592073333540869101
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 11:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K6MwnYW3;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id e1so13101419wrt.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2020 11:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ldQgh2f9vIMpuK7cLdbcP9xC8Y4utDTat0nR+uoCTK8=;
        b=K6MwnYW3XB2nMxa+/ZExQ9NWYlNf2nDlkw79KSxjWLr3D4NY8TOynPuUJtr08mewrD
         Igq5ZSHwjBrcFrcy0KIdpPGksS2xsIozqQa3/dkQVi45P5VxBmHAKB+8Aawb179D3hyp
         r4rNGTjpJbBUNYG25OkqGDi60Iav51AmkmHsoPA4zPVtv84QCiBMbqfGaPhHGiT3FA5r
         vxLtg+3JSASEcH3x097Esqt7ybTLg+NxviW9EbJJYVuxDAmrHacKp/sgasQTu2AHKDaS
         zw4B9yVlCkLCkij+tKUwEjTyAVJEQ8bbHNQLs1DH7cLu980XskoM4/eP2Eq17DPnh6ms
         iJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ldQgh2f9vIMpuK7cLdbcP9xC8Y4utDTat0nR+uoCTK8=;
        b=Ryi/5gGyA6XvJrDTI0AiO0hR2tfUjpvl/EcXx8Ok+EqFrWO//K2me5XHhgIjcfrRjK
         zLUTAm96gUoTIljg5uQi7nD8MjMVNIbuufMGvHhOKo2IEYS27q9MXmRST+nAj9RqRUTd
         Pk+GoXITlRbXZPl+t9Ecl2EPuWdq1z53lOajwJqUuUpnwCH9UHSLwpUMlYtGlScd8Z+Y
         8O8oP+AcyTVSL17raUUuqxOUtFF3/njRrdR7wRyxcVRURC67w7usFTxxK1cW3K0kMr+E
         DNs76VpzguuUtngDHfnSDX6gNvE+5AcdleXRMfC5k9T4wBFFOA40VXXLBhkD+GWhyNez
         tFXQ==
X-Gm-Message-State: AOAM532aAAd9fFymjPIyRJR5iuiUPKjECFo9UufkdRdHi03vukBJ3d8O
	pi/Y3ckDzVxunTI3r4H1F64D6h4p
X-Google-Smtp-Source: ABdhPJyhKB4pw6XsjJAU8LrAlpbSE9AhrN/MBJF5a78bQZoEkYItAUe6oxxcbm/44Q0B3aY4gFRayA==
X-Received: by 2002:adf:9286:: with SMTP id 6mr21155993wrn.361.1592073331841;
        Sat, 13 Jun 2020 11:35:31 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id 138sm15100127wma.23.2020.06.13.11.35.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jun 2020 11:35:31 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [meta-oe] [PATCH] packagegroup-basic: drop recipe
Date: Sat, 13 Jun 2020 20:37:29 +0200
Message-Id: <20200613183729.22777-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

It's duplicated to packagegroup-base in OE, let's drop it.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 .../packagegroups/packagegroup-basic.bb       | 53 -------------------
 1 file changed, 53 deletions(-)
 delete mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
deleted file mode 100644
index 2da9118af..000000000
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-# This recipe is intended as a 'simpler' replacement for packagegroup-base.
-# Please communicate your use cases and suggestions to the mailinglist(s)
-
-SUMMARY = "Basic task to get a device online"
-
-PR = "r13"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-inherit packagegroup
-
-# Poke extra recomendations into the list using your machine.conf
-#
-MACHINE_EXTRA_RRECOMMENDS ?= ""
-
-#
-# Select between dropbear and openssh
-# Set TASK_BASIC_SSHDAEMON = "openssh-sshd openssh-sftp openssh-sftp-server" in your DISTRO config to get openssh(d)
-#
-TASK_BASIC_SSHDAEMON ?= "dropbear openssh-sftp openssh-sftp-server"
-
-#
-# The section below is designed to match with packagegroup-boot, but doesn't depend on it to allow for more freedom
-# when writing image recipes.
-# It also avoids the choice between connman/networkmanager/ifupdown since that is an image feature, not a
-# distro feature.
-#
-# Util-linux (u)mount is included because the busybox one can't handle /etc/mtab being symlinked to /proc/mounts
-#
-RDEPENDS_${PN} = "\
-    ${TASK_BASIC_SSHDAEMON} \
-    avahi-daemon avahi-utils \
-"
-
-#
-# The following section is split in 3:
-#   1) Machine features: kernel modules and userspace helpers for those
-#   2) Distro features: packages associated with those
-#   3) Nice to have: packages that are nice to have, but aren't strictly needed
-#
-RRECOMMENDS_${PN} = "\
-    ${MACHINE_EXTRA_RRECOMMENDS} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "usbhost", "usbutils", "", d)} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "alsa-utils-alsamixer", "", d)} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "kernel-module-g-ether kernel-module-g-serial kernel-module-g-mass-storage", "", d)} \
-    \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "bluez5", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)} \
-    \
-    tzdata \
-    \
-    cpufrequtils \
-    htop \
-"
-- 
2.27.0

