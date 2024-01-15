Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19559C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 11:50:06 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.77550.1705319397074483950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 03:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+4RS+aK;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso11554514e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 03:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705319395; x=1705924195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BBus30gvnHPF2alU4m5ZedPEeV/gSRLh2GEm/+hme0=;
        b=f+4RS+aKNrQ3Si9/AV9Kuik9JQN6A/yKyfMhMMTWSoVktYehSfz2EiTS4XhZ7Hw5N5
         4kjqFoMYxfGFp2rM38KWuWlyVijeePEwopWFMFKASz0wr/OeFTN5vOw7Y45dB4sRO4wl
         5ZSoj8nLYXeENewEh/LBuWstvr1PMj/Lwpeud3f+NMH4KTfI/7XLLr546OMMN3xshhvg
         ow3urLIbML96QL1zvLqnFUSr+RHlzhoj3F+tHOFBKmXsen7BlX55ET/6j+CZtMa9dZFw
         IxtzwpAE6qLDHpycnywTbueIpOuEzH+z0rUSGCedEGvERGvvDuIXuWa9j27Sf4RBmAhf
         3mIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705319395; x=1705924195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BBus30gvnHPF2alU4m5ZedPEeV/gSRLh2GEm/+hme0=;
        b=D+STn8U9zZDsSmtKtFuOw4KrZqhQdF2haocLrHjndjarxZbn2do6K22mI8/pL/qjX7
         vW416cIvJGTuAD6c0SYj4SOQekY6BGqkGRLXodHMIzUbB75TqFAp6esZxdk3CLPYw/le
         cZxaY2AyA5B8CdbxF+c9OKrkZC0WNaOZdw6By+6yE24AczvmsUWPeS8Nibh+okU9lK/4
         REyNMbyzHUMhJq7+NLR7OtLZGSjbdfJ/Dd7brqJDtN08rUTyFT8jGsUwqPpr9gf5kk6p
         jo+6FxM5uHeFaWt307gcpICbYDjh14K1UVEFdBHDjHCqzZl9d2pNfwFwyxjfKi/X/B4t
         WEaw==
X-Gm-Message-State: AOJu0YwgEjIyiucm/ZpY3rf9YlFYX5h7PPW/vs88ZLbF8/JRs3dYvUcL
	tiRHPkxd8HefYlfm7+Urkg8/vH2+pvU20A==
X-Google-Smtp-Source: AGHT+IGCvgLRhoLONPbGkgq0EsmlfRoWvkB5KSWDzyx/M1Fp2cA4oCDBNIi9FFXnnDmPHi7qTdXK8w==
X-Received: by 2002:a05:6512:3d12:b0:50e:8e98:c25c with SMTP id d18-20020a0565123d1200b0050e8e98c25cmr3403149lfv.70.1705319394206;
        Mon, 15 Jan 2024 03:49:54 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id lb7-20020a170906adc700b00a2a4bd50588sm5256393ejb.147.2024.01.15.03.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:49:53 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCHv2] gerbera: upgrade 1.12.1 -> 2.0.0
Date: Mon, 15 Jan 2024 14:49:20 +0300
Message-Id: <20240115114920.751423-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 11:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108284

* 0001-Fix-build-against-fmt-10.patch dropped because fixed in the new version
* Expat dropped from DEPENDS because has been replaced with pugixml at version 1.5.0
* Required dependencies updated and added to DEPENDS
* Optional packages added and those enable by default have been enabled.

Changelog:

NEW Features

    Staged importing that allows updating the virtual layout instead of deleting and recreating it each time (import-mode="grb")
    Config options as command line arguments (--set-option OPT=VAL with --print-options)
    Allow configuration of follow-symlinks per autoscan directory
    Configuration of containers in virtual layout: title can be changed, some nodes can be disabled
    New mode of loading Javascript plugins with cleanup of global variables
    Generation of example configuration via command line option --create-example-config
    Case insensitive sorting for databases
    New config options for URL handling and host redirection
    Use .nomedia to hide directory, incl. config option
    Support for UPnP commands GetFeatureList and GetSortExtensionCapabilities
    Build for Ubuntu 23.04 and 23.10

FIXES

    Autoscan: Keep track of renamed directories
    Docker: add JPEG and update description
    Runtime issues in request handling
    Configurable handling of HOME directory
    Transcoding: parsing issue of requests
    Stability for sqlite database access
    Browsing on Samsung devices

