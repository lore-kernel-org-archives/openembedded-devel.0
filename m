Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.51732.1595841696652692853
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 02:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JDL13Fw9;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id g6so3805852ljn.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TsLyHf9icimfTRdF3XNR95W1SsltnAf5GMBLlHhhh6E=;
        b=JDL13Fw9v/WQ6uGRTA+IDmBNBN944L4CvSOEAo7yhKSgezk3Dgc4I56xBMJuyTlX6N
         Vqyn3BUM4mpjC0/RHfXEwzs9gYBe5EQaU4yWLCkew2lujfspwgUu1tHuQIcwbl+bJfL7
         w3CNavzw4deuCQFpkUyjJQbANHhVPkXgm5+qmzW+bZd3M5W4Vvp5DHF0IhNferkiEwD3
         60Fm1XxzalELJwZdAxZI+cdBYNZbX15m0K3ulJJ9/ycHiVq6TVepKy9rn+EzOfWwS+vt
         C9uvqxfPDQ0sv9q9g1t/agD78qZBvus0twI+f+d5hkfThFtE3LaQlTHmXcL39FEVFoY6
         UZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TsLyHf9icimfTRdF3XNR95W1SsltnAf5GMBLlHhhh6E=;
        b=PitZTHirTdewzKRCM2C53z0Z0hkkSkkbGLKtjx6ZbfOKMA8u0g1pcdR1l7wChvkULi
         cw/lJdd3THwL7v1bEIdxvHwF9Rz6ODcYjHpXlmW2XfiMA1D4liAmeBFYi4h8ZLiM8nTh
         0hEPgG7zyAnwKb6s4lYHkbUVa45JXjxnXYXMqPNay9VRirjYn8GvpsDIUVgP58mRRHqA
         Mv99F1WvEOARw+BCqiERQQKARF5/CcQJ2Sq0PaYbHbjEiyroiIpS/mXgfcFuuRSY79O6
         JN9BjEey/3Ob8drir8E3uZ/JYdSg2zAwn5Y054xYAuWpuO4Q+nKcSu03Y4AiXi/QNTtC
         8Zrg==
X-Gm-Message-State: AOAM5314zPb1Ej47AEedXjoRHxNg7IXcAgiN3ydNpuWtLk/erl4VSzgv
	3oMSJnvmEnVQXoH9PGuAlO6V29joZhU=
X-Google-Smtp-Source: ABdhPJzK4gttWwKg/EVsg0XP8nwdwrqoru3mzIKv8Ry6vLQMAVBynTodKhVVpokwV76aFLeqLr/nPw==
X-Received: by 2002:a05:651c:106e:: with SMTP id y14mr8930700ljm.381.1595841694272;
        Mon, 27 Jul 2020 02:21:34 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id t10sm2231593ljg.60.2020.07.27.02.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 02:21:33 -0700 (PDT)
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: madhavan.krishnan@linaro.org,
	raj.khem@gmail.com,
	peter.griffin@linaro.org,
	libcamera-devel@lists.libcamera.org,
	Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [meta-multimedia][PATCH] libcamera: fix packaging and installation
Date: Mon, 27 Jul 2020 12:21:08 +0300
Message-Id: <20200727092108.6209-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1

libcamera checks if RPATH or RUNPATH dynamic tag is present in
libcamera.so. If it does, it assumes that libcamera binaries are
run directly from the build directory without installing them, and
tries to use resorces like IPA modules from the build directory.
Mainline meson strips RPATH/RUNPATH out at install time (for
meson versions up to 0.54; the things are somewhat changed in 0.55).
But openembedded-core patches meson to disable RPATH/RUNPATH removal.
That's why we need to remove this tag manually in do_install_append().

IPA module is signed (with openssl dgst) after it is built. But
during packaging the OE build system 1) splits out debugging info,
and 2) strips the binaries. So the IPA module *.so file installed
isn't the one which the signature was calculated against. Then
the signature check fails, and libcamera tries to run the IPA
module isolated (in a sandbox), which doesn't work if the IPA
module wasn't designed to run isolated. The easiest way to fix that
is to disable splitting out debug information and stripping the binaries
during packaging with INHIBIT_PACKAGE_DEBUG_SPLIT and
INHIBIT_PACKAGE_STRIP.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 .../recipes-multimedia/libcamera/libcamera.bb            | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 00a5c480d..573366f08 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -18,13 +18,20 @@ PV = "202006+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python3-pyyaml-native udev gnutls boost"
+DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
 RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
 
 inherit meson pkgconfig python3native
 
+do_install_append() {
+        chrpath -d ${D}${libdir}/libcamera.so
+}
+
 FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES_${PN} += " ${libdir}/libcamera.so"
 
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+
-- 
2.17.1

