Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.2675.1622059186485590357
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 12:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KN2S8ipG;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso1240261wmm.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n4sAZUmnyFI2HnPEesMFuAfFmvzo7CNl+3q8xJltMIY=;
        b=KN2S8ipGi5YyhI8VKPuGF8+Thb9VK7AUVAByUtyHjNiE1pvXw8p1THqJd7TGWSFHVH
         thXyC0/dd/T4+9Zg37wQFvKXA6kM/O0UB2URjYx3P+/T2Xw+/qHQWUoD+UaJ8RNycwNG
         s1Lxt6QcWuiADpcjW0pmZNZnWP6VIdxgITbskQ9qsFRWTjQqw6PXGoUAGrCYrOV7GFuN
         8lbFNThzbXCoyVhIRnE23GHZ38eq46jkMuiLgSuBhGDxzKmkZg1bI9eW/jK90S0fwba3
         4l4JV2Kf88Ssdg1xnLe9VCy6PMp2+FpKHs4+BltD+xSLWYrz7PEfCn9GOw0zqA8kQJNs
         ZFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4sAZUmnyFI2HnPEesMFuAfFmvzo7CNl+3q8xJltMIY=;
        b=ahcC4Aboei58i4zgc9/ylImi+qEXGUmXjlELSz/5le3ULYDTSPA9Y0kPFv3Kk4sYY+
         s/9xX7x/r63S4y4jwukJYKNmYLaKcBi4AEB+RmNJAIB80lyNG3pBepGxG4IcKxtuHa6n
         j78xHaTv+iEjVMXiHCxO1fI5ilGBEs7P+20B8/X3GZHmC4niSwBApdarIBi6kNgVyZ9S
         MRCmzsjRVi6jZwE1K4Ov+yve/lizGgGV9vVOeuVZG/730UmRvRU0+nMBP2stH16+V1cH
         sBQYBuFiDeaN1Y9ikkyMJmXSdz7ioAYigsbVVOInFU7tB8ZZS9K9rXfhu7hqhh5ZvqA6
         YPyA==
X-Gm-Message-State: AOAM532AfF4SfzL0CDHTW+pCT1giFS1R/UGlFfsaK1c63J8jJCgkYpiy
	QzIyRLMCbKL2RYZ8U0fbl1H4JrvDglzCtSwy2l0kasZV
X-Google-Smtp-Source: ABdhPJxt9oC6Ko4sO1PO6xn9HK11l/7xRke7a1mLt/MTTaoEzpfuqXCCERalMrF4WCUlCrlvrBxdqg==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr107733wmj.84.1622059183656;
        Wed, 26 May 2021 12:59:43 -0700 (PDT)
Return-Path: <nishaparrakat@gmail.com>
Received: from bsys_traas.speedport.ip (p200300c00f3bb0593a22e2fffe1aa816.dip0.t-ipconnect.de. [2003:c0:f3b:b059:3a22:e2ff:fe1a:a816])
        by smtp.gmail.com with ESMTPSA id y2sm8852895wmq.45.2021.05.26.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:59:43 -0700 (PDT)
From: "Nisha Parrakat" <nishaparrakat@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: [meta-oe][master][PATCH 2/2] android-tools: upgrade android-tools to latest debian 10.0.0.r36
Date: Wed, 26 May 2021 19:59:29 +0000
Message-Id: <20210526195929.26047-2-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526195929.26047-1-nishaparrakat@gmail.com>
References: <20210526195929.26047-1-nishaparrakat@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

upgrade of android-tools to 10.0.0.r36

Delete all the old patches that were applicable for
old version.

Use all the makefiles that come with the new version
directly from the source code, just modifying them
to install output to a specific folder

