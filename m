Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3299.1795042577965131989
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 14:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ensi-uma-tn.20260707.gappssmtp.com header.s=20260707 header.b=gyzEiZfk;
 spf=none, err=permanent DNS error (domain: ensi-uma.tn, ip: 209.85.218.48, mailfrom: ahmed.chrif@ensi-uma.tn)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5123794038so99169766b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 14:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ensi-uma-tn.20260707.gappssmtp.com; s=20260707; t=1795042576; x=1795647376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6cD1sxJcipIWTeiWqDUbBMMBYnK0mTQoNLaWe2S7Es=;
        b=gyzEiZfk7cJiJaspTF+gW3L2L4okjvfUywVMJ2Uu0FFyb9xh1iOoLFoZqGBHpFT6IR
         Qsvy5tAgGZmUUzsauIwQU6v8oENTvED8GA8Pm1VrLnK4AVyhTJPitdmZuOqmUFp5q9p+
         t0kk7BbuMwDlwa2MBZvDgE15DaTFjqZnO9jjTgzipSb6AKH1sZmIBmHh7xxtB06O75yY
         pyYeUreITJz3r8c7EEEex9HsQRB1t0aNJB6hY1Lf4em3WUV7ZEZbfnirHYjJdCdQI3Rx
         wU8FO4SRWSpmzOwxHodJBdr1IIvmlzXiuKxAYUAb0nVW4zULaYf8r8ETnuCEeBwbn7gU
         jguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795042576; x=1795647376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6cD1sxJcipIWTeiWqDUbBMMBYnK0mTQoNLaWe2S7Es=;
        b=E6m3C8nCsNsk4S5/JvphrXVXxxpUCX2lGSQGJD8getkO0K62k4MLq4ZiyRE/CrH7yX
         ZWlqGODtR5NmEaIXN4059d1yxEbwEffZbnOPjmPFDbpkidaoT+GvRj8AwuHVxECuEPmI
         fbkmik9ixW9xnL7lVERczx/oGnm6HA9IqGkIOs5P96a4/fuMHP6JT2IQVXU/Y9eA2u/8
         PKl4xdN8DYnS3FpJ5lKzYyT7gMDp5MXmOEeJN430hBI59NdJZv7WCrBNEU5A+Ob7Az04
         mdpyxLwChTIE7TFLbyxbaoiiPrcz0Z5U0Y/S2xlNSO1/hnaxN1jTn5pKOqZ0fcBEwljK
         WrBA==
X-Gm-Message-State: APuU4Z9+J2ZXwlMYprT9fomAR6phbqvLAfrhlBFRatSsE+CJzCzDyCkd
	5iLVt5taSxIiN4zsHZIu/BrmpvXaB1GNaZ3zmcVDFIQYvrcx4kLHl4d7ysNnU24eK53CnbHZ2gV
	jRBcA2QQ=
X-Gm-Gg: AYBFou3ahDzm0CUaX9vDemp7rHD1NRn/wfMuuD9pfS+mTi0EyfcSOh3jP/6I9DRP79E
	fu5v6bESgIJ5UxhUgzJlQb+eEtiy9SH3QvbrkHJwD53cAPGsg+GbqKvZ6JqFqv615LNjZyblLcG
	+ET7rdatCsvkvU6c49u3EvHoW3nf4a6wwnH6u1b6jczQtKIjAU9YtfPH4+nvdk4SADUeswWdFGr
	dCNGxZb9Ngl1pvUot4+AgkxmQ1CkIshaXh1YLysyrv+P/P2VFD5C4Bs4RTbXkjciifQXt5/ey5P
	OBNBiIUwvdB+edJi+Juqhyr3KvEBX44X17ada0y4xwZhDXM5JP7mz0SvwApdLozbYZyGrzL3ZiJ
	OwvzfkpCJ1Hy9/qdr2xPIk9QPMilwUIxmk1SvX1QKQ5uigVfoc555/7d8LamNHC8QUH42FxY9Bz
	1AsjhWZQ8q7jxnxIk8Rt112Y/bzR5NDSV7lQ/WYjM4DcEGOpN8uqgkeijr51rO1gW7rg01WTQKk
	tHFbWi/pOgdrz9/fgu62nuqInLz7lL3sRSgu+evKXHH2Rh2ZChlBDpo102DG/g5dgeg/oZXgY6z
	CxqmwWaxXm+jYiX9VYlItVEQq7FkfjEiUU5IoEKfLQhZgNC8odMFcY439odA+nWNjsDbBr/B3DX
	G3GUmo8/UBz3HAeaWErL+iA1VRhguL8AeX6AgtNywkpOaNujQUNXfU6ZlPeKGL6UBlp4=
X-Received: by 2002:a05:600c:3ac5:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb7da0f7e5mr81218625e9.5.1795042245315;
        Wed, 18 Nov 2026 14:50:45 -0800 (PST)
