Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAB0C83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 02:39:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.4226.1751596740877713887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 19:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iw62v6qb;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-237e6963f63so3920985ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 19:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751596740; x=1752201540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuDLONVuN0lMVn4Z8MYCKaXgPx1WN/Cy6hpkwSp2mvU=;
        b=iw62v6qb23e8g0nL+CxmQM3Vk1eER+z1KdKqg/UhxP040YF7yEE15jdtKTaP+eN3oE
         420SuLZ/Ilpk+73cSoq0zRlW1DcSNla0BIHnnWrxF6i1gn/5ESlD4hUE6zM1UYiGNGS/
         ejUd2Mob5xKSXGQZZ2Z0vlla3kEAemHXNwYcifYksSc+Wiy0kHPNIOqFEq7ZMFOyDIfl
         zY3BabxENAtRAdqmM6CG2o2P2hdu5gC20NGHMDKuxzTECTSpRMwBxT2Rfan6XYk8Fr//
         hSE7xSVaeLjTSm6DRUnlgJ7GY7SidawOzY6vjXZskLfPoC0P8GOcOvg72mbAam3H/1K9
         4Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596740; x=1752201540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuDLONVuN0lMVn4Z8MYCKaXgPx1WN/Cy6hpkwSp2mvU=;
        b=gi4zeILmv0uXUF8Y924stJ1sBBrAEDN7jQMip0MUnZrphsJoHPb0LmaQpHnR+QbO3p
         8JFuogceJZXun9Mx2i7WyKZgI8bzXYSOesJZ8p6262Z/198xQx+ifsw8PklRfinjfrdo
         sS2Qk741kKOlICgkGzsIo717uW/30IZqTbn4RLz+I0veiVbaePvCYeW0YsOF8IIpIq9/
         +qVHJvDDZ+kzv+jUoQK7VRyyALAGsn9/jAIlrKUswtHFgvLcfoH/NXORsb3dZEF39G4/
         aKjY13fww0NR7ALc3Rd1mvCQN3mNMqYEtMDpowm1OK9EL+CUBWN7cMiKHzWXkuE5PXKz
         ZdXA==
X-Gm-Message-State: AOJu0YzE+5zpDxtNwlOOpD2oXZ3Mqv9KUXW+oXGH48KBHZoX4efMBi96
	XscEw2OtMPTZdU+1KE9J+ZM8nrsG+rqHO4BLOLqUcUcgOtugdIGO2eUyzBUXyUtI
X-Gm-Gg: ASbGncvusMujZYgVPMuJY1OxMW2vdYREAjF1pzWBushQvEklAP6KdAxCgx5lAKtNVj8
	RHYvcBnjlExVC9n/PjUWp4Fu7U2EPKIvF7P3Eqc3bKSXu78dUKMRt5e9Drh6SGT7LMVADZEvpUV
	7EMfFp1X2Mdzxp9E1ZIqF5uhi9MbPfiIYuks/nb5++bSyc47Je2i6duPCIjdsWZTrm9KesCLPVH
	9F/Gb8U9lw6X2NSSn4kTQYdZl5ptX+Doj31XNbJwuqbB9woRNW2BxvDPc6elJizKnPWIje1WvUJ
	hlkW89EQnn+pkAi8/BNbnIOhRhE2CwoTOLIAzEHPHL3PSrZWr1xBJw==
X-Google-Smtp-Source: AGHT+IFIR/4wwXRfI2xRD7pkG2h/ddp7iceMz32PHcmYyeB8e+Q5Fp6WrV5sJQ0sKhYEYid/sDAOQw==
X-Received: by 2002:a17:903:1965:b0:234:f182:a759 with SMTP id d9443c01a7336-23c8754b1ccmr7276085ad.28.1751596739911;
        Thu, 03 Jul 2025 19:38:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62555asm799426a12.51.2025.07.03.19.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 19:38:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Michael Estner <michaelestner@web.de>
Subject: [meta-filesystems][PATCH 2/2] nilfs-utils: Respect usrmege when defining base_sbindir
Date: Thu,  3 Jul 2025 19:38:56 -0700
Message-ID: <20250704023856.3131843-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704023856.3131843-1-raj.khem@gmail.com>
References: <20250704023856.3131843-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 02:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118230

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Michael Estner <michaelestner@web.de>
---
 ...e.ac-Add-knob-to-define-base-sbindir.patch | 35 +++++++++++++++++++
 .../nilfs-utils/nilfs-utils_v2.2.11.bb        |  6 +++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils/0001-configure.ac-Add-knob-to-define-base-sbindir.patch

diff --git a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils/0001-configure.ac-Add-knob-to-define-base-sbindir.patch b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils/0001-configure.ac-Add-knob-to-define-base-sbindir.patch
new file mode 100644
index 0000000000..e53d2bdc8b
--- /dev/null
+++ b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils/0001-configure.ac-Add-knob-to-define-base-sbindir.patch
@@ -0,0 +1,35 @@
+From 1b8f420ec8852355580dd925c0316798d4fa7449 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Jul 2025 19:32:12 -0700
+Subject: [PATCH] configure.ac: Add knob to define base sbindir
+
+This helps when distros use converged directories with usrmerge
+set --with-base-sbindir=DIR accordingly so it respects the
+distro policy
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9a2f5ff..ce2c853 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -186,7 +186,14 @@ AC_SYS_LARGEFILE
+ AC_PREFIX_DEFAULT([/usr])
+ test "x$prefix" = "xNONE" && prefix="/usr"
+ test "x$exec_prefix" = "xNONE" && exec_prefix="${prefix}"
+-AC_SUBST([root_sbindir], [/sbin])
++
++AC_ARG_WITH([base-sbindir],
++    [AS_HELP_STRING([--with-base-sbindir=DIR],
++        [specify root system binary directory @<:@default=/sbin@:>@])],
++    [root_sbindir="$withval"],
++    [root_sbindir="/sbin"])
++
++AC_SUBST([root_sbindir])
+ AC_SUBST([sbindir], [${exec_prefix}/sbin])
+ AC_SUBST([sysconfdir], [/etc])
+ AC_SUBST([localstatedir], [/var])
diff --git a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
index 507684a395..a09f01282f 100644
--- a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
+++ b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
@@ -3,10 +3,14 @@ HOMEPAGE = "https://nilfs.sourceforge.io/"
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=385034ac639a62b8415db9814582ee98"
-SRC_URI = "git://github.com/nilfs-dev/nilfs-utils.git;protocol=https;branch=v2.2.y;tag=${PV}"
+SRC_URI = "git://github.com/nilfs-dev/nilfs-utils.git;protocol=https;branch=v2.2.y;tag=${PV} \
+           file://0001-configure.ac-Add-knob-to-define-base-sbindir.patch"
 
 SRCREV = "507064bb3604d0fd88f5e3f6422d9ade73a26120"
 
 DEPENDS = "util-linux util-linux-libuuid"
 
 inherit autotools
+
+# make install is trying to run ldconfig, not suitable for cross builds
+EXTRA_OECONF += "LDCONFIG=true --with-base-sbindir=${base_sbindir}"

