Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384E7C02190
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 19:06:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.70483.1738523173557808613
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 11:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fxBtLf2j;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so2224736f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738523172; x=1739127972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yT7klHGQGVYHwNjTg2ymeKpN4GVK78xJxGjaY/Xe0M=;
        b=fxBtLf2jUY0vwVeCsuEaO4vzf78nuNayn3yKA7PX7iQRmSiAyd9nJIkk2n6L4l447s
         5tHoS1A8GJUZ1khDN9CX1X/v2qzzUIIEKfsdD493q3AYJRo9SbQdAS0iA4opeC6f29+5
         9zzFYDNkmebJvEjZkO4R2gEeECUC7iap4XPTpe2VBllJZnARUaIfUsUErMG/V4qiL0km
         heqZZFNdAD5dZlJ4PNSCMAA0xLUOYc8wlDgKmn2ONEuwAPtTfjXZh3ZVO6TjqfKk1t3a
         Z7NPcPswriYHV1fq7dN4TnMmfCC7qr4yFZJAvyZ7+DLyAs9r68KFdzU2AprtozP38Ce2
         xV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738523172; x=1739127972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yT7klHGQGVYHwNjTg2ymeKpN4GVK78xJxGjaY/Xe0M=;
        b=IaJHknTGdu6uPxysU2gFD5axMyM4+JOkdkqowiT1yUfWIOOohmHa/eaLL6TciwqpyP
         072hnZ2F9yYBcoSNFm1f2QjpC68x0VcUi1jTZOqMqIf3uEF4ZnVHnx47SH1wE1y69bRz
         h6W9vzqt01D+TPDRl/UnSbZJhYE5CUp+smx7RePRiNu/jZKjYXoMeFGwb4y5nZ2nGoxW
         Q6a+mwbxt9BFNJHrv+hQyshsQx/i2Lwo+C83/ZLhfABdr9Glo3ZPiNcLcpWMSRFJOhi4
         4WyCq9qUWjeqK6ZkMScMUr+QJFb1uxT6a83dvlIBR/FdxOAzWz29O4nKTaX9+cpJqBM5
         GSFQ==
X-Gm-Message-State: AOJu0YxzoFIftYIv1OIQ0hZFacEG+Y/Gf0k3h6oSU+QYtKKBFPSK+goI
	Zy7OlzKTUF66saWtlQfccBXz6N+sFVhxSeKw/MAcKJrSBtFtW6U6ukyUcpGR
X-Gm-Gg: ASbGncubiEfb6MzzUPrDsW74Sm0PT6t74dBVUoYwtUS1hOQM3CEVA8EIDfQk9YkydXg
	rTr0shNmgT7gclTlj/o8eHvM/Nyer97galJSf6LVh29/R6pnZs8cKM7ZUrtDkmqJ+bZG8ThwqzC
	bBQ9utesfy8+4h240DKEN09/ITLDm0haIjgypevoTtsECBhPKWIFOM6f0/kG43eBxKsENhEM86D
	XReSdfJzU0eU6GTl62ieJ6TTqjtodtKLBYPncW2iU1PoNMvYZJJFouD9prxiR2dgoXLM0wodeY8
	In78bSCYQl5LxSq73FhIHcBEAmO6X9g=
X-Google-Smtp-Source: AGHT+IEE4SpJVx/kCeUHoqw5sewBFboBBE/LP6+htvo8xzJDMiEqwytXzO6dKkTt1VTyqmMuDnRbrw==
X-Received: by 2002:a5d:59a9:0:b0:386:4244:15c7 with SMTP id ffacd0b85a97d-38c60f7788amr8656171f8f.25.1738523171699;
        Sun, 02 Feb 2025 11:06:11 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b57ccsm10697424f8f.79.2025.02.02.11.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 11:06:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH] capnproto: remove binary checking from target cmake file
Date: Sun,  2 Feb 2025 20:06:08 +0100
Message-ID: <20250202190608.1521989-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 19:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115218

When linking to capnproto from another project, cmake fails to
find this package with the following error:

| CMake Error at ${RECIPE_SYSROOT}/usr/lib/cmake/CapnProto/CapnProtoTargets.cmake:176 (message):
|   The imported target "CapnProto::capnp_tool" references the file
|
|      "${RECIPE_SYSROOT}/usr/bin/capnp"
|
|   but this file does not exist.  Possible reasons include:

This generates some binary files in ${bindir}, and when crosscompiling,
these files are not included in ${RECIPE_SYSROOT} of the project that
references this ones.

However the cmake file does check if these binaries exist, ultimately
failing the do_configure task due to not finding them. Since these
binaries are not usable on the build system anyway, just remove the
checking of them when compiling for class-target.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
index daeeb975f..ad4e036a4 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
@@ -27,4 +27,10 @@ FILES:${PN}-compiler = "${bindir}"
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 
+do_install:append:class-target() {
+  # delete lines checking files in bindir, e.g. this:
+  # list(APPEND _cmake_import_check_files_for_CapnProto::capnp_tool "${_IMPORT_PREFIX}/bin/capnp" )
+  sed -i "/.*_cmake_import_check_files_for_CapnProto.*bin\/.*/d" ${D}${libdir}/cmake/CapnProto/CapnProtoTargets-noconfig.cmake
+}
+
 BBCLASSEXTEND = "native nativesdk"

