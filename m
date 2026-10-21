Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1137.1792543051299106724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 17:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m4C5DzOx;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-18cdcfc05ffso128775c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 17:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792543051; x=1793147851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiuYKJ4S2mmrnhG2OuZVHS+ClcwFdurFQUMSTnzuQ7Q=;
        b=m4C5DzOxBvdE+jrrMgw6vlTRB/Z2ydQQdIW9trBz9RmAoKQOntMlw2ytlUb2/o2lA2
         j0VshOc35AUIHnfCcVGJdACIjMOgeuQXGlceXBVQEcX/zLUsBlBBM879nBBhHDVdcfPz
         GRJWT9uTf8WOJI0cRjUyM+e9bjtTR2+bRp6PRpKvaJ/c3BKcPj/EGSdU45AgVBMCD5PZ
         0JbZAmZcgWoR4L3ki4DeT/VQt0o0wVXt59SGdb1dd0H2tGqO492L3CX/UTjssxlI3bbP
         n9OAVqX99ZyHbqu1ILIvmI8BYA+sNK3gGAmu9AHjI4D+Wx3gqE/Zfi+Art2o8Z4ZQCiy
         0u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792543051; x=1793147851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DiuYKJ4S2mmrnhG2OuZVHS+ClcwFdurFQUMSTnzuQ7Q=;
        b=07Ab7rQz9JU5wTbGYnc98JdJtRb3nJbCD6v9BKON5SnIGkm4NsI6KIVBqNpHs/XFzH
         BRSTFXZZjXo4f5kTOEB7kJrfTciEPKIayGFeZ9wcFjly69T4H0TlTgXYbbhbVS3FbdGZ
         B1KgMyvOFb+/klHwFfUYRvod0ajz5vfTK3bXanNBA2DVfJPaH/DRX/wHSpeqmxwikL11
         +GPwP/Vnc5225S+uc4/KuAYWp1N3KzGzTqxBHGnq/Vs10Q2ayCcPwuoJD2P5RjpMPGHU
         Ki027wazJpI46OcGJHP6Jo4+D8ayZdGWoIx8lpY5kp6fcZPRnxZSmYHDpuXdEgOJY/wC
         7VTA==
X-Gm-Message-State: AFq9FYJ+iDvFyYlgdVFwSZ92TexGSB3DScQ4cEQhV0tBCJQv2FAvaI/+
	A8hLcSTBuwOoCCQzO+f4h8U4AKOHFrENxrRhB8YuFfqZgHxZmP9sK0o3fXfZhg==
X-Gm-Gg: AYBFou3HbhoCYgJL91xMdTcdo/m8sQeehjlJc74BtSpCQTWzAZNTuH6s5RKoTx79JqP
	Uv5Qns2ZKx0wWcaJt2Twe/nHDUGMr49AcGbZBa9W+NCGvCHopiBBgksaoJrfoTWpO85ljIDgfx3
	wsUN5IDmNBio6J0mRHRMIXG4Nfh97KeEsJkFL9sfJwf5UNUbIdKLmjiQ0rSdLn2VL6xHwxjd0Xu
	Ej5TVGXn2bVAQzZA3/qhCPRdkYw/x7BTj6o+R+n0xG+GlSYDE9UV5CDi2OBqj6HfmSRbptO/6Dr
	2NAExvbPEt1k1oF3k9URJZWGcXTO1T1K68KwcfJthCdGdj8kxfGySBoUiuQvbcjL/PkYY2L9+MF
	tUjo54jDzHEoRovHPVaSLQVjzeSdzXkM4qFxmwhOf/CB9uoETuoCCjoWz5mZZhFgfRkZT4h/CzO
	rFBmVVqf7K3guNZdh6kuMUAS2+IPjcRvFHeqCnjseIF9jbpMYzVxQFmYCT34apsH4UU1pX8mwuE
	e/aDhGAJ3olhwpV9rUDcdww9cGTkb/kW7xN0WzEJKfUoXiAML32S+JbxIvlzi5MLMg+P4q8Bl+G
	AX0wgeKjdlxCb6pLYZ9QDmJM4T2n8Cw=
X-Received: by 2002:a05:7022:28f:b0:18d:5988:8d3 with SMTP id a92af1059eb24-190a109f74amr589263c88.3.1792543050446;
        Tue, 20 Oct 2026 17:37:30 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926fe9sm1648124c88.2.2026.10.20.17.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:37:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/5] bmap-writer: upgrade 1.0.5 -> 1.0.6
