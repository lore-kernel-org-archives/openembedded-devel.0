Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.11718.1594390882366774360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 07:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jmIL7HXv;
 spf=pass (domain: linaro.org, ip: 209.85.167.194, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f194.google.com with SMTP id k6so4873955oij.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4XTCOurLGAbBtP4Tt1pz7zsGbeyloSXABQmfKYLSxNQ=;
        b=jmIL7HXvJEaI3rp3H47olgRgOpgh3QkZ2YZUO6rS85GE7Y/Y+qLOTflMxuTeHBzHtF
         xCczldZTQkeSwT4aeAkUFL3Ey+98V7Yfi61g13Ga1AMlOty+t6zvf61U1JK3JK6AGoWH
         ykmZQOmuN6Az8Py60ZWR7/H+JJYmW66C1oLtKeis2RqSsEfHVK6nrY2flJECXILiCitm
         5v2fevkSROjI1wAfT6qeFsBBAG1XCsS2Dbq1t/vNkz04ksHkE+D2Wy2sNk5gziEqNwhk
         +kumlXPymTvHVvuxdV7MAre2ieS3HMnQ1eFMWCZKbh5KhDO6TI0oDdaGFPyydHJIcLl2
         oxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4XTCOurLGAbBtP4Tt1pz7zsGbeyloSXABQmfKYLSxNQ=;
        b=faNuzgRR7Rv5tb4NrXF1IPmtDlU+bL09gtQEBz9+lmVAEyDjFisKPI361rBlKSusXU
         6gcuaJRFl/ss2MMKUeQoldiZYxK5P0EykqL8Ur6yvzd6/4AMCIMFOpii0iXRIv6NqcVq
         fcmCEZqIScJUEkBAl6zCgXitpAM5OKlrl3HO0fXoWiJiE0uPXQkwtpVkXT1n+EoRAM05
         yOrNELFjaXNMHPNpVmYvt4uVm8vud1B+iCCsehsJwuWunbeL96uvcYtZ/rE4Zx03a9Yw
         kXo2y2jyPAx9FmyuThUGLZXcm+mAADmWx1DMIgSBC9UELFYpptKezWh4AGC1p+PLCzKM
         TsUQ==
X-Gm-Message-State: AOAM533liNPkOUeWdf95jxkH5XtoyGha/BwCO8oEUZgUbhhp95ZU3zCT
	ME8GDeVvgwGR0ai0ZZ1cW2s8NRLfssw=
X-Google-Smtp-Source: ABdhPJy4ALzO/YMKKmNmJQml79tu2xsWia2sJNgj+tq4WXK3ZxM7aBV7aTm6gqaa2ZMriJrF/cxnVg==
X-Received: by 2002:aca:50d5:: with SMTP id e204mr2392509oib.60.1594390881062;
        Fri, 10 Jul 2020 07:21:21 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:f5a5:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id s8sm1111416otk.36.2020.07.10.07.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 07:21:19 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH 1/2] recipes-graphics: Add opengl-es-cts install in /usr/lib
Date: Fri, 10 Jul 2020 09:21:13 -0500
Message-Id: <20200710142114.10612-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Commonly this kind of testing tools are installed in /usr/lib
like piglit, remove version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../vk-gl-cts/opengl-es-cts_3.2.6.1.bb        | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
new file mode 100644
index 000000000..226f70027
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "OpenGL CTS"
+LICENSE = "Apache-2.0"
+PR = "r0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "\
+	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;tag=${BPN}-${PV};name=vk-gl-cts \
+	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;branch=main \
+	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers \
+	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools \
+"
+
+S = "${WORKDIR}/git"
+
+SRCREV_FORMAT = "vk-gl-cts"
+SRCREV_amber = "d26ee22dd7faab1845a531d410f7ec1db407402a"
+SRCREV_glslang = "c538b5d796fb24dd418fdd650c7f76e56bcc3dd8"
+SRCREV_spirv-headers = "e4322e3be589e1ddd44afb20ea842a977c1319b8"
+SRCREV_spirv-tools = "1eb89172a82b436d8037e8a8c29c80f7e1f7df74"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake
+
+DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
+
+EXTRA_OECMAKE_append = "-DDEQP_TARGET=surfaceless"
+
+CTSDIR = "${libdir}/${BPN}"
+
+do_install() {
+	install -d ${D}/${CTSDIR}
+
+	install -m 0755 ${B}/external/openglcts/modules/cts-runner ${D}/${CTSDIR}
+	install -m 0755 ${B}/external/openglcts/modules/glcts ${D}/${CTSDIR}
+	for dir in gl_cts gles2 gles3 gles31 gles32 ; do
+		cp -r ${B}/external/openglcts/modules/$dir ${D}/${CTSDIR}/
+	done
+	install -m 0755 ${B}/modules/gles3/deqp-gles3 ${D}/${CTSDIR}
+
+	rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
+}
+
+FILES_${PN} += "${CTSDIR}"
-- 
2.27.0

