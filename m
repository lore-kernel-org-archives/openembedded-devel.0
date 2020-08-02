Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.15262.1596395261167731689
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2020 12:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wVRMe7+Q;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id 185so27174567ljj.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2020 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gffvLB+WlAnYBdMss2eSA+WIA4DrPKNvIyVac0+f32Y=;
        b=wVRMe7+QYyf+VYuYRbo5a7YRL633rfhrWcBkKbMh6HRq1mBZmQ8S48POOfXjB3y2dQ
         WouYwYSAYuIOdZpLC2ZTqmn3q+rVRQ22apYzKhtf2CEiXqDWcUEiobqfsPVSNrgebHvJ
         EAQjSiyGQZnYZM/yp2EnWashLJf7kjcauppBV7wY8eHy8Y+xQdPcsic5JdX9P+yVH/yt
         HGpUxTe3MDuwYwAzO86wNfEAwjv0+IpCdOz0bX1Fhh7N9qhk/zbyRN02pWCizWSS4vGK
         VoSZcTfrlCVp33WVxm6P6MNNHZJZOOtY4XK2ytSF4D8+PGpK3l9XMwMRi5TsfGV9aOQd
         K+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gffvLB+WlAnYBdMss2eSA+WIA4DrPKNvIyVac0+f32Y=;
        b=iadqhpf40UWvUN6zPS1eUn9dPD2w/tJAjy1O/PtrLNNGvuICAvsrjZ1E9PKVJbU4pC
         iV4vjXFm/PaRhBHQaINcI0JcHGbsRdZ+EbphFGW2ZCM8kMk4G3Hq+ogWiAMkZcU1exao
         8/HragIfTLuK3GD+2N1EJIbNRTRV6aDi34FeAvZvM5smE3nP/2z1hdkWif4AkFVtRwYm
         GJMwFvHU8J47a2FyRXfp8nvmGsDVisI2q92/stpy/IuFjfpm8Jca5sso3YRDTg50wjVi
         Cy8k2ZeV+b26JeQNaQkZBNZL+ZvL/un7SsgyX107MdSTQ/Bm+5psgOLtDJfkgaVwBPku
         YaEA==
X-Gm-Message-State: AOAM530c5EYHXU0ArhMZyUpPjmOFzowF4F6VnwQVBhG5MUTjBks2Y9OF
	hNRo5BQ2SOWKfvMKjeWtq4QE5hVBZOo=
X-Google-Smtp-Source: ABdhPJyk49ySFUfJeoNHN2+qiTSBMrVcej/XAoFNOlmQBp2+2SaxZO4ar8C0kDr4clQ1vErVkRQObA==
X-Received: by 2002:a05:651c:1069:: with SMTP id y9mr6100342ljm.438.1596395259001;
        Sun, 02 Aug 2020 12:07:39 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id e29sm1289126ljp.136.2020.08.02.12.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2020 12:07:38 -0700 (PDT)
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: madhavan.krishnan@linaro.org,
	raj.khem@gmail.com,
	peter.griffin@linaro.org,
	libcamera-devel@lists.libcamera.org,
	Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [meta-multimedia][PATCH v3] libcamera: fix packaging and installation
Date: Sun,  2 Aug 2020 22:07:19 +0300
Message-Id: <20200802190719.9358-1-andrey.konovalov@linaro.org>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Changes in v3:
  - As suggested by Laurent Pinchart, use ipa-sign-install.sh script
    to recalculate the signatures instead of ipa-sign.sh.

 Changes in v2:
  - Recalculate the IPA modules signatures after do_package()
    instead of disabling stripping and splitting libcamera package

 .../recipes-multimedia/libcamera/libcamera.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 00a5c480d..b34d673bd 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -18,13 +18,30 @@ PV = "202006+git${SRCPV}"
 
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
+    local modules
+    for module in $(find "${PKGD}/usr/lib/libcamera" -name "*.so.sign"); do
+        module="${module%.sign}"
+        if [ -f "${module}" ] ; then
+            modules="${modules} ${module}"
+        fi
+    done
+
+    "${S}/src/ipa/ipa-sign-install.sh" "${B}/src/ipa-priv-key.pem" "${modules}"
+}
+
 FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES_${PN} += " ${libdir}/libcamera.so"
 
-- 
2.17.1

