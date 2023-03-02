Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B194C7EE37
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 08:31:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.10287.1677745882654474465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 00:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gomlaf8V;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id i3so16789785plg.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtiWP5rHLmyZ4W3ChqWIosA1AHQ64eNkVCyngPe2RPo=;
        b=Gomlaf8VZ0bKXrtsA+gx9m2j1TVCzSRCbhptrQaKkATTLg9TTnDZpn0EslBkWfSMm3
         QWj9J9IRjWKzyqg5p+7nqoJCVD0mRU9Y8+y41nB4ZjqMUj86ilpU5DgE5rEk9EGVEOqf
         QRICz8r/hXNJj6ljiq3h0BVGT6lIXHXUKUVvO8TVvGdVxt8XR38VgQXQb5F4RDvEpn8v
         indjTHakfwSCRpwCFoxGjGu+C1BNW0wtYvHvg24Ovwi4tHToHOiTBxxPtiN5ySdnsazB
         boruUK0zYn95Vso1me7im4TZRmvmrNsZxbBhSf/mnNScTn5x+KECORwiVwMUBSrbreDb
         HkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtiWP5rHLmyZ4W3ChqWIosA1AHQ64eNkVCyngPe2RPo=;
        b=dFO5qsTApC9GQPfvunbOvXmXaLDzh4qngbtLkWBehMFf4nLF4EzNkgJoq5Tw7x7k6i
         0HVEtkQVBCZIA8yHiiSMuRW9nfyvjFJPg4gfdOHgLYkUw1A4aVDw3gVVj+fI7WeSZgBg
         Bl7snORRAMlf4tpCm9GsDMVtZxl5TLH7ta5NWfN/cfUFPwpw7DYXTEDRRGaiSxVsGBiS
         rE/t6TCDAA1/AeHgoUO+dqDEfSv3W1QnD9ryHCfQXMyMKKHPvgB3aobZB/BNpXX3AJUr
         nKdS2+r1H19O9sdiqwfKOpIXic05w/rHKOp9glVzqXjewBi0l8qicBvHX3LHoXrXlWOJ
         nixg==
X-Gm-Message-State: AO0yUKUZfk8KKPPJSRcAHIneNrZdJh4wYSB8tV+ewMkj8FJL+1sU1T0S
	RWm0AClsmR+clbKpZO3aIHI+gOEJmi4=
X-Google-Smtp-Source: AK7set/DfdG9iaPMVJ7/txvv9bMatD5FFrBNsUSFgi2vv1itz3k7hdBtPJBpwBMOQ1KSi06HZkf+Sg==
X-Received: by 2002:a17:903:2301:b0:19a:ae30:3a42 with SMTP id d1-20020a170903230100b0019aae303a42mr1564568plh.21.1677745881836;
        Thu, 02 Mar 2023 00:31:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d70d00b0019aeddce6casm9670994ply.205.2023.03.02.00.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 00:31:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] libsdl-image: Fix build with clang16
Date: Thu,  2 Mar 2023 00:31:15 -0800
Message-Id: <20230302083116.1332448-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302083116.1332448-1-raj.khem@gmail.com>
References: <20230302083116.1332448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 08:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101330

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-png-img-Fix-prototypes-of-callbacks.patch | 52 +++++++++++++++++++
 .../libsdl/libsdl-image_1.2.12.bb             |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-image/0001-png-img-Fix-prototypes-of-callbacks.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-image/0001-png-img-Fix-prototypes-of-callbacks.patch b/meta-oe/recipes-graphics/libsdl/libsdl-image/0001-png-img-Fix-prototypes-of-callbacks.patch
