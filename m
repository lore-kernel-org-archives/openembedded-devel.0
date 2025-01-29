Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BB3C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 03:36:23 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.5317.1738121777878829908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 19:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DQLJWlOi;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21669fd5c7cso113592165ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 19:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738121777; x=1738726577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VW3irBp2Nu2AMYAMdigNVMdKeQFDK2FtySclXyWGsZA=;
        b=DQLJWlOiCt03iQYW0Gu+Yw1dtvZU50vZveJHEJL6B//F13zsixY86n6acH3QFfmJqG
         IwHzYGoE+xcWvqxvpDum9dSQi5LapIBKIa1iX03rIxDmqVCzZtcYMAM/bEyD7LuJmId6
         3Uomn+Y57sDrNwyeh3hME27woQucqRFYQ8gM2tQYXTb70zBLehDRQGYdRHMMdm64xjDQ
         N7ZPaxA/theaZ02ehMXP0F4PYMRr5Vsya3zmeNfmSoUQF+Hks7FyZ/47vXitYnTEQ/be
         tlUltUdnaPks8dMhGPTEVlemoABa8/DD8MEel4h/ecHdADgj9sJG6z73BB8V7LYc/0Hs
         Rdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738121777; x=1738726577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW3irBp2Nu2AMYAMdigNVMdKeQFDK2FtySclXyWGsZA=;
        b=uIrUZAqdVWXomG/FJarm1Mq+LZC74SprCXoze9YYv6KgdfHQJnsaerKHabooFHFK1b
         3CWQBQJ4dS25DPz2/thHImP/WeGXcQ12c4xHFScIHH1PQp2GRLz6Vjgjmaqy+RKtwb9D
         JSoW74PDhc55JPZtN/j9DyKT3skUvnCmHR7mTGYfLsYEzttXAXB0DXxBBlC/LJSCr8IK
         4FspYKVoLUcOl9EFJakzuiOkBOlPi73TTdpPdTeb1cEu+bNXC5vM5JgqG6zYnuloTHJw
         4xnj5PO90GlKxnFpErnA9hGwfrS4s6mslaaOPvk3RuRmO+DEI2F9VuatGW4nPvvfDFYZ
         7vGw==
X-Gm-Message-State: AOJu0YzWYhTc91lquKrvWQAy6J7K2TThpI05aXlnLWlZ6OR/PGm6+JIh
	DQh3zaVf8dKue/cNaBkMb/lNNP6nlTs9nhc2tQ8nAqwKJVm36GBGvLmSIg==
X-Gm-Gg: ASbGncuu7cMNzW3gctCGPW6O5gZIxoP2MxG9KXd/D7EwRSas+zPrVI3A55cJ+sDn2Dj
	7SfaMCNwPu0m1lZu9MWr6McQcdktr9JBfzkIiPsw/N2EiMLNwl4HRm9tjoKFLtDheFs3VaQcEuD
	ZdjO1ohcYdgLDQjiwbYV6qawIj49fxrCPOu9OQAaaI50/VeeDfsCb+9LDVv/WOSdFD06Oxsb5Iy
	gAJ7WXNHTMMWWCb2iPGMdP/3OMQVfctJNAbEv/9H0szDVg0ypM+O9TYCP8trwN5lSVoti38GC87
	OiDEl6WuWOivCDRIkVsm5je91cEWvwzs2VRIg/a2KnaYG0ijmPIkYMGk8EysAHMzQ1ID4sXVttg
	bdipopQAoCGdVGvPsXn6geBtmzeS4
X-Google-Smtp-Source: AGHT+IF6avKFglUgFvKRCaZcLtxboAEVyjr59KtWj1yydH1VeN/ci88hmcjGCm/KCugJCd1/CM9Veg==
X-Received: by 2002:a17:903:2f8e:b0:215:b75f:a1cb with SMTP id d9443c01a7336-21dd9fa74bcmr10427985ad.9.1738121776995;
        Tue, 28 Jan 2025 19:36:16 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net. [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414158csm89900335ad.150.2025.01.28.19.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 19:36:16 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH] meta-oe: libspdm: Initial support for libspdm
Date: Wed, 29 Jan 2025 13:36:04 +1000
Message-ID: <20250129033605.1635908-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 03:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115126

libspdm is DMTF's Reference Implementation of SPDM, it's a library that
can be used to implement a SPDM requester or responder in userspace.

This patch adds support for building libspdm, which can then be used to
build applications depending on libspdm.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-support/libspdm/libspdm_3.6.0.bb  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
new file mode 100644
index 0000000000..316cccebfc
--- /dev/null
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
@@ -0,0 +1,63 @@
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
+EXTRA_OECMAKE = "\
+    -DARCH=${TARGET_ARCH} \
+	-DTOOLCHAIN=NONE \
+	-DTARGET=Release \
+	-DCRYPTO=openssl \
+	-DENABLE_BINARY_BUILD=1 \
+	-DCOMPILED_LIBCRYPTO_PATH=${libdir} \
+	-DCOMPILED_LIBSSL_PATH=${libdir} \
+	-DDISABLE_TESTS=1 \
+	-DDISABLE_EDDSA=1 \
+	-DLINK_FLAGS=${STAGING_DIR} \
+	-DCMAKE_C_FLAGS='${LIBSPDM_CFLAGS}' \
+	"
+
+# PACKAGECONFIG ??= ""
+# PACKAGECONFIG[brotli] = "-Dbrotli=enabled,-Dbrotli=disabled,brotli"
+# PACKAGECONFIG[gssapi] = "-Dgssapi=enabled,-Dgssapi=disabled,krb5"
+# PACKAGECONFIG[ntlm] = "-Dntlm=enabled,-Dntlm=disabled"
+# PACKAGECONFIG[sysprof] = "-Dsysprof=enabled,-Dsysprof=disabled,sysprof"
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


