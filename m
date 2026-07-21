Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DCBC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 16:27:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27183.1784651253583416843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 09:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rwtPJp/r;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce98cb8165so54390675ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651253; x=1785256053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBlZtMkun6sIu3vlUHseC3JQQAvmJMuFlusVUfZjEbg=;
        b=rwtPJp/rYSr1+kRD91Mu5E46pA3aYTKoBCDCAA1VI4YMlPxfx65Bg2UNs00BzFi6Cr
         e00NX5d+Q50yqxJb4qzT38rx/KLDgZxiNpZqCbAGtztXwzg8i7EK+62AtAAR61T7xwIm
         JUSutpGpnKWnQeLth8UOsK6tiI2FQBM8rGG0k+61KR4mH32IRULkU6abgu2nvlBVGynH
         /vxj6z2BovNpn7WFyoa1zOjOB1dWgJe1+GemdfSjRHBwP20AV0sMWm+/F+kSnbaTtAZc
         Pd1PQdEI6cw3Ztt2b6UcTKsQUg45+lIGCRQKG/qSEX3xXkiT6m6vkhmHWNXLSDEvTMbd
         JG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651253; x=1785256053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBlZtMkun6sIu3vlUHseC3JQQAvmJMuFlusVUfZjEbg=;
        b=mpVx5zUC/i/TNigct3QevUqsjLnk1YwIlt/uDeW/nNPw1ai100vLuK4Au5eee+vkcu
         tePwInA+sNmxXKvOgtLjWfuIjVQe1gIARyWnqDkH+qe/Z66fbd+NpTxILociYqCsEk/F
         P9d61eBmHyxWbFftZsGtrlPYDF3yfa4YNCToEHZGGwSZM3KE0zvaX0z3//R2rJOcWeE8
         HnhymZLhdCoAZQ5IQCLF38am5e0Mdz5t81YvowYDVmTl+vQGtvG+fSOIycH9dsYGC2/G
         PxYDpzHv5n+hvvlPII2KOdn7gedlfi0OeUCMRMRrxoPeAs88+LyL/MUuvfZFiBf+HOC2
         F6WA==
X-Gm-Message-State: AOJu0YxNCG5eI/Qnrvk2OsCb9jUugcCRYsN9PJyaTobo97YhlcAqrNOH
	5DfkjdvJP6dASJ6BiqM5n46I5yrHVzzanl2kZWai2ADm8FV5OwOLBhE8Hv4i4w==
X-Gm-Gg: AR+sD11rwszszS4OLgo3h4C97fp1QLHE4DgVPEtga0nMNGwuVyGtIojIUx2UeU4ZbsU
	4oBX//h/N+M8DD5eWi/5I/GdQaHs/pmpX43jahlnfh3N6Ng2d9rSeQiEVqB28ykSr5rriwxIhfJ
	vAtDiNUtKYP0wRes+S63lBq/rwqWInbUfPTbTubXJTAa0GgSbE12w1rU+Pqtlo4vrHPmI9ZvMDo
	MgkUWOLeBrdOuPN/j9nICHLGpvhdd4vpTfbMczTdl2wzgK4Ni9TbgbsujZLLJpZC2P0WiXCai7P
	qwEf154YQnjOGoCZbR/pW+rWJ2ApuhW8kZoVsWECfBERzCa18NW8L5CB8JNA7BUG+iNM9R15sMm
	z2NXAumzxxRxOmXrUseexfzpZaoK8zBsD2TqJWuf+t0lfFpWFqkN/E1fk4ueL3JoPbcy0KX7uWF
	HJOXpsvbFHd6TKSfroLA==
X-Received: by 2002:a17:903:4688:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2cf8ddb8b0dmr3985445ad.22.1784651252896;
        Tue, 21 Jul 2026 09:27:32 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:b7f2:160:d1f2:65e2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm479421eec.3.2026.07.21.09.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:27:32 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-openembedded][PATCH v3 2/3] android-tools: export libsparse/libbase/liblog headers and libs to sysroot
Date: Tue, 21 Jul 2026 21:56:43 +0530
Message-ID: <20260721162645.2056048-3-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721162645.2056048-1-emailaddress.ashish@gmail.com>
References: <20260721162645.2056048-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 16:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128355

Export libsparse, libbase, and liblog headers and libraries to the sysroot.
Currently, these are often internal to the build.
Reorganise header installation to ${includedir}/sparse to match the expected
include paths for e2fsprogs contrib tools.

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 .../android-tools/android-tools_%.bbappend    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_%.bbappend

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_%.bbappend b/meta-oe/recipes-devtools/android-tools/android-tools_%.bbappend
new file mode 100644
index 0000000000..50c54145b8
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_%.bbappend
@@ -0,0 +1,54 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+# e2fsprogs expecting headers in sparse/ subdirectory
+do_install:append:class-native() {
+    # to resolve the "Multiple shlib providers" conflict.
+    rm -f ${D}${libdir}/android/libsparse.so*
+    rm -f ${D}${libdir}/android/libbase.so*
+    rm -f ${D}${libdir}/android/liblog.so*
+
+    if [ -d "${S}/system/core/libsparse/include/sparse" ]; then
+        install -d ${D}${includedir}/sparse
+        cp -r ${S}/system/core/libsparse/include/sparse/* ${D}${includedir}/sparse/
+    else
+        bbfatal "Sparse headers not found in ${S}/system/core/libsparse/include/sparse"
+    fi
+
+    install -d ${D}${libdir}
+    for lib in libsparse libbase liblog; do
+        if [ -f "${S}/debian/out/system/${lib}.so" ]; then
+            bbnote "Installing ${lib} from ${S}/debian/out/system/${lib}.so"
+            install -m 0755 ${S}/debian/out/system/${lib}.so ${D}${libdir}/${lib}.so.0
+            ln -sf ${lib}.so.0 ${D}${libdir}/${lib}.so
+        elif [ -f "${S}/debian/out/system/${lib}.so.0" ]; then
+            bbnote "Installing ${lib} from ${S}/debian/out/system/${lib}.so.0"
+            install -m 0755 ${S}/debian/out/system/${lib}.so.0 ${D}${libdir}/${lib}.so.0
+            ln -sf ${lib}.so.0 ${D}${libdir}/${lib}.so
+        else
+            bberror "${lib} not found in ${S}/debian/out/system"
+        fi
+    done
+
+    install -d ${D}${libdir}/android
+    for lib in libsparse libbase liblog; do
+        if [ -f "${D}${libdir}/${lib}.so.0" ]; then
+            ln -sf ../${lib}.so.0 ${D}${libdir}/android/${lib}.so.0
+            ln -sf ../${lib}.so ${D}${libdir}/android/${lib}.so
+        fi
+    done
+}
+
+FILES:${PN}-dev += " \
+    ${includedir}/sparse \
+    ${libdir}/lib*.so \
+    ${libdir}/android/lib*.so \
+"
+
+FILES:${PN} += " \
+    ${libdir}/lib*.so.* \
+    ${libdir}/android/lib*.so.* \
+"
+
+SYSROOT_DIRS:append:class-native = " ${includedir} ${libdir}"
+
+DEPENDS:append:class-native = " googletest-native"
-- 
2.43.0


