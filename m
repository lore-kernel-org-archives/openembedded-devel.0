Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8941D7C629
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2019 04:38:02 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u9so592115pgo.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 21:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J7lE/KNQmbUgVIP8xyYF7HW3MrC1HZPbY6ID3xDAE8g=;
	b=MhgWkwo3B2Z/tnCjuNiVAl6w7fG7aP0mJzutSr9q3SbUZXYOrdo+M0VytuA5b4BszT
	peHuQ7eBz75oZQf/V1i7IxlwxNVbsg7q4ZtKAy6S6hzXwTpcEcs3wn6UO1dZ/7dqg5nA
	nz0iZDL9Z98VilHLJuTSTGooFX+ykWU5RvxpwgbNnqCXdPLFrEYFymxvjBx8XJ6S6cI+
	WEY2jIznQxCTcSajnwjicv1VU4uu///apO4G/RbVthjqUSfriS20EM5VjrI+vGeyOVGo
	zjSt32tI1HyYjR3k+01lUoLuxMzJ9HWXXA7OvjuXTpD8AbsH8wP1FBRBTyOpnVuUfcvE
	MfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J7lE/KNQmbUgVIP8xyYF7HW3MrC1HZPbY6ID3xDAE8g=;
	b=RRrpAGxAuUiuhwkI69oZ0q/mhPomy3L7vtZS2v0bhMZqaVvxze+Sa0zYhJnU8JSO0W
	kuuyxi9voZ30eK8edYt0InDLvmEE4MQzXi4K6t8d3M/ggaGAsa0MS1KczdpsCXutYkbT
	8mIU270qmHg1fn4pmA6yGZgoshCSuQBUUfiw+2sL5D9ZUU+hSfFf8HVcdTdqvyABGi9b
	emvER9WwEmNcR43af8y4IaLXIfc0v2wRvjwYjolYh/+LyvXAPF9tha12VQuBuiw53DzQ
	vaYgKF4FmXe/JPr92fDx5JVmFpg+wmyg/HiBUwbSrNNNjDpKkIT7R0RmLswyir7cz2+F
	ZIdQ==
X-Gm-Message-State: APjAAAWjVQ40Dld59XZxtZcSFiFMXWQPdPqFzYKZpfvz4bQPvx29ftwg
	krHv/Dp6uN3mQBTzmsrCjPq5FQnE
X-Google-Smtp-Source: APXvYqyq5aWL+4B/TZIiXdWVxIO7rj4CjtqParnFs6CYV9vKVJeEbm36f1QkJAkdcq7MbTd272qxzg==
X-Received: by 2002:a62:ea08:: with SMTP id t8mr41783864pfh.60.1552451882711; 
	Tue, 12 Mar 2019 21:38:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	k72sm29195838pfb.122.2019.03.12.21.38.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 21:38:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Mar 2019 21:37:54 -0700
Message-Id: <20190313043754.26859-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Thomas Kunze <thommycheck@gmx.de>
Subject: [meta-initramfs][PATCH v2] klibc: Upgrade to 2.0.6 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2019 04:38:02 -0000
Content-Transfer-Encoding: 8bit