Return-Path: <ahmed.chrif@ensi-uma.tn>
Received: from localhost.localdomain ([2c0f:f698:c503:350:e6a9:9151:4aaf:d5ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e580745sm57680155e9.2.2026.11.18.14.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:50:44 -0800 (PST)
From: Ahmed Chrif <ahmed.chrif@ensi-uma.tn>
To: openembedded-devel@lists.openembedded.org
Cc: Ahmed Chrif <ahmed.chrif@ensi-uma.tn>
Subject: [meta-oe][PATCH] classes: add a systemd-confext image class
Date: Wed, 18 Nov 2026 23:50:22 +0100
Message-ID: <20261118225022.70660-1-ahmed.chrif@ensi-uma.tn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 23:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132663
Content-Type: text/plain; charset="utf-8"

Add a class to build systemd-confext images, the /etc counterpart of
sysext-image. It installs /etc/extension-release.d/extension-release.<name>
with the ID/VERSION_ID fields that systemd-confext matches against the host
os-release, so the image can be merged over /etc at runtime. The image type
is left to IMAGE_FSTYPES (e.g. squashfs, erofs or ddi).

This allows configuration to be shipped and updated independently of the OS
and of sysext application images on systems with a read-only rootfs.

Tested: squashfs confext images built with this logic and merged with
systemd-confext on a Jetson Orin Nano (systemd 258.1) in a downstream
Yocto distro.

AI-Generated: Uses Claude
Signed-off-by: Ahmed Chrif <ahmed.chrif@ensi-uma.tn>
---
 meta-oe/classes/confext-image.bbclass | 92 +++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 meta-oe/classes/confext-image.bbclass

diff --git a/meta-oe/classes/confext-image.bbclass b/meta-oe/classes/confext-image.bbclass
new file mode 100644
index 0000000000..c4b2622b9b
--- /dev/null
+++ b/meta-oe/classes/confext-image.bbclass
@@ -0,0 +1,92 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Configuration extension images may - dynamically at runtime - extend the
+# /etc/ directory hierarchy with additional files. This is particularly
+# useful on immutable system images where /etc/ resides on a read-only
+# file system, or is only writable via an overlay, and shall be extended
+# at runtime without making any persistent modifications to the base OS.
+# This is the /etc/ counterpart of the sysext-image class, which extends
+# /usr/ and /opt/.
+
+## Example usage:
+# confext-image-example.bb
+#SUMMARY = "An example image to showcase a configuration extension image."
+#LICENSE = "MIT"
+#inherit confext-image
+#IMAGE_FSTYPES = "squashfs"
+#IMAGE_FEATURES = ""
+#IMAGE_LINGUAS = ""
+#IMAGE_INSTALL = "my-config-package"
+#
+## After building, the resulting 'confext-image-example*.confext.squashfs'
+# can be deployed to an embedded system and 'merged' into the OS by
+# following steps:
+## 1. place a symlink into the systemd-confext image search path:
+# $> mkdir /run/confexts
+# $> ln -s /tmp/confext-image-example.confext.squashfs /run/confexts/example.raw
+## 2. list all available extensions:
+# $> systemd-confext list
+## 3. and enable the found extensions:
+# $> SYSTEMD_LOG_LEVEL=debug systemd-confext merge
+#
+# Any image type usable by systemd-confext can be selected through
+# IMAGE_FSTYPES, e.g. "erofs", or "ddi" with 'inherit discoverable-disk-image'
+# and REPART_DDI_TYPE = "confext".
+# Note: squashfs/erofs need xattr support in the kernel
+# (CONFIG_SQUASHFS_XATTR / CONFIG_EROFS_FS_XATTR) for the
+# 'user.extension-release.strict' attribute set below to be preserved.
+
+# Note: PACKAGECONFIG:pn-systemd needs to include 'sysext', which also
+# provides systemd-confext.
+
+# systemd-confext [1] has a simple mechanism for version compatibility:
+# the extension to be loaded has to contain a file named
+# /etc/extension-release.d/extension-release.NAME
+# with "NAME" part *exactly* matching the filename of the extensions
+# raw-device filename.
+#
+# From the extension-release file the "ID" and "VERSION_ID" fields are
+# matched against same fields present in `os-release` and the extension
+# is "merged" only if values in both fields from both files are an
+# exact match.
+#
+# Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-confext.html
+
+inherit image
+
+# Include '.confext' in the deployed image filename and symlink
+IMAGE_NAME = "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}.confext"
+IMAGE_LINK_NAME = "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}.confext"
+EXTENSION_NAME = "${IMAGE_LINK_NAME}.${IMAGE_FSTYPES}"
+
+# Base extension identification fields
+EXTENSION_ID_FIELD ?= "${DISTRO}"
+EXTENSION_VERSION_FIELD ?= "${DISTRO_VERSION}"
+
+confext_image_add_version_identifier_file() {
+    # Use matching based on Distro name and version
+    echo 'ID=${EXTENSION_ID_FIELD}' > ${WORKDIR}/extension-release.base
+    # os-release.bb does "sanitise_value(ver)", which needs to be done here too
+    echo 'VERSION_ID=${EXTENSION_VERSION_FIELD}' \
+        | sed 's,+,-,g;s, ,_,g' \
+        >> ${WORKDIR}/extension-release.base
+
+    # Instruct `systemd-confext` to perform re-load once extension image is verified
+    echo 'EXTENSION_RELOAD_MANAGER=1' >> ${WORKDIR}/extension-release.base
+
+    install -d ${IMAGE_ROOTFS}${sysconfdir}/extension-release.d
+    install -m 0644 ${WORKDIR}/extension-release.base \
+        ${IMAGE_ROOTFS}${sysconfdir}/extension-release.d/extension-release.${EXTENSION_NAME}
+
+    # systemd-confext expects an extension-release file of the exact same name as the image;
+    # by setting a xattr we allow renaming of the extension image file.
+    # (Kernel: this requires xattr support in the used filesystem)
+    setfattr -n user.extension-release.strict -v false \
+        ${IMAGE_ROOTFS}${sysconfdir}/extension-release.d/extension-release.${EXTENSION_NAME}
+}
+
+ROOTFS_POSTPROCESS_COMMAND += "confext_image_add_version_identifier_file"
-- 
2.43.0

