Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.8587.1591713002282679757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SGIyljcM;
 spf=pass (domain: linaro.org, ip: 209.85.210.196, mailfrom: arthur.she@linaro.org)
Received: by mail-pf1-f196.google.com with SMTP id a127so10131745pfa.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a0hf2SQ9uTzgJioDWIEI68M9UHevoX+bZ3ZigNTzYKA=;
        b=SGIyljcMQU7T/xMxn4s8avfx4RHmrzOmK4reM35HcRTxXy2Z+VdZkzwVDPpe2Ut+O6
         eUrDoyDTt3ffKCFCPAMPmd0etfBms7Ki5RIY4/O+lQFJnCtnNcpJcR0qFu4LpzKhXO0I
         js7cTlH5bz54bt1U/Cx881rRBJe4eIrNfxscGKfE6E3fz4iPGrn1GuXWScm7lgJNYO3N
         uwEU7n/HOSnqOhaA9x+HE6VFcmmFWuaDmJxK9VYUylAu87gQ4MIM3bOhTJoPKfXaJv+/
         fcT6HlMItk+Fft0/T2eoC0VMhGBz/NAsTY2XIvCpPdKBHfShx6pGXF/OxgWhl45U8ADG
         nbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a0hf2SQ9uTzgJioDWIEI68M9UHevoX+bZ3ZigNTzYKA=;
        b=ORoThwmVmllVf+6qC3b8lWLEmlWMa74fY6d2mo9/X++/Q/lTFoObfWt3uB+zNQxfNM
         mIUELyc5LHhcC9PXSSy+f0a+OoIPDpMlMYcy0VhuhsFnnIJtXi9afS6Ec4xAoE4nzMpH
         g+M+/O3j6qdZZZz+A+e5LsPJub4oh5rvyBwMjJUJhsi75fgRNXLB2VyxPBYpZYP4f3nJ
         HE+f4hs4rV2+vo4yDrbyIjKczGou//LR4H4jYO140MafuHCjDpJ48cyrX8QpIz1AkBIP
         chnzTFcgnxC8xyCRDVhWHK+TeWLLcZvJ3Umb9wNDyA3kc8jt+rU77iaSa60EPo2bmAYX
         uS+A==
X-Gm-Message-State: AOAM531Rmej0f+Rk5yilBthcdGW2jWR38XZzwLMV2c0FxhjvsU/E5z5N
	6h8uKCLv0SGcqbBt58nl/+GCj975wMD/sw==
X-Google-Smtp-Source: ABdhPJxBqxZbseeo/Z9CuC/CV0uqNlTrwPQI19gZ5Pse76TUV4ENJse528duX0plzG0bzUAMjyKcrA==
X-Received: by 2002:a63:7016:: with SMTP id l22mr24519829pgc.284.1591713001326;
        Tue, 09 Jun 2020 07:30:01 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id m2sm2752560pjl.45.2020.06.09.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 07:30:00 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [meta-oe][PATCH] igt-gpu-tools: add new package
Date: Tue,  9 Jun 2020 07:29:57 -0700
Message-Id: <20200609142957.187352-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

igt-gpu-tools is a collection of tools for development and testing of the DRM
drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 .../igt-gpu-tools/igt-gpu-tools_git.bb        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb

diff --git a/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
new file mode 100644
index 000000000..761df1cbb
--- /dev/null
+++ b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -0,0 +1,46 @@
+SUMMARY = "IGT GPU Tools"
+DESCRIPTION = "IGT GPU Tools is a collection of tools for development and testing of the DRM drivers"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
+
+LICENSE_append = " & ISC"
+
+inherit meson gtk-doc
+
+SRCREV = "${AUTOREV}"
+
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
+RDEPENDS_${PN} += "bash python3-mako python3-six git net-snmp"
+
+PACKAGE_BEFORE_PN = "${PN}-benchmarks"
+
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
+COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
+COMPATIBLE_HOST_libc-musl_class-target = "null"
+
+gputools_sysroot_preprocess() {
+	rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
+}
+SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
+
+do_install_append() {
+    install -d ${D}/usr/share/${BPN}/scripts
+    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
+    install -d ${D}/usr/share/${BPN}/runner
+    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
+    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
+}
+
+FILES_${PN} += "\
+        ${libexecdir}/${BPN}/*\
+        ${libdir}/intel_aubdump.so \
+        ${datadir}/${BPN}/1080p-right.png \
+        ${datadir}/${BPN}/1080p-left.png \
+        ${datadir}/${BPN}/pass.png \
+        ${datadir}/${BPN}/test-list.txt \
+        ${libexecdir}/${BPN}/benchmarks \
+        "
-- 
2.25.1