Drop staging related patches which are not needed anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
v2: Fix build with arm

 ...n_-structs-for-non-glibc-system-libs.patch |   0
 ...-ulocked_-fgets-fread-fwrite-aliases.patch |   0
 ...-path-to-compiler-headers-via-isyste.patch |   0
 ...-print-libgcc-file-name-instead-of-p.patch |   0
 .../0001-always-use-bfd-linker.patch          |   0
 ...o-not-set-a-fallback-march-and-mtune.patch |   0
 ...dash-Specify-format-string-in-fmtstr.patch |   0
 ...001-include-linux-sysinfo.h-directly.patch |   0
 ...libc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch |   0
 .../0001-klibc-add-getrandom-syscall.patch    |   0
 ...bc_2.0.4-add-kexec_file_load-syscall.patch |   0
 .../0001-mkfifo-Implement-mkfifo.patch        |   0
 .../armv4-fix-v4bx.patch                      |   4 +-
 .../klcc-consider-sysroot.patch               |   0
 .../klcc-cross-accept-clang-options.patch     |   0
 .../klibc-config-eabi.patch                   |   5 +-
 .../use-env-for-perl.patch                    |   0
 ...lcc-cross_2.0.4.bb => klcc-cross_2.0.6.bb} |   2 -
 ...c-utils-do-not-build-shared-binaries.patch | 213 ------------------
 .../klibc-2.0.4/klibc-linux-libc-dev.patch    |  29 ---
 .../klibc/klibc-2.0.4/staging.patch           | 151 -------------
 ...s_2.0.4.bb => klibc-static-utils_2.0.6.bb} |   6 -
 .../recipes-devtools/klibc/klibc-utils.inc    |   8 +-
 ...bc-utils_2.0.4.bb => klibc-utils_2.0.6.bb} |   0
 .../recipes-devtools/klibc/klibc.inc          |  13 +-
 .../klibc/{klibc_2.0.4.bb => klibc_2.0.6.bb}  |   2 +
 26 files changed, 10 insertions(+), 423 deletions(-)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-Define-in_-structs-for-non-glibc-system-libs.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-always-use-bfd-linker.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-dash-Specify-format-string-in-fmtstr.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-include-linux-sysinfo.h-directly.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-klibc-add-getrandom-syscall.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/0001-mkfifo-Implement-mkfifo.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/armv4-fix-v4bx.patch (84%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/klcc-consider-sysroot.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/klcc-cross-accept-clang-options.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/klibc-config-eabi.patch (85%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.4 => files}/use-env-for-perl.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klcc-cross_2.0.4.bb => klcc-cross_2.0.6.bb} (96%)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-static-utils-do-not-build-shared-binaries.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
 rename meta-initramfs/recipes-devtools/klibc/{klibc-static-utils_2.0.4.bb => klibc-static-utils_2.0.6.bb} (61%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-utils_2.0.4.bb => klibc-utils_2.0.6.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc_2.0.4.bb => klibc_2.0.6.bb} (91%)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Define-in_-structs-for-non-glibc-system-libs.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-Define-in_-structs-for-non-glibc-system-libs.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-always-use-bfd-linker.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-always-use-bfd-linker.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-dash-Specify-format-string-in-fmtstr.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-dash-Specify-format-string-in-fmtstr.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-include-linux-sysinfo.h-directly.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-include-linux-sysinfo.h-directly.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-add-getrandom-syscall.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-add-getrandom-syscall.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-mkfifo-Implement-mkfifo.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
rename to meta-initramfs/recipes-devtools/klibc/files/0001-mkfifo-Implement-mkfifo.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch b/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
similarity index 84%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
rename to meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
index e842353061..4a334fa252 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
@@ -12,12 +12,10 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  usr/klibc/arch/arm/MCONFIG | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/usr/klibc/arch/arm/MCONFIG b/usr/klibc/arch/arm/MCONFIG
-index 53bc1dc..303c6ac 100644
 --- a/usr/klibc/arch/arm/MCONFIG
 +++ b/usr/klibc/arch/arm/MCONFIG
 @@ -29,6 +29,7 @@ else
- KLIBCSHAREDFLAGS = -Ttext 0x01800200
+ KLIBCSHAREDFLAGS = -Ttext-segment 0x01800000
  ifeq ($(CONFIG_AEABI),y)
  KLIBCREQFLAGS += -mabi=aapcs-linux -mno-thumb-interwork
 +KLIBCLDFLAGS += $(FIX_ARMV4_EABI_BX)
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-consider-sysroot.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
rename to meta-initramfs/recipes-devtools/klibc/files/klcc-consider-sysroot.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-cross-accept-clang-options.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-cross-accept-clang-options.patch
rename to meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/files/klibc-config-eabi.patch
similarity index 85%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch
rename to meta-initramfs/recipes-devtools/klibc/files/klibc-config-eabi.patch
index f28cd54233..a6998f86d6 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/klibc-config-eabi.patch
@@ -12,13 +12,12 @@ Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
  defconfig | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/defconfig b/defconfig
