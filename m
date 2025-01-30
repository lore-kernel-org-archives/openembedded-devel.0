Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7ABC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 06:07:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.10039.1738217248719997043
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 22:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ko0ZE1LA;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166022c5caso5410385ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 22:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738217248; x=1738822048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzDLjyDlOoMO3o80DM5DdpM5UGChucUjXI1HxHoMB7E=;
        b=Ko0ZE1LA++rASFKeKOhTjP+RgRgS3XBBiM8VtVzI37uu7mNB0dbZ43FvdukWuHmoqG
         rktJwkGimWGK4/C8TArxJv+E7ApuFvUIwQoqBfUZDuo4bbihKukPi1N0y7QG5QRQlwZi
         e+1wBJzZpWpihsjAXci4zj9hHOWgG7lbvScxhDciaUWsgUCLeGfXGy9hn1XWiq7m+RM1
         aFh0C7OCcJJY7iOnHnu7AZkgcqxASYR/hGutxDu4OXMpzWOnaS4llzNk7JaZglgV4eis
         HdshzrdjfHN75l2y0yoWaJaJd0wK5lhT8pv2lOCVYJ6+xJ19HMTpgFQldtTVOKq15wym
         toYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738217248; x=1738822048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzDLjyDlOoMO3o80DM5DdpM5UGChucUjXI1HxHoMB7E=;
        b=FoVh5q46lGOQkeTykxV7N2oVCBPRFBqxoSf4YiF8ggKUxYCOQr7v4KBuFYoi7RGeX2
         8cYZ2udFsbXg8zcR1pAJKnqcFDbkTbBnPhJqp2/DU4RC/li0XRm8cEmKln6TjUq9q8bh
         Q4WO/P+rTF6gKTOQPEGGzbElIgJrYwFmnhRRJy7SRY9mFIl6E/es/qTiMIFvxy75B+2Z
         YuEhskJcOj+tKd9nYGptEsfcNFQBCDq/pQCu2U/LHqmq5ghzoHgdCm4NggAZaq9O7JyA
         dIjkBtPIASavluA1CILvQwYccoIjIBGaB4xg1aQgvWgfl6F5jt0HLY1sQroRr52g1NfR
         qQCQ==
X-Gm-Message-State: AOJu0YxwM0MljFUa43W/jxP7Ey2XgI37xUI/+2/vkOqxZMKqFlcYSwnF
	/zb9ZMXvnU+p5HmqXWBB2CaqGY9VnKjPZXLK1LZWnyYh3jjAa/K/VUa+rw==
X-Gm-Gg: ASbGnct00W+CHLeJW9fwPLbBCXgdkajClHC211E2/hymiJ1MrZcuP8L3OE+AWsHD9xz
	OiR/rC7ARpr2z9RafA1jvpqcO6wgzDiE/XOVLaAjXP9QKcCDl5VOemx78TZMk+iDmSuMotmb6Pn
	gh5GskG0zbSafqRyeGWaqj2q8sSQetwdCvP0X+Ufh/IGnZkLkEPJ1kz32BepSA8A6Cl3Kj9hmyc
	tB4gOfE25Do/pmiGIc26uCj/C17BX56Cg47cztRtc3pG1UOmQewqzFnwuCx69FMjFdQS29pgA9H
	0H6oDzUK4FWJY5BHloIeT+v/F2aTsfosnQAJPa7aOsTk1LF6B9PGKzLpLRCv/nAF+dQ2UIRAH5O
	+7ugkx07Ph4waMd7OKA==
X-Google-Smtp-Source: AGHT+IFO40bJ+wY2WDIETeDLTEJAMx3BbjUkNru4ZpajrH8DQ24VV6i8iXAy630842KAe8l/BuVzng==
X-Received: by 2002:a05:6a00:e8a:b0:72a:bc6a:3a87 with SMTP id d2e1a72fcca58-72fd096a0a5mr8796048b3a.0.1738217247709;
        Wed, 29 Jan 2025 22:07:27 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net. [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm538444a12.58.2025.01.29.22.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 22:07:27 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH v3] meta-oe: libspdm: Initial support for libspdm
Date: Thu, 30 Jan 2025 16:07:19 +1000
Message-ID: <20250130060720.1686103-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 06:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115149

libspdm is DMTF's Reference Implementation of SPDM, it's a library that
can be used to implement a SPDM requester or responder in userspace.

This patch adds support for building libspdm, which can then be used to
build applications depending on libspdm.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-support/libspdm/libspdm_3.6.0.bb  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
new file mode 100644
index 0000000000..fa04ce6c59
--- /dev/null
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
@@ -0,0 +1,76 @@
+SUMMARY = "DMTF's Reference Implementation of SPDM"
+DESCRIPTION = "libspdm is a reference implementation of the DMTF’s Security Protocols and \
+Data Models (SPDM). This is used to enable authentication, attestation and key exchange to \
+assist in providing infrastructure security enablement"
+HOMEPAGE = "https://github.com/DMTF/libspdm"
+BUGTRACKER = "https://github.com/DMTF/libspdm/issues"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8f9b59a81a88da8e812af43728b72dd7"
+
+DEPENDS = "openssl"
+
+SRC_URI = "git://github.com/DMTF/libspdm.git;branch=main;protocol=https"
+SRCREV = "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+LIBSPDM_CFLAGS = "\
+	${TARGET_CFLAGS} \
+	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
+	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0 \
+	-DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=0 \
+	-DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=0 \
+	-DLIBSPDM_HAL_PASS_SPDM_CONTEXT=1 \
+	"
+
+def get_spdm_multiarch(bb, d):
+    target_arch = d.getVar('TARGET_ARCH')
+    multiarch_options = {
+        "x86_64":  "x64",
+        "i586":    "ia32",
+        "i686":    "ia32",
+        "arm":     "arm",
+        "aarch64": "aarch64",
+        "riscv32": "riscv32",
+        "riscv64": "riscv64",
+    }
+
+    if target_arch in multiarch_options :
+        return multiarch_options[target_arch]
+
+    bb.error("unsupported architecture '%s'" % target_arch)
+
+EXTRA_OECMAKE += "\
+    -DARCH=${@get_spdm_multiarch(bb, d)} \
+	-DTOOLCHAIN=NONE \
+	-DTARGET=Release \
+	-DCRYPTO=openssl \
+	-DENABLE_BINARY_BUILD=1 \
+	-DCOMPILED_LIBCRYPTO_PATH=${libdir} \
+	-DCOMPILED_LIBSSL_PATH=${libdir} \
+	-DDISABLE_TESTS=1 \
+	-DDISABLE_EDDSA=1 \
+	"
+
+do_install () {
+    install -d ${D}/${libdir}
+    install -m 0644 lib/* ${D}/${libdir}/
+
+    install -d ${D}/${includedir}/${BPN}/
+    cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/
+
+    install -d ${D}/${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib
+    cp -rf ${S}/os_stub/spdm_crypt_ext_lib/*.h ${D}/${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib/
+}
+
+FILES:${PN} += "${libdir}/*.a"
+FILES:${PN} += "${includedir}/${BPN}/*.h"
+FILES:${PN} += "${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib/*.h"
+
+COMPATIBLE_HOST:powerpc = "null"
+COMPATIBLE_HOST:powerpc64 = "null"
+COMPATIBLE_HOST:mipsarchn32 = "null"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


