Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.9428.1597214240763136677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eDSjEee9;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id o5so533156pgb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlWeMjgVkrxkrPfbtP/c6vjvTZfBfuSvRj5RexXJ9xA=;
        b=eDSjEee9FCXJccxZ4Me4XLrUTWVarKOGFPguVCOIdM61lamCSjH4E+2mZxEa7pF+xG
         v5tuuIBuSLg2T7XQaZ62RLiSoWC2qBRKpXWZB5z+Cq8i/oazLFk6sWQ62EM5eBksTaVP
         ZI/WnN4nLf4br/UYyDqK5+i4ZaSwdnRhbFFs+pOndg9MyO8f5BMspalBXt72S2uGX/x4
         InuCVidf0yTSQzqgkfr88P6CSqvdMaP6cnqyeT9RqdmVaflc0GZN4PX7ATuMpMaIA3le
         PZEtlQPILQJUjI4vu6dHwmmo01bGWAh5H3J6xHi8/XvnS298G5RvQgN5zy+aVam4mVSn
         lIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlWeMjgVkrxkrPfbtP/c6vjvTZfBfuSvRj5RexXJ9xA=;
        b=XtCNIbgk1s2PgqOBzLmX2PTfPVj/NJKGbP85//mDo2Tf0O1PzkBFnuAjYzaeY1+H1K
         3V9oylocdWWUzuQQv7VWbjZKU1lr49rBuW7FrWasU2IKoUNRo0j6MxvEPht/YBUhuNal
         JoXMJiubFCqkoIBR/tBjJowXD4rKE+QzHwrwj7NAmgN0C4aE/q9ysV6FF8zh9C1Mz1p3
         M5xtVJKxTlf67+Z71Zwj7uOnrsqxnakqFtjfZJvLVCwX55Gx5sshAlgUjZNnzYXkzzhb
         qvcSoqRHySnZgMHLQBVKnWo62MfGrR5gciQSUGu99MQDoA+UnocsN2ig1/MBaJuAgcuH
         NgJw==
X-Gm-Message-State: AOAM533sNLg1cxoa1M6vpQbM5w3MCG9iORwNTOMOGPuQJcZLlTIjYnXT
	vyf5wtviGSjOcFXbYUXRe1yJ178m9o4=
X-Google-Smtp-Source: ABdhPJwPx2OZz4X6FJAievmwC9xOtiLt8/zcESuHeS/p/FjhHAUkdFdMemcgB23oELJkOQT1iU8UUw==
X-Received: by 2002:a63:6a47:: with SMTP id f68mr3900555pgc.358.1597214240036;
        Tue, 11 Aug 2020 23:37:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 6/9] opencl-icd-loader: Update beyond 2020.06.16
Date: Tue, 11 Aug 2020 23:37:08 -0700
Message-Id: <20200812063711.2758315-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063711.2758315-1-raj.khem@gmail.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: License is now apache-2.0 as per [1]

Fixes build wih gcc10
Add new dependency on ocl-icd
Gather install artifacts from new locations

[1] https://github.com/KhronosGroup/OpenCL-ICD-Loader/commit/44f384ae624675d6b0b92ce39a97cb7f4899d92a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opencl/opencl-icd-loader_git.bb            | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
index 7c49c8d552..3b9d050569 100644
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
 
+DEPENDS += "opencl-headers ocl-icd"
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

