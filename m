Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.12382.1597383442450118073
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F+7X4nRQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id t6so4005796pgq.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gm3NR4KtLx+BeALPDnyx0FC944go1UDRC+zyMKtLXaM=;
        b=F+7X4nRQvo2LhN8EkzQxzOAkeUdUcCiTmkSN+6RNM6ZtPFQWpL/drCpXhAmXnp9yI1
         XoVaE4FdQDmwfQkOdg174Pj5Cv5NbHuoD939cLOk6NsPADYbkxnsf6Jsw8vA5XaOv0oy
         817qzkp13dFuD7aGUbT6be8UXhAnjmhsF5vBBqZnxvI6qLJzWbcBktIJ/nLkIZHuvwrR
         GE0YjPKp7IEmnPot8a3scQdzMpaJJtx5b/7Z/zVYnsVWx0EMIVXM4qbMhegfPI4is/Kj
         anEZcuXZW7YSHxa8WvCB1MPDNR+fQxnte1haHG43inSkUfoW+qRSqo5CJHkZfyauFuaJ
         0nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gm3NR4KtLx+BeALPDnyx0FC944go1UDRC+zyMKtLXaM=;
        b=ofdg2kajgZPS7QvgJrVvP9SayCgSJ8tgIbe50YZATOSn4YE8ZsKAhToQQdHrfSUrJP
         odM7EsmYz+ySnrDxymHqibih9op+bJ3bT/rLy8Uwa2DVx2ZGbCdUjusklDLNOyluwfCN
         4EukhYwf8E02t9nK71uQSEFPNpE32w/VzxpnWFxbVqlM++uTsBxyf9FekQVWmU5uIRmt
         lxIPgzqOFAcC4KdAA9Puny6aXHY/mvuBIk+B2BrInn/gCZOI1f7O0OPOny/e2NT2x5HG
         jvoR7cmrRfFAlLZmMPMoU4Tl9uxtBP51XtJU/CJb2voJ0DLZLSM5/V1PpIYOic0THb3c
         DUnw==
X-Gm-Message-State: AOAM532gElNfADSw/5G/yLW9E6w3quOupfLe2MUJirIDJg+hFr1fhGR7
	LUVzAnbjayPIqOKryZdHio+PaOZOA/jVMA==
X-Google-Smtp-Source: ABdhPJzaImtlUs8k3wiJRCOri2vOhir8n34ZwQI2WuBkiWBrKrSM87oAlTutD9JytcCxjS17XwUYyg==
X-Received: by 2002:a62:cd8f:: with SMTP id o137mr671826pfg.241.1597383441632;
        Thu, 13 Aug 2020 22:37:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>
Subject: [meta-oe][PATCH V2 21/21] opencl-icd-loader: Update beyond 2020.06.16
Date: Thu, 13 Aug 2020 22:36:57 -0700
Message-Id: <20200814053657.1701247-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: License is now apache-2.0 as per [1]

Fixes build wih gcc10
Gather install artifacts from new locations

[1] https://github.com/KhronosGroup/OpenCL-ICD-Loader/commit/44f384ae624675d6b0b92ce39a97cb7f4899d92a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>
---
v2: Drop dep on ocl-icd

 .../opencl/opencl-icd-loader_git.bb            | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
index 7c49c8d552..ed27b26164 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
@@ -1,24 +1,27 @@
 SUMMARY  = "OpenCL ICD Loader"
 DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
-LICENSE  = "Khronos"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ec724732ce73269486574c718ef0c79b"
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SECTION = "base"
 
+DEPENDS += "opencl-headers"
+
 inherit pkgconfig cmake
 
 S = "${WORKDIR}/git"
-SRCREV = "b342ff7b7f70a4b3f2cfc53215af8fa20adc3d86"
+PV = "2020.06.16+git${SRCPV}"
+SRCREV = "862eebe7ca733c398334a8db8481172a7d3a3c47"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git"
 
 do_install () {
 	install -d ${D}${bindir}
-	install -m 0755 ${B}/bin/icd_loader_test ${D}${bindir}/
+	install -m 0755 ${B}/test/loader_test/icd_loader_test ${D}${bindir}/
 	chrpath -d ${D}${bindir}/icd_loader_test
 	install -d ${D}${libdir}
-	install -m 0644 ${B}/lib/libIcdLog.so ${D}${libdir}/
-	install -m 0644 ${B}/lib/libOpenCLDriverStub.so ${D}${libdir}/
+	install -m 0644 ${B}/test/log/libIcdLog.so ${D}${libdir}/
+	install -m 0644 ${B}/test/driver_stub/libOpenCLDriverStub.so ${D}${libdir}/
 	chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
-	install -m 0644 ${B}/lib/libOpenCL.so.1.2 ${D}${libdir}/
+	install -m 0644 ${B}/libOpenCL.so.1.2 ${D}${libdir}/
 	cd ${D}${libdir}
 	ln -s libOpenCL.so.1.2 libOpenCL.so.1
 	ln -s libOpenCL.so.1 libOpenCL.so
@@ -41,5 +44,4 @@ FILES_${PN}-dev = " \
 FILES_libicdlog = "${libdir}/libIcdLog.so"
 FILES_libicdlog-dbg = "${libdir}/.debug/libIcdLog.so"
 
-DEPENDS = "opencl-headers"
 RDEPENDS_${PN} = "libicdlog"
-- 
2.28.0