new file mode 100644
index 0000000000..1bbfa99210
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-image/0001-png-img-Fix-prototypes-of-callbacks.patch
@@ -0,0 +1,52 @@
+From 41791738221fdb7574fc8e23f84214910cdce098 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 1 Mar 2023 21:51:40 -0800
+Subject: [PATCH] png-img: Fix prototypes of callbacks
+
+Clang-16 is flagging function pointer mismatches
+
+Upstream-Status: Inappropriate [No upstream]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ IMG_png.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/IMG_png.c b/IMG_png.c
+index 5f91f15..4d5bdb6 100644
+--- a/IMG_png.c
++++ b/IMG_png.c
+@@ -78,15 +78,15 @@
+ static struct {
+ 	int loaded;
+ 	void *handle;
+-	png_infop (*png_create_info_struct) (png_structp png_ptr);
++	png_infop (*png_create_info_struct) (png_const_structp png_ptr);
+ 	png_structp (*png_create_read_struct) (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn);
+ 	void (*png_destroy_read_struct) (png_structpp png_ptr_ptr, png_infopp info_ptr_ptr, png_infopp end_info_ptr_ptr);
+-	png_uint_32 (*png_get_IHDR) (png_structp png_ptr, png_infop info_ptr, png_uint_32 *width, png_uint_32 *height, int *bit_depth, int *color_type, int *interlace_method, int *compression_method, int *filter_method);
+-	png_voidp (*png_get_io_ptr) (png_structp png_ptr);
+-	png_byte (*png_get_channels) (png_structp png_ptr, png_infop info_ptr);
+-	png_uint_32 (*png_get_PLTE) (png_structp png_ptr, png_infop info_ptr, png_colorp *palette, int *num_palette);
+-	png_uint_32 (*png_get_tRNS) (png_structp png_ptr, png_infop info_ptr, png_bytep *trans, int *num_trans, png_color_16p *trans_values);
+-	png_uint_32 (*png_get_valid) (png_structp png_ptr, png_infop info_ptr, png_uint_32 flag);
++	png_uint_32 (*png_get_IHDR) (png_const_structp png_ptr, png_const_infop info_ptr, png_uint_32 *width, png_uint_32 *height, int *bit_depth, int *color_type, int *interlace_method, int *compression_method, int *filter_method);
++	png_voidp (*png_get_io_ptr) (png_const_structp png_ptr);
++	png_byte (*png_get_channels) (png_const_structp png_ptr, png_const_infop info_ptr);
++	png_uint_32 (*png_get_PLTE) (png_const_structp png_ptr, png_infop info_ptr, png_colorp *palette, int *num_palette);
++	png_uint_32 (*png_get_tRNS) (png_const_structp png_ptr, png_infop info_ptr, png_bytep *trans, int *num_trans, png_color_16p *trans_values);
++	png_uint_32 (*png_get_valid) (png_const_structp png_ptr, png_const_infop info_ptr, png_uint_32 flag);
+ 	void (*png_read_image) (png_structp png_ptr, png_bytepp image);
+ 	void (*png_read_info) (png_structp png_ptr, png_infop info_ptr);
+ 	void (*png_read_update_info) (png_structp png_ptr, png_infop info_ptr);
+@@ -95,7 +95,7 @@ static struct {
+ 	void (*png_set_packing) (png_structp png_ptr);
+ 	void (*png_set_read_fn) (png_structp png_ptr, png_voidp io_ptr, png_rw_ptr read_data_fn);
+ 	void (*png_set_strip_16) (png_structp png_ptr);
+-	int (*png_sig_cmp) (png_bytep sig, png_size_t start, png_size_t num_to_check);
++	int (*png_sig_cmp) (png_const_bytep sig, png_size_t start, png_size_t num_to_check);
+ #ifndef LIBPNG_VERSION_12
+ 	jmp_buf* (*png_set_longjmp_fn) (png_structp, png_longjmp_ptr, size_t);
+ #endif
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
index 5a93dc19a8..01137bb0ca 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=613734b7586e1580ef944961c6d62227"
 DEPENDS = "tiff zlib libpng jpeg libsdl"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz \
+           file://0001-png-img-Fix-prototypes-of-callbacks.patch \
            file://configure.patch"
-SRC_URI[md5sum] = "a0f9098ebe5400f0bdc9b62e60797ecb"
 SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
 
 S = "${WORKDIR}/SDL_image-${PV}"
-- 
2.39.2


