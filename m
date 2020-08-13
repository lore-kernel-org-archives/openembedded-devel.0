Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.4364.1597350992378911602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 13:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vNgCbRdW;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id g6so7611824ljn.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 13:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=dvn/IwqLA+3PH4BKODk/zOnnDdgbBvpTRDgFYMP1JH8=;
        b=vNgCbRdW484fNR3yZuknZHE44eln9gutzaHVYYaPdwM9cgGpSiy9/rIle3omvay/rp
         v+Ky/h0x3V35kQSQcuwIa9XAiAANotxAYa1Z1dA8TOtta4HQpc9b02sERfiUDazFXAHm
         suP+WnsYMI+lYeVqNKM63qqgsOjXRiMeRvuNAp3CkQy2cRcZQCyKjOQY5JyIorbxKRks
         E0X0zDcf9nnHOLfZHZY0yL/N2KoUYc9p1rMwkFVqkrfxCFmPM5d/Dz5+SyE/4vpvsgO/
         WedBHcBiFGFhXHcESX3vxkeZPg46dy0wX+CuLechrvyERWeHwQln+aP6k3mrRQRHGdNg
         AW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dvn/IwqLA+3PH4BKODk/zOnnDdgbBvpTRDgFYMP1JH8=;
        b=JQswVK4z5JaV8B/bYBH3au3gNZIlolJwnom77KzCfix0i/DiQJYS0sIJcj469seq9n
         9pzvvLGTm1YHhkABsnX/oGv+a3dvIdm0k6CJ3TCFLKWbOCnUOjFQvzebaxkx/fk7gP+C
         hf+doI/8qnM9HmYyrbn4tcLzKWTKZkaswlKZTyv7a3OOPExZDOsBULW6f0v5RSdoKmQ2
         4E+QMnBfAHpIYeE1/9G8tgMdFVcCOIDfKF6xa8OBcx0HPleHA05xmhmXMPWLI1Zf/144
         Ml2OmDyGlEx/yD7KalnToGu7if0TFlMqnhSVYpYm0bhJKoaFzIq3iICJFt3vXaVbrfHL
         Wwlg==
X-Gm-Message-State: AOAM533TJCgJRz1E87DdHGF/gym8b33s/dKdEuGnRpT6HFRhdcn/5q4z
	q5B6tK5MdTlcnjWNq11LR+76p2Cn2BU=
X-Google-Smtp-Source: ABdhPJzGxBA0PhthWUt1flPrVng4nIor1DREaCyLQQmfR8qCInIkzs4s2oKK7nq5KxlBblFVd3iWvg==
X-Received: by 2002:a2e:81d9:: with SMTP id s25mr2768909ljg.104.1597350990286;
        Thu, 13 Aug 2020 13:36:30 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id n29sm1442090lfi.9.2020.08.13.13.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 13:36:29 -0700 (PDT)
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: madhavan.krishnan@linaro.org,
	raj.khem@gmail.com,
	peter.griffin@linaro.org,
	libcamera-devel@lists.libcamera.org,
	Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [meta-multimedia][PATCH v4] libcamera: fix packaging and installation
Date: Thu, 13 Aug 2020 23:36:08 +0300
Message-Id: <20200813203608.26814-1-andrey.konovalov@linaro.org>
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
 Changes in v4:
  - Some of the quotation marks removed to let bitbake to expand
    the variables properly.

 Changes in v3:
  - As suggested by Laurent Pinchart, use ipa-sign-install.sh script
    to recalculate the signatures instead of ipa-sign.sh.

 Changes in v2:
  - Recalculate the IPA modules signatures after do_package()
    instead of disabling stripping and splitting libcamera package

 .../recipes-multimedia/libcamera/libcamera.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index af2d3b4e1..c66c93ec5 100644
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
+    for module in $(find ${PKGD}/usr/lib/libcamera -name "*.so.sign"); do
+        module="${module%.sign}"
+        if [ -f "${module}" ] ; then
+            modules="${modules} ${module}"
+        fi
+    done
+
+    ${S}/src/ipa/ipa-sign-install.sh ${B}/src/ipa-priv-key.pem "${modules}"
+}
+
 FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES_${PN} += " ${libdir}/libcamera.so"
 
-- 
2.17.1

