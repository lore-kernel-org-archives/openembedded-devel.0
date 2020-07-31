Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.19887.1596206379979582368
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 07:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CgkMkrLz;
 spf=pass (domain: linaro.org, ip: 209.85.208.195, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f195.google.com with SMTP id t23so9158699ljc.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tuKsKgQeAsC+TMas+rdCYzvgJmYJK+nAIwmmPeHmja8=;
        b=CgkMkrLzYNPy/aA+tcxJow8FwdM8py6yoxMbpzl+vQDKfAVo4P5j9Sk6d2UtoqfHb2
         PvC957ELX3DpQ5dyL+C2AsWPZ0RtzVaS24VB/+mT+VSnRhpltrJETi5ZNOetKvJXwuko
         vdxEN9C0ovoZ8e5Ae1QLPuYlc5CuKjgSDpEhHNYLRXw2sboQG3AKvGIEisH4XK7JcMPB
         QzakQlANCjkMDXMn3W/ZTbvbZYb/y/TNgt/0Us28C+eyljpFv+oWCjNBjrTqnDe+IqlY
         ddSdcAh8Hvn/EjVAuazV2IsHrNXs/IBkNS60V3c3gbvg5/b1ZbchdNM7jMzQZ1CUX8am
         VylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tuKsKgQeAsC+TMas+rdCYzvgJmYJK+nAIwmmPeHmja8=;
        b=Bkr/7u2XTAXWIhy6CCYderVSb7jOSpFp0EkBUmJv1ySE9s9deIg9x4IzGhdVygtVOr
         tPC/5GZS8auffYzOUYH9TKab0D9XuvIsOavEgYSXO/Yo/6rlQNi8x81RFrheBJvG8W/g
         fJubr0t3tTNN/mW695nuF5tRihDlz4zXTnbT9dV7IGuJkm8VJvO8osVmgW/8tsP9q+lb
         SysQwVfsnFWJ6M9LKRXttgrGb+lggCtFqBdlsGK870a+A/GtSUIxOszaHFxIoCYXCWl1
         PlFawXuQUAWW0nPtetWFIZJcOqFr5KK7pjf1Gy3wvghnHEESIIm2MmxkF9Kx9HTbvbf3
         R/2g==
X-Gm-Message-State: AOAM532LplIb16P62p3cFjZdCN7LIKruQ0JSu06SOmpVyjOMvgZp8G3G
	hKfM6wcfZ6+cr32GiZXCvnp3gAx2EZs=
X-Google-Smtp-Source: ABdhPJwaE6JeJ7EsuOAPysR9+89djLexgEqr6az3uadGq07zGk5Q37mlJmXLN2ygozdHFiTrPpm9QQ==
X-Received: by 2002:a2e:8e70:: with SMTP id t16mr2228260ljk.81.1596206377645;
        Fri, 31 Jul 2020 07:39:37 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id i20sm561303ljb.90.2020.07.31.07.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:39:36 -0700 (PDT)
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: madhavan.krishnan@linaro.org,
	raj.khem@gmail.com,
	peter.griffin@linaro.org,
	libcamera-devel@lists.libcamera.org,
	Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [meta-multimedia][PATCH v2] libcamera: fix packaging and installation
Date: Fri, 31 Jul 2020 17:39:19 +0300
Message-Id: <20200731143919.25825-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1

libcamera checks if RPATH or RUNPATH dynamic tag is present in
libcamera.so. If it does, it assumes that libcamera binaries are
run directly from the build directory without installing them, and
tries to use resorces like IPA modules from the build directory.
Mainline meson strips RPATH/RUNPATH out from libcamera.so file
at install time. But openembedded-core patches meson to disable
RPATH/RUNPATH removal. That's why  we need to remove this tag manually
in do_install_append().

IPA module is signed (with openssl dgst) after it is built. But
during packaging the OE build system 1) splits out debugging info,
and 2) strips the binaries. So the IPA module so file installed
isn't the one which the signature was calculated against. Then
the signature check fails, and libcamera tries to run the IPA
module isolated (in a sandbox), which doesn't work if the IPA
module wasn't designed to run isolated. The solution is to
recalculate the IPA modules signatures in ${PKGD} after do_package().

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 Changes in v2:
  - Recalculate the IPA modules signatures after do_package()
    instead of disabling stripping and splitting libcamera package

 .../recipes-multimedia/libcamera/libcamera.bb     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 00a5c480d..30c6600e5 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -18,13 +18,26 @@ PV = "202006+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python3-pyyaml-native udev gnutls boost"
+DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
 RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
 
 inherit meson pkgconfig python3native
 
+do_install_append() {
+    chrpath -d ${D}${libdir}/libcamera.so
+}
+
+addtask do_recalculate_ipa_signatures_package after do_package before do_packagedata
+do_recalculate_ipa_signatures_package() {
+    for module in $(find "${PKGD}/usr/lib/libcamera" -name "*.so.sign"); do
+        if [ -f "${module%.sign}" ] ; then
+            "${S}/src/ipa/ipa-sign.sh" "${B}/src/ipa-priv-key.pem" "${module%.sign}" "${module}"
+        fi
+    done
+}
+
 FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES_${PN} += " ${libdir}/libcamera.so"
 
-- 
2.17.1

