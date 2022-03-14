Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2136BC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:57:09 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.24333.1647248227269371793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=I853ccqt;
 spf=pass (domain: qtec.com, ip: 209.85.208.174, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f174.google.com with SMTP id c15so4181425ljr.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NwlNrAyedU+5f55GS3bO6AQzed5A9jUlyf32fBx60CA=;
        b=I853ccqtGsu114qkZj/btAvoBovOBtlO29ohOCspyahtmg7DIAkJ4o2Uepcl2/s/Ur
         009hpVxigdKOgKKFeuSiaRB+ebtdJBAx4QXvK8M8hgpQiF05oHLwVNkfF9L0I4zzRcWO
         HjZzrgj1588M+RkMqRRE9TauZSGMev2pr2KODPEepfZAwMHsTHeGirvS0uUPbO4q8iLZ
         GuaaMbqRbsMmQyMjxcD1CyvkMld3UAS3JW9DW+9sKBhofZEKIaW0wK64pX37zAMFntyd
         huEoiY0DQFS9WklMoUEe4+mB/QFDf/JSR48AAlAb3dPYA7xt4yYhtRqFvjODF/BEB8V/
         nQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NwlNrAyedU+5f55GS3bO6AQzed5A9jUlyf32fBx60CA=;
        b=h3CQ7tXEYKaUB+dcrb9j7qmXDvE0lp3Ep66o/tHvM4hr1EHhZRJqSylCMLBRTyz9nQ
         YoMm+uSiTzBYBtR+lRrmd7XpbvhI9zWFkqIOjzHyR0OaVDGNxodhTwjYjqlZeaaTySBq
         OcSipWR7ddYq5DSwMI4AyVKf8315KJF0WaOiWq2gjaZbnPK/YQLPkJu9ot1iwucMDeoB
         l9wXpwfoor86C4au7KTgdgTQ0Ebb4mMiKONO5LY9TROWFe76ivVt1fvn0zZUroQX5XVn
         uEkCSXFCxTCDaJtV42moQuJ9EsDEAVMd3mSQ16tzQgYTz4CWlsdRaop9z7ELVAFxnPmr
         XiMA==
X-Gm-Message-State: AOAM531eNsfRCofr7g89/NGqbASKZjCALmwX85cJHk/64WND+2O53g8m
	DWsHyBALhySMD8cXdNCCHYJZeeQKnqmOWjs7y5NmkXYferhUstINjXVD1m04eABXGyo+IA1ecTv
	Dy7Z8e0vsZCAab9LDnET252wwE6SjLKzP0w+B+I96Q5zPziHolnPsDPo2iddQlkPuW02qyhseWt
	zowbhqSGVBquEeXw==
X-Google-Smtp-Source: 
 ABdhPJxIA8WLckopukXDEk+1rthupTvkyMU6vDBB96MV6eKCVwW8+sppI61NGLcQMXB0aDkVDqe9IQ==
X-Received: by 2002:a2e:8e85:0:b0:249:22ad:7bf0 with SMTP id
 z5-20020a2e8e85000000b0024922ad7bf0mr8069871ljk.340.1647248225194;
        Mon, 14 Mar 2022 01:57:05 -0700 (PDT)
Received: from localhost.localdomain
 (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 h3-20020a2e9003000000b00249278d3bd7sm1751237ljg.77.2022.03.14.01.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 01:57:04 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [meta-oe][PATCH 4/6] opencl-icd-loader: Update 2020.12.18 ->
 v2022.01.04
Date: Mon, 14 Mar 2022 09:56:44 +0100
Message-Id: <20220314085646.38283-4-daniel@qtec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314085646.38283-1-daniel@qtec.com>
References: <20220314085646.38283-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 08:57:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95975

- Fix recipe style WARNINGS from oe-stylize.

    ./contrib/oe-stylize.py
    meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb

    Reminder:  Tabs should not be used (use spaces instead)  in : '
    ${bindir}/icd_loader_test \ '

    Reminder:  The correct spacing for a variable is FOO = "BAR"
    in : '
    SUMMARY  = "OpenCL ICD Loader" '

- Fix missing lib for CL applications

    strace clinfo:
    openat(AT_FDCWD, "/usr/lib/libOpenCL.so.1", O_RDONLY|O_CLOEXEC) =
    -1 ENOENT (No such file or directory)
    newfstatat(AT_FDCWD, "/usr/lib", {st_mode=S_IFDIR|0755, st_size=36864, ...}, 0) = 0
    writev(2, [{iov_base="clinfo", iov_len=6}, {iov_base=": ", iov_len=2},
    {iov_base="error while loading shared libra"..., iov_len=36},
    {iov_base=": ", iov_len=2}, {iov_base="libOpenCL.so.1", iov_len=14},
    {iov_base=": ", iov_len=2}, {iov_base="cannot open shared object file", iov_len=30},
    {iov_base=": ", iov_len=2}, {iov
    _base="No such file or directory", iov_len=25}, {iov_base="\n", iov_len=1}], 10
    clinfo: error while loading shared libraries: libOpenCL.so.1: cannot open shared
    object file: No such file or directory) = 120
    exit_group(127)                         = ?

- Change branch name master -> main according to upstream repository.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 .../opencl/opencl-icd-loader_git.bb           | 54 ++++++++++---------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
index 45b1ad549..67437732d 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
@@ -1,30 +1,36 @@
-SUMMARY  = "OpenCL ICD Loader"
+SUMMARY = "OpenCL ICD Loader"
 DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
-LICENSE  = "Apache-2.0"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SECTION = "base"
 
+inherit pkgconfig cmake
+
 DEPENDS += "opencl-headers"
 
-inherit pkgconfig cmake
+PROVIDES = "virtual/opencl-icd"
 
 S = "${WORKDIR}/git"
-PV = "2020.12.18+git${SRCPV}"
-SRCREV = "1d5315c3ed30d026acb79a1aa53a276fc833ffa7"
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=master;protocol=https"
-
-do_install () {
-	install -d ${D}${bindir}
-	install -m 0755 ${B}/test/loader_test/icd_loader_test ${D}${bindir}/
-	chrpath -d ${D}${bindir}/icd_loader_test
-	install -d ${D}${libdir}
-	install -m 0644 ${B}/test/log/libIcdLog.so ${D}${libdir}/
-	install -m 0644 ${B}/test/driver_stub/libOpenCLDriverStub.so ${D}${libdir}/
-	chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
-	install -m 0644 ${B}/libOpenCL.so.1.2 ${D}${libdir}/
-	cd ${D}${libdir}
-	ln -s libOpenCL.so.1.2 libOpenCL.so.1
-	ln -s libOpenCL.so.1 libOpenCL.so
+PV = "v2022.01.04+git${SRCPV}"
+SRCREV = "169f05d026e65948b30cfe2200595fda92198cf7"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
+
+EXTRA_OECMAKE:append = " \
+    -DOPENCL_ICD_LOADER_HEADERS_DIR=${STAGING_INCDIR} \
+"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/test/loader_test/icd_loader_test ${D}${bindir}/
+    chrpath -d ${D}${bindir}/icd_loader_test
+    install -d ${D}${libdir}
+    install -m 0644 ${B}/test/log/libIcdLog.so ${D}${libdir}/
+    install -m 0644 ${B}/test/driver_stub/libOpenCLDriverStub.so ${D}${libdir}/
+    chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
+    install -m 0644 ${B}/libOpenCL.so.1.2 ${D}${libdir}/
+    cd ${D}${libdir}
+    ln -s libOpenCL.so.1.2 libOpenCL.so.1
+    ln -s libOpenCL.so.1 libOpenCL.so
 }
 
 PACKAGES = "opencl-icd-loader opencl-icd-loader-dev"
@@ -32,13 +38,13 @@ PACKAGES += "libicdlog libicdlog-dbg"
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
 FILES:${PN} = " \
-	${bindir}/icd_loader_test \
-	${libdir}/libOpenCLDriverStub.so \
-	${libdir}/libOpenCL.so.1.2 \
+    ${bindir}/icd_loader_test \
+    ${libdir}/libOpenCLDriverStub.so \
+    ${libdir}/libOpenCL.so.1.2 \
+    ${libdir}/libOpenCL.so.1 \
 "
 FILES:${PN}-dev = " \
-	${libdir}/libOpenCL.so \
-	${libdir}/libOpenCL.so.1 \
+    ${libdir}/libOpenCL.so \
 "
 
 FILES:libicdlog = "${libdir}/libIcdLog.so"
-- 
2.34.1