a)added rules_yocto.mk that will mimic the debian/rules
b)modified the makefiles of the components to output to
a common dir.
c)
Built boringssl crypto with the option -DOPENSSL_NO_ASM
to solve the below errors

 libcrypto.so.0: undefined reference to `aes_hw_encrypt'
 libcrypto.so.0: undefined reference to `aes_hw_set_encrypt_key'
 libcrypto.so.0: undefined reference to `gcm_gmult_v8'
 libcrypto.so.0: undefined reference to `gcm_init_v8'
 libcrypto.so.0: undefined reference to `sha256_block_data_order'
 libcrypto.so.0: undefined reference to `aes_hw_ctr32_encrypt_blocks'
 libcrypto.so.0: undefined reference to `aes_hw_cbc_encrypt'
 libcrypto.so.0: undefined reference to `vpaes_decrypt'
 libcrypto.so.0: undefined reference to `vpaes_encrypt'
 libcrypto.so.0: undefined reference to `gcm_gmult_neon'
 libcrypto.so.0: undefined reference to `sha1_block_data_order'
 libcrypto.so.0: undefined reference to `sha512_block_data_order'
 libcrypto.so.0: undefined reference to `gcm_init_neon'
 libcrypto.so.0: undefined reference to `aes_hw_set_decrypt_key'
 libcrypto.so.0: undefined reference to `vpaes_set_decrypt_key'
 libcrypto.so.0: undefined reference to `gcm_ghash_neon'
 libcrypto.so.0: undefined reference to `bn_mul_mont'
 libcrypto.so.0: undefined reference to `aes_hw_decrypt'
 libcrypto.so.0: undefined reference to `gcm_ghash_v8'
 libcrypto.so.0: undefined reference to `vpaes_cbc_encrypt'
 libcrypto.so.0: undefined reference to `ChaCha20_ctr32'
 libcrypto.so.0: undefined reference to `vpaes_ctr32_encrypt_blocks'
 libcrypto.so.0: undefined reference to `vpaes_set_encrypt_key'

 Attention : https://github.com/grpc/grpc/issues/9440

d) compiled android compatible version of libunwind to be used
to build libbacktrace
e) REQUIRES meta-selinux for libselinux
f) checked compilation and packaging for for x86_64 and aarch64
g) UNTESTED android-tools-adbd.service , couldn't find how to build adbd
that is needed by the service with the new version of android-tools. At
present the service is still packaged but may not work.
h) tested the adb and fastboot on the core-image-minimal by including
the android-tools in the image and ran the commands with 'help'

Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 .../android-tools/android-tools/adb.mk        |  72 ----
 .../android-tools/adb_mk_change_out_dir.patch |  50 +++
 .../android-tools/android-tools/adbd.mk       | 164 --------
 ...scv-Add-risc-v-Android-config-header.patch | 359 ------------------
 .../0001-adb-remove-selinux-extensions.patch  |  44 ---
 ...-Use-local-sockets-where-appropriate.patch |  70 ----
 .../core/0003-adb-define-shell-command.patch  |  29 --
 ...-adb-Fix-build-on-big-endian-systems.patch |  45 ---
 .../0005-adb-add-base64-implementation.patch  | 348 -----------------
 .../core/0006-adb-Musl-fixes.patch            | 131 -------
 ...sb_linux.c-fix-build-with-glibc-2.28.patch |  24 --
 ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  21 -
 ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
 ...ux-capability.h-on-linux-systems-too.patch |  23 --
 .../0011-Remove-bionic-specific-calls.patch   |  64 ----
 ...laration-of-stlcat-strlcopy-function.patch |  50 ---
 .../core/0013-adb-Support-riscv64.patch       | 189 ---------
 .../android-tools/core/adb_libssl_11.diff     |  39 --
 .../android-tools/android-tools/ext4_utils.mk | 103 -----
 ...ext4_utils-remove-selinux-extensions.patch |  39 --
 ...add-o-argument-to-preserve-ownership.patch |  78 ----
 .../android-tools/android-tools/fastboot.mk   |  89 -----
 .../fastboot_compile_remove_gtest.patch       |  51 +++
 .../fastboot_mk_change_out_dir.patch          |  52 +++
 .../android-tools/android-tools/gitignore     |  59 ---
 .../img2simg_change_out_dir.patch             |  41 ++
 .../libadb_mk_change_out_dir.patch            |  44 +++
 .../libbacktrace_mk_change_out_dir.patch      |  60 +++
 .../libbase_mk_change_out_dir.patch           |  33 ++
 .../libcrypto_mk_change_out_dir.patch         |  30 ++
 .../libcrypto_utils_mk_change_out_dir.patch   |  38 ++
 .../libcutils_mk_change_out_dir.patch         |  27 ++
 .../libext4_utils_mk_change_out_dir.patch     |  42 ++
 .../libfec_mk_change_out_dir.patch            |  35 ++
 .../liblog_mk_change_out_dir.patch            |  42 ++
 .../0001-Remove-bionic-specific-calls.patch   |  25 --
 ...t-define-gettid-if-glibc-2.30-is-use.patch |  49 ---
 .../libsparse_mk_change_out_dir.patch         |  47 +++
 .../libunwind_mk_change_out_dir.patch         |  47 +++
 .../libziparchive_mk_change_out_dir.patch     |  47 +++
 .../android-tools/android-tools/mkbootimg.mk  |  29 --
 .../android-tools/rules_yocto.mk              |   4 +
 .../simg2img_change_out_dir.patch             |  41 ++
 ...me_space_std_to_compile_libbacktrace.patch |  19 +
 .../android-tools/android-tools_10.0.0.r36.bb | 204 ++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb  | 182 ---------
 46 files changed, 954 insertions(+), 2435 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_dir.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_remove_gtest.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change_out_dir.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/gitignore
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_out_dir.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_change_out_dir.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_out_dir.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std_to_compile_libbacktrace.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_10.0.0.r36.bb
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
deleted file mode 100644
index 0687c22c1..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
+++ /dev/null
@@ -1,72 +0,0 @@
-# Makefile for adb
-
-SRCDIR ?= $(S)
-
-VPATH += $(SRCDIR)/system/core/adb
-adb_SRC_FILES += adb.c
-adb_SRC_FILES += console.c
-adb_SRC_FILES += transport.c
-adb_SRC_FILES += transport_local.c
-adb_SRC_FILES += transport_usb.c
-adb_SRC_FILES += commandline.c
-adb_SRC_FILES += adb_client.c
-adb_SRC_FILES += adb_auth_host.c
-adb_SRC_FILES += sockets.c
-adb_SRC_FILES += services.c
-adb_SRC_FILES += file_sync_client.c
-adb_SRC_FILES += get_my_path_linux.c
-adb_SRC_FILES += usb_linux.c
-adb_SRC_FILES += usb_vendors.c
-adb_SRC_FILES += fdevent.c
-adb_OBJS := $(adb_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/core/libcutils
-libcutils_SRC_FILES += atomic.c
-libcutils_SRC_FILES += hashmap.c
-libcutils_SRC_FILES += native_handle.c
-libcutils_SRC_FILES += config_utils.c
-libcutils_SRC_FILES += cpu_info.c
-libcutils_SRC_FILES += load_file.c
-# libcutils_SRC_FILES += open_memstream.c
-# libcutils_SRC_FILES += strdup16to8.c
-# libcutils_SRC_FILES += strdup8to16.c
-# libcutils_SRC_FILES += record_stream.c
-# libcutils_SRC_FILES += process_name.c
-# libcutils_SRC_FILES += threads.c
-# libcutils_SRC_FILES += sched_policy.c
-# libcutils_SRC_FILES += iosched_policy.c
-libcutils_SRC_FILES += str_parms.c
-libcutils_SRC_FILES += fs.c
-libcutils_SRC_FILES += multiuser.c
-libcutils_SRC_FILES += socket_inaddr_any_server.c
-libcutils_SRC_FILES += socket_local_client.c
-libcutils_SRC_FILES += socket_local_server.c
-libcutils_SRC_FILES += socket_loopback_client.c
-libcutils_SRC_FILES += socket_loopback_server.c
-libcutils_SRC_FILES += socket_network_client.c
-libcutils_SRC_FILES += sockets.c
-libcutils_SRC_FILES += ashmem-host.c
-libcutils_SRC_FILES += dlmalloc_stubs.c
-libcutils_OBJS := $(libcutils_SRC_FILES:.c=.o)
-
-CFLAGS += -DANDROID
-CFLAGS += -DWORKAROUND_BUG6558362
-CFLAGS += -DADB_HOST=1
-CFLAGS += -D_XOPEN_SOURCE -D_GNU_SOURCE
-CFLAGS += -DANDROID_SMP=0
-CFLAGS += -I$(SRCDIR)/system/core/adb
-CFLAGS += -I$(SRCDIR)/system/core/include
-CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
-
-LIBS += libcutils.a -lpthread -lcrypto
-
-all: adb
-
-adb: libcutils.a $(adb_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)
-
-libcutils.a: $(libcutils_OBJS)
-	$(AR) rcs $@ $(libcutils_OBJS)
-
-clean:
-	$(RM) $(adb_OBJS) $(libcutils_OBJS) adb *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_dir.patch
new file mode 100644
index 000000000..8c07e133a
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_dir.patch
@@ -0,0 +1,50 @@
+patching adb.mk to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending 
+--- git/system/core/debian/adb.mk	2021-04-29 21:11:00.617892503 +0200
++++ git/system/core/debian/adb.mk	2021-04-29 21:17:33.256016600 +0200
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = adb
+ 
+ SOURCES = client/adb_client.cpp \
+@@ -12,10 +13,10 @@
+ 
+ SOURCES := $(foreach source, $(SOURCES), adb/$(source))
+ CXXFLAGS += -std=gnu++2a
+-CPPFLAGS += -Iinclude -Iadb -Ibase/include \
++CPPFLAGS += -Iinclude -Iadb -Ibase/include  -I$(OUT_DIR)/usr/include/ \
+             -DADB_VERSION='"$(DEB_VERSION)"' -DADB_HOST=1 -D_GNU_SOURCE
+-LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android -Wl,-rpath-link=. \
+-           -lpthread -L. -ladb -lbase
++LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android -Wl,-rpath-link=$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
++           -lpthread -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -ladb -lbase
+ 
+ # -latomic should be the last library specified
+ # https://github.com/android/ndk/issues/589
+@@ -24,7 +25,8 @@
+ endif
+ 
+ build: $(SOURCES)
+-	$(CXX) $^ -o adb/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
++	mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
+ 
+ clean:
+-	$(RM) adb/$(NAME)
++	$(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb/$(NAME)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
deleted file mode 100644
index 31452ae10..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
+++ /dev/null
@@ -1,164 +0,0 @@
-# Makefile for adbd
-
-SRCDIR ?= $(S)
-
-VPATH += $(SRCDIR)/system/core/adb
-adbd_SRC_FILES += adb.c
-adbd_SRC_FILES += fdevent.c
-adbd_SRC_FILES += transport.c
-adbd_SRC_FILES += transport_local.c
-adbd_SRC_FILES += transport_usb.c
-adbd_SRC_FILES += adb_auth_client.c
-adbd_SRC_FILES += sockets.c
-adbd_SRC_FILES += services.c
-adbd_SRC_FILES += file_sync_service.c
-adbd_SRC_FILES += jdwp_service.c
-adbd_SRC_FILES += framebuffer_service.c
-adbd_SRC_FILES += remount_service.c
-adbd_SRC_FILES += disable_verity_service.c
-adbd_SRC_FILES += base64.c
-adbd_SRC_FILES += usb_linux_client.c
-adbd_OBJS := $(adbd_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/core/liblog
-liblog_SRC_FILES += logd_write.c
-liblog_SRC_FILES += log_event_write.c
-liblog_SRC_FILES += logprint.c
-liblog_SRC_FILES += event_tag_map.c
-liblog_SRC_FILES += fake_log_device.c
-liblog_OBJS := $(liblog_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/core/fs_mgr
-fs_mgr_SRC_FILES += fs_mgr_fstab.c
-fs_mgr_OBJS := $(fs_mgr_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/core/libcutils
-libcutils_SRC_FILES += atomic.c
-libcutils_SRC_FILES += hashmap.c
-libcutils_SRC_FILES += native_handle.c
-libcutils_SRC_FILES += config_utils.c
-libcutils_SRC_FILES += cpu_info.c
-libcutils_SRC_FILES += load_file.c
-# libcutils_SRC_FILES += open_memstream.c
-# libcutils_SRC_FILES += strdup16to8.c
-# libcutils_SRC_FILES += strdup8to16.c
-# libcutils_SRC_FILES += record_stream.c
-# libcutils_SRC_FILES += process_name.c
-# libcutils_SRC_FILES += threads.c
-# libcutils_SRC_FILES += sched_policy.c
-# libcutils_SRC_FILES += iosched_policy.c
-libcutils_SRC_FILES += str_parms.c
-libcutils_SRC_FILES += fs.c
-libcutils_SRC_FILES += multiuser.c
-libcutils_SRC_FILES += socket_inaddr_any_server.c
-libcutils_SRC_FILES += socket_local_client.c
-libcutils_SRC_FILES += socket_local_server.c
-libcutils_SRC_FILES += socket_loopback_client.c
-libcutils_SRC_FILES += socket_loopback_server.c
-libcutils_SRC_FILES += socket_network_client.c
-libcutils_SRC_FILES += sockets.c
-libcutils_SRC_FILES += ashmem-host.c
-libcutils_SRC_FILES += dlmalloc_stubs.c
-libcutils_SRC_FILES += klog.c
-libcutils_SRC_FILES += properties.c
-libcutils_OBJS := $(libcutils_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/external/libselinux/src
-libselinux_SRC_FILES += booleans.c
-libselinux_SRC_FILES += canonicalize_context.c
-libselinux_SRC_FILES += disable.c
-libselinux_SRC_FILES += enabled.c
-libselinux_SRC_FILES += fgetfilecon.c
-libselinux_SRC_FILES += fsetfilecon.c
-libselinux_SRC_FILES += getenforce.c
-libselinux_SRC_FILES += getfilecon.c
-libselinux_SRC_FILES += getpeercon.c
-libselinux_SRC_FILES += lgetfilecon.c
-libselinux_SRC_FILES += load_policy.c
-libselinux_SRC_FILES += lsetfilecon.c
-libselinux_SRC_FILES += policyvers.c
-libselinux_SRC_FILES += procattr.c
-libselinux_SRC_FILES += setenforce.c
-libselinux_SRC_FILES += setfilecon.c
-libselinux_SRC_FILES += context.c
-libselinux_SRC_FILES += mapping.c
-libselinux_SRC_FILES += stringrep.c
-libselinux_SRC_FILES += compute_create.c
-libselinux_SRC_FILES += compute_av.c
-libselinux_SRC_FILES += avc.c
-libselinux_SRC_FILES += avc_internal.c
-libselinux_SRC_FILES += avc_sidtab.c
-libselinux_SRC_FILES += get_initial_context.c
-libselinux_SRC_FILES += checkAccess.c
-libselinux_SRC_FILES += sestatus.c
-libselinux_SRC_FILES += deny_unknown.c
-
-libselinux_SRC_FILES += callbacks.c
-libselinux_SRC_FILES += check_context.c
-libselinux_SRC_FILES += freecon.c
-libselinux_SRC_FILES += init.c
-libselinux_SRC_FILES += label.c
-libselinux_SRC_FILES += label_file.c
-libselinux_SRC_FILES += label_android_property.c
-libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/extras/ext4_utils
-libext4_utils_SRC_FILES += make_ext4fs.c
-libext4_utils_SRC_FILES += ext4fixup.c
-libext4_utils_SRC_FILES += ext4_utils.c
-libext4_utils_SRC_FILES += allocate.c
-libext4_utils_SRC_FILES += contents.c
-libext4_utils_SRC_FILES += extent.c
-libext4_utils_SRC_FILES += indirect.c
-libext4_utils_SRC_FILES += uuid.c
-libext4_utils_SRC_FILES += sha1.c
-libext4_utils_SRC_FILES += wipe.c
-libext4_utils_SRC_FILES += crc16.c
-libext4_utils_SRC_FILES += ext4_sb.c
-libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
-
-CFLAGS += -std=gnu11
-CFLAGS += -DANDROID
-CFLAGS += -DADB_HOST=0
-CFLAGS += -D_XOPEN_SOURCE -D_GNU_SOURCE
-CFLAGS += -DALLOW_ADBD_ROOT=1
-CFLAGS += -DALLOW_ADBD_DISABLE_VERITY=1
-CFLAGS += -DPROP_NAME_MAX=32
-CFLAGS += -DPROP_VALUE_MAX=92
-CFLAGS += -DAUDITD_LOG_TAG=1003
-# CFLAGS += -DHOST
-CFLAGS += -DANDROID_SMP=0
-CFLAGS += -I$(SRCDIR)/system/core/adb
-CFLAGS += -I$(SRCDIR)/system/core/include
-CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
-CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
-CFLAGS += -I$(SRCDIR)/system/core/fs_mgr/include
-CFLAGS += -I$(SRCDIR)/hardware/libhardware/include
-CFLAGS += -I$(SRCDIR)/external/libselinux/include
-CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
-
-LIBS += liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a -lpthread -lbsd -lpcre -lresolv -lcrypto
-
-all: adbd
-
-adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a $(adbd_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS)
-
-liblog.a: $(liblog_OBJS)
-	$(AR) rcs $@ $(liblog_OBJS)
-
-libfs_mgr.a: $(fs_mgr_OBJS)
-	$(AR) rcs $@ $(fs_mgr_OBJS)
-
-libcutils.a: $(libcutils_OBJS)
-	$(AR) rcs $@ $(libcutils_OBJS)
-
-libselinux.a: $(libselinux_OBJS)
-	export CFLAGS="-DANDROID -DHOST"
-	$(AR) rcs $@ $(libselinux_OBJS)
-
-libext4_utils.a: $(libext4_utils_OBJS)
-	$(AR) rcs $@ $(libext4_utils_OBJS)
-
-clean:
-	$(RM) *.o *.a adbd
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch b/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch
deleted file mode 100644
index 57c443b70..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch
+++ /dev/null
@@ -1,359 +0,0 @@
-From 82dce13ea7b5b31c63851bd67f66072413917e73 Mon Sep 17 00:00:00 2001
-From: Chenxi Mao <maochenxi@eswin.com>
-Date: Mon, 20 Apr 2020 15:32:40 +0800
-Subject: [PATCH 1/1] Riscv: Add risc-v Android config header
-
----
- .../arch/linux-riscv64/AndroidConfig.h        | 340 ++++++++++++++++++
- 1 file changed, 340 insertions(+)
- create mode 100644 core/combo/include/arch/linux-riscv64/AndroidConfig.h
-
-diff --git a/core/combo/include/arch/linux-riscv64/AndroidConfig.h b/core/combo/include/arch/linux-riscv64/AndroidConfig.h
-new file mode 100644
-index 0000000000..bcbda8f87f
---- /dev/null
-+++ b/core/combo/include/arch/linux-riscv64/AndroidConfig.h
-@@ -0,0 +1,340 @@
-+/*
-+ * Copyright (C) 2013 The Android Open Source Project
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+/*
-+ * Android config -- "android-aarch64".  Used for ARM aarch64 device builds.
-+ */
-+#ifndef _ANDROID_CONFIG_H
-+#define _ANDROID_CONFIG_H
-+
-+/*
-+ * ===========================================================================
-+ *                              !!! IMPORTANT !!!
-+ * ===========================================================================
-+ *
-+ * This file is included by ALL C/C++ source files.  Don't put anything in
-+ * here unless you are absolutely certain it can't go anywhere else.
-+ *
-+ * Any C++ stuff must be wrapped with "#ifdef __cplusplus".  Do not use "//"
-+ * comments.
-+ */
-+
-+/*
-+ * Threading model.  Choose one:
-+ *
-+ * HAVE_PTHREADS - use the pthreads library.
-+ * HAVE_WIN32_THREADS - use Win32 thread primitives.
-+ *  -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, and HAVE__BEGINTHREADEX
-+ */
-+#define HAVE_PTHREADS
-+
-+/*
-+ * Do we have pthread_setname_np()?
-+ *
-+ * (HAVE_PTHREAD_SETNAME_NP is used by WebKit to enable a function with
-+ * the same name but different parameters, so we can't use that here.)
-+ */
-+#define HAVE_ANDROID_PTHREAD_SETNAME_NP
-+
-+/*
-+ * Do we have the futex syscall?
-+ */
-+#define HAVE_FUTEX
-+
-+/*
-+ * Process creation model.  Choose one:
-+ *
-+ * HAVE_FORKEXEC - use fork() and exec()
-+ * HAVE_WIN32_PROC - use CreateProcess()
-+ */
-+#define HAVE_FORKEXEC
-+
-+/*
-+ * Process out-of-memory adjustment.  Set if running on Linux,
-+ * where we can write to /proc/<pid>/oom_adj to modify the out-of-memory
-+ * badness adjustment.
-+ */
-+#define HAVE_OOM_ADJ
-+
-+/*
-+ * IPC model.  Choose one:
-+ *
-+ * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (semget, shmget).
-+ * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open, mmap).
-+ * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore, CreateFileMapping).
-+ * HAVE_ANDROID_IPC - use Android versions (?, mmap).
-+ */
-+#define HAVE_ANDROID_IPC
-+
-+/*
-+ * Memory-mapping model. Choose one:
-+ *
-+ * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h
-+ * HAVE_WIN32_FILEMAP - use Win32 filemaps
-+ */
-+#define  HAVE_POSIX_FILEMAP
-+
-+/*
-+ * Define this if you have <termio.h>
-+ */
-+#define  HAVE_TERMIO_H 1
-+
-+/*
-+ * Define this if you have <sys/sendfile.h>
-+ */
-+#define  HAVE_SYS_SENDFILE_H 1
-+
-+/*
-+ * Define this if you build against MSVCRT.DLL
-+ */
-+/* #define HAVE_MS_C_RUNTIME */
-+
-+/*
-+ * Define this if you have sys/uio.h
-+ */
-+#define  HAVE_SYS_UIO_H 1
-+
-+/*
-+ * Define this if your platforms implements symbolic links
-+ * in its filesystems
-+ */
-+#define HAVE_SYMLINKS
-+
-+/*
-+ * Define this if we have localtime_r().
-+ */
-+/* #define HAVE_LOCALTIME_R 1 */
-+
-+/*
-+ * Define this if we have gethostbyname_r().
-+ */
-+/* #define HAVE_GETHOSTBYNAME_R */
-+
-+/*
-+ * Define this if we have ioctl().
-+ */
-+#define HAVE_IOCTL
-+
-+/*
-+ * Define this if we want to use WinSock.
-+ */
-+/* #define HAVE_WINSOCK */
-+
-+/*
-+ * Define this if have clock_gettime() and friends
-+ */
-+#define HAVE_POSIX_CLOCKS
-+
-+/*
-+ * Define this if we have linux style epoll()
-+ */
-+#define HAVE_EPOLL
-+
-+/*
-+ * Endianness of the target machine.  Choose one:
-+ *
-+ * HAVE_ENDIAN_H -- have endian.h header we can include.
-+ * HAVE_LITTLE_ENDIAN -- we are little endian.
-+ * HAVE_BIG_ENDIAN -- we are big endian.
-+ */
-+#define HAVE_ENDIAN_H
-+#define HAVE_LITTLE_ENDIAN
-+
-+#define _FILE_OFFSET_BITS 64
-+/* #define _LARGEFILE_SOURCE 1 */
-+
-+/*
-+ * Define if platform has off64_t (and lseek64 and other xxx64 functions)
-+ */
-+#define HAVE_OFF64_T
-+
-+/*
-+ * Defined if we have the backtrace() call for retrieving a stack trace.
-+ * Needed for CallStack to operate; if not defined, CallStack is
-+ * non-functional.
-+ */
-+#define HAVE_BACKTRACE 0
-+
-+/*
-+ * Defined if we have the cxxabi.h header for demangling C++ symbols.  If
-+ * not defined, stack crawls will be displayed with raw mangled symbols
-+ */
-+#define HAVE_CXXABI 0
-+
-+/*
-+ * Defined if we have the gettid() system call.
-+ */
-+#define HAVE_GETTID
-+
-+/*
-+ * Defined if we have the sched_setscheduler() call
-+ */
-+#define HAVE_SCHED_SETSCHEDULER
-+
-+/*
-+ * Add any extra platform-specific defines here.
-+ */
-+#ifndef __linux__
-+#define __linux__
-+#endif
-+
-+/*
-+ * Define if we have <malloc.h> header
-+ */
-+#define HAVE_MALLOC_H
-+
-+/*
-+ * Define if we're running on *our* linux on device or emulator.
-+ */
-+#define HAVE_ANDROID_OS 1
-+
-+/*
-+ * Define if we have Linux-style non-filesystem Unix Domain Sockets
-+ */
-+#define HAVE_LINUX_LOCAL_SOCKET_NAMESPACE 1
-+
-+/*
-+ * Define if we have Linux's inotify in <sys/inotify.h>.
-+ */
-+#define HAVE_INOTIFY 1
-+
-+/*
-+ * Define if we have madvise() in <sys/mman.h>
-+ */
-+#define HAVE_MADVISE 1
-+
-+/*
-+ * Define if tm struct has tm_gmtoff field
-+ */
-+#define HAVE_TM_GMTOFF 1
-+
-+/*
-+ * Define if dirent struct has d_type field
-+ */
-+#define HAVE_DIRENT_D_TYPE 1
-+
-+/*
-+ * Define if libc includes Android system properties implementation.
-+ */
-+#define HAVE_LIBC_SYSTEM_PROPERTIES 1
-+
-+/*
-+ * Define if system provides a system property server (should be
-+ * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).
-+ */
-+/* #define HAVE_SYSTEM_PROPERTY_SERVER */
-+
-+/*
-+ * What CPU architecture does this platform use?
-+ */
-+#define ARCH_AARCH64
-+
-+/*
-+ * Define if the size of enums is as short as possible,
-+ */
-+/* #define HAVE_SHORT_ENUMS */
-+
-+/*
-+ * sprintf() format string for shared library naming.
-+ */
-+#define OS_SHARED_LIB_FORMAT_STR    "lib%s.so"
-+
-+/*
-+ * type for the third argument to mincore().
-+ */
-+#define MINCORE_POINTER_TYPE unsigned char *
-+
-+/*
-+ * The default path separator for the platform
-+ */
-+#define OS_PATH_SEPARATOR '/'
-+
-+/*
-+ * Is the filesystem case sensitive?
-+ */
-+#define OS_CASE_SENSITIVE
-+
-+/*
-+ * Define if <sys/socket.h> exists.
-+ */
-+#define HAVE_SYS_SOCKET_H 1
-+
-+/*
-+ * Define if the strlcpy() function exists on the system.
-+ */
-+#define HAVE_STRLCPY 1
-+
-+/*
-+ * Define if the open_memstream() function exists on the system.
-+ */
-+/* #define HAVE_OPEN_MEMSTREAM 1 */
-+
-+/*
-+ * Define if the BSD funopen() function exists on the system.
-+ */
-+#define HAVE_FUNOPEN 1
-+
-+/*
-+ * Define if prctl() exists
-+ */
-+#define HAVE_PRCTL 1
-+
-+/*
-+ * Define if writev() exists
-+ */
-+#define HAVE_WRITEV 1
-+
-+/*
-+ * Define if <stdint.h> exists.
-+ */
-+#define HAVE_STDINT_H 1
-+
-+/*
-+ * Define if <stdbool.h> exists.
-+ */
-+#define HAVE_STDBOOL_H 1
-+
-+/*
-+ * Define if <sched.h> exists.
-+ */
-+#define HAVE_SCHED_H 1
-+
-+/*
-+ * Define if pread() exists
-+ */
-+#define HAVE_PREAD 1
-+
-+/*
-+ * Define if we have st_mtim in struct stat
-+ */
-+#define HAVE_STAT_ST_MTIM 1
-+
-+/*
-+ * Define if printf() supports %zd for size_t arguments
-+ */
-+#define HAVE_PRINTF_ZD 1
-+
-+/*
-+ * Define to 1 if <stdlib.h> provides qsort_r() with a BSD style function prototype.
-+ */
-+#define HAVE_BSD_QSORT_R 0
-+
-+/*
-+ * Define to 1 if <stdlib.h> provides qsort_r() with a GNU style function prototype.
-+ */
-+#define HAVE_GNU_QSORT_R 0
-+
-+#endif /* _ANDROID_CONFIG_H */
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch
deleted file mode 100644
index 7d20c5068..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7b7200727413ca4a9bb132221c543ec033dffafa Mon Sep 17 00:00:00 2001
-From: Sergio Schvezov <sergio.schvezov@canonical.com>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] adb: remove selinux extensions
-
-* drop useless includes of Android SELINUX extensions
-* avoids having to clone another module
-* this should be sent upstream
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- adb/file_sync_service.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/adb/file_sync_service.c b/adb/file_sync_service.c
-index 7933858516..3cbd0cd863 100644
---- a/adb/file_sync_service.c
-+++ b/adb/file_sync_service.c
-@@ -26,7 +26,6 @@
- 
- #include <errno.h>
- #include <private/android_filesystem_config.h>
--#include <selinux/android.h>
- #include "sysdeps.h"
- 
- #define TRACE_TAG  TRACE_SYNC
-@@ -73,7 +72,6 @@ static int mkdirs(char *name)
-                 *x = '/';
-                 return ret;
-             }
--            selinux_android_restorecon(name, 0);
-         }
-         *x++ = '/';
-     }
-@@ -251,7 +249,6 @@ static int handle_send_file(int s, char *path, uid_t uid,
-     if(fd >= 0) {
-         struct utimbuf u;
-         adb_close(fd);
--        selinux_android_restorecon(path, 0);
-         u.actime = timestamp;
-         u.modtime = timestamp;
-         utime(path, &u);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch
deleted file mode 100644
index 3627110ad..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From d855f042ca09a358cebe2d3c1d29d512afd7ebb8 Mon Sep 17 00:00:00 2001
-From: Hilko Bengen <bengen@debian.org>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] adb: Use local sockets where appropriate
-
-Upstream-Status: Inappropriate
----
- adb/adb.c             | 6 +++++-
- adb/adb_client.c      | 5 +++--
- adb/transport_local.c | 3 ++-
- 3 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/adb/adb.c b/adb/adb.c
-index 10a1e0da26..027edd9359 100644
---- a/adb/adb.c
-+++ b/adb/adb.c
-@@ -1230,7 +1230,11 @@ int launch_server(int server_port)
-  */
- void build_local_name(char* target_str, size_t target_size, int server_port)
- {
--  snprintf(target_str, target_size, "tcp:%d", server_port);
-+  if (gListenAll > 0) {
-+    snprintf(target_str, target_size, "tcp:%d", server_port);
-+  } else {
-+    snprintf(target_str, target_size, "local:%d", server_port);
-+  }
- }
- 
- #if !ADB_HOST
-diff --git a/adb/adb_client.c b/adb/adb_client.c
-index eb1720d22c..a383faefe3 100644
---- a/adb/adb_client.c
-+++ b/adb/adb_client.c
-@@ -185,12 +185,12 @@ int _adb_connect(const char *service)
-         strcpy(__adb_error, "service name too long");
-         return -1;
-     }
--    snprintf(tmp, sizeof tmp, "%04x", len);
-+    snprintf(tmp, sizeof tmp, "%d", __adb_server_port);
- 
-     if (__adb_server_name)
-         fd = socket_network_client(__adb_server_name, __adb_server_port, SOCK_STREAM);
-     else
--        fd = socket_loopback_client(__adb_server_port, SOCK_STREAM);
-+        fd = socket_local_client(tmp, ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);
- 
-     if(fd < 0) {
-         strcpy(__adb_error, "cannot connect to daemon");
-@@ -201,6 +201,7 @@ int _adb_connect(const char *service)
-         return -1;
-     }
- 
-+    snprintf(tmp, sizeof tmp, "%04x", len);
-     if(writex(fd, tmp, 4) || writex(fd, service, len)) {
-         strcpy(__adb_error, "write failure during connection");
-         adb_close(fd);
-diff --git a/adb/transport_local.c b/adb/transport_local.c
-index 948cc15812..71582a8c88 100644
---- a/adb/transport_local.c
-+++ b/adb/transport_local.c
-@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int console_port, int adb_port)
-     }
- #endif
-     if (fd < 0) {
--        fd = socket_loopback_client(adb_port, SOCK_STREAM);
-+        snprintf(buf, sizeof buf, "%d", adb_port);
-+        fd = socket_local_client(buf, ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);
-     }
- 
-     if (fd >= 0) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch
deleted file mode 100644
index cf1d9cbc3..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4421c2e19946dcd651fd8ac022b96627fc526149 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] adb: define shell command
-
-we intend to run on Linux system so the shell is always /bin/sh,
-for the host or the target.
-
-Upstream-Status: Inappropriate
----
- adb/services.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/adb/services.c b/adb/services.c
-index 21b08dc201..d44b0c5068 100644
---- a/adb/services.c
-+++ b/adb/services.c
-@@ -299,11 +299,7 @@ static int create_subproc_raw(const char *cmd, const char *arg0, const char *arg
- }
- #endif  /* !ABD_HOST */
- 
--#if ADB_HOST
- #define SHELL_COMMAND "/bin/sh"
--#else
--#define SHELL_COMMAND "/system/bin/sh"
--#endif
- 
- #if !ADB_HOST
- static void subproc_waiter_service(int fd, void *cookie)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
deleted file mode 100644
index 79e9d4d3b..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 548b8ca62c64a16305929e2eaf3d546d48de9c25 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 21 Feb 2017 19:46:24 +0100
-Subject: [PATCH] adb: Fix build on big endian systems
-
-The usb_linux_client.c file defines cpu_to_le16/32 by using the C
-library htole16/32 function calls. However, cpu_to_le16/32 are used
-when initializing structures, i.e in a context where a function call
-is not allowed.
-
-It works fine on little endian systems because htole16/32 are defined
-by the C library as no-ops. But on big-endian systems, they are
-actually doing something, which might involve calling a function,
-causing build failures.
-
-To solve this, we simply open-code cpu_to_le16/32 in a way that allows
-them to be used when initializing structures.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- adb/usb_linux_client.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c
-index 8426e0ea14..6e8b5bbbd2 100644
---- a/adb/usb_linux_client.c
-+++ b/adb/usb_linux_client.c
-@@ -34,8 +34,15 @@
- #define MAX_PACKET_SIZE_FS	64
- #define MAX_PACKET_SIZE_HS	512
- 
--#define cpu_to_le16(x)  htole16(x)
--#define cpu_to_le32(x)  htole32(x)
-+#if __BYTE_ORDER == __LITTLE_ENDIAN
-+# define cpu_to_le16(x) (x)
-+# define cpu_to_le32(x) (x)
-+#else
-+# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
-+# define cpu_to_le32(x) \
-+	((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
-+	 (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
-+#endif
- 
- struct usb_handle
- {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
deleted file mode 100644
index fcd4ae238..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
+++ /dev/null
@@ -1,348 +0,0 @@
-From 753bcb5971401b82fb2e6197d31c9e386f6d0392 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Sep 2017 15:46:38 -0700
-Subject: [PATCH] adb: add base64 implementation
-
-musl needs it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- adb/adb_auth_client.c |   2 +-
- adb/base64.c          | 315 ++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 316 insertions(+), 1 deletion(-)
- create mode 100644 adb/base64.c
-
-diff --git a/adb/adb_auth_client.c b/adb/adb_auth_client.c
-index 55e9dcad19..104b413b8b 100644
---- a/adb/adb_auth_client.c
-+++ b/adb/adb_auth_client.c
-@@ -75,7 +75,7 @@ static void read_keys(const char *file, struct listnode *list)
-         if (sep)
-             *sep = '\0';
- 
--        ret = __b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-+        ret = b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-         if (ret != sizeof(key->key)) {
-             D("%s: Invalid base64 data ret=%d\n", file, ret);
-             free(key);
-diff --git a/adb/base64.c b/adb/base64.c
-new file mode 100644
-index 0000000000..95da284d0d
---- /dev/null
-+++ b/adb/base64.c
-@@ -0,0 +1,315 @@
-+/*
-+ * Copyright (c) 1996-1999 by Internet Software Consortium.
-+ *
-+ * Permission to use, copy, modify, and distribute this software for any
-+ * purpose with or without fee is hereby granted, provided that the above
-+ * copyright notice and this permission notice appear in all copies.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE CONSORTIUM DISCLAIMS
-+ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET SOFTWARE
-+ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
-+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
-+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
-+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
-+ * SOFTWARE.
-+ */
-+
-+/*
-+ * Portions Copyright (c) 1995 by International Business Machines, Inc.
-+ *
-+ * International Business Machines, Inc. (hereinafter called IBM) grants
-+ * permission under its copyrights to use, copy, modify, and distribute this
-+ * Software with or without fee, provided that the above copyright notice and
-+ * all paragraphs of this notice appear in all copies, and that the name of IBM
-+ * not be used in connection with the marketing of any product incorporating
-+ * the Software or modifications thereof, without specific, written prior
-+ * permission.
-+ *
-+ * To the extent it has a right to do so, IBM grants an immunity from suit
-+ * under its patents, if any, for the use, sale or manufacture of products to
-+ * the extent that such products are used for performing Domain Name System
-+ * dynamic updates in TCP/IP networks by means of the Software.  No immunity is
-+ * granted for any product per se or for any other function of any product.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", AND IBM DISCLAIMS ALL WARRANTIES,
-+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-+ * PARTICULAR PURPOSE.  IN NO EVENT SHALL IBM BE LIABLE FOR ANY SPECIAL,
-+ * DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER ARISING
-+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE, EVEN
-+ * IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.
-+ */
-+
-+#if !defined(LINT) && !defined(CODECENTER)
-+static const char rcsid[] = "$BINDId: base64.c,v 8.7 1999/10/13 16:39:33 vixie Exp $";
-+#endif /* not lint */
-+
-+#include <sys/types.h>
-+#include <sys/param.h>
-+#include <sys/socket.h>
-+
-+#include <netinet/in.h>
-+#include <arpa/inet.h>
-+#include <arpa/nameser.h>
-+
-+#include <ctype.h>
-+#include <resolv.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <stdint.h>
-+#include <string.h>
-+
-+#define Assert(Cond) if (!(Cond)) abort()
-+
-+static const char Base64[] =
-+	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
-+static const char Pad64 = '=';
-+
-+/* (From RFC1521 and draft-ietf-dnssec-secext-03.txt)
-+   The following encoding technique is taken from RFC 1521 by Borenstein
-+   and Freed.  It is reproduced here in a slightly edited form for
-+   convenience.
-+
-+   A 65-character subset of US-ASCII is used, enabling 6 bits to be
-+   represented per printable character. (The extra 65th character, "=",
-+   is used to signify a special processing function.)
-+
-+   The encoding process represents 24-bit groups of input bits as output
-+   strings of 4 encoded characters. Proceeding from left to right, a
-+   24-bit input group is formed by concatenating 3 8-bit input groups.
-+   These 24 bits are then treated as 4 concatenated 6-bit groups, each
-+   of which is translated into a single digit in the base64 alphabet.
-+
-+   Each 6-bit group is used as an index into an array of 64 printable
-+   characters. The character referenced by the index is placed in the
-+   output string.
-+
-+                         Table 1: The Base64 Alphabet
-+
-+      Value Encoding  Value Encoding  Value Encoding  Value Encoding
-+          0 A            17 R            34 i            51 z
-+          1 B            18 S            35 j            52 0
-+          2 C            19 T            36 k            53 1
-+          3 D            20 U            37 l            54 2
-+          4 E            21 V            38 m            55 3
-+          5 F            22 W            39 n            56 4
-+          6 G            23 X            40 o            57 5
-+          7 H            24 Y            41 p            58 6
-+          8 I            25 Z            42 q            59 7
-+          9 J            26 a            43 r            60 8
-+         10 K            27 b            44 s            61 9
-+         11 L            28 c            45 t            62 +
-+         12 M            29 d            46 u            63 /
-+         13 N            30 e            47 v
-+         14 O            31 f            48 w         (pad) =
-+         15 P            32 g            49 x
-+         16 Q            33 h            50 y
-+
-+   Special processing is performed if fewer than 24 bits are available
-+   at the end of the data being encoded.  A full encoding quantum is
-+   always completed at the end of a quantity.  When fewer than 24 input
-+   bits are available in an input group, zero bits are added (on the
-+   right) to form an integral number of 6-bit groups.  Padding at the
-+   end of the data is performed using the '=' character.
-+
-+   Since all base64 input is an integral number of octets, only the
-+         -------------------------------------------------
-+   following cases can arise:
-+
-+       (1) the final quantum of encoding input is an integral
-+           multiple of 24 bits; here, the final unit of encoded
-+	   output will be an integral multiple of 4 characters
-+	   with no "=" padding,
-+       (2) the final quantum of encoding input is exactly 8 bits;
-+           here, the final unit of encoded output will be two
-+	   characters followed by two "=" padding characters, or
-+       (3) the final quantum of encoding input is exactly 16 bits;
-+           here, the final unit of encoded output will be three
-+	   characters followed by one "=" padding character.
-+   */
-+
-+int
-+b64_ntop(const uint8_t* src, size_t srclength, char* target, size_t targsize)
-+{
-+	size_t datalength = 0;
-+	uint8_t input[3];
-+	uint8_t output[4];
-+	size_t i;
-+
-+	while (2 < srclength) {
-+		input[0] = *src++;
-+		input[1] = *src++;
-+		input[2] = *src++;
-+		srclength -= 3;
-+
-+		output[0] = input[0] >> 2;
-+		output[1] = ((input[0] & 0x03) << 4) + (input[1] >> 4);
-+		output[2] = ((input[1] & 0x0f) << 2) + (input[2] >> 6);
-+		output[3] = input[2] & 0x3f;
-+		Assert(output[0] < 64);
-+		Assert(output[1] < 64);
-+		Assert(output[2] < 64);
-+		Assert(output[3] < 64);
-+
-+		if (datalength + 4 > targsize)
-+			return (-1);
-+		target[datalength++] = Base64[output[0]];
-+		target[datalength++] = Base64[output[1]];
-+		target[datalength++] = Base64[output[2]];
-+		target[datalength++] = Base64[output[3]];
-+	}
-+
-+	/* Now we worry about padding. */
-+	if (0 != srclength) {
-+		/* Get what's left. */
-+		input[0] = input[1] = input[2] = '\0';
-+		for (i = 0; i < srclength; i++)
-+			input[i] = *src++;
-+
-+		output[0] = input[0] >> 2;
-+		output[1] = ((input[0] & 0x03) << 4) + (input[1] >> 4);
-+		output[2] = ((input[1] & 0x0f) << 2) + (input[2] >> 6);
-+		Assert(output[0] < 64);
-+		Assert(output[1] < 64);
-+		Assert(output[2] < 64);
-+
-+		if (datalength + 4 > targsize)
-+			return (-1);
-+		target[datalength++] = Base64[output[0]];
-+		target[datalength++] = Base64[output[1]];
-+		if (srclength == 1)
-+			target[datalength++] = Pad64;
-+		else
-+			target[datalength++] = Base64[output[2]];
-+		target[datalength++] = Pad64;
-+	}
-+	if (datalength >= targsize)
-+		return (-1);
-+	target[datalength] = '\0';	/* Returned value doesn't count \0. */
-+	return (datalength);
-+}
-+
-+/* skips all whitespace anywhere.
-+   converts characters, four at a time, starting at (or after)
-+   src from base - 64 numbers into three 8 bit bytes in the target area.
-+   it returns the number of data bytes stored at the target, or -1 on error.
-+ */
-+
-+int b64_pton(const char* src, uint8_t* target, size_t targsize)
-+{
-+	int tarindex, state, ch;
-+	char *pos;
-+
-+	state = 0;
-+	tarindex = 0;
-+
-+	while ((ch = *src++) != '\0') {
-+		if (isspace(ch))	/* Skip whitespace anywhere. */
-+			continue;
-+
-+		if (ch == Pad64)
-+			break;
-+
-+		pos = strchr(Base64, ch);
-+		if (pos == 0) 		/* A non-base64 character. */
-+			return (-1);
-+
-+		switch (state) {
-+		case 0:
-+			if (target) {
-+				if ((size_t)tarindex >= targsize)
-+					return (-1);
-+				target[tarindex] = (pos - Base64) << 2;
-+			}
-+			state = 1;
-+			break;
-+		case 1:
-+			if (target) {
-+				if ((size_t)tarindex + 1 >= targsize)
-+					return (-1);
-+				target[tarindex]   |=  (pos - Base64) >> 4;
-+				target[tarindex+1]  = ((pos - Base64) & 0x0f)
-+							<< 4 ;
-+			}
-+			tarindex++;
-+			state = 2;
-+			break;
-+		case 2:
-+			if (target) {
-+				if ((size_t)tarindex + 1 >= targsize)
-+					return (-1);
-+				target[tarindex]   |=  (pos - Base64) >> 2;
-+				target[tarindex+1]  = ((pos - Base64) & 0x03)
-+							<< 6;
-+			}
-+			tarindex++;
-+			state = 3;
-+			break;
-+		case 3:
-+			if (target) {
-+				if ((size_t)tarindex >= targsize)
-+					return (-1);
-+				target[tarindex] |= (pos - Base64);
-+			}
-+			tarindex++;
-+			state = 0;
-+			break;
-+		default:
-+			abort();
-+		}
-+	}
-+
-+	/*
-+	 * We are done decoding Base-64 chars.  Let's see if we ended
-+	 * on a byte boundary, and/or with erroneous trailing characters.
-+	 */
-+
-+	if (ch == Pad64) {		/* We got a pad char. */
-+		ch = *src++;		/* Skip it, get next. */
-+		switch (state) {
-+		case 0:		/* Invalid = in first position */
-+		case 1:		/* Invalid = in second position */
-+			return (-1);
-+
-+		case 2:		/* Valid, means one byte of info */
-+			/* Skip any number of spaces. */
-+			for ((void)NULL; ch != '\0'; ch = *src++)
-+				if (!isspace(ch))
-+					break;
-+			/* Make sure there is another trailing = sign. */
-+			if (ch != Pad64)
-+				return (-1);
-+			ch = *src++;		/* Skip the = */
-+			/* Fall through to "single trailing =" case. */
-+			/* FALLTHROUGH */
-+
-+		case 3:		/* Valid, means two bytes of info */
-+			/*
-+			 * We know this char is an =.  Is there anything but
-+			 * whitespace after it?
-+			 */
-+			for ((void)NULL; ch != '\0'; ch = *src++)
-+				if (!isspace(ch))
-+					return (-1);
-+
-+			/*
-+			 * Now make sure for cases 2 and 3 that the "extra"
-+			 * bits that slopped past the last full byte were
-+			 * zeros.  If we don't check them, they become a
-+			 * subliminal channel.
-+			 */
-+			if (target && target[tarindex] != 0)
-+				return (-1);
-+		}
-+	} else {
-+		/*
-+		 * We ended by seeing the end of the string.  Make sure we
-+		 * have no partial bytes lying around.
-+		 */
-+		if (state != 0)
-+			return (-1);
-+	}
-+
-+	return (tarindex);
-+}
-+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
deleted file mode 100644
index b5d383f38..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 62d957a1271c88ec08d67984fbe31601f0bd41a9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Sep 2017 15:50:57 -0700
-Subject: [PATCH] adb: Musl fixes
-
-__nonnull is gcc specific
-include sys/types.h for size_t
-Do not redefine close() and lseek()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- adb/adb.h                    |  2 ++
- adb/disable_verity_service.c | 13 ++++++++-----
- adb/framebuffer_service.c    |  7 ++++---
- adb/sysdeps.h                | 12 ++++++------
- 4 files changed, 20 insertions(+), 14 deletions(-)
-
-diff --git a/adb/adb.h b/adb/adb.h
-index 44e5981bdc..bcdc49f63c 100644
---- a/adb/adb.h
-+++ b/adb/adb.h
-@@ -18,7 +18,9 @@
- #define __ADB_H
- 
- #include <limits.h>
-+#include <sys/types.h>
- 
-+#include "fdevent.h"
- #include "adb_trace.h"
- #include "transport.h"  /* readx(), writex() */
- 
-diff --git a/adb/disable_verity_service.c b/adb/disable_verity_service.c
-index ed3da52108..29fa3d65a9 100644
---- a/adb/disable_verity_service.c
-+++ b/adb/disable_verity_service.c
-@@ -14,25 +14,28 @@
-  * limitations under the License.
-  */
- 
--#include "sysdeps.h"
- 
- #define  TRACE_TAG  TRACE_ADB
- #include "adb.h"
-+#include "sysdeps.h"
-+#include "cutils/properties.h"
-+#include "ext4_sb.h"
-+#include <fs_mgr.h>
- 
- #include <stdio.h>
- #include <stdarg.h>
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <inttypes.h>
-+#include <unistd.h>
-+#include <errno.h>
-+#include <stdbool.h>
- 
--#include "cutils/properties.h"
--#include "ext4_sb.h"
--#include <fs_mgr.h>
- 
- #define FSTAB_PREFIX "/fstab."
- struct fstab *fstab;
- 
--__attribute__((__format__(printf, 2, 3))) __nonnull((2))
-+__attribute__((__format__(printf, 2, 3))) __attribute__((nonnull((2))))
- static void write_console(int fd, const char* format, ...)
- {
-     char buffer[256];
-diff --git a/adb/framebuffer_service.c b/adb/framebuffer_service.c
-index 8cbe8403cc..8f0ccfb7aa 100644
---- a/adb/framebuffer_service.c
-+++ b/adb/framebuffer_service.c
-@@ -14,6 +14,10 @@
-  * limitations under the License.
-  */
- 
-+#include "fdevent.h"
-+#include "adb.h"
-+#include "sysdeps.h"
-+
- #include <stdlib.h>
- #include <stdio.h>
- #include <unistd.h>
-@@ -23,9 +27,6 @@
- #include <sys/types.h>
- #include <sys/wait.h>
- 
--#include "fdevent.h"
--#include "adb.h"
--
- #include <linux/fb.h>
- #include <sys/ioctl.h>
- #include <sys/mman.h>
-diff --git a/adb/sysdeps.h b/adb/sysdeps.h
-index cc1f839e9f..ea39ac39cc 100644
---- a/adb/sysdeps.h
-+++ b/adb/sysdeps.h
-@@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd)
- {
-     return close(fd);
- }
--#undef   close
--#define  close   ____xxx_close
-+//#undef   close
-+//#define  close   ____xxx_close
- 
- static __inline__  int  unix_read(int  fd, void*  buf, size_t  len)
- {
-@@ -369,8 +369,8 @@ static __inline__ int  adb_close(int fd)
- {
-     return close(fd);
- }
--#undef   close
--#define  close   ____xxx_close
-+//#undef   close
-+//#define  close   ____xxx_close
- 
- 
- static __inline__  int  adb_read(int  fd, void*  buf, size_t  len)
-@@ -392,8 +392,8 @@ static __inline__ int   adb_lseek(int  fd, int  pos, int  where)
- {
-     return lseek(fd, pos, where);
- }
--#undef   lseek
--#define  lseek   ___xxx_lseek
-+//#undef   lseek
-+//#define  lseek   ___xxx_lseek
- 
- static __inline__  int    adb_unlink(const char*  path)
- {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
deleted file mode 100644
index e02a95687..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From de393bba41c8feff932c77d6c30233945f380d42 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 11 Aug 2018 13:23:37 +0000
-Subject: [PATCH] adb: usb_linux.c: fix build with glibc-2.28
-
-* include sysmacros for major, minor
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- adb/usb_linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/adb/usb_linux.c b/adb/usb_linux.c
-index f16bdd0361..c8a7732441 100644
---- a/adb/usb_linux.c
-+++ b/adb/usb_linux.c
-@@ -22,6 +22,7 @@
- #include <sys/ioctl.h>
- #include <sys/types.h>
- #include <sys/time.h>
-+#include <sys/sysmacros.h>
- #include <dirent.h>
- #include <fcntl.h>
- #include <errno.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
deleted file mode 100644
index 7d223e05f..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From 3a788e9168c9b9eac66c4fa479413f4a95c61be4 Mon Sep 17 00:00:00 2001
-From: Florent Revest <revestflo@gmail.com>
-Date: Mon, 30 Oct 2017 21:05:46 +0100
-Subject: [PATCH] adb: Allow adbd to be ran as root
-
----
- adb/adb.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/adb/adb.c b/adb/adb.c
-index 027edd9359..e0f7ecde45 100644
---- a/adb/adb.c
-+++ b/adb/adb.c
-@@ -1271,6 +1271,7 @@ static int should_drop_privileges() {
-     int secure = 0;
-     char value[PROPERTY_VALUE_MAX];
- 
-+    return 0;
-    /* run adbd in secure mode if ro.secure is set and
-     ** we are not in the emulator
-     */
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
deleted file mode 100644
index a4dc6e1e3..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From dd195778a9930b7967b21a3b8eb390b70253dbad Mon Sep 17 00:00:00 2001
-From: David Ng <dave@codeaurora.org>
-Date: Fri, 27 Jul 2012 17:15:03 -0700
-Subject: [PATCH] mkbootimg: Add --dt parameter to specify DT image
-
-New optional --dt parameter to specify a kernel device
-tree image.
-
-Upstream-Status: Inappropriate
----
- mkbootimg/bootimg.h   |  7 +++++--
- mkbootimg/mkbootimg.c | 21 +++++++++++++++++++++
- 2 files changed, 26 insertions(+), 2 deletions(-)
-
-diff --git a/mkbootimg/bootimg.h b/mkbootimg/bootimg.h
-index 9171d85a7b..308c537d6b 100644
---- a/mkbootimg/bootimg.h
-+++ b/mkbootimg/bootimg.h
-@@ -41,8 +41,8 @@ struct boot_img_hdr
- 
-     unsigned tags_addr;    /* physical addr for kernel tags */
-     unsigned page_size;    /* flash page size we assume */
--    unsigned unused[2];    /* future expansion: should be 0 */
--
-+    unsigned dt_size;      /* device tree in bytes */
-+    unsigned unused;       /* future expansion: should be 0 */
-     unsigned char name[BOOT_NAME_SIZE]; /* asciiz product name */
- 
-     unsigned char cmdline[BOOT_ARGS_SIZE];
-@@ -64,10 +64,13 @@ struct boot_img_hdr
- ** +-----------------+
- ** | second stage    | o pages
- ** +-----------------+
-+** | device tree     | p pages
-+** +-----------------+
- **
- ** n = (kernel_size + page_size - 1) / page_size
- ** m = (ramdisk_size + page_size - 1) / page_size
- ** o = (second_size + page_size - 1) / page_size
-+** p = (dt_size + page_size - 1) / page_size
- **
- ** 0. all entities are page_size aligned in flash
- ** 1. kernel and ramdisk are required (size != 0)
-diff --git a/mkbootimg/mkbootimg.c b/mkbootimg/mkbootimg.c
-index fc92b4dc30..658052cdf2 100644
---- a/mkbootimg/mkbootimg.c
-+++ b/mkbootimg/mkbootimg.c
-@@ -65,6 +65,7 @@ int usage(void)
-             "       [ --board <boardname> ]\n"
-             "       [ --base <address> ]\n"
-             "       [ --pagesize <pagesize> ]\n"
-+            "       [ --dt <filename> ]\n"
-             "       -o|--output <filename>\n"
-             );
-     return 1;
-@@ -105,6 +106,8 @@ int main(int argc, char **argv)
-     char *cmdline = "";
-     char *bootimg = 0;
-     char *board = "";
-+    char *dt_fn = 0;
-+    void *dt_data = 0;
-     unsigned pagesize = 2048;
-     int fd;
-     SHA_CTX ctx;
-@@ -158,6 +161,8 @@ int main(int argc, char **argv)
-                 fprintf(stderr,"error: unsupported page size %d\n", pagesize);
-                 return -1;
-             }
-+        } else if(!strcmp(arg, "--dt")) {
-+            dt_fn = val;
-         } else {
-             return usage();
-         }
-@@ -232,6 +237,14 @@ int main(int argc, char **argv)
-         }
-     }
- 
-+    if(dt_fn) {
-+        dt_data = load_file(dt_fn, &hdr.dt_size);
-+        if (dt_data == 0) {
-+            fprintf(stderr,"error: could not load device tree image '%s'\n", dt_fn);
-+            return 1;
-+        }
-+    }
-+
-     /* put a hash of the contents in the header so boot images can be
-      * differentiated based on their first 2k.
-      */
-@@ -242,6 +255,10 @@ int main(int argc, char **argv)
-     SHA_update(&ctx, &hdr.ramdisk_size, sizeof(hdr.ramdisk_size));
-     SHA_update(&ctx, second_data, hdr.second_size);
-     SHA_update(&ctx, &hdr.second_size, sizeof(hdr.second_size));
-+    if(dt_data) {
-+        SHA_update(&ctx, dt_data, hdr.dt_size);
-+        SHA_update(&ctx, &hdr.dt_size, sizeof(hdr.dt_size));
-+    }
-     sha = SHA_final(&ctx);
-     memcpy(hdr.id, sha,
-            SHA_DIGEST_SIZE > sizeof(hdr.id) ? sizeof(hdr.id) : SHA_DIGEST_SIZE);
-@@ -266,6 +283,10 @@ int main(int argc, char **argv)
-         if(write_padding(fd, pagesize, hdr.second_size)) goto fail;
-     }
- 
-+    if(dt_data) {
-+        if(write(fd, dt_data, hdr.dt_size) != (ssize_t) hdr.dt_size) goto fail;
-+        if(write_padding(fd, pagesize, hdr.dt_size)) goto fail;
-+    }
-     return 0;
- 
- fail:
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch
deleted file mode 100644
index 2c607ff67..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From ef743c9c3c7452ae904a5c343ee2b759ab3a87cb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@ubuntu.com>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] Use linux/capability.h on linux systems too
-
-Upstream-Status: Inappropriate
----
- include/private/android_filesystem_config.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/private/android_filesystem_config.h b/include/private/android_filesystem_config.h
-index 2f528b95c8..3e0b00928e 100644
---- a/include/private/android_filesystem_config.h
-+++ b/include/private/android_filesystem_config.h
-@@ -27,7 +27,7 @@
- #include <sys/types.h>
- #include <stdint.h>
- 
--#ifdef HAVE_ANDROID_OS
-+#if defined(HAVE_ANDROID_OS) || defined(__linux__)
- #include <linux/capability.h>
- #else
- #include "android_filesystem_capability.h"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch
deleted file mode 100644
index 5b18f461a..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 9eff8799831961c0edf6e37e5d4cbf43baa7c748 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] Remove bionic specific calls
-
-Upstream-Status: Inappropriate
----
- include/cutils/properties.h | 1 -
- libcutils/properties.c      | 2 +-
- liblog/logd_write.c         | 5 +++++
- 3 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/include/cutils/properties.h b/include/cutils/properties.h
-index 798db8b36f..7d01f28d6e 100644
---- a/include/cutils/properties.h
-+++ b/include/cutils/properties.h
-@@ -19,7 +19,6 @@
- 
- #include <sys/cdefs.h>
- #include <stddef.h>
--#include <sys/system_properties.h>
- #include <stdint.h>
- 
- #ifdef __cplusplus
-diff --git a/libcutils/properties.c b/libcutils/properties.c
-index b283658aa4..4151e7882c 100644
---- a/libcutils/properties.c
-+++ b/libcutils/properties.c
-@@ -104,10 +104,10 @@ int32_t property_get_int32(const char *key, int32_t default_value) {
-     return (int32_t)property_get_imax(key, INT32_MIN, INT32_MAX, default_value);
- }
- 
-+#undef HAVE_LIBC_SYSTEM_PROPERTIES
- #ifdef HAVE_LIBC_SYSTEM_PROPERTIES
- 
- #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
--#include <sys/_system_properties.h>
- 
- int property_set(const char *key, const char *value)
- {
-diff --git a/liblog/logd_write.c b/liblog/logd_write.c
-index b2668cedb7..f5a44fe901 100644
---- a/liblog/logd_write.c
-+++ b/liblog/logd_write.c
-@@ -23,6 +23,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <sys/stat.h>
-+#include <sys/syscall.h>
- #include <sys/types.h>
- #if (FAKE_LOG_DEVICE == 0)
- #include <sys/socket.h>
-@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id_t log_id, struct iovec *vec, size_t nr)
-     realtime_ts.tv_nsec = ts.tv_nsec;
- 
-     log_id_buf = log_id;
-+#ifdef __BIONIC__
-     tid = gettid();
-+#else
-+    tid = (pid_t) syscall(__NR_gettid);
-+#endif
- 
-     newVec[0].iov_base   = (unsigned char *) &log_id_buf;
-     newVec[0].iov_len    = sizeof_log_id_t;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
deleted file mode 100644
index b0feb6592..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cd4525d760c6f88c9bf85f7bf488da79cd0d3264 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] Fix implicit declaration of stlcat/strlcopy functions
-
-Upstream-Status: Inappropriate
----
- adb/adb.c                | 1 +
- fs_mgr/fs_mgr_fstab.c    | 2 +-
- include/cutils/sockets.h | 2 +-
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/adb/adb.c b/adb/adb.c
-index e0f7ecde45..aaefd9b401 100644
---- a/adb/adb.c
-+++ b/adb/adb.c
-@@ -41,6 +41,7 @@
- #include <sys/prctl.h>
- #include <getopt.h>
- #include <selinux/selinux.h>
-+#include <grp.h>
- #else
- #include "usb_vendors.h"
- #endif
-diff --git a/fs_mgr/fs_mgr_fstab.c b/fs_mgr/fs_mgr_fstab.c
-index edd9591164..9ddb4643b5 100644
---- a/fs_mgr/fs_mgr_fstab.c
-+++ b/fs_mgr/fs_mgr_fstab.c
-@@ -17,7 +17,7 @@
- #include <ctype.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <string.h>
-+#include <bsd/string.h>
- #include <sys/mount.h>
- 
- #include "fs_mgr_priv.h"
-diff --git a/include/cutils/sockets.h b/include/cutils/sockets.h
-index daf43ec944..d3270c69e7 100644
---- a/include/cutils/sockets.h
-+++ b/include/cutils/sockets.h
-@@ -19,7 +19,7 @@
- 
- #include <errno.h>
- #include <stdlib.h>
--#include <string.h>
-+#include <bsd/string.h>
- #include <stdbool.h>
- 
- #ifdef HAVE_WINSOCK
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch
deleted file mode 100644
index a8434afba..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-From 48ddf4fb999931942c359350fb31cd557514e1c6 Mon Sep 17 00:00:00 2001
-From: Chenxi Mao <maochenxi@eswin.com>
-Date: Mon, 20 Apr 2020 15:27:22 +0800
-Subject: [PATCH 1/1] adb: Support riscv64
-
----
- include/cutils/atomic-inline.h  |   2 +
- include/cutils/atomic-riscv64.h | 156 ++++++++++++++++++++++++++++++++
- 2 files changed, 158 insertions(+)
- create mode 100644 include/cutils/atomic-riscv64.h
-
-diff --git a/include/cutils/atomic-inline.h b/include/cutils/atomic-inline.h
-index a31e913579..b5dc38209c 100644
---- a/include/cutils/atomic-inline.h
-+++ b/include/cutils/atomic-inline.h
-@@ -55,6 +55,8 @@ extern "C" {
- #include <cutils/atomic-mips64.h>
- #elif defined(__mips__)
- #include <cutils/atomic-mips.h>
-+#elif defined(__riscv) && __riscv_xlen == 64
-+#include <cutils/atomic-riscv64.h>
- #else
- #error atomic operations are unsupported
- #endif
-diff --git a/include/cutils/atomic-riscv64.h b/include/cutils/atomic-riscv64.h
-new file mode 100644
-index 0000000000..2664db5a86
---- /dev/null
-+++ b/include/cutils/atomic-riscv64.h
-@@ -0,0 +1,156 @@
-+/*
-+ * Copyright (C) 2014 The Android Open Source Project
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ *  * Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ *  * Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in
-+ *    the documentation and/or other materials provided with the
-+ *    distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
-+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
-+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
-+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
-+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
-+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-+ * SUCH DAMAGE.
-+ */
-+
-+#ifndef ANDROID_CUTILS_ATOMIC_RISCV64_H
-+#define ANDROID_CUTILS_ATOMIC_RISCV64_H
-+
-+#include <stdint.h>
-+
-+#ifndef ANDROID_ATOMIC_INLINE
-+#define ANDROID_ATOMIC_INLINE inline __attribute__((always_inline))
-+#endif
-+
-+/*
-+   TODOAArch64: Revisit the below functions and check for potential
-+   optimizations using assembly code or otherwise.
-+*/
-+
-+extern ANDROID_ATOMIC_INLINE
-+void android_compiler_barrier(void)
-+{
-+    __asm__ __volatile__ ("" : : : "memory");
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+void android_memory_barrier(void)
-+{
-+    __asm__ __volatile__ ("fence rw,rw" : : : "memory");
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_acquire_load(volatile const int32_t *ptr)
-+{
-+    int32_t value = *ptr;
-+    android_memory_barrier();
-+    return value;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_release_load(volatile const int32_t *ptr)
-+{
-+    android_memory_barrier();
-+    return *ptr;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+void android_atomic_acquire_store(int32_t value, volatile int32_t *ptr)
-+{
-+    *ptr = value;
-+    android_memory_barrier();
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+void android_atomic_release_store(int32_t value, volatile int32_t *ptr)
-+{
-+    android_memory_barrier();
-+    *ptr = value;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int android_atomic_cas(int32_t old_value, int32_t new_value,
-+                       volatile int32_t *ptr)
-+{
-+    return __sync_val_compare_and_swap(ptr, old_value, new_value) != old_value;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int android_atomic_acquire_cas(int32_t old_value, int32_t new_value,
-+                               volatile int32_t *ptr)
-+{
-+    int status = android_atomic_cas(old_value, new_value, ptr);
-+    android_memory_barrier();
-+    return status;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int android_atomic_release_cas(int32_t old_value, int32_t new_value,
-+                               volatile int32_t *ptr)
-+{
-+    android_memory_barrier();
-+    return android_atomic_cas(old_value, new_value, ptr);
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_add(int32_t increment, volatile int32_t *ptr)
-+{
-+    int32_t prev, status;
-+    android_memory_barrier();
-+    do {
-+        prev = *ptr;
-+        status = android_atomic_cas(prev, prev + increment, ptr);
-+    } while (__builtin_expect(status != 0, 0));
-+    return prev;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_inc(volatile int32_t *addr)
-+{
-+    return android_atomic_add(1, addr);
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_dec(volatile int32_t *addr)
-+{
-+    return android_atomic_add(-1, addr);
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_and(int32_t value, volatile int32_t *ptr)
-+{
-+    int32_t prev, status;
-+    android_memory_barrier();
-+    do {
-+        prev = *ptr;
-+        status = android_atomic_cas(prev, prev & value, ptr);
-+    } while (__builtin_expect(status != 0, 0));
-+    return prev;
-+}
-+
-+extern ANDROID_ATOMIC_INLINE
-+int32_t android_atomic_or(int32_t value, volatile int32_t *ptr)
-+{
-+    int32_t prev, status;
-+    android_memory_barrier();
-+    do {
-+        prev = *ptr;
-+        status = android_atomic_cas(prev, prev | value, ptr);
-+    } while (__builtin_expect(status != 0, 0));
-+    return prev;
-+}
-+
-+#endif /* ANDROID_CUTILS_ATOMIC_RISCV_H */
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
deleted file mode 100644
index 3ead649b1..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
+++ /dev/null
@@ -1,39 +0,0 @@
-Description: adb: Make compatible with openssl 1.1
- OpenSSL version 1.1 brought some API changes which broke the build here,
- fix that by accessing rsa->n (and e) directly, using RSA_get0_key instead.
-Author: Chirayu Desai <chirayudesai1@gmail.com
-Last-Update: 2016-11-10
----
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
----
- system/core/adb/adb_auth_host.c |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
---- a/adb/adb_auth_host.c
-+++ b/adb/adb_auth_host.c
-@@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
-     BIGNUM* rem = BN_new();
-     BIGNUM* n = BN_new();
-     BIGNUM* n0inv = BN_new();
-+    BIGNUM* e = BN_new();
- 
-     if (RSA_size(rsa) != RSANUMBYTES) {
-         ret = 0;
-@@ -82,7 +83,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
-     }
- 
-     BN_set_bit(r32, 32);
--    BN_copy(n, rsa->n);
-+    RSA_get0_key(rsa, &n, &e, NULL);
-     BN_set_bit(r, RSANUMWORDS * 32);
-     BN_mod_sqr(rr, r, n, ctx);
-     BN_div(NULL, rem, n, r32, ctx);
-@@ -96,7 +97,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
-         BN_div(n, rem, n, r32, ctx);
-         pkey->n[i] = BN_get_word(rem);
-     }
--    pkey->exponent = BN_get_word(rsa->e);
-+    pkey->exponent = BN_get_word(e);
- 
- out:
-     BN_free(n0inv);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk b/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
deleted file mode 100644
index c18aa9c4d..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
+++ /dev/null
@@ -1,103 +0,0 @@
-# Makefile for ext4_utils
-
-SRCDIR ?= $(S)
-
-VPATH += $(SRCDIR)/system/extras/ext4_utils
-make_ext4fs_SRC_FILES += make_ext4fs_main.c
-make_ext4fs_SRC_FILES += canned_fs_config.c
-make_ext4fs_OBJS := $(make_ext4fs_SRC_FILES:.c=.o)
-
-ext2simg_SRC_FILES += ext2simg.c
-ext2simg_OBJS := $(ext2simg_SRC_FILES:.c=.o)
-
-ext4fixup_SRC_FILES += ext4fixup_main.c
-ext4fixup_OBJS := $(ext4fixup_SRC_FILES:.c=.o)
-
-libext4_utils_SRC_FILES += make_ext4fs.c
-libext4_utils_SRC_FILES += ext4fixup.c
-libext4_utils_SRC_FILES += ext4_utils.c
-libext4_utils_SRC_FILES += allocate.c
-libext4_utils_SRC_FILES += contents.c
-libext4_utils_SRC_FILES += extent.c
-libext4_utils_SRC_FILES += indirect.c
-libext4_utils_SRC_FILES += uuid.c
-libext4_utils_SRC_FILES += sha1.c
-libext4_utils_SRC_FILES += wipe.c
-libext4_utils_SRC_FILES += crc16.c
-libext4_utils_SRC_FILES += ext4_sb.c
-libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/core/libsparse
-simg2img_SRC_FILES += simg2img.c
-simg2img_SRC_FILES += sparse_crc32.c
-simg2img_OBJS := $(simg2img_SRC_FILES:.c=.o)
-
-img2simg_SRC_FILES += img2simg.c
-img2simg_OBJS := $(img2simg_SRC_FILES:.c=.o)
-
-simg2simg_SRC_FILES += simg2simg.c
-simg2simg_SRC_FILES += sparse_crc32.c
-simg2simg_OBJS := $(simg2simg_SRC_FILES:.c=.o)
-
-libsparse_SRC_FILES += backed_block.c
-libsparse_SRC_FILES += output_file.c
-libsparse_SRC_FILES += sparse.c
-libsparse_SRC_FILES += sparse_crc32.c
-libsparse_SRC_FILES += sparse_err.c
-libsparse_SRC_FILES += sparse_read.c
-libsparse_OBJS := $(libsparse_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/external/libselinux/src
-libselinux_SRC_FILES += callbacks.c
-libselinux_SRC_FILES += check_context.c
-libselinux_SRC_FILES += freecon.c
-libselinux_SRC_FILES += init.c
-libselinux_SRC_FILES += label.c
-libselinux_SRC_FILES += label_file.c
-libselinux_SRC_FILES += label_android_property.c
-libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
-
-CFLAGS += -DANDROID
-CFLAGS += -DHOST
-CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
-CFLAGS += -I$(SRCDIR)/system/core/include
-CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
-CFLAGS += -I$(SRCDIR)/external/libselinux/include
-CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
-
-all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg
-
-make_ext4fs: libext4_utils.a libsparse.a libselinux.a $(make_ext4fs_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) \
-		libext4_utils.a libsparse.a libselinux.a -lz -lpcre
-
-ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \
-		libext4_utils.a libselinux.a libsparse.a -lz -lpcre
-
-ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) libext4_utils.a libsparse.a -lz
-
-simg2img: libsparse.a $(simg2img_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) libsparse.a -lz
-
-img2simg: libsparse.a $(img2simg_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) libsparse.a -lz
-
-simg2simg: libsparse.a $(simg2simg_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) libsparse.a -lz
-
-libext4_utils.a: $(libext4_utils_OBJS)
-	$(AR) rcs $@ $(libext4_utils_OBJS)
-
-libsparse.a: $(libsparse_OBJS)
-	$(AR) rcs $@ $(libsparse_OBJS)
-
-libselinux.a: $(libselinux_OBJS)
-	$(AR) rcs $@ $(libselinux_OBJS)
-
-clean:
-	$(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS) $(ext4fixup_OBJS) \
-		$(simg2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) \
-		$(libext4_utils_OBJS) $(libsparse_OBJS) $(libselinux_OBJS) \
-		make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch
deleted file mode 100644
index 4a19a5d65..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 354604da9d152f1931e91991d3f34197fc8fc759 Mon Sep 17 00:00:00 2001
-From: Sergio Schvezov <sergio.schvezov@canonical.com>
-Date: Tue, 2 Oct 2018 16:36:54 +0000
-Subject: [PATCH] ext4_utils: remove selinux extensions
-
-* drop useless includes of Android SELINUX extensions
-* avoids having to clone another module
-* this should be sent upstream
-
-Upstream-Status: Inappropriate
----
- ext4_utils/make_ext4fs.c      | 1 -
- ext4_utils/make_ext4fs_main.c | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
-index 2f89ae8a0..732afbed7 100644
---- a/ext4_utils/make_ext4fs.c
-+++ b/ext4_utils/make_ext4fs.c
-@@ -62,7 +62,6 @@
- 
- #include <selinux/selinux.h>
- #include <selinux/label.h>
--#include <selinux/android.h>
- 
- #define O_BINARY 0
- 
-diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_main.c
-index a6c5f6160..f8e7b9da9 100644
---- a/ext4_utils/make_ext4fs_main.c
-+++ b/ext4_utils/make_ext4fs_main.c
-@@ -32,7 +32,6 @@
- #ifndef USE_MINGW
- #include <selinux/selinux.h>
- #include <selinux/label.h>
--#include <selinux/android.h>
- #else
- struct selabel_handle;
- #endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
deleted file mode 100644
index 3b50ffbf3..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From b9254539811ce912bfd16dd1d185eba7a10cceff Mon Sep 17 00:00:00 2001
-From: Markus Mayer <mmayer@mmayer.net>
-Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] ext4_utils: add -o argument to preserve ownership
-
-See also https://android-review.googlesource.com/#/c/100312/
-
-Upstream-Status: Inappropriate
----
- ext4_utils/make_ext4fs.c      |  6 ++++++
- ext4_utils/make_ext4fs_main.c | 10 ++++++++--
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
-index 732afbed7..2cbf04399 100644
---- a/ext4_utils/make_ext4fs.c
-+++ b/ext4_utils/make_ext4fs.c
-@@ -67,6 +67,8 @@
- 
- #endif
- 
-+int preserve_owner = 0;
-+
- /* TODO: Not implemented:
-    Allocating blocks in the same block group as the file inode
-    Hash or binary tree directories
-@@ -185,6 +187,10 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
- 		} else {
- 			dentries[i].mtime = fixed_time;
- 		}
-+		if (preserve_owner) {
-+			dentries[i].uid = stat.st_uid;
-+			dentries[i].gid = stat.st_gid;
-+		}
- 		uint64_t capabilities;
- 		if (fs_config_func != NULL) {
- #ifdef ANDROID
-diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_main.c
-index f8e7b9da9..e82d43277 100644
---- a/ext4_utils/make_ext4fs_main.c
-+++ b/ext4_utils/make_ext4fs_main.c
-@@ -47,13 +47,15 @@ struct selabel_handle;
- extern struct fs_info info;
- 
- 
-+extern int preserve_owner;
-+
- static void usage(char *path)
- {
- 	fprintf(stderr, "%s [ -l <len> ] [ -j <journal size> ] [ -b <block_size> ]\n", basename(path));
- 	fprintf(stderr, "    [ -g <blocks per group> ] [ -i <inodes> ] [ -I <inode size> ]\n");
- 	fprintf(stderr, "    [ -L <label> ] [ -f ] [ -a <android mountpoint> ]\n");
- 	fprintf(stderr, "    [ -S file_contexts ] [ -C fs_config ] [ -T timestamp ]\n");
--	fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -v ] [ -B <block_list_file> ]\n");
-+	fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -o ] [ -v ] [ -B <block_list_file> ]\n");
- 	fprintf(stderr, "    <filename> [<directory>]\n");
- }
- 
-@@ -79,7 +81,7 @@ int main(int argc, char **argv)
- 	struct selinux_opt seopts[] = { { SELABEL_OPT_PATH, "" } };
- #endif
- 
--	while ((opt = getopt(argc, argv, "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctv")) != -1) {
-+	while ((opt = getopt(argc, argv, "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctov")) != -1) {
- 		switch (opt) {
- 		case 'l':
- 			info.len = parse_num(optarg);
-@@ -142,6 +144,10 @@ int main(int argc, char **argv)
- 			}
- #endif
- 			break;
-+		case 'o':
-+			preserve_owner = 1;
-+			printf("Warning: Enabling 'preserve ownership', this is an unofficial feature!\n");
-+			break;
- 		case 'v':
- 			verbose = 1;
- 			break;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
deleted file mode 100644
index b9ba95f38..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
+++ /dev/null
@@ -1,89 +0,0 @@
-# Makefile for fastboot
-
-SRCDIR ?= $(S)
-
-VPATH += $(SRCDIR)/system/core/fastboot
-fastboot_SRC_FILES += protocol.c
-fastboot_SRC_FILES += engine.c
-fastboot_SRC_FILES += bootimg.c
-fastboot_SRC_FILES += fastboot.c
-fastboot_SRC_FILES += util.c
-fastboot_SRC_FILES += fs.c
-fastboot_SRC_FILES += usb_linux.c
-fastboot_SRC_FILES += util_linux.c
-fastboot_OBJS := $(fastboot_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/core/libzipfile
-libzipfile_SRC_FILES += centraldir.c
-libzipfile_SRC_FILES += zipfile.c
-libzipfile_OBJS := $(libzipfile_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/extras/ext4_utils
-libext4_utils_SRC_FILES += make_ext4fs.c
-libext4_utils_SRC_FILES += ext4fixup.c
-libext4_utils_SRC_FILES += ext4_utils.c
-libext4_utils_SRC_FILES += allocate.c
-libext4_utils_SRC_FILES += contents.c
-libext4_utils_SRC_FILES += extent.c
-libext4_utils_SRC_FILES += indirect.c
-libext4_utils_SRC_FILES += uuid.c
-libext4_utils_SRC_FILES += sha1.c
-libext4_utils_SRC_FILES += wipe.c
-libext4_utils_SRC_FILES += crc16.c
-libext4_utils_SRC_FILES += ext4_sb.c
-libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/core/libsparse
-libsparse_SRC_FILES += backed_block.c
-libsparse_SRC_FILES += output_file.c
-libsparse_SRC_FILES += sparse.c
-libsparse_SRC_FILES += sparse_crc32.c
-libsparse_SRC_FILES += sparse_err.c
-libsparse_SRC_FILES += sparse_read.c
-libsparse_OBJS := $(libsparse_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/external/libselinux/src
-libselinux_SRC_FILES += callbacks.c
-libselinux_SRC_FILES += check_context.c
-libselinux_SRC_FILES += freecon.c
-libselinux_SRC_FILES += init.c
-libselinux_SRC_FILES += label.c
-libselinux_SRC_FILES += label_file.c
-libselinux_SRC_FILES += label_android_property.c
-libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
-
-CFLAGS += -std=gnu11
-CFLAGS += -DANDROID
-# CFLAGS += -DUSE_F2FS
-CFLAGS += -DHOST
-CFLAGS += -I$(SRCDIR)/system/core/fastboot
-CFLAGS += -I$(SRCDIR)/system/core/include
-CFLAGS += -I$(SRCDIR)/system/core/mkbootimg
-CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
-CFLAGS += -I$(SRCDIR)/system/extras/f2fs_utils
-CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
-CFLAGS += -I$(SRCDIR)/external/libselinux/include
-CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
-
-LIBS += libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz -lpcre
-
-all: fastboot
-
-fastboot: libzipfile.a libext4_utils.a libsparse.a libselinux.a $(fastboot_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) $(LIBS)
-
-libzipfile.a: $(libzipfile_OBJS)
-	$(AR) rcs $@ $(libzipfile_OBJS)
-
-libext4_utils.a: $(libext4_utils_OBJS)
-	$(AR) rcs $@ $(libext4_utils_OBJS)
-
-libsparse.a: $(libsparse_OBJS)
-	$(AR) rcs $@ $(libsparse_OBJS)
-
-libselinux.a: $(libselinux_OBJS)
-	$(AR) rcs $@ $(libselinux_OBJS)
-
-clean:
-	$(RM) $(fastboot_OBJS) $(libzipfile_OBJS) $(libext4_utils_OBJS) \
-		$(libsparse_OBJS) $(libselinux_OBJS) fastboot *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_remove_gtest.patch b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_remove_gtest.patch
new file mode 100644
index 000000000..a04f27f10
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_remove_gtest.patch
@@ -0,0 +1,51 @@
+socket.h: removing dependency of gtest
+
+Removed the dependency of gtest on the build of fastboot binary.
+Fixes below error
+
+In file included from fastboot/fastboot.cpp:70:
+| In file included from fastboot/tcp.h:36:
+| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file not found
+| #include <gtest/gtest_prod.h>
+|          ^~~~~~~~~~~~~~~~~~~~
+| 1 error generated.
+| In file included from fastboot/socket.cpp:29:
+| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file not found
+| #include <gtest/gtest_prod.h>
+|          ^~~~~~~~~~~~~~~~~~~~
+| 1 error generated.
+| In file included from fastboot/tcp.cpp:29:
+| In file included from fastboot/tcp.h:36:
+| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file not found
+| #include <gtest/gtest_prod.h>
+|          ^~~~~~~~~~~~~~~~~~~~
+| 1 error generated.
+| In file included from fastboot/udp.cpp:31:
+| In file included from fastboot/udp.h:34:
+| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file not found
+| #include <gtest/gtest_prod.h>
+|          ^~~~~~~~~~~~~~~~~~~~
+| 1 error generated.
+
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+--- a/system/core/fastboot/socket.h       2021-04-14 21:14:00.355973915 +0000
++++ b/system/core/fastboot/socket.h   2021-04-14 21:14:21.879680699 +0000
+@@ -40,7 +40,6 @@
+
+ #include <android-base/macros.h>
+ #include <cutils/sockets.h>
+-#include <gtest/gtest_prod.h>
+
+ // Socket interface to be implemented for each platform.
+ class Socket {
+@@ -119,8 +118,6 @@
+             socket_send_buffers_function_ = &socket_send_buffers;
+
+   private:
+-    FRIEND_TEST(SocketTest, TestTcpSendBuffers);
+-    FRIEND_TEST(SocketTest, TestUdpSendBuffers);
+
+     DISALLOW_COPY_AND_ASSIGN(Socket);
+ };
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change_out_dir.patch
new file mode 100644
index 000000000..c8904f045
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change_out_dir.patch
@@ -0,0 +1,52 @@
+patching fastboot.mk to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+
+--- git/system/core/debian/fastboot.mk	2021-05-17 07:47:56.800224043 +0000
++++ git/system/core/debian/fastboot.mk	2021-05-17 07:49:40.130383096 +0000
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = fastboot
+ fastboot_SOURCES = \
+           bootimg_utils.cpp \
+@@ -38,11 +39,11 @@
+             -Ifs_mgr/liblp/include \
+             -I/usr/include/android/openssl \
+             -Ilibsparse/include \
+-            -Ilibziparchive/include
++            -Ilibziparchive/include -I$(OUT_DIR)/usr/include/ 
+ LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+            -fuse-ld=gold \
+-           -Wl,-rpath-link=. \
+-           -L. -lziparchive -lsparse -lbase -lcutils -ladb -lcrypto -lext4_utils \
++           -Wl,-rpath-link=$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android -lziparchive -lsparse -lbase -lcutils -ladb -lcrypto -lext4_utils \
+            -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+            -l7z \
+ 
+@@ -53,7 +54,8 @@
+ endif
+ 
+ build: $(SOURCES)
+-	$(CXX) $^ -o fastboot/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
++	mkdir --parents $(OUT_DIR)/usr/bin/fastboot
++	$(CXX) $^ -o $(OUT_DIR)/usr/bin/fastboot/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
+ 
+ clean:
+-	$(RM) fastboot/$(NAME)
++	$(RM) $(OUT_DIR)/usr/bin/fastboot/$(NAME)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore b/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
deleted file mode 100644
index b034c10a1..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
+++ /dev/null
@@ -1,59 +0,0 @@
-*
-!.gitignore
-!*.indirectionsymlink
-!*.[ch]
-!*.mk
-!*.patch
-!*.service
-!NOTICE
-!MODULE_LICENSE_*
-!/system/
-!/system/core/
-!/system/core/adb/
-!/system/core/fastboot/
-!/system/core/fs_mgr/
-!/system/core/fs_mgr/include/
-!/system/core/include/
-!/system/core/include/android/
-!/system/core/include/cutils/
-!/system/core/include/log/
-!/system/core/include/mincrypt/
-!/system/core/include/private/
-!/system/core/include/utils/
-!/system/core/include/zipfile/
-!/system/core/liblog/
-!/system/core/liblog/tests/
-!/system/core/libcutils/
-!/system/core/libmincrypt/
-!/system/core/libzipfile/
-!/system/core/libsparse/
-!/system/core/libsparse/include/
-!/system/core/libsparse/include/sparse/
-!/system/core/libsparse/simg_dump.py
-!/system/core/mkbootimg/
-!/system/extras/
-!/system/extras/ext4_utils/
-!/system/extras/ext4_utils/mkuserimg.sh
-!/system/extras/ext4_utils/test_ext4fixup
-!/system/extras/f2fs_utils/
-!/hardware/
-!/hardware/libhardware/
-!/hardware/libhardware/include/
-!/hardware/libhardware/include/hardware/
-!/external/
-!/external/libselinux/
-!/external/libselinux/include/
-!/external/libselinux/include/selinux/
-!/external/libselinux/src/
-!/external/f2fs-tools/
-!/external/f2fs-tools/include/
-!/external/f2fs-tools/lib/
-!/external/f2fs-tools/mkfs/
-!/build/
-!/build/core/
-!/build/core/version_defaults.mk
-!/build/core/combo/
-!/build/core/combo/include/
-!/build/core/combo/include/arch/
-!/build/core/combo/include/arch/linux-*/
-!/build/core/combo/include/arch/linux-*/AndroidConfig.h
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_out_dir.patch
new file mode 100644
index 000000000..6913c4b98
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_out_dir.patch
@@ -0,0 +1,41 @@
+patching img2simg.mk to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+
+--- git/system/core/debian/img2simg.mk	2021-05-12 09:05:38.580607289 +0000
++++ git/system/core/debian/img2simg.mk	2021-05-12 09:09:04.331908253 +0000
+@@ -1,13 +1,14 @@
++include ../../rules_yocto.mk
+ NAME = img2simg
+ SOURCES = img2simg.cpp
+ SOURCES := $(foreach source, $(SOURCES), libsparse/$(source))
+ CPPFLAGS += -Ilibsparse/include -Iinclude -std=gnu++17
+-LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-           -Wl,-rpath-link=. \
+-           -L. -lsparse
++LDFLAGS += -Wl,-rpath=$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++           -Wl,-rpath-link=$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -lsparse
+ 
+ build: $(SOURCES)
+-	$(CXX) $^ -o libsparse/$(NAME) $(CPPFLAGS) $(LDFLAGS)
++	$(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME) $(CPPFLAGS) $(LDFLAGS)
+ 
+ clean:
+-	$(RM) libsparse/$(NAME)
++	$(RM) $(OUT_DIR)/usr/bin/$(NAME)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_out_dir.patch
new file mode 100644
index 000000000..7094ccaa9
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_out_dir.patch
@@ -0,0 +1,44 @@
+libadb.mk: modifications to make it build in yocto environment
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+--- git/system/core/debian/libadb.mk	2021-04-30 16:29:34.596618862 +0200
++++ git/system/core/debian/libadb.mk	2021-04-30 16:36:53.932837490 +0200
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME := libadb
+ 
+ LIBADB_SRC_FILES := \
+@@ -43,18 +44,18 @@
+             -Ibase/include \
+             -Idiagnose_usb/include \
+             -Ilibcrypto_utils/include \
+-            -Iinclude \
++            -Iinclude -I$(OUT_DIR)/usr/include \
+             -DPLATFORM_TOOLS_VERSION='"$(PLATFORM_TOOLS_VERSION)"' \
+             -DADB_HOST=1 -DADB_VERSION='"$(DEB_VERSION)"'
+ 
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
+            -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android -lcrypto \
+-           -lpthread -L. -lbase -lcutils -lcrypto_utils -lusb-1.0
++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android -lcrypto \
++           -lpthread -lbase -lcutils -lcrypto_utils -lusb-1.0
+ 
+ $(NAME).so: $(SOURCES)
+-	$(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(NAME).so
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
+ 
+ transport_mdns_unsupported.cpp:
+ 	echo 'void init_mdns_transport_discovery(void) {}' > transport_mdns_unsupported.cpp
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_change_out_dir.patch
new file mode 100644
index 000000000..464b63de2
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_change_out_dir.patch
@@ -0,0 +1,60 @@
+patching libbacktrace.mk to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+
+--- git/system/core/debian/libbacktrace.mk	2021-05-21 23:51:55.022408433 +0000
++++ git/system/core/debian/libbacktrace.mk	2021-05-21 23:53:07.487543521 +0000
+@@ -1,5 +1,6 @@
+-
+-include /usr/share/dpkg/architecture.mk
++include ../../rules_yocto.mk
++#pass architecture specific info to makefile
++DEB_HOST_ARCH=${deb_host_arch}
+ 
+ NAME = libbacktrace
+ 
+@@ -88,11 +89,11 @@
+             -Ilibprocinfo/include \
+             -Ilibunwindstack/include \
+             -I/usr/include/android/lzma \
+-            -I/usr/include/android/unwind
++            -I$(OUT_DIR)/usr/include/android/libunwind
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
+            -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android -lunwind \
+-           -L. -lbase -llog -lpthread -l7z
++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android -lunwind \
++           -lbase -llog -lpthread -l7z
+ 
+ # -latomic should be the last library specified
+ # https://github.com/android/ndk/issues/589
+@@ -104,11 +105,11 @@
+ endif
+ 
+ build: $(COBJECTS) $(CXXOBJECTS) $(OBJECTS_ASSEMBLY)
+-	$(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(NAME).so
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
++	ln -s $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(NAME).so
+ 
+ clean:
+-	$(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME).so*
++	$(RM) $(COBJECTS) $(CXXOBJECTS) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
+ 
+ $(CXXOBJECTS): %.o: %.cpp
+ 	$(CXX) $< -o $@ $(CXXFLAGS) $(CPPFLAGS)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_out_dir.patch
new file mode 100644
index 000000000..37c93d6d0
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_out_dir.patch
@@ -0,0 +1,33 @@
+libbase.mk: modifications to make it build in yocto environment
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+--- git/system/core/debian/libbase.mk	2021-04-29 22:01:13.664181133 +0200
++++ git/system/core/debian/libbase.mk	2021-04-29 22:04:52.328123833 +0200
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = libbase
+ SOURCES = \
+           chrono_utils.cpp \
+@@ -20,8 +21,9 @@
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0
+ 
+ build: $(SOURCES)
+-	$(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(NAME).so
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r base/include/* $(OUT_DIR)/usr/include/
+ 
+ clean:
+-	$(RM) $(NAME).so*
++	$(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_change_out_dir.patch
new file mode 100644
index 000000000..f70590977
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_change_out_dir.patch
@@ -0,0 +1,30 @@
+libcrypto.mk: modifications to make it build in yocto environment
+
+Adding an include file that is setting the common flags.
+
+Modified the build rule so that it outputs the binary and include
+to the OUT_DIR
+
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+--- git/external/boringssl/debian/libcrypto.mk	2021-04-30 11:32:40.610312307 +0000
++++ git/external/boringssl/debian/libcrypto.mk	2021-04-30 11:36:47.738318880 +0000
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ include sources.mk
+ 
+ NAME = libcrypto
+@@ -26,6 +27,8 @@
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 -lpthread
+ 
+ build: $(SOURCES)
+-	mkdir --parents debian/out
+-	$(CC) $^ -o debian/out/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
+-	ln -s $(NAME).so.0 debian/out/$(NAME).so
+\ No newline at end of file
++	mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ 
++	mkdir --parents $(OUT_DIR)/usr/include
++	$(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -DOPENSSL_NO_ASM
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r include/openssl $(OUT_DIR)/usr/include
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk_change_out_dir.patch
new file mode 100644
index 000000000..a0dd34876
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk_change_out_dir.patch
@@ -0,0 +1,38 @@
+libcrypto_utils.mk: modifications to make it build in yocto environment
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary and header to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+--- git/system/core/debian/libcrypto_utils.mk	2021-04-30 14:18:54.071379767 +0200
++++ git/system/core/debian/libcrypto_utils.mk	2021-04-30 14:22:46.179047308 +0200
+@@ -1,15 +1,17 @@
++include ../../rules_yocto.mk
+ NAME:= libcrypto_utils
+ SOURCES := android_pubkey.c
+ SOURCES := $(foreach source, $(SOURCES), libcrypto_utils/$(source))
+-CPPFLAGS += -Ilibcrypto_utils/include -Iinclude
++CPPFLAGS += -Ilibcrypto_utils/include -Iinclude -I$(OUT_DIR)/usr/include
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
+ 	-Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-	-L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++	-L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+ 	-lcrypto -Wl,-z,defs
+ 
+ build: $(SOURCES)
+-	$(CC) $^ -o $(NAME).so.0  $(CPPFLAGS) $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(NAME).so
++	$(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0  $(CPPFLAGS) $(LDFLAGS)
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r libcrypto_utils/include/* $(OUT_DIR)/usr/include/
+ 
+ clean:
+-	$(RM) $(NAME).so*
++	$(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_change_out_dir.patch
new file mode 100644
index 000000000..5539eb91d
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_change_out_dir.patch
@@ -0,0 +1,27 @@
+--- git/system/core/debian/libcutils.mk	2021-05-17 06:38:40.105161629 +0000
++++ git/system/core/debian/libcutils.mk	2021-05-17 06:42:37.141912366 +0000
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = libcutils
+ 
+ # copied from libcutils/Android.bp
+@@ -50,14 +51,15 @@
+             -Iinclude \
+ 
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
+-           -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android -lpthread -L. -llog -lbase
++           -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android -lpthread -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -llog -lbase 
+ 
+ build: $(COBJECTS) $(CXXOBJECTS)
+-	$(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(NAME).so
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)	
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r libcutils/include/cutils $(OUT_DIR)/usr/include/	
+ 
+ clean:
+-	$(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
++	$(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
+ 
+ $(COBJECTS): %.o: %.c
+ 	$(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_change_out_dir.patch
new file mode 100644
index 000000000..efccfab9c
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_change_out_dir.patch
@@ -0,0 +1,42 @@
+libext4_utils.mk: modifications to make it build in yocto environment
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary and header to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+--- git/system/extras/debian/libext4_utils.mk	2021-04-29 21:46:39.384394114 +0000
++++ git/system/extras/debian/libext4_utils.mk	2021-04-29 21:49:53.808605543 +0000
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = libext4_utils
+ 
+ ext4_utils_SOURCES := \
+@@ -17,14 +18,16 @@
+             -Iext4_utils/include \
+             -Ilibfec/include \
+             -Isquashfs_utils \
+-            -I/usr/include/android \
++            -I/usr/include/android -I$(OUT_DIR)/usr/include \
+             -D_GNU_SOURCE -DFEC_NO_KLOG -DSQUASHFS_NO_KLOG -D_LARGEFILE64_SOURCE
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
+            -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
+            -lbase -lsparse -lselinux
+ 
+ build: $(SOURCES)
+-	mkdir --parents $(OUT_DIR)
+-	$(CC) $^ -o $(OUT_DIR)/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).so
++	mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/	
++	$(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r ext4_utils/include/* $(OUT_DIR)/usr/include/
++
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_out_dir.patch
new file mode 100644
index 000000000..0f8184d41
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_out_dir.patch
@@ -0,0 +1,35 @@
+--- git/system/extras/debian/libfec.mk	2021-05-17 06:55:51.973044031 +0000
++++ git/system/extras/debian/libfec.mk	2021-05-17 06:56:41.940185413 +0000
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = libfec
+ 
+ # copied from libfec/Android.bp
+@@ -12,20 +13,21 @@
+ CXXFLAGS += -fno-strict-aliasing -std=g++17
+ CPPFLAGS += \
+             -Iext4_utils/include \
+-            -Ilibfec/include \
++            -Ilibfec/include -I $(OUT_DIR)/usr/include \
+             -D_GNU_SOURCE -DFEC_NO_KLOG -D_LARGEFILE64_SOURCE
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
+            -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+            -lbase -lsparse -lselinux
+ 
+ build: $(COBJECTS) $(CXXOBJECTS)
+-	mkdir -p $(OUT_DIR)
+-	$(CXX) $^ -o $(OUT_DIR)/$(NAME).so.0 $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).so
++	mkdir -p $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r libfec/include/* $(OUT_DIR)/usr/include/
+ 
+ clean:
+-	$(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
++	$(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
+ 
+ $(COBJECTS): %.o: %.c
+ 	$(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_out_dir.patch
new file mode 100644
index 000000000..09ef1871b
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_out_dir.patch
@@ -0,0 +1,42 @@
+patching liblog.mk to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+
+--- git/system/core/debian/liblog.mk	2021-05-17 08:13:28.304700936 +0000
++++ git/system/core/debian/liblog.mk	2021-05-17 08:15:59.590064282 +0000
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = liblog
+ 
+ # copied from liblog/Android.bp
+@@ -39,11 +40,12 @@
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 -lpthread
+ 
+ build: $(COBJECTS) $(CXXOBJECTS)
+-	$(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(NAME).so
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)	
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r liblog/include/* $(OUT_DIR)/usr/include/	
+ 
+ clean:
+-	$(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME).so*
++	$(RM) $(COBJECTS) $(CXXOBJECTS) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
+ 
+ $(COBJECTS): %.o: %.c
+ 	$(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
deleted file mode 100644
index 9de2593df..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 36654a4484117e5f4d63a810c0d94bc9c7ee3a83 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Tue, 2 Oct 2018 16:36:54 +0000
-Subject: [PATCH] Remove bionic specific calls
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/procattr.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/procattr.c b/src/procattr.c
-index f350808..761cf8e 100644
---- a/src/procattr.c
-+++ b/src/procattr.c
-@@ -8,7 +8,7 @@
- #include "selinux_internal.h"
- #include "policy.h"
- 
--#ifdef HOST
-+#ifndef __BIONIC__
- static pid_t gettid(void)
- {
- 	return syscall(__NR_gettid);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
deleted file mode 100644
index 87771cba8..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f4f9d24860e1b5cd4f6a014f3fda7cd33ebe5be7 Mon Sep 17 00:00:00 2001
-From: Petr Lautrbach <plautrba@redhat.com>
-Date: Sat, 27 Jul 2019 08:20:20 -0700
-Subject: [PATCH] libselinux: Do not define gettid() if glibc >= 2.30 is used
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Since version 2.30 glibc implements gettid() system call wrapper, see
-https://sourceware.org/bugzilla/show_bug.cgi?id=6399
-
-Fixes:
-cc -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND   -c -o procattr.o procattr.c
-procattr.c:28:14: error: static declaration of ‘gettid’ follows non-static declaration
-   28 | static pid_t gettid(void)
-      |              ^~~~~~
-In file included from /usr/include/unistd.h:1170,
-                 from procattr.c:2:
-/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of ‘gettid’ was here
-   34 | extern __pid_t gettid (void) __THROW;
-      |                ^~~~~~
-
-Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
-Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/procattr.c | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
---- a/src/procattr.c
-+++ b/src/procattr.c
-@@ -8,12 +8,16 @@
- #include "selinux_internal.h"
- #include "policy.h"
- 
--#ifndef __BIONIC__
-+/* Bionic and glibc >= 2.30 declare gettid() system call wrapper in unistd.h and
-+ * has a definition for it */
-+#if defined(__GLIBC_)
-+#if !__GLIBC_PREREQ(2,30)
- static pid_t gettid(void)
- {
- 	return syscall(__NR_gettid);
- }
- #endif
-+#endif
- 
- static int getprocattrcon(char ** context,
- 			  pid_t pid, const char *attr)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_change_out_dir.patch
new file mode 100644
index 000000000..4f8bb44a4
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_change_out_dir.patch
@@ -0,0 +1,47 @@
+patching libsparse.mk to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+
+--- git/system/core/debian/libsparse.mk	2021-05-17 08:13:34.764584388 +0000
++++ git/system/core/debian/libsparse.mk	2021-05-17 08:15:34.850492654 +0000
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = libsparse
+ SOURCES = \
+         backed_block.cpp \
+@@ -18,16 +19,16 @@
+   -shared -Wl,-soname,$(NAME).so.0 \
+   -lz \
+   -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-  -L. \
++  -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
+   -lbase
+ 
+ 
+ build: $(COBJECTS) $(CXXOBJECTS)
+-	$(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(NAME).so
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so	
+ 
+ clean:
+-	$(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
++	$(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
+ 
+ $(COBJECTS): %.o: %.c
+ 	$(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_change_out_dir.patch
new file mode 100644
index 000000000..237d45c3c
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_change_out_dir.patch
@@ -0,0 +1,47 @@
+patching libundwind to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Passing the architecture details($CPU)from the recipe.
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+
+--- git/external/libunwind/debian/libunwind.mk	2021-05-22 02:29:52.950324653 +0000
++++ git/external/libunwind/debian/libunwind.mk	2021-05-22 02:30:48.535322846 +0000
+@@ -1,4 +1,4 @@
+-include debian/detect_arch.mk
++include ../../rules_yocto.mk 
+ 
+ ARCH_SOURCES = is_fpreg.c \
+                regname.c \
+@@ -131,10 +131,12 @@
+ CPPFLAGS += -Iinclude -Isrc $($(CPU)_INCLUDES) -Idebian/include
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
+            -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-           -lpthread -nostdlib -lc -lgcc -Ldebian/out -l7z
++           -lpthread -nostdlib -lc -lgcc -l7z
+ 
+ build: $(SOURCES)
+-	mkdir --parents debian/out
+-	ln -s /usr/lib/p7zip/7z.so debian/out/lib7z.so
+-	$(CC) $^ -o debian/out/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
+-	ln -s $(NAME).so.0 debian/out/$(NAME).so
++	mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ 
++	mkdir --parents $(OUT_DIR)/usr/include/android/libunwind
++	$(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -Wno-header-guard -Wno-absolute-value
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r include/* debian/include/* $(OUT_DIR)/usr/include/android/libunwind/
++
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_change_out_dir.patch
new file mode 100644
index 000000000..cc9997dac
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_change_out_dir.patch
@@ -0,0 +1,47 @@
+patching libziparchive.mk to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+
+--- git/system/core/debian/libziparchive.mk	2021-05-17 08:13:41.684459540 +0000
++++ git/system/core/debian/libziparchive.mk	2021-05-17 08:16:19.293722572 +0000
+@@ -1,3 +1,4 @@
++include ../../rules_yocto.mk
+ NAME = libziparchive
+ SOURCES = zip_archive.cc \
+           zip_archive_stream_entry.cc\
+@@ -5,14 +6,15 @@
+ SOURCES := $(foreach source, $(SOURCES), libziparchive/$(source))
+ CXXFLAGS += -std=gnu++17
+ CPPFLAGS += -DZLIB_CONST -D_FILE_OFFSET_BITS=64 \
+-            -Iinclude -Ibase/include -Ilibziparchive/include
++            -Iinclude -Ibase/include -Ilibziparchive/include -I$(OUT_DIR)/usr/include/
+ LDFLAGS += -shared -Wl,-soname,$(NAME).so.0 \
+            -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-           -lz -L. -llog -lbase
++           -lz -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android -llog -lbase 
+ 
+ build: $(SOURCES)
+-	$(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
+-	ln -s $(NAME).so.0 $(NAME).so
++	$(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)	
++	ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
++	cp -r libziparchive/include/* $(OUT_DIR)/usr/include/
+ 
+ clean:
+-	$(RM) $(NAME).so*
++	$(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk b/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
deleted file mode 100644
index 519f609fd..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-# Makefile for mkbootimg
-
-SRCDIR ?= $(S)
-
-VPATH += $(SRCDIR)/system/core/mkbootimg
-mkbootimg_SRC_FILES += mkbootimg.c
-mkbootimg_OBJS := $(mkbootimg_SRC_FILES:.c=.o)
-
-VPATH += $(SRCDIR)/system/core/libmincrypt
-libmincrypt_SRC_FILES := dsa_sig.c p256.c p256_ec.c p256_ecdsa.c rsa.c sha.c sha256.c
-libmincrypt_OBJS := $(libmincrypt_SRC_FILES:.c=.o)
-
-CFLAGS += -DANDROID
-CFLAGS += -I$(SRCDIR)/system/core/mkbootimg
-CFLAGS += -I$(SRCDIR)/system/core/include
-CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
-
-LIBS += libmincrypt.a
-
-all: mkbootimg
-
-mkbootimg: libmincrypt.a $(mkbootimg_OBJS)
-	$(CC) -o $@ $(LDFLAGS) $(mkbootimg_OBJS) $(LIBS)
-
-libmincrypt.a: $(libmincrypt_OBJS)
-	$(AR) rcs $@ $(libmincrypt_OBJS)
-
-clean:
-	$(RM) $(mkbootimg_OBJS) $(libmincrypt_OBJS) mkbootimg *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk b/meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
new file mode 100644
index 000000000..5e217f47f
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
@@ -0,0 +1,4 @@
+CPPFLAGS += -fPIC
+ifndef OUT_DIR
+OUT_DIR = ../../debian/out
+endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_out_dir.patch
new file mode 100644
index 000000000..d17adfffd
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_out_dir.patch
@@ -0,0 +1,41 @@
+patching simg2img.mk to build in yocto environment.
+
+Changes include:
+Introduced an output folder which will keep all the outputs from the
+android-tools.
+
+Adding an include file that is setting the common flags.
+Changed the cppflag to include the headers from other components
+of android-tools
+
+Modified LDflags so that the libraries that are coming from other android-tools
+are searched in the output folder.
+
+Modified the build rule so that it outputs the binary to the OUT_DIR
+
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+
+--- git/system/core/debian/simg2img.mk	2021-05-12 09:47:52.577840520 +0000
++++ git/system/core/debian/simg2img.mk	2021-05-12 09:51:43.525678276 +0000
+@@ -1,13 +1,14 @@
++include ../../rules_yocto.mk
+ NAME = simg2img
+ SOURCES = simg2img.cpp sparse_crc32.cpp
+ SOURCES := $(foreach source, $(SOURCES), libsparse/$(source))
+ CPPFLAGS += -Ilibsparse/include -Iinclude -std=gnu++17
+-LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-           -Wl,-rpath-link=. \
+-           -L. -lsparse
++LDFLAGS += -Wl,-rpath=$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++           -Wl,-rpath-link=$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android -lsparse
+ 
+ build: $(SOURCES)
+-	$(CXX) $^ -o libsparse/$(NAME) $(CPPFLAGS) $(LDFLAGS)
++	$(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME) $(CPPFLAGS) $(LDFLAGS)
+ 
+ clean:
+-	$(RM) libsparse/$(NAME)
++	$(RM) $(OUT_DIR)/usr/bin/$(NAME)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std_to_compile_libbacktrace.patch b/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std_to_compile_libbacktrace.patch
new file mode 100644
index 000000000..079ade46b
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std_to_compile_libbacktrace.patch
@@ -0,0 +1,19 @@
+To Fix the below error
+
+ In file included from libunwindstack/DwarfSection.cpp:21:
+| libunwindstack/include/unwindstack/DwarfMemory.h:32:29: error: unknown type name 'size_t'; did you mean 'std::size_t'?
+|   bool ReadBytes(void* dst, size_t num_bytes);
+|                             ^~~~~~
+|                             std::size_t
+
+--- ./system/core/libunwindstack/include/unwindstack/DwarfMemory.h	2021-05-22 00:52:15.132452862 +0000
++++ ./system/core/libunwindstack/include/unwindstack/DwarfMemory.h	2021-05-22 00:53:09.793416724 +0000
+@@ -23,7 +23,7 @@
+ 
+ // Forward declarations.
+ class Memory;
+-
++using namespace std;
+ class DwarfMemory {
+  public:
+   DwarfMemory(Memory* memory) : memory_(memory) {}
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_10.0.0.r36.bb b/meta-oe/recipes-devtools/android-tools/android-tools_10.0.0.r36.bb
new file mode 100644
index 000000000..02c669582
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_10.0.0.r36.bb
@@ -0,0 +1,204 @@
+DESCRIPTION = "Different utilities from Android"
+SECTION = "console/utils"
+LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
+    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
+    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
+    file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
+"
+DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools p7zip libselinux"
+
+ANDROID_MIRROR = "android.googlesource.com"
+
+# matches with 10.0.0+r36
+SRCREV_boringssl = "ae2dd49c7cb74d04bdba7c1c9bd62c1e9cdf98f6"
+SRCREV_core = "5aa13b053182b758d7a19db0c83e1b9b5bf1ec2e"
+SRCREV_extras = "d31740f9d0399f8b938e88e58843d966e1cccab6"
+SRCREV_libhardware = "c6925520342a7d37758f85eb1cf3baa20a7b7a18"
+SRCREV_build = "28768b3120f751583a2743101b892f210d4715cf"
+SRCREV_libunwind = "03a963ecf6ea836b38b3537cbcda0ecfd7a77393"
+
+SRC_URI = " \
+    git://salsa.debian.org/android-tools-team/android-platform-external-boringssl;name=boringssl;protocol=https;nobranch=1;destsuffix=git/external/boringssl \
+    git://salsa.debian.org/android-tools-team/android-platform-system-core;name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
+    git://salsa.debian.org/android-tools-team/android-platform-system-extras;name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
+    git://${ANDROID_MIRROR}/platform/hardware/libhardware;name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware \
+    git://salsa.debian.org/android-tools-team/android-platform-build.git;name=build;protocol=https;nobranch=1;destsuffix=git/build \
+    git://salsa.debian.org/android-tools-team/android-platform-external-libunwind.git;protocol=https;name=libunwind;nobranch=1;destsuffix=git/external/libunwind \
+    file://adb_mk_change_out_dir.patch \
+    file://libadb_mk_change_out_dir.patch \
+    file://fastboot_compile_remove_gtest.patch \
+    file://fastboot_mk_change_out_dir.patch \
+    file://libbase_mk_change_out_dir.patch \
+    file://libext4_utils_mk_change_out_dir.patch \
+    file://libcrypto_mk_change_out_dir.patch \
+    file://libcrypto_utils_mk_change_out_dir.patch \
+    file://libcutils_mk_change_out_dir.patch \
+    file://libfec_mk_change_out_dir.patch \
+    file://img2simg_change_out_dir.patch \
+    file://simg2img_change_out_dir.patch \
+    file://liblog_mk_change_out_dir.patch \
+    file://libsparse_mk_change_out_dir.patch \
+    file://libziparchive_mk_change_out_dir.patch \
+    file://libbacktrace_mk_change_out_dir.patch \
+    file://libunwind_mk_change_out_dir.patch \
+    file://use_name_space_std_to_compile_libbacktrace.patch \
+    file://rules_yocto.mk;subdir=git \
+    file://android-tools-adbd.service \
+"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/${BPN}"
+
+#apply all the patches maintained in the debian version.
+do_unpack_and_patch_debian() {
+    cd ${S}/system/core
+    for i in `find ${S}/system/core/debian/patches -name "*.patch"`; do
+        patch -p1 < $i
+    done
+    #a patch with no .patch extention, lets apply that
+    patch -p1 < ${S}/system/core/debian/patches/Added-missing-headers
+    cd ${S}/external/libunwind
+    for i in `find ${S}/external/libunwind/debian/patches -name "*.patch"`; do
+        patch -p1 < $i
+    done
+}
+addtask unpack_and_patch_debian after do_unpack before do_patch
+
+# http://errors.yoctoproject.org/Errors/Details/1debian881/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
+COMPATIBLE_HOST_powerpc = "(null)"
+COMPATIBLE_HOST_powerpc64 = "(null)"
+COMPATIBLE_HOST_powerpc64le = "(null)"
+
+inherit systemd clang
+
+TOOLCHAIN = "clang"
+DEPENDS += "\
+    clang-cross-${TARGET_ARCH} \
+"
+
+SYSTEMD_SERVICE_${PN} = "android-tools-adbd.service"
+
+# Find libbsd headers during native builds
+CC_append_class-native = " -I${STAGING_INCDIR}"
+CC_append_class-nativesdk = " -I${STAGING_INCDIR}"
+
+PREREQUISITE_core = "libbase libsparse liblog libcutils"
+TOOLS_TO_BUILD = "libcrypto_utils libadb libziparchive fastboot adb img2simg simg2img libbacktrace"
+
+# Adb needs sys/capability.h, which is not available for native*
+TOOLS_class-native = "boringssl fastboot ext4_utils mkbootimg"
+TOOLS_class-nativesdk = "boringssl fastboot ext4_utils mkbootimg"
+
+do_compile() {
+
+    case "${HOST_ARCH}" in
+      arm)
+        export android_arch=linux-arm
+        cpu=arm
+        deb_host_arch=arm
+      ;;
+      aarch64)
+        export android_arch=linux-arm64
+        cpu=arm64
+        deb_host_arch=arm64
+      ;;
+      riscv64)
+        export android_arch=linux-riscv64
+      ;;
+      mips|mipsel)
+        export android_arch=linux-mips
+        cpu=mips
+        deb_host_arch=mips
+      ;;
+      mips64|mips64el)
+        export android_arch=linux-mips64
+        cpu=mips64
+        deb_host_arch=mips64
+      ;;
+      powerpc|powerpc64)
+        export android_arch=linux-ppc
+      ;;
+      i586|i686|x86_64)
+        export android_arch=linux-x86
+        cpu=x86_64
+        deb_host_arch=amd64
+      ;;
+    esac
+
+    export SRCDIR=${S}
+
+    oe_runmake -f ${S}/external/boringssl/debian/libcrypto.mk -C ${S}/external/boringssl
+    oe_runmake -f ${S}/external/libunwind/debian/libunwind.mk -C ${S}/external/libunwind CPU=${cpu}
+
+    for tool in ${PREREQUISITE_core}; do
+      oe_runmake -f ${S}/system/core/debian/${tool}.mk -C ${S}/system/core
+    done
+
+    for i in `find ${S}/system/extras/debian/ -name "*.mk"`; do
+        oe_runmake -f $i -C ${S}/system/extras
+    done
+
+    for tool in ${TOOLS_TO_BUILD}; do
+        if tool == "libbacktrace"; then
+            oe_runmake -f ${S}/system/core/debian/${tool}.mk -C ${S}/system/core DEB_HOST_ARCH=${deb_host_arch}
+        else
+            oe_runmake -f ${S}/system/core/debian/${tool}.mk -C ${S}/system/core
+        fi
+    done
+
+}
+
+do_install() {
+    if echo ${TOOLS_TO_BUILD} | grep -q "ext4_utils" ; then
+        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
+    fi
+
+    if echo ${TOOLS_TO_BUILD} | grep -q "adb " ; then
+        install -d ${D}${bindir}
+        install -m0755 ${S}/debian/out/usr/lib/android/adb/adb ${D}${bindir}
+    fi
+
+    if echo ${TOOLS_TO_BUILD} | grep -q "adbd" ; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/adbd/adbd ${D}${bindir}
+    fi
+
+    # Outside the if statement to avoid errors during do_package
+    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
+      ${D}${systemd_unitdir}/system/android-tools-adbd.service
+
+    if echo ${TOOLS_TO_BUILD} | grep -q "fastboot" ; then
+        install -d ${D}${bindir}
+        install -m0755 ${S}/debian/out/usr/bin/fastboot/fastboot ${D}${bindir}
+    fi
+
+    install -d  ${D}${libdir}/android/
+    install -m0755 ${S}/debian/out/usr/lib/android/*.so.* ${D}${libdir}/android/
+    if echo ${TOOLS_TO_BUILD} | grep -q "mkbootimg" ; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
+    fi
+}
+
+PACKAGES += "${PN}-fstools"
+
+RDEPENDS_${BPN} = "${BPN}-conf p7zip"
+
+FILES_${PN}-fstools = "\
+    ${bindir}/ext2simg \
+    ${bindir}/ext4fixup \
+    ${bindir}/img2simg \
+    ${bindir}/make_ext4fs \
+    ${bindir}/simg2img \
+    ${bindir}/simg2simg \
+    ${bindir}/simg_dump \
+    ${bindir}/mkuserimg \
+"
+FILES_${PN} += "${libdir}/android ${libdir}/android/*"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
deleted file mode 100644
index e8992346b..000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ /dev/null
@@ -1,182 +0,0 @@
-DESCRIPTION = "Different utilities from Android"
-SECTION = "console/utils"
-LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM = " \
-    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
-    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
-    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
-    file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
-"
-DEPENDS = "libbsd libpcre zlib libcap"
-DEPENDS_append_class-target = " openssl"
-
-ANDROID_MIRROR = "android.googlesource.com"
-
-# matches with android-5.1.1_r37
-SRCREV_core = "2314b110bdebdbfd2d94c502282f9e57c849897e"
-SRCREV_extras = "3ecbe8d841df96127d7855661293e5ab6ba6c205"
-SRCREV_libhardware = "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
-SRCREV_libselinux = "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
-SRCREV_build = "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
-
-SRC_URI = " \
-    git://${ANDROID_MIRROR}/platform/system/core;name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
-    git://${ANDROID_MIRROR}/platform/system/extras;name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
-    git://${ANDROID_MIRROR}/platform/hardware/libhardware;name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware \
-    git://${ANDROID_MIRROR}/platform/external/libselinux;name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux \
-    git://${ANDROID_MIRROR}/platform/build;name=build;protocol=https;nobranch=1;destsuffix=git/build \
-    file://core/0001-adb-remove-selinux-extensions.patch;patchdir=system/core \
-    file://core/0002-adb-Use-local-sockets-where-appropriate.patch;patchdir=system/core \
-    file://core/0003-adb-define-shell-command.patch;patchdir=system/core \
-    file://core/0004-adb-Fix-build-on-big-endian-systems.patch;patchdir=system/core \
-    file://core/0005-adb-add-base64-implementation.patch;patchdir=system/core \
-    file://core/0006-adb-Musl-fixes.patch;patchdir=system/core \
-    file://core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=system/core \
-    file://core/0008-adb-Allow-adbd-to-be-ran-as-root.patch;patchdir=system/core \
-    file://core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;patchdir=system/core \
-    file://core/0010-Use-linux-capability.h-on-linux-systems-too.patch;patchdir=system/core \
-    file://core/0011-Remove-bionic-specific-calls.patch;patchdir=system/core \
-    file://core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch;patchdir=system/core \
-    file://core/adb_libssl_11.diff;patchdir=system/core \
-    file://core/0013-adb-Support-riscv64.patch;patchdir=system/core \
-    file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=system/extras \
-    file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;patchdir=system/extras \
-    file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=external/libselinux \
-    file://libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch;patchdir=external/libselinux \
-    file://android-tools-adbd.service \
-    file://build/0001-Riscv-Add-risc-v-Android-config-header.patch;patchdir=build \
-    file://gitignore \
-    file://adb.mk;subdir=${BPN} \
-    file://adbd.mk;subdir=${BPN} \
-    file://ext4_utils.mk;subdir=${BPN} \
-    file://fastboot.mk;subdir=${BPN} \
-    file://mkbootimg.mk;subdir=${BPN} \
-"
-
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/${BPN}"
-
-# http://errors.yoctoproject.org/Errors/Details/133881/
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-
-COMPATIBLE_HOST_powerpc = "(null)"
-COMPATIBLE_HOST_powerpc64 = "(null)"
-COMPATIBLE_HOST_powerpc64le = "(null)"
-
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}-adbd"
-SYSTEMD_SERVICE_${PN}-adbd = "android-tools-adbd.service"
-
-# Find libbsd headers during native builds
-CC_append_class-native = " -I${STAGING_INCDIR}"
-CC_append_class-nativesdk = " -I${STAGING_INCDIR}"
-
-TOOLS = "adb fastboot ext4_utils mkbootimg adbd"
-
-# Adb needs sys/capability.h, which is not available for native*
-TOOLS_class-native = "fastboot ext4_utils mkbootimg"
-TOOLS_class-nativesdk = "fastboot ext4_utils mkbootimg"
-
-do_compile() {
-    cp ${WORKDIR}/gitignore ${S}/.gitignore
-
-    # Setting both variables below causing our makefiles to not work with
-    # implicit make rules
-    unset CFLAGS
-    unset CPPFLAGS
-
-    export SRCDIR=${S}
-
-    case "${HOST_ARCH}" in
-      arm)
-        export android_arch=linux-arm
-      ;;
-      aarch64)
-        export android_arch=linux-arm64
-      ;;
-      riscv64)
-        export android_arch=linux-riscv64
-      ;;
-      mips|mipsel)
-        export android_arch=linux-mips
-      ;;
-      mips64|mips64el)
-        export android_arch=linux-mips64
-      ;;
-      powerpc|powerpc64)
-        export android_arch=linux-ppc
-      ;;
-      i586|i686|x86_64)
-        export android_arch=linux-x86
-      ;;
-    esac
-
-    for tool in ${TOOLS}; do
-      mkdir -p ${B}/${tool}
-      oe_runmake -f ${B}/${tool}.mk -C ${B}/${tool}
-    done
-}
-
-do_install() {
-    if echo ${TOOLS} | grep -q "ext4_utils" ; then
-        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
-        install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
-
-        install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
-        install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
-    fi
-
-    if echo ${TOOLS} | grep -q "adb " ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/adb/adb ${D}${bindir}
-    fi
-
-    if echo ${TOOLS} | grep -q "adbd" ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/adbd/adbd ${D}${bindir}
-    fi
-
-    # Outside the if statement to avoid errors during do_package
-    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
-      ${D}${systemd_unitdir}/system/android-tools-adbd.service
-
-    if echo ${TOOLS} | grep -q "fastboot" ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
-    fi
-
-    if echo ${TOOLS} | grep -q "mkbootimg" ; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
-    fi
-}
-
-PACKAGES =+ "${PN}-fstools ${PN}-adbd"
-
-RDEPENDS_${PN}-adbd = "${PN}-conf"
-RDEPENDS_${PN}-fstools = "bash"
-
-FILES_${PN}-adbd = "\
-    ${bindir}/adbd \
-    ${systemd_unitdir}/system/android-tools-adbd.service \
-"
-
-FILES_${PN}-fstools = "\
-    ${bindir}/ext2simg \
-    ${bindir}/ext4fixup \
-    ${bindir}/img2simg \
-    ${bindir}/make_ext4fs \
-    ${bindir}/simg2img \
-    ${bindir}/simg2simg \
-    ${bindir}/simg_dump \
-    ${bindir}/mkuserimg \
-"
-
-BBCLASSEXTEND = "native"
-- 
2.17.1

