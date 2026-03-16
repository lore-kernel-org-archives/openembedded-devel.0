Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDD4F506FF
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:30:32 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63472.1773700226163681888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 15:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NC98Yhrf;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: danismostlikely@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad9238d8fso5777082d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 15:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773700225; x=1774305025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sg5eQYJ8lyfDql9FKccJiroJWgcJ0Uuv+UuamGz0XkM=;
        b=NC98YhrfyQgHQkust1Htg+33wd7B1GA03GgSSorauAh5e4Zji2lNEdcsmXx9+p2Ax9
         ghRf3RzxduECXnJh8/ZF/SUwpQAnppK+1m7CjdYo0+zSRy75effX5lZkV7zZWGKq50nm
         509q6GgZLdBYduf98DA7xffq21If91DVGmRQqZ3+U38UTvz5YsiTB052yFUFke5EP85a
         n3RKXg2DISN6k9qkdmV+uY4DzWYvW0XpfBxo0YRck9NKurenCNUY6KKiVS4OEbrB4vrK
         sAjnbZ9CY4L9dJMqcdFkdPg7WTrJ8Xg2HDniC4edlVSR1T+R3j/OnbOLZddZh8t3HYID
         uYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700225; x=1774305025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg5eQYJ8lyfDql9FKccJiroJWgcJ0Uuv+UuamGz0XkM=;
        b=X0rsAIChwaQEL5Z4Obx2n59NzMhDkbqvm/s6J6p42iH7uvH+/m705Y4OeHWvhSzfHa
         +grgLzVekqljjjOSLrkKgYLxxPRWcrSoMzbQ8w0y+3XrWx2gc+Vr6N66bMkWz24M2QQx
         kwH/oYJp7Oi43iCSv0FN8Wu6OzYgmTK8zQoIVMp+zVmVPfIXniX/N2esp0yPDrIBu8Gp
         waN2/IntTXXtA8izMXAAdl/9AKYmRHUgYTxPTSo4SCJZ4eV7WPfAeNvWKHXQKO9U4XPa
         +OK/Zbvo1CcGV1SKdi5m6oJcD7XcT8Dmn0Xushgpr3AOkvdr58j/iWX9qNAwEYtr8rZY
         mRKQ==
X-Gm-Message-State: AOJu0YzvXuVAVYIPMaxbaYE2R85wLQWjqbmmiW5k1G0WPcrVBo9MDm+9
	jfbnm4CFMunkSu/r8GtEPOIDILKloYVdKA2UtHs6R9dbil0f+1Y60GjQ2quJkw==
X-Gm-Gg: ATEYQzwAB2a4aY/HwNFq4Htih5IIyMs0w/jBIrzrWsa8sc1u3KB1Lx7+h6FrXxwKEh4
	yd6NKyOF2w4doQm83RXxMACMSuzp/Apx6oJMHHjpoYm/Tytf0BbXvUfe5d1MtriXUGxfXbyBg0p
	2enHlAP8ZcQmKi9rK6d6IIPw21WFMLOyUXh6RskfxnEVctImd6AiaEkYBbWKVJs57WTJGJXEyZM
	5TYRiLcWgXHpNrHBrZ8zd8cFOSoG6trww+Kg5MWOQgT4LzQxGnYDFjLpyi5VrbeuzEuW1oAmAWe
	Fp0gn4z0wADIHXDRg4yHmmrLU4ufv9Is23YHbrmb513V+5uoAFuAtcRT0Lry3Ks8Mns/eqWCMnn
	YkaWQOwlJxtZQBHFrQaDRBetr69FfzzQeE13L3urp11i7sCe8hO2iEwvLfaZPvcrS9vwNZ6C1LF
	x3hNeW021GhC3jQe+jNCYzOGw3nKoLW11La0DMEp9bMIgm4vH4DaY35b4=
X-Received: by 2002:a53:bbca:0:b0:649:e294:a380 with SMTP id 956f58d0204a3-64e62fa3960mr10128547d50.37.1773700224911;
        Mon, 16 Mar 2026 15:30:24 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b636d3sm6353140d50.17.2026.03.16.15.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:30:24 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <danmcgr@protonmail.com>
Subject: [meta-oe][PATCH v2 1/2] libfido2-initial: new recipe
Date: Mon, 16 Mar 2026 16:30:13 -0600
Message-ID: <20260316223014.56293-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125293

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

