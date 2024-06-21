Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C7AC2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:03:48 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.69434.1718964220775000349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfeMd6zx;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f21ff4e6dso254667366b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 03:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718964218; x=1719569018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oen0ypMdL0zE7C8DjVINZMC9vwWt2ZSSc9SJS6WVuoY=;
        b=DfeMd6zxgVf3bKFtQ+j7QSdN89uWGPAs9Y5EboJXApO9/f+iJGFuoht5t3Ph7kn5D7
         nkqZMHzdyPkH11Z2anon50nmQ6VUxewuU+aWqMJLRh2Afjrkhx2RkNllldDxGP/+WdXZ
         QL9uBq/lXPBV0W+LYLBriAqjxyyqFETsKEJnnj3n8H6YOmsswOV9FT5YjK18sSRX35Sa
         OhZtYSiYmCSjqRBJsJtvkD/la53Dy2ezZsRXBQViXuPg1SluxZZ9e241Kh9a8vT0GBmf
         WcoUzcJglg1T8nufc8QvkojctmoutKvvR/Wpx1EfasY7L+dJqNDeGxA4mW3DWzM5mNjH
         mnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718964218; x=1719569018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oen0ypMdL0zE7C8DjVINZMC9vwWt2ZSSc9SJS6WVuoY=;
        b=i50o/KiDFszMxDRrpf+VbwupR6RlDfa1xgGmPl6aGNYFhD3uTneUd0ZS/m5b/BVX91
         tjOXNtooCavv7SHLnNAhqZEppWmmws1YhRPBg+QP7YnhZOsnBiszvP3LsneoUTFaxImT
         wBIUthUd5MWOxd19okdS2mzCSPeO5jqYTAKL1dMt8GsR7srZtGM0SpBI5xztNOtSovfn
         p0AIgQ+eLnlhnyPBdtur21KmAWQdshHIxYQU3FfRBsDIcESUPoXUFbZxbmDfvxcJbjmp
         LvV2rMfU7DEpMKbhW6F4dMa8PW9MuQKrxuN+sOiFKOT3LVfwCvm4SPw68vDaUCuQs1rs
         TnaA==
X-Gm-Message-State: AOJu0YxTv5EhHQS4sx+1zhTZ4T2wJpBo1g1l0oX8ZXhnPRZt0CjFEhZf
	Jo73Pi/kP+0cnqX8z8DwdPf4CEUdLrSMLodwqiAav7E5/Qr2xnYquovg9DwP
X-Google-Smtp-Source: AGHT+IG343sutEQME1QKd4Lu8CJxpWuyP4FmI7KAl5d/zShnqfZWlAGGdgQ6lwT/49GUdLuBACKgRQ==
X-Received: by 2002:a17:907:a587:b0:a6f:ac90:754d with SMTP id a640c23a62f3a-a6fac907737mr509602966b.29.1718964218141;
        Fri, 21 Jun 2024 03:03:38 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf5603a8sm66048066b.154.2024.06.21.03.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:03:36 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] recipes: set S to fix the QA warning
Date: Fri, 21 Jun 2024 13:02:44 +0300
Message-Id: <20240621100244.693838-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 10:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110987

Fix the warning by pointing S to ${WORKDIR}/sources and UNPACKDIR to ${S}. Since recent UNPACKDIR work, default S directory is not created anymore. By setting UNPACKDIR to S, S in indirectly created in do_unpack.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtool/android-tools/android-tools-conf_1.0.bb   | 3 +++
 .../recipes-devtools/android-tools/android-tools-conf_1.0.bb  | 3 +++
 .../recipes-extended/inputattach-config/inputattach-config.bb | 3 +++
 meta-oe/recipes-extended/zram/zram_0.2.bb                     | 3 +++
 .../gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb          | 4 ++++
 .../recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb    | 3 ++-
 meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb             | 4 +++-
 meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb   | 3 +++
 meta-oe/recipes-support/libusbgx/libusbgx-config.bb           | 3 +++
 9 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
index cb2ff672e..b98c70db7 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "file://android-gadget-setup"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
index f73be8dbb..abf21803e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "file://android-gadget-setup"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install() {
diff --git a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
index fb1aefad6..9bb2e2f1f 100644
--- a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
+++ b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
@@ -4,6 +4,9 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171d
 
 SRC_URI = "file://inputattach.conf"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
index 800dd6b7c..89292118d 100644
--- a/meta-oe/recipes-extended/zram/zram_0.2.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
@@ -17,6 +17,9 @@ SRC_URI = " \
            file://dev-zram0.swap \
 "
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_install () {
     # Install systemd related configuration file
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
index 1cfd9c1cb..c92976376 100644
--- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
@@ -5,8 +5,12 @@ it requires libxml2 and python 2 at the same time, which can no longer be satisf
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
                     file://${COREBASE}/meta/files/common-licenses/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"
+
 SRC_URI = "file://gnome-doc-utils.m4"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 PROVIDES = "gnome-doc-utils"
 
 do_install:append() {
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 5a8fe4c32..43b4614f0 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/OFL.txt;md5=969851e3a70122069a4d9ee61dd5
 SRC_URI = "http://levien.com/type/myfonts/Inconsolata.otf \
     file://OFL.txt"
 
-S = "${UNPACKDIR}/ttf-inconsolata-${PV}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 FILES:${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \
     ${datadir}/doc/ttf-inconsolata/*"
diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index 02a695218..4770fae50 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -20,6 +20,9 @@ SRC_URI += "\
             file://COPYING \
             "
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "libcap"
 
@@ -50,7 +53,6 @@ do_configure:prepend() {
 		cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
 	fi
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
-	cp -r ${UNPACKDIR}/COPYING ${S}
 }
 
 
diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index 90db08544..ece30a598 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -8,6 +8,9 @@ SRC_URI = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/
            https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
 SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_compile() {
     install -pm 644 ${UNPACKDIR}/ctapi-common.LICENSE LICENSE
     install -pm 644 ${UNPACKDIR}/ctapi-common.README README
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
index 4e9e6bcdf..c79dd092c 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
@@ -4,6 +4,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://usbgx.default"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
-- 
2.25.1