Code Improvements

    Update Javascript libraries
    Update versions of googletest (1.14), pupnp (1.14.18), libexiv2 (v0.28.1), libebml (1.4.5), fmt (10.2.0), pugixml (1.14), spdlog (1.12.0) and taglib (1.13.1)
    Compatibility with gcc14

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 Unlike v1, magic(libmagic) and js(duktape) packageconfigs have been added. Also, libmagic is part of 'file'.
 According to this https://github.com/gerbera/gerbera/blob/v2.0.0/CMakeLists.txt#L29 packageconfigs that should be activated have been activated.

 .../0001-Fix-build-against-fmt-10.patch       | 168 ------------------
 .../gerbera/gerbera_1.12.1.bb                 |  31 ----
 .../gerbera/gerbera_2.0.0.bb                  |  30 ++++
 3 files changed, 30 insertions(+), 199 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-against-fmt-10.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera_1.12.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera_2.0.0.bb

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-against-fmt-10.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-against-fmt-10.patch
deleted file mode 100644
index 2da98cfcf..000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-against-fmt-10.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-From 2c08724e8a7e3a0ee8cdd91246a714a17f2ba5c1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 May 2023 17:31:56 -0700
-Subject: [PATCH] Fix build against fmt 10+
-
-Fixes
-git/src/config/setup/config_setup_vector.cc:191:9:   required from here
-| /home/hains/openpli-dm920-python3/build/tmp/work/cortexa15hf-neon-vfpv4-oe-linux-gnueabi/gerbera/1.11.0-r0/
-recipe-sysroot/usr/include/fmt/core.h:1691:7: error: static assertion failed: Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
-|  1691 |       formattable,
-|       |       ^~~~~~~~~~~
-
-Source: https://github.com/Hains/openpli-dm920-python3/commit/688ae121bd3928925a8656bd4aaf3857d8e8a8ed
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/config/setup/config_setup_array.cc       | 6 +++---
- src/config/setup/config_setup_autoscan.cc    | 2 +-
- src/config/setup/config_setup_client.cc      | 2 +-
- src/config/setup/config_setup_dictionary.cc  | 6 +++---
- src/config/setup/config_setup_dynamic.cc     | 2 +-
- src/config/setup/config_setup_transcoding.cc | 2 +-
- src/config/setup/config_setup_tweak.cc       | 2 +-
- src/config/setup/config_setup_vector.cc      | 4 ++--
- 8 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/src/config/setup/config_setup_array.cc b/src/config/setup/config_setup_array.cc
-index 8f3cf1db..efc9b501 100644
---- a/src/config/setup/config_setup_array.cc
-+++ b/src/config/setup/config_setup_array.cc
-@@ -136,11 +136,11 @@ std::vector<std::string> ConfigArraySetup::getXmlContent(const pugi::xml_node& o
-     std::vector<std::string> result;
-     if (initArray) {
-         if (!initArray(optValue, result, ConfigDefinition::mapConfigOption(nodeOption))) {
--            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue);
-+            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue.value());
-         }
-     } else {
-         if (!createOptionFromNode(optValue, result)) {
--            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue);
-+            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue.value());
-         }
-     }
-     if (result.empty()) {
-@@ -149,7 +149,7 @@ std::vector<std::string> ConfigArraySetup::getXmlContent(const pugi::xml_node& o
-         result = defaultEntries;
-     }
-     if (notEmpty && result.empty()) {
--        throw_std_runtime_error("Invalid array {} empty '{}'", xpath, optValue);
-+        throw_std_runtime_error("Invalid array {} empty '{}'", xpath, optValue.value());
-     }
-     return result;
- }
-diff --git a/src/config/setup/config_setup_autoscan.cc b/src/config/setup/config_setup_autoscan.cc
-index e882ca3e..d773419b 100644
---- a/src/config/setup/config_setup_autoscan.cc
-+++ b/src/config/setup/config_setup_autoscan.cc
-@@ -203,7 +203,7 @@ std::shared_ptr<ConfigOption> ConfigAutoscanSetup::newOption(const pugi::xml_nod
- {
-     auto result = std::vector<AutoscanDirectory>();
-     if (!createOptionFromNode(optValue, result)) {
--        throw_std_runtime_error("Init {} autoscan failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} autoscan failed '{}'", xpath, optValue.value());
-     }
-     optionValue = std::make_shared<AutoscanListOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_client.cc b/src/config/setup/config_setup_client.cc
-index 30bb98cb..56be9c53 100644
---- a/src/config/setup/config_setup_client.cc
-+++ b/src/config/setup/config_setup_client.cc
-@@ -163,7 +163,7 @@ std::shared_ptr<ConfigOption> ConfigClientSetup::newOption(const pugi::xml_node&
-     auto result = std::make_shared<ClientConfigList>();
- 
-     if (!createOptionFromNode(isEnabled ? optValue : pugi::xml_node(nullptr), result)) {
--        throw_std_runtime_error("Init {} client config failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} client config failed '{}'", xpath, optValue.value());
-     }
-     optionValue = std::make_shared<ClientConfigListOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_dictionary.cc b/src/config/setup/config_setup_dictionary.cc
-index eb91c694..ea2aaa05 100644
---- a/src/config/setup/config_setup_dictionary.cc
-+++ b/src/config/setup/config_setup_dictionary.cc
-@@ -162,11 +162,11 @@ std::map<std::string, std::string> ConfigDictionarySetup::getXmlContent(const pu
-     std::map<std::string, std::string> result;
-     if (initDict) {
-         if (!initDict(optValue, result)) {
--            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue);
-+            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue.value());
-         }
-     } else {
-         if (!createOptionFromNode(optValue, result) && required) {
--            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue);
-+            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue.value());
-         }
-     }
-     if (result.empty()) {
-@@ -175,7 +175,7 @@ std::map<std::string, std::string> ConfigDictionarySetup::getXmlContent(const pu
-         result = defaultEntries;
-     }
-     if (notEmpty && result.empty()) {
--        throw_std_runtime_error("Invalid dictionary {} empty '{}'", xpath, optValue);
-+        throw_std_runtime_error("Invalid dictionary {} empty '{}'", xpath, optValue.value());
-     }
-     return result;
- }
-diff --git a/src/config/setup/config_setup_dynamic.cc b/src/config/setup/config_setup_dynamic.cc
-index 6a43b820..93030b85 100644
---- a/src/config/setup/config_setup_dynamic.cc
-+++ b/src/config/setup/config_setup_dynamic.cc
-@@ -179,7 +179,7 @@ std::shared_ptr<ConfigOption> ConfigDynamicContentSetup::newOption(const pugi::x
-     auto result = std::make_shared<DynamicContentList>();
- 
-     if (!createOptionFromNode(optValue, result)) {
--        throw_std_runtime_error("Init {} DynamicContentList failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} DynamicContentList failed '{}'", xpath, optValue.value());
-     }
-     optionValue = std::make_shared<DynamicContentListOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_transcoding.cc b/src/config/setup/config_setup_transcoding.cc
-index 4827f109..c353ce1f 100644
---- a/src/config/setup/config_setup_transcoding.cc
-+++ b/src/config/setup/config_setup_transcoding.cc
-@@ -492,7 +492,7 @@ std::shared_ptr<ConfigOption> ConfigTranscodingSetup::newOption(const pugi::xml_
-     auto result = std::make_shared<TranscodingProfileList>();
- 
-     if (!createOptionFromNode(isEnabled ? optValue : pugi::xml_node(nullptr), result)) {
--        throw_std_runtime_error("Init {} transcoding failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} transcoding failed '{}'", xpath, optValue.value());
-     }
-     optionValue = std::make_shared<TranscodingProfileListOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_tweak.cc b/src/config/setup/config_setup_tweak.cc
-index d7692c09..72c2beb2 100644
---- a/src/config/setup/config_setup_tweak.cc
-+++ b/src/config/setup/config_setup_tweak.cc
-@@ -242,7 +242,7 @@ std::shared_ptr<ConfigOption> ConfigDirectorySetup::newOption(const pugi::xml_no
-     auto result = std::make_shared<DirectoryConfigList>();
- 
-     if (!createOptionFromNode(optValue, result)) {
--        throw_std_runtime_error("Init {} DirectoryConfigList failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} DirectoryConfigList failed '{}'", xpath, optValue.value());
-     }
-     optionValue = std::make_shared<DirectoryTweakOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_vector.cc b/src/config/setup/config_setup_vector.cc
-index c8ff853d..91f99ca4 100644
---- a/src/config/setup/config_setup_vector.cc
-+++ b/src/config/setup/config_setup_vector.cc
-@@ -180,7 +180,7 @@ std::vector<std::vector<std::pair<std::string, std::string>>> ConfigVectorSetup:
- {
-     std::vector<std::vector<std::pair<std::string, std::string>>> result;
-     if (!createOptionFromNode(optValue, result) && required) {
--        throw_std_runtime_error("Init {} vector failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} vector failed '{}'", xpath, optValue.value());
-     }
-     if (result.empty()) {
-         log_debug("{} assigning {} default values", xpath, defaultEntries.size());
-@@ -188,7 +188,7 @@ std::vector<std::vector<std::pair<std::string, std::string>>> ConfigVectorSetup:
-         result = defaultEntries;
-     }
-     if (notEmpty && result.empty()) {
--        throw_std_runtime_error("Invalid vector {} empty '{}'", xpath, optValue);
-+        throw_std_runtime_error("Invalid vector {} empty '{}'", xpath, optValue.value());
-     }
-     return result;
- }
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.12.1.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.12.1.bb
deleted file mode 100644
index 89cc51e0e..000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.12.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-Description = "Gerbera - An UPnP media server"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
-
-SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master \
-           file://0001-Fix-build-against-fmt-10.patch \
-           "
-
-SRCREV = "559e1d1a92f5977ce8cff7393aa85330dbf2d1d6"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "expat fmt spdlog pugixml libebml libmatroska zlib curl libupnp e2fsprogs sqlite3 libnsl2"
-
-SYSTEMD_SERVICE:${PN} = "gerbera.service"
-
-inherit cmake pkgconfig systemd
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=TRUE,-DWITH_SYSTEMD=FALSE,systemd"
-PACKAGECONFIG[taglib] = "-DWITH_TAGLIB=TRUE,-DWITH_TAGLIB=FALSE,taglib"
-EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE -DLIBUUID_INCLUDE_DIRS=${STAGING_INCDIR} -DLIBUUID_LIBRARIES=-luuid"
-
-do_install:append() {
-    install -d ${D}/root/.config/
-}
-
-FILES:${PN} += "/root/.config/"
-
-SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.0.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.0.0.bb
new file mode 100644
index 000000000..fea14fd84
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.0.0.bb
@@ -0,0 +1,30 @@
+Description = "Gerbera is a UPnP media server which allows you to stream your digital media through your home network and consume it on a variety of UPnP compatible devices."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
+
+SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master"
+SRCREV = "2f26e656b16fb86132f27d1f8d47c6055041430d"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp libnsl2"
+
+SYSTEMD_SERVICE:${PN} = "gerbera.service"
+
+inherit cmake pkgconfig systemd
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} curl taglib inotify exif matroska magic js"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=TRUE,-DWITH_SYSTEMD=FALSE,systemd"
+PACKAGECONFIG[taglib] = "-DWITH_TAGLIB=TRUE,-DWITH_TAGLIB=FALSE,taglib"
+PACKAGECONFIG[curl] = "-DWITH_CURL=TRUE,-DWITH_CURL=FALSE,curl"
+PACKAGECONFIG[inotify] = "-DWITH_INOTIFY=TRUE,-DWITH_INOTIFY=FALSE,inotify-tools"
+PACKAGECONFIG[avcodec] = "-DWITH_AVCODEC=TRUE,-DWITH_AVCODEC=FALSE,ffmpeg"
+PACKAGECONFIG[wavpack] = "-DWITH_WAVPACK=TRUE,-DWITH_WAVPACK=FALSE,wavpack"
+PACKAGECONFIG[exif] = "-DWITH_EXIF=TRUE,-DWITH_EXIF=FALSE,libexif"
+PACKAGECONFIG[exiv2] = "-DWITH_EXIV2=TRUE,-DWITH_EXIV2=FALSE,exiv2"
+PACKAGECONFIG[matroska] = "-DWITH_MATROSKA=TRUE,-DWITH_MATROSKA=FALSE,libebml libmatroska"
+PACKAGECONFIG[magic] = "-DWITH_MAGIC=TRUE,-DWITH_MAGIC=FALSE,file"
+PACKAGECONFIG[js] = "-DWITH_JS=TRUE,-DWITH_JS=FALSE,duktape"
+
+SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
-- 
2.25.1