Date: Wed, 21 Oct 2026 13:37:15 +1300
Message-ID: <20261021003715.2982979-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
References: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 00:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131183
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are part of upstream version.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...p-writer_1.0.5.bb => bmap-writer_1.0.6.bb} |  4 +-
 ...-Honour-ImageSize-for-the-last-block.patch | 85 -------------------
 ...-library-s-ioctl-request-type-for-BL.patch | 50 -----------
 3 files changed, 1 insertion(+), 138 deletions(-)
 rename meta-oe/recipes-support/bmap-writer/{bmap-writer_1.0.5.bb => bmap-writer_1.0.6.bb} (80%)
 delete mode 100644 meta-oe/recipes-support/bmap-writer/files/0001-Honour-ImageSize-for-the-last-block.patch
 delete mode 100644 meta-oe/recipes-support/bmap-writer/files/0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch

diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.6.bb
similarity index 80%
rename from meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
rename to meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.6.bb
index 3aefaa436f..a11fc7ec75 100644
--- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.6.bb
@@ -9,10 +9,8 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e49f4652534af377a713df3d9dec60cb"
 
 SRC_URI = "git://github.com/embetrix/${BPN};branch=master;protocol=https;tag=${PV} \
-           file://0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch \
-           file://0001-Honour-ImageSize-for-the-last-block.patch \
            "
-SRCREV = "c7b1bec0f40217d17e315226552e461a4a816abc"
+SRCREV = "7662aad2fba224530c45afd511db9146dcb48ccf"
 
 DEPENDS = "libtinyxml2 libarchive"
 inherit cmake pkgconfig
