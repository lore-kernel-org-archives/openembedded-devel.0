Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A16CF53D8E
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 19:23:21 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59425.1773688999662623146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 12:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R5z9TF6l;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: danismostlikely@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ae222d87dso4567285d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 12:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773688998; x=1774293798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sg5eQYJ8lyfDql9FKccJiroJWgcJ0Uuv+UuamGz0XkM=;
        b=R5z9TF6lwXcp9f2fOjStAGr2Ouoxy4x4Eohy2tq6gNENSaVjSjDEQzCb/hOUs2coq9
         gIkjaxKEYHDoeQCedfPCbVrieKoXzyDtX4MXtpznZxuJdX2Q4zpldZ6p3U3b0bDjaDEw
         ws3FJvRirvwiuIWhV6s+/XFs2hg5TTD/ndwiw299zRhbV7rNtzqCYxDTHGdiSvyCqJZ9
         YurKPc8G1bDjR9lzarZkf5hAZJ8JaEkMtTqkrw9nIa7KlORsmkuh3+e2d/Ct8YO6ZaAI
         Y+o+FhVZicVPGzn2MdHtIUmFPQZfxvkS5aSqjLOTGdzjRYEqYxvSaIyp7+PM0yLfGqC0
         LdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773688998; x=1774293798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg5eQYJ8lyfDql9FKccJiroJWgcJ0Uuv+UuamGz0XkM=;
        b=lCTJBbhB+F145oYfpDt8XvWhEWy8vrOcyTBohgJFPeykTDAmOyhJBc0SC6HIMnMIgA
         NGxdNXEuD7BMGuOCi12RT0bZD7sfPg6fVjsdqBMuCkZfz5NUAVhSDEaoZhG1/QCt3Ggf
         PsQz8pReZNvadTA37jHUoWbFPV1fMSaBmUbgcxZm5HUnJcBbpcM6bEkWGWUXxXP0PPGC
         A65AskH6yDi7WgGAj7FlZ7pS0oI+8sDaTRS1Ks/CyJHIwCIk5AKatmJSCpEhb1w5g6Ji
         jPCemgUYl0LW+mtnWOcPtfRY05rX5viXwpwysmJ/XfdONA1SZcoVZ32m+6xXDjiQ/iDJ
         Ua5g==
X-Gm-Message-State: AOJu0YwKYDSnsugG1MlRi28DvvHMNvoobyze47/pIPCaEQbgq+ckHku2
	oQwcLu936d8FJn2941dm9Wn4DJreyCR7rXFapq2/jiOO/qZ3B9Z2RBtLoUSxpg==
X-Gm-Gg: ATEYQzypHP+vYRZHSF52CyA0hR2FRRONRhXtTQV/Kbq4zjFgceLxwAYEVUSHoOS5Vnv
	Vhn+ObWaYXGOS2sfhGwrlaPJTewQMSy4JOgP7Kavj9F8NPvjVPsYHHH/Fq/VbNbF20QwYyVN0yF
	nBxk1ZvyiwiAJ1adv9tXB17WirTmOQn3q67kF5CyfAynWmNu85PoOHLNg1uukA/vUbP4MahQHk4
	DR6Ote8kUflNNIAI7oIjYFe1ll5X21etO7M2y8kjhEuG3znQaIQufKmy/ISVZ/Ct+5NucaKT3wx
	mauxXsH9rstJu5ioKiqsW4DVm2Y1Ca5qNziRUWrRsPo5vckyv3499cnywVCOqV7qSZJWfNN90Yn
	MXe279KtlktsKybd+MS0jif/i0DyiXskvZC4fZSEACPkeJOmBXWK2iPu2eSwPDXhW7lCn7Stf6S
	NqtRWbthLO/nzwbtFFbKB5jdQwHbW7Oc2tP5o9d/MR2RfU7Ypits36+zX5+yjq4nHl9w==
X-Received: by 2002:a53:b1a3:0:b0:64c:b242:497e with SMTP id 956f58d0204a3-64e62f28029mr10270581d50.1.1773688998528;
        Mon, 16 Mar 2026 12:23:18 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a51580sm6046840d50.8.2026.03.16.12.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:23:17 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <danmcgr@protonmail.com>
Subject: [meta-oe][PATCH 1/2] libfido2-initial: new recipe
Date: Mon, 16 Mar 2026 13:22:48 -0600
Message-ID: <20260316192249.3950474-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 19:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125285

From: Dan McGregor <danmcgr@protonmail.com>

Use this recipe to break a circular dependency between libfido2 and
systemd when systemd's fido PACKAGECONFIG is enabled. systemd depends
on libfido2, and libfido2 depends on udev provided by systemd. However,
systemd only depends on the headers provided by libfido2 and its pkgconf
data. systemd uses only the datatypes provided, and opportunistically
enables fido support if libfido2 is found.

This recipe provides only the headers and pkgconf data. This is
sufficient to allow systemd to build support for libfido2.

It only works with a related change I've submitted to openembedded core.

Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
---
 .../libfido2/libfido2-initial_1.16.0.bb       | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb

diff --git a/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb b/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
new file mode 100644
index 00000000000..7d9838b003b
--- /dev/null
+++ b/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
@@ -0,0 +1,40 @@
+SUMMARY = "FIDO 2.0 support library"
+DESCRIPTION = "libfido2 provides library functionality and command-line tools to \
+communicate with a FIDO device over USB, and to verify attestation and \
+assertion signatures."
+HOMEPAGE = "https://developers.yubico.com/libfido2"
+LICENSE = "BSD-2-Clause"
+SECTION = "libs/network"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=20be19aaa222f71738712b26f7f8717b"
+
+SRC_URI = "https://developers.yubico.com/${BPN}/Releases/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "8c2b6fb279b5b42e9ac92ade71832e485852647b53607c43baaafbbcecea04e4"
+
+inherit nopackages
+
+PACKAGES = ""
+
+# The purpose of this recipe is to break a circular dependency between libfido2 and
+# systemd. libfido2 depends on udev (provided by systemd) to build, while systemd
+# depends on libfido2 if the fido feature is enabled. However, systemd doesn't
+# actually link against libfido2. It only needs the headers in place and a dummy
+# shared library. It opportunistically dlopens libfido2 if it's present, but
+# for that to work it needs the headers in place.
+# Just fake enough to make systemd happy, and have it RRECOMMEND the real libfido2.
+do_install() {
+    mkdir -p ${D}${includedir}/libfido2-initial/fido
+    mkdir -p ${D}${datadir}/pkgconfig
+
+    install -m 644 ${S}/src/fido.h ${D}${includedir}/libfido2-initial
+    install -m 644 ${S}/src/fido/* ${D}${includedir}/libfido2-initial/fido/
+
+    # Real libfido2 installs its pkg conf file in ${libdir}.
+    sed -e 's,@CMAKE_INSTALL_PREFIX@,${exec_prefix},' \
+        -e 's,@CMAKE_INSTALL_LIBDIR@,${baselib}/libfido2-initial,' \
+        -e 's,@FIDO_VERSION@,${PV},' \
+        -e 's,@PROJECT_NAME@,${BPN},' \
+        -e '/^Cflags/s,$,/libfido2-initial,' \
+        ${S}/src/libfido2.pc.in > ${D}${datadir}/pkgconfig/libfido2.pc
+
+}

