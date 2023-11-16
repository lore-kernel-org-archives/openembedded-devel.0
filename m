Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39642C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 12:36:08 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.5619.1700138162409511323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 04:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hLr9mWCG;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so1153298a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 04:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700138160; x=1700742960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUir/VFUUGNahtTvKETtetnb3NYOucGnnSTC2ED3/ck=;
        b=hLr9mWCGml2vH7T9BtYGVcSZDedUgG8bxLjDCjLraFkA/Z3841471A0W5ARaRIouOc
         XLW+uRWqrQlrs8dCDR8Tmkb+83BcMk4jmUCAQgpEBBL7TsPmnPA8zxQ+fppC7P7yj0LP
         kgQJ7ys3u/97+aEhCZIDHDa2OXsAQTNtk/TlUwcUwBjS3bZDRZ2RbkpCZTpJvfq2fN9V
         wBUe6J7yHnLmdp9ztGuo7/PVlBdZSG0tMv5KlX8gff34uIFy2T3JHurn36rUz738IWMu
         90wL1yDfgi+Zr4UVz0d1fvKx121t7usfg+i5dybnGFU8wJILfJ9fUvcg+bTzVOa1SlL0
         frgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700138160; x=1700742960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUir/VFUUGNahtTvKETtetnb3NYOucGnnSTC2ED3/ck=;
        b=u7HEZrB/wF9WWjOp9XBAvb7jomU7+fBUU3pRVHVvLYBETkX732lVJUDx2UBVXEX+E+
         QD1Jpz2E7UQpXuUZhQad+g6jLPdrGXwj27D4e1e6SJWckUp9A1bjNpQKbwjMJiMCS9Ei
         7prWhJWH+zejQNbhdONjGrrvsayU2WrZnrLvjiEDfUfZ5y1hfzsVAA98OzqVM3iarJJb
         4IoJOMd+hnGkg4R4ErBgLiYgrz/tzIeN6/e5nB3OHtsNgRGXY/AD2Qp9pkbrXfNsh+H+
         d46+0yj1UXCYIn4PIVzGqj+GGOcLjIXyVe4FJg1wU1z6hb3yFgU/OGUZgDb8AM3O43xQ
         voqw==
X-Gm-Message-State: AOJu0Yx1a71Br5UCKZFqWT++kjptaouV4BIfF7B3iBF2EG+NL+vk6byg
	M00abv0Lg+mG6HP0higLWgJxJyy9oQRIyA==
X-Google-Smtp-Source: AGHT+IEqRv30vUaArSAsmFgeblPS3XeexotiFLJWPeyNEiF7SmhX8JDW8A1A6WIHkoPNpY91UQC0yw==
X-Received: by 2002:aa7:d5c6:0:b0:545:4bf4:c48f with SMTP id d6-20020aa7d5c6000000b005454bf4c48fmr11044215eds.5.1700138160057;
        Thu, 16 Nov 2023 04:36:00 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id l22-20020aa7c3d6000000b005402b190108sm7727439edr.39.2023.11.16.04.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 04:35:59 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] opencl-icd-loader: upgrade v2022.01.04 -> v2023.04.17
Date: Thu, 16 Nov 2023 15:35:46 +0300
Message-Id: <20231116123546.982858-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 12:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106814

Changelog:

- Synchronize with OpenCL v3.0.14 specification release.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...d-loader_git.bb => opencl-icd-loader_2023.04.17.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-core/opencl/{opencl-icd-loader_git.bb => opencl-icd-loader_2023.04.17.bb} (81%)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.04.17.bb
similarity index 81%
rename from meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
rename to meta-oe/recipes-core/opencl/opencl-icd-loader_2023.04.17.bb
index fc04cb55f..925053bd6 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.04.17.bb
@@ -12,8 +12,8 @@ PROVIDES = "virtual/opencl-icd"
 RPROVIDES:${PN} = "virtual/opencl-icd"
 
 S = "${WORKDIR}/git"
-PV = "v2022.01.04+git${SRCPV}"
-SRCREV = "169f05d026e65948b30cfe2200595fda92198cf7"
+
+SRCREV = "b1bce7c3c580a8345205cf65fc1a5f55ba9cdb01"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
 
 EXTRA_OECMAKE:append = " \
@@ -22,11 +22,11 @@ EXTRA_OECMAKE:append = " \
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${B}/test/loader_test/icd_loader_test ${D}${bindir}/
+    install -m 0755 ${B}/icd_loader_test ${D}${bindir}/
     chrpath -d ${D}${bindir}/icd_loader_test
     install -d ${D}${libdir}
-    install -m 0644 ${B}/test/log/libIcdLog.so ${D}${libdir}/
-    install -m 0644 ${B}/test/driver_stub/libOpenCLDriverStub.so ${D}${libdir}/
+    install -m 0644 ${B}/libIcdLog.so ${D}${libdir}/
+    install -m 0644 ${B}/libOpenCLDriverStub.so ${D}${libdir}/
     chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
     install -m 0644 ${B}/libOpenCL.so.1.2 ${D}${libdir}/
     cd ${D}${libdir}
-- 
2.25.1