-index 04b98e9..0cb23d0 100644
 --- a/defconfig
 +++ b/defconfig
-@@ -6,4 +6,4 @@ CONFIG_KLIBC_ZLIB=y
+@@ -6,5 +6,5 @@ CONFIG_KLIBC_ZLIB=y
  CONFIG_REGPARM=y
  # ARM options
  # CONFIG_KLIBC_THUMB is not set
 -# CONFIG_AEABI is not set
 +CONFIG_AEABI=y
+ # CONFIG_DEBUG_INFO is not set
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/use-env-for-perl.patch
rename to meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.6.bb
similarity index 96%
rename from meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
rename to meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.6.bb
index ab2afb7f84..4011aa231e 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.6.bb
@@ -7,8 +7,6 @@ DEPENDS = "klibc"
 PACKAGES = ""
 inherit nopackages
 
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
-
 SRC_URI += "file://use-env-for-perl.patch"
 
 # disable task already run in klibc recipe
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-static-utils-do-not-build-shared-binaries.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-static-utils-do-not-build-shared-binaries.patch
deleted file mode 100644
index 2f7cd35564..0000000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-static-utils-do-not-build-shared-binaries.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-From c034dceae17b7d8d437871afe5eba55a55434222 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Wed, 10 Oct 2018 00:48:31 +0200
-Subject: [PATCH] klibc-static-utils: do not build shared binaries
-
-We were building some shared utilities and this was leading to linker errors
-for x86 with security flags enabled.
-
-Fix
- i586-oe-linux-musl-ld.bfd: discarded output section: `.got.plt'
-
-Upstream-Status: Inappropriate [Embedded Specific]
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- usr/dash/Kbuild           | 6 +-----
- usr/kinit/Kbuild          | 4 +---
- usr/kinit/fstype/Kbuild   | 4 +---
- usr/kinit/ipconfig/Kbuild | 4 +---
- usr/kinit/nfsmount/Kbuild | 4 +---
- usr/kinit/resume/Kbuild   | 5 +----
- usr/kinit/run-init/Kbuild | 5 +----
- usr/utils/Kbuild          | 7 ++-----
- 8 files changed, 9 insertions(+), 30 deletions(-)
-
-diff --git a/usr/dash/Kbuild b/usr/dash/Kbuild
-index 1a6920a..b3a4e64 100644
---- a/usr/dash/Kbuild
-+++ b/usr/dash/Kbuild
-@@ -25,12 +25,8 @@ gen-h-files := builtins.h nodes.h syntax.h token.h
- 
- static-y := sh
- 
--# The shared binary
--shared-y    := sh.shared
--sh.shared-y := $(sh-y)
--
- # For cleaning
--targets := sh sh.g sh.shared sh.shared.g $(gen-o-files)
-+targets := sh sh.g $(gen-o-files)
- 
- # explicit dependency for all generated files
- $(addprefix $(obj)/, $(sh-y)): $(addprefix $(obj)/, $(gen-h-files))
-diff --git a/usr/kinit/Kbuild b/usr/kinit/Kbuild
-index f7fdccd..8db06ab 100644
---- a/usr/kinit/Kbuild
-+++ b/usr/kinit/Kbuild
-@@ -18,8 +18,6 @@ kinit-y  += fstype/
- kinit-y  += resume/
- 
- static-y := kinit
--shared-y := kinit.shared
--kinit.shared-y := $(kinit-y)
- 
- # Additional include paths files
- KLIBCCFLAGS += -I$(srctree)/$(src)/fstype \
-@@ -29,7 +27,7 @@ KLIBCCFLAGS += -I$(srctree)/$(src)/fstype \
-  	       -I$(srctree)/$(src)/run-init
- 
- # Cleaning
--targets += kinit kinit.g kinit.shared kinit.shared.g
-+targets += kinit kinit.g
- subdir- := fstype ipconfig nfsmount resume run-init
- 
- 
-diff --git a/usr/kinit/fstype/Kbuild b/usr/kinit/fstype/Kbuild
-index 367611d..8d453ea 100644
---- a/usr/kinit/fstype/Kbuild
-+++ b/usr/kinit/fstype/Kbuild
-@@ -3,7 +3,6 @@
- #
- 
- static-y := static/fstype
--shared-y := shared/fstype
- 
- # common .o files
- objs := main.o fstype.o
-@@ -16,8 +15,7 @@ lib-y := $(objs)
- 
- # .o files used to built executables
- static/fstype-y := $(objs)
--shared/fstype-y := $(objs)
- 
- # Cleaning
--clean-dirs := static shared
-+clean-dirs := static
- 
-diff --git a/usr/kinit/ipconfig/Kbuild b/usr/kinit/ipconfig/Kbuild
-index eb1d472..ef87e7e 100644
---- a/usr/kinit/ipconfig/Kbuild
-+++ b/usr/kinit/ipconfig/Kbuild
-@@ -3,7 +3,6 @@
- #
- 
- static-y := static/ipconfig
--shared-y := shared/ipconfig
- 
- # common .o files
- objs := main.o netdev.o packet.o
-@@ -22,8 +21,7 @@ lib-y := $(objs)
- 
- # .o files used to built executables
- static/ipconfig-y := $(objs)
--shared/ipconfig-y := $(objs)
- 
- # Cleaning
--clean-dirs := static shared
-+clean-dirs := static
- 
-diff --git a/usr/kinit/nfsmount/Kbuild b/usr/kinit/nfsmount/Kbuild
-index ba31708..01bedce 100644
---- a/usr/kinit/nfsmount/Kbuild
-+++ b/usr/kinit/nfsmount/Kbuild
-@@ -4,7 +4,6 @@
- 
- static-y := static/nfsmount
- #FIXME - build is broken static-y := dummypmap
--shared-y := shared/nfsmount
- 
- objs := main.o mount.o portmap.o dummypmap.o sunrpc.o
- 
-@@ -13,7 +12,6 @@ lib-y := $(objs)
- 
- # .o files used for executables
- static/nfsmount-y := $(objs)
--shared/nfsmount-y := $(objs)
- 
- # dummypmap uses a single .o file (rename src file?)
- dummypmap-y := dummypmap_test.o
-@@ -21,5 +19,5 @@ dummypmap-y := dummypmap_test.o
- # TODO - do we want a stripped version
- # TODO - do we want the static.g + shared.g directories?
- 
--clean-dirs := static shared
-+clean-dirs := static
- 
-diff --git a/usr/kinit/resume/Kbuild b/usr/kinit/resume/Kbuild
-index c1342e1..15b9590 100644
---- a/usr/kinit/resume/Kbuild
-+++ b/usr/kinit/resume/Kbuild
-@@ -3,7 +3,6 @@
- #
- 
- static-y := static/resume
--shared-y := shared/resume
- 
- # common .o files
- objs := resume.o resumelib.o
-@@ -20,9 +19,7 @@ KLIBCCFLAGS += -I$(srctree)/$(src)/..
- # .o files used to built executables
- static/resume-y   := $(objs)
- static/resume-lib := ../lib.a
--shared/resume-y   := $(objs)
--shared/resume-lib := ../lib.a
- 
- # Cleaning
--clean-dirs := static shared
-+clean-dirs := static
- 
-diff --git a/usr/kinit/run-init/Kbuild b/usr/kinit/run-init/Kbuild
-index c153b0a..a1ea834 100644
---- a/usr/kinit/run-init/Kbuild
-+++ b/usr/kinit/run-init/Kbuild
-@@ -3,7 +3,6 @@
- #
- 
- static-y := static/run-init
--shared-y := shared/run-init
- 
- # common .o files
- objs := run-init.o runinitlib.o
-@@ -24,9 +23,7 @@ KLIBCCFLAGS += -I$(srctree)/$(src)/..
- # .o files used to built executables
- static/run-init-y   := $(objs)
- static/run-init-lib := ../lib.a
--shared/run-init-y   := $(objs)
--shared/run-init-lib := ../lib.a
- 
- # Cleaning
--clean-dirs := static shared
-+clean-dirs := static
- 
-diff --git a/usr/utils/Kbuild b/usr/utils/Kbuild
-index 67d9486..1573363 100644
---- a/usr/utils/Kbuild
-+++ b/usr/utils/Kbuild
-@@ -7,7 +7,6 @@ progs += true false sleep ln mv nuke minips cat ls losetup
- progs += uname halt kill readlink cpio sync dmesg
- 
- static-y := $(addprefix static/, $(progs))
--shared-y := $(addprefix shared/, $(progs))
- 
- # The binary is placed in a subdir, so we need to tell kbuild this
- static/chroot-y     := chroot.o
-@@ -62,13 +61,11 @@ static/losetup-y    := losetup.o
- shared/losetup-y    := losetup.o
- 
- # Additionally linked targets
--always := static/reboot static/poweroff shared/reboot shared/poweroff
-+always := static/reboot static/poweroff
- 
- $(obj)/static/reboot $(obj)/static/poweroff: $(obj)/static/halt
- 	$(call cmd,ln)
--$(obj)/shared/reboot $(obj)/shared/poweroff: $(obj)/shared/halt
--	$(call cmd,ln)
- 
- # Clean deletes the static and shared dir
--clean-dirs := static shared
-+clean-dirs := static
- 
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch
deleted file mode 100644
index a5563b7407..0000000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1be2bc41f915922102a3ba671b54c2df6f0052e6 Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Sun, 14 Mar 2010 18:41:56 +0000
-Subject: [PATCH] klibc_1.5.26: now build against linux-libc-headers
-
-commit 43adf69062254fb4f8d4d11fb5fe36a60ae25d5a
-
-    Taken from debian "Fix klibc Debian specific build trouble"
-    Adapted for klibc_2.0.2
-
----
- scripts/Kbuild.install | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/Kbuild.install b/scripts/Kbuild.install
-index 8af5697..d32a8a5 100644
---- a/scripts/Kbuild.install
-+++ b/scripts/Kbuild.install
-@@ -95,7 +95,9 @@ header:
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
--	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
-+	$(Q)for x in ../../../include/asm ../../../include/asm-generic ../../../include/linux ../../../include/mtd; do \
-+		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
-+	done
- 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
- 	$(Q)chmod -R a+rX,go-w $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
deleted file mode 100644
index 5c7a6625b5..0000000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 1892079b827cf8f8316305b6d6e0985db82441a2 Mon Sep 17 00:00:00 2001
-From: Thomas Kunze <thommycheck@gmx.de>
-Date: Sat, 6 Aug 2011 05:30:14 +0000
-Subject: [PATCH] klibc: initial commit of version 1.5.24
-
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id eefb99a313bbcc8f34c8b32bf0c5aa2dd2580735
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-
-Minor edits following upstream changes
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
----
- scripts/Kbuild.install    | 4 ----
- usr/dash/Kbuild           | 2 --
- usr/gzip/Kbuild           | 2 --
- usr/kinit/Kbuild          | 2 --
- usr/kinit/fstype/Kbuild   | 2 --
- usr/kinit/ipconfig/Kbuild | 2 --
- usr/kinit/nfsmount/Kbuild | 2 --
- usr/kinit/resume/Kbuild   | 2 --
- usr/kinit/run-init/Kbuild | 2 --
- usr/klibc/Kbuild          | 2 --
- usr/utils/Kbuild          | 2 --
- 11 files changed, 24 deletions(-)
-
-diff --git a/scripts/Kbuild.install b/scripts/Kbuild.install
-index d32a8a5..fda699d 100644
---- a/scripts/Kbuild.install
-+++ b/scripts/Kbuild.install
-@@ -88,19 +88,15 @@ else
- header:
- 	$(Q)echo "  INSTALL headers + man pages to $(INSTALLROOT)$(INSTALLDIR)"
- 	$(Q)mkdir -p $(INSTALLROOT)$(bindir)
--	$(Q)mkdir -p $(INSTALLROOT)$(mandir)/man1
--	$(Q)mkdir -p $(INSTALLROOT)$(SHLIBDIR)
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)
- 	$(Q)-rm -rf $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
--	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
- 	$(Q)for x in ../../../include/asm ../../../include/asm-generic ../../../include/linux ../../../include/mtd; do \
- 		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
- 	done
- 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
- 	$(Q)chmod -R a+rX,go-w $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
--	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
- 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
- 
- footer: header
-diff --git a/usr/dash/Kbuild b/usr/dash/Kbuild
-index 3a98c1f..1a6920a 100644
---- a/usr/dash/Kbuild
-+++ b/usr/dash/Kbuild
-@@ -92,5 +92,3 @@ $(obj)/syntax.c: $(obj)/mksyntax
- $(obj)/syntax.h: $(obj)/syntax.c
- 	$(Q):
- 
--# Targets to install
--install-y := sh.shared
-diff --git a/usr/gzip/Kbuild b/usr/gzip/Kbuild
-index 9bbf0a4..c497d02 100644
---- a/usr/gzip/Kbuild
-+++ b/usr/gzip/Kbuild
-@@ -21,5 +21,3 @@ $(obj)/gunzip $(obj)/zcat: $(obj)/gzip
- # Cleaning
- targets := gzip gzip.g gunzip zcat
- 
--# Targets to install
--install-y := gzip gunzip zcat
-diff --git a/usr/kinit/Kbuild b/usr/kinit/Kbuild
-index 5320127..f7fdccd 100644
---- a/usr/kinit/Kbuild
-+++ b/usr/kinit/Kbuild
-@@ -33,5 +33,3 @@ targets += kinit kinit.g kinit.shared kinit.shared.g
- subdir- := fstype ipconfig nfsmount resume run-init
- 
- 
--# install binary
--install-y := kinit kinit.shared
-diff --git a/usr/kinit/fstype/Kbuild b/usr/kinit/fstype/Kbuild
-index 9b20db1..367611d 100644
---- a/usr/kinit/fstype/Kbuild
-+++ b/usr/kinit/fstype/Kbuild
-@@ -21,5 +21,3 @@ shared/fstype-y := $(objs)
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-diff --git a/usr/kinit/ipconfig/Kbuild b/usr/kinit/ipconfig/Kbuild
-index 7f8d181..eb1d472 100644
---- a/usr/kinit/ipconfig/Kbuild
-+++ b/usr/kinit/ipconfig/Kbuild
-@@ -27,5 +27,3 @@ shared/ipconfig-y := $(objs)
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-diff --git a/usr/kinit/nfsmount/Kbuild b/usr/kinit/nfsmount/Kbuild
-index 461e6f3..ba31708 100644
---- a/usr/kinit/nfsmount/Kbuild
-+++ b/usr/kinit/nfsmount/Kbuild
-@@ -23,5 +23,3 @@ dummypmap-y := dummypmap_test.o
- 
- clean-dirs := static shared
- 
--# Install binary
--install-y := $(shared-y)
-diff --git a/usr/kinit/resume/Kbuild b/usr/kinit/resume/Kbuild
-index 034195d..c1342e1 100644
---- a/usr/kinit/resume/Kbuild
-+++ b/usr/kinit/resume/Kbuild
-@@ -26,5 +26,3 @@ shared/resume-lib := ../lib.a
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-diff --git a/usr/kinit/run-init/Kbuild b/usr/kinit/run-init/Kbuild
-index f7832b7..c153b0a 100644
---- a/usr/kinit/run-init/Kbuild
-+++ b/usr/kinit/run-init/Kbuild
-@@ -30,5 +30,3 @@ shared/run-init-lib := ../lib.a
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-diff --git a/usr/klibc/Kbuild b/usr/klibc/Kbuild
-index eba6add..98caf2e 100644
---- a/usr/klibc/Kbuild
-+++ b/usr/klibc/Kbuild
-@@ -185,5 +185,3 @@ install-rule:
- 	          $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib))
- 	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
- 	                      $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib
--	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
--	                      $(INSTALLROOT)$(SHLIBDIR)
-diff --git a/usr/utils/Kbuild b/usr/utils/Kbuild
-index 05aa794..67d9486 100644
---- a/usr/utils/Kbuild
-+++ b/usr/utils/Kbuild
-@@ -72,5 +72,3 @@ $(obj)/shared/reboot $(obj)/shared/poweroff: $(obj)/shared/halt
- # Clean deletes the static and shared dir
- clean-dirs := static shared
- 
--# install only install the shared binaries
--install-y := $(shared-y) shared/reboot shared/poweroff
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.6.bb
similarity index 61%
rename from meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.6.bb
index 16778630c4..c835fd647a 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.6.bb
@@ -10,9 +10,3 @@ KLIBC_UTILS_PKGNAME = "klibc-static-utils"
 
 require klibc-utils.inc
 require klibc.inc
-
-SRC_URI += "file://0001-klibc-static-utils-do-not-build-shared-binaries.patch"
-
-# avoid textrel if linking with -pie
-SECURITY_CFLAGS = ""
-SECURITY_LDFLAGS = ""
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index 2aac9e6ebf..00cb86d3e6 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -2,11 +2,11 @@ do_install() {
     install -d ${D}${base_bindir}
     install -d ${D}${base_sbindir}
     if [ "${KLIBC_UTILS_VARIANT}" = "shared" ]; then
-        install -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit.shared
-        install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh.shared
+        install -m 755 usr/kinit/shared/kinit ${D}${base_bindir}/kinit.shared
+        install -m 755 usr/dash/shared/sh ${D}${base_bindir}/sh.shared
     else
-        install -m 755 usr/dash/sh ${D}${base_bindir}/sh
-        install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
+        install -m 755 usr/dash/static/sh ${D}${base_bindir}/sh
+        install -m 755 usr/kinit/static/kinit ${D}${base_bindir}/kinit
         install -m 755 usr/gzip/gzip ${D}${base_bindir}
         ln -s gzip ${D}${base_bindir}/gunzip
         ln -s gzip ${D}${base_bindir}/zcat
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.6.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.6.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index ec52e9734f..5805448671 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -5,12 +5,10 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 DEPENDS = "linux-libc-headers perl-native"
-SRCREV = "4d19974d7020488f63651244e1f9f51727c3f66c"
+SRCREV = "22b36d1ae34416bc48869619cbb0cccb2070f48f"
 
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            ${ARMPATCHES} \
-           file://klibc-linux-libc-dev.patch \
-           file://staging.patch \
            file://klcc-consider-sysroot.patch \
            file://klcc-cross-accept-clang-options.patch \
            file://0001-dash-Specify-format-string-in-fmtstr.patch \
@@ -48,8 +46,6 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
                  V=1 \
                 "
-EXTRA_OEMAKE += "'EXTRA_KLIBCAFLAGS=${SECURITY_CFLAGS} -Wa,--noexecstack' \
-                 'EXTRA_KLIBCLDFLAGS=${SECURITY_LDFLAGS} -z noexecstack'"
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
@@ -76,10 +72,3 @@ KLIBC_ARCH_x86-64 = "x86_64"
 KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
-
-GCCPIE ?= ""
-SECURITY_LDFLAGS = "${@'-z relro -z now -pie' if '${GCCPIE}' else ''}"
-SECURITY_LDFLAGS_mips = ""
-SECURITY_LDFLAGS_mipsel = ""
-SECURITY_LDFLAGS_mips64 = ""
-SECURITY_LDFLAGS_mips64el = ""
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.6.bb
similarity index 91%
rename from meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc_2.0.6.bb
index bc80f382fe..7df0b0a3d5 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.6.bb
@@ -10,6 +10,8 @@ do_install() {
     install -d ${D}${libdir}
     install -m 755 usr/klibc/klibc-*.so ${D}${libdir}
     (cd  ${D}${libdir}; ln -s klibc-*.so klibc.so)
+    rm -rf ${D}${exec_prefix}/man
+    rm -rf ${D}${libdir}/klibc/bin
 }
 
 PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
-- 
2.21.0


