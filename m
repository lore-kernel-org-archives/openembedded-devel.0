Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AECC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 05:39:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.9704.1738215594086765251
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 21:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXOzO51T;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: alistair23@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso462837a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 21:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738215593; x=1738820393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvEr9nESuFRUe/WYCJXWBjPpwqIcBl9bzo4YLFAtfAo=;
        b=nXOzO51TnW2TnVzCqLKZs2w7s/fGCwfyJK24X6UZ50+SMeWS0gNHatuvlyp/hI3nyM
         HUfFV4/QNSlJ6YiLUvV2ceP6Hlb95/zoGn7zAWkEWmLvpcm1gXTf1gh6OwRtIMu/sNSL
         96nYh9GPQFkds6cTJCEmIUEpuLte2fhxT2iK7x1oPozOXaF7j5TXI2miylUgCITpez1w
         D+o3pzcSZqSEnI46UPjADlus6U87pBbMINciE1/GF9F49OEFiK301m6AC1lUHmFIEsgt
         SFsukU4P6gtsgb3K0VQXjAKdl3Uzqnqps5XQvuaK6NoDsC+XLQWlOpgK3zLmFVvIlvxP
         m1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738215593; x=1738820393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvEr9nESuFRUe/WYCJXWBjPpwqIcBl9bzo4YLFAtfAo=;
        b=cjG+o2lEXw4D3fc5JuJdSj9bVgCPp08aLjdj1NIZ9a1koC1YVKsNb6PH3E3XuFTCQj
         TXiC7zFTGyQg3DuGgv+kVZ/QcL4bK87c2e5783SdbYfvoo94sri8dNOkaGowD6UqCCaL
         Ymf+nxkUghRTtiHD62jQck8lIZF62IRxxf31xzGU2ptUMvCvVmdGCO1iUGMA+/iHQsTS
         1DxlJmqnzhual8+HSxXbYqtRY4+9FAsUfRjH8bi6fJhGvTCFm2PAWr5ox+HwROoppG9S
         8G1s27KRBihG7NlPNCU6+sHgEp7pXuBd2a2CCV3byTLDSKxEjAoPvOBFgkQXH1p4fy6N
         h0GQ==
X-Gm-Message-State: AOJu0Yw2JsJBPe4bv5NS16gG+Z6EKPsi8+0/5KIkQnZyOzYN6t3X6OHm
	isuzND3fyvm636ewtTp0gskJrqI8i2YsmZ7QaNndmg8NEDk5JtV9ko7U1w==
X-Gm-Gg: ASbGncsyC70IYEAJPDUWtpOEZo1kDiZsKzg3dg+ENHpAeNLaqhtttiVvWYnhYjy3C5C
	N7mpyHNMZPzEiFe68gRVXP5hb3NRYcayf9IehRngs+kW0ILIukozFyBgQQ7C7GNLcK/QmnWnPxH
	JdeLodISK7BeC5SNkESdHKebjtuJe59ywOkJ4+L2mWWks9DjIOZ4qovj+Ijic/G0z+G5cdIleuu
	wYlCdku2hX1Jl4gMEAfyBPE8nqluTWjYhUjcjVRY5zkNu981hi8YKggFlIxNzo6jHjB0n3hEjMg
	kz1F3eNfAZUCyQw1txQe4N94O4vhn9e0Rj5gQfTaF0zRlxnsJGkegDO81GY4+qaJGxexPFG0Sl9
	R/qazIGbY7M/sqLcWHg==
X-Google-Smtp-Source: AGHT+IGisJtQrmygY7etvFuJgEl9CQciinOY4Ptqp1NpICO4FhZLZ7m7DD1g8f6Eo3WAWx8jUG4nfw==
X-Received: by 2002:a17:90b:3bc8:b0:2ef:e0bb:1ef2 with SMTP id 98e67ed59e1d1-2f83ac0230cmr8350370a91.19.1738215593217;
        Wed, 29 Jan 2025 21:39:53 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net. [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489b01besm594057a91.19.2025.01.29.21.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 21:39:52 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH v2] meta-oe: libspdm: Initial support for libspdm
Date: Thu, 30 Jan 2025 15:39:40 +1000
Message-ID: <20250130053941.1680181-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 05:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115147

libspdm is DMTF's Reference Implementation of SPDM, it's a library that
can be used to implement a SPDM requester or responder in userspace.

This patch adds support for building libspdm, which can then be used to
build applications depending on libspdm.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-support/libspdm/libspdm_3.6.0.bb  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
new file mode 100644
index 0000000000..5f51730d12
--- /dev/null
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
@@ -0,0 +1,72 @@
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
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


