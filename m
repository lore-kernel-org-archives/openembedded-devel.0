Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBC5C47074
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 15:31:32 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.17130.1704641488527268224
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 07:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfIy7BTb;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33761e291c1so476490f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 07:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704641486; x=1705246286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RhRAIpHrdk41mTifsmpvPmhz5QgZy5hwKEGpPdN99s=;
        b=TfIy7BTb2dseqrGv0hi+Se8kLSBV76Yx93c+lxV1fZS21e8Z7O1Lk3NRMPprkyRnPx
         vK0sZHlstYaUlUcGbs4SQ/b/+3RY/qc4CUqJt7r0t/XONdDwAwsiey/VDZINqsr3PEEk
         qZ3YPCEQCuvtCjg8/62XZ5Aa5b7rMniGxtm+6nx63uxRNnH9Z2fyD6cz8ebNwwtZIsxM
         SfjlaNfRccOBraBA4C/tkfy2vzyaHpML7J2oL3F9y9lp04KMQv8svc2lnqv5tfVd7pyi
         KNPkNZXxMkVrf1jPbIYQxtN0ufsjhGfaqWohXH+mKHyO756uy7SE1i7qEDzSsvFerPGi
         N1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704641486; x=1705246286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RhRAIpHrdk41mTifsmpvPmhz5QgZy5hwKEGpPdN99s=;
        b=vNHmAFG+Jyshw89W7vN4VF/WpDeTf+9gcXVGzZqY3T2DNz7aDzqAz5U0XVYSo4P0od
         mYY63CuHd5azfknin/tTS5Sxd0YJxATgzKyUPxxn0JZliJ87o/09g1FgKI/F8LwmnW/X
         N8hqReFEUALe9JX1UH/hPf4DIUdWXenMgse0lxMjhHwlLyVNpGWgRsy8sC5xYyu//wjO
         adepgyE4beGGkJagBnm4RLdi0qWs5q+p4ydFIrXq0DOvagCRUOq1ZER4oFn4SElQyfr0
         nTfhQWGfpyKetSiFe3eZuioipaP3/5hz8j9FWoEkTR27p/sAYTp6AwA2vhhKjuszXFHL
         vUtw==
X-Gm-Message-State: AOJu0YwrUQT1Al9M39qxoxuxnXuuQX0OWOZ4EIimKsK65WSuNkrkwkBf
	ohSElDTFfxU+OGphRIDF57+x2JO+R9hzDg==
X-Google-Smtp-Source: AGHT+IHcSGN8y0TmtOFhPoPvAecCMtcT1+ahKjW9nF2JpRKeE+zpFT0AUx8M476b9iM66fkMrGtfYw==
X-Received: by 2002:adf:f604:0:b0:336:58e8:d444 with SMTP id t4-20020adff604000000b0033658e8d444mr2434135wrp.30.1704641486140;
        Sun, 07 Jan 2024 07:31:26 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.25])
        by smtp.gmail.com with ESMTPSA id h13-20020a5d6e0d000000b0033677a4e0d6sm5550843wrz.13.2024.01.07.07.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 07:31:25 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] pcsc-lite: upgrade 2.0.0 -> 2.0.1
Date: Sun,  7 Jan 2024 18:31:20 +0300
Message-Id: <20240107153120.879670-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 15:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108074

Changelog:

- SCardConnect(): return SCARD_W_SECURITY_VIOLATION when needed (polkit)
- SCardCancel(): return SCARD_S_SUCCESS even if the client already finished
- polkit is enabled by default
- libpcscspy: fix a crash with NULL pointers
- Doxygen: fix SCardBeginTransaction() documentation
- fix pcscd internal thread safety issues (clang -fsanitize=thread)
- Some other minor improvements

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../pcsc-lite/{pcsc-lite_2.0.0.bb => pcsc-lite_2.0.1.bb}  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_2.0.0.bb => pcsc-lite_2.0.1.bb} (88%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.0.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.1.bb
similarity index 88%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.0.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.1.bb
index e7f4551af..0862f955b 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
 DEPENDS = "autoconf-archive-native flex-native"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "d6c3e2b64510e5ed6fcd3323febf2cc2a8e5fda5a6588c7671f2d77f9f189356"
+SRC_URI[sha256sum] = "5edcaf5d4544403bdab6ee2b5d6c02c6f97ea64eebf0825b8d0fa61ba417dada"
 
 inherit autotools systemd pkgconfig perlnative
 
@@ -23,11 +23,12 @@ EXTRA_OECONF = " \
 
 S = "${WORKDIR}/pcsc-lite-${PV}"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} udev"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)} udev"
 PACKAGECONFIG:class-native ??= ""
 
 PACKAGECONFIG[systemd]  = ",--disable-libsystemd,systemd,"
 PACKAGECONFIG[udev] = "--enable-libudev,--disable-libudev,udev"
+PACKAGECONFIG[polkit] = ",--disable-polkit,polkit"
 
 PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-dev"
 
@@ -35,7 +36,8 @@ RRECOMMENDS:${PN} = "ccid"
 RRECOMMENDS:${PN}:class-native = ""
 RPROVIDES:${PN}:class-native += "pcsc-lite-lib-native"
 
-FILES:${PN} = "${sbindir}/pcscd"
+FILES:${PN} = "${sbindir}/pcscd \
+               ${datadir}/polkit-1"
 FILES:${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
 FILES:${PN}-dev = "${includedir} \
                    ${libdir}/pkgconfig \
-- 
2.25.1