diff --git a/meta-oe/recipes-support/bmap-writer/files/0001-Honour-ImageSize-for-the-last-block.patch b/meta-oe/recipes-support/bmap-writer/files/0001-Honour-ImageSize-for-the-last-block.patch
deleted file mode 100644
index 1943256d71..0000000000
--- a/meta-oe/recipes-support/bmap-writer/files/0001-Honour-ImageSize-for-the-last-block.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From e63a11dedcdece8b9b285485a86405fd258b37d8 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 29 Sep 2026 17:29:52 +0200
-Subject: [PATCH] Honour ImageSize for the last block
-
-bmaptool records the exact image size in ImageSize, and the last block
-of an image whose size is not a multiple of BlockSize is only partly
-filled. Writing and verifying used (endBlock + 1) * BlockSize as the end
-of every range, so the range containing that block asked for more bytes
-than the image has and the write failed with "Image ended before the
-block map did". Read ImageSize and clamp the end of each range to it.
-
-AI-Generated: Uses Claude Code (Claude Fable 5.1)
-Upstream-Status: Pending
----
- src/bmap.cpp         | 5 +++++
- src/bmap.h           | 1 +
- src/image_writer.cpp | 2 +-
- src/main.cpp         | 2 +-
- 4 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/bmap.cpp b/src/bmap.cpp
-index fabf2c2..0162ac0 100644
---- a/src/bmap.cpp
-+++ b/src/bmap.cpp
-@@ -135,6 +135,7 @@ int parseBMap(const std::string &filename, bmap_t& bmapData) {
-         bmapData.bmapVersion = (version != nullptr) ? trimWhitespace(version) : "unknown";
- 
-         // Parse image information
-+        bmapData.imageSize = requireChildUnsigned(p_root, "ImageSize");
-         bmapData.blocksTotal = requireChildUnsigned(p_root, "BlocksCount");
-         bmapData.blocksMapped = requireChildUnsigned(p_root, "MappedBlocksCount");
-         bmapData.blockSize = requireChildUnsigned(p_root, "BlockSize");
-@@ -200,6 +201,10 @@ int validateBmap(const bmap_t& bmap, uint64_t deviceSize) {
-         if (bmap.blocksTotal == 0) {
-             throw BmapError("BMAP: BlocksCount must not be zero");
-         }
-+        if (bmap.imageSize > bmap.blocksTotal * bmap.blockSize ||
-+            bmap.imageSize <= (bmap.blocksTotal - 1) * bmap.blockSize) {
-+            throw BmapError("BMAP: ImageSize does not match BlocksCount and BlockSize");
-+        }
-         if (bmap.blocksMapped > bmap.blocksTotal) {
-             throw BmapError("BMAP: MappedBlocksCount exceeds BlocksCount");
-         }
-diff --git a/src/bmap.h b/src/bmap.h
-index cf6ff9d..98cb969 100644
---- a/src/bmap.h
-+++ b/src/bmap.h
-@@ -38,6 +38,7 @@ struct bmap_t {
-     std::string checksumType;
-     size_t blockSize = 0;
-     size_t blocksTotal = 0;
-+    size_t imageSize = 0;
-     size_t blocksMapped = 0;
-     std::string bmapVersion;
-     std::string bmapChecksum;
-diff --git a/src/image_writer.cpp b/src/image_writer.cpp
-index bb802ea..f864151 100644
---- a/src/image_writer.cpp
-+++ b/src/image_writer.cpp
-@@ -177,7 +177,7 @@ int BmapWriteImage(int fd, const bmap_t &bmap, int dev_fd, const std::string &de
-         for (const auto &range : bmap.ranges) {
-             // validateBmap() has already proven that none of this can overflow.
-             const size_t outStart = range.startBlock * bmap.blockSize;
--            const size_t outEnd = (range.endBlock + 1) * bmap.blockSize;
-+            const size_t outEnd = std::min((range.endBlock + 1) * bmap.blockSize, bmap.imageSize);
-             const size_t rangeSize = outEnd - outStart;
-             const off_t writeOffset = static_cast<off_t>(outStart);
-             size_t writtenSize = 0;
-diff --git a/src/main.cpp b/src/main.cpp
-index ca42c12..b8cbbc5 100644
---- a/src/main.cpp
-+++ b/src/main.cpp
-@@ -166,7 +166,7 @@ int main(int argc, char *argv[]) {
-     FdGuard imageGuard(image_fd);
- 
-     std::cout << "BMAP format version: " << bmap.bmapVersion << std::endl;
--    std::cout << "Image size: " << (bmap.blocksTotal * bmap.blockSize) << " bytes" << std::endl;
-+    std::cout << "Image size: " << bmap.imageSize << " bytes" << std::endl;
-     std::cout << "Block size: " << bmap.blockSize << " bytes" << std::endl;
-     std::cout << "Mapped blocks: " << bmap.blocksMapped << " out of " << bmap.blocksTotal
-               << " (" << std::fixed << std::setprecision(1)
--- 
-2.55.0
-
diff --git a/meta-oe/recipes-support/bmap-writer/files/0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch b/meta-oe/recipes-support/bmap-writer/files/0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch
deleted file mode 100644
index 236ff7d1ef..0000000000
--- a/meta-oe/recipes-support/bmap-writer/files/0001-device-Use-the-C-library-s-ioctl-request-type-for-BL.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 7b96cb4998714bbb338adecafad8614484feb8cd Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Tue, 29 Sep 2026 12:56:53 -0700
-Subject: [PATCH] device: Use the C library's ioctl request type for
- BLKGETSIZE64
-
-The type of ioctl()'s request argument differs between C libraries:
-glibc declares it as unsigned long, musl and bionic as int. BLKGETSIZE64
-is an unsigned long constant, so with -Wconversion -Wsign-conversion
--Werror passing it directly fails on musl, while casting it to int fails
-on glibc:
-
-  device.cpp:163:50: error: unsigned conversion from 'int' to 'long unsigned int' changes value from '-2146954638' to '18446744071562596978' [-Werror=sign-conversion]
-
-Deduce the request type from the ioctl() declaration and convert the
-request code to it explicitly, which builds on both.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/device.cpp | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/src/device.cpp b/src/device.cpp
-index 2c06c84..d1fa995 100644
---- a/src/device.cpp
-+++ b/src/device.cpp
-@@ -151,6 +151,13 @@ int openTargetDevice(const std::string& device) {
-     return fd;
- }
- 
-+// The type of ioctl()'s request argument depends on the C library: glibc
-+// uses unsigned long, musl and bionic use int. Deduce it from the
-+// declaration so request codes can be converted explicitly on all of them.
-+template <typename Request>
-+static Request ioctlRequestType(int (*)(int, Request, ...));
-+using ioctl_request_t = decltype(ioctlRequestType(&::ioctl));
-+
- // Capacity of the target in bytes, or 0 when it cannot be determined (a
- // regular file which simply grows as needed).
- uint64_t getDeviceSize(int fd) {
-@@ -160,7 +167,7 @@ uint64_t getDeviceSize(int fd) {
-     if (::fstat(fd, &statbuf) != 0) {
-         return 0;
-     }
--    if (S_ISBLK(statbuf.st_mode) && (::ioctl(fd, BLKGETSIZE64, &size) != 0)) {
-+    if (S_ISBLK(statbuf.st_mode) && (::ioctl(fd, static_cast<ioctl_request_t>(BLKGETSIZE64), &size) != 0)) {
-         return 0;
-     }
- 
