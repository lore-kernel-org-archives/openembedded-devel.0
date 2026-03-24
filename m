Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84956F532DD
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 05:40:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13609.1774330854174425698
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 22:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KSOcKoB8;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso7416645e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 22:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774330852; x=1774935652; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qqL7TdGvfq44teSgscdWqnXEtPo7fioE6F96xI08yIE=;
        b=KSOcKoB84mVEDffRUubfWaanuPPEWoyFw6+Ml93lkwErOgJj4LQeWkfGca9HBVq7FH
         EYPYwcvP/gT20RbkoI7GWhOhFKdVk6443JZzF8tJ+QCYpn4eEFaaZAJ/15KGDSuIlXnL
         ZSbzH5eizLGzH3tHpCL9mk9aWQiReiFr/eP3H9DhgjjaBCK2zB8RViBWwIVG4pmcvTdb
         6Dkp2kumUgkkMuiJEmDRsYEn8QKaziX/cA4V8c3nymkqAEdyuJIEld82l+/QdypZyUGa
         4pn99Qs5vNJxganXiYpVDZ6C9TkGgZRbxe57B1wSZ1tqespqFU0ycc7omUaqh88tRZBC
         Hq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330852; x=1774935652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqL7TdGvfq44teSgscdWqnXEtPo7fioE6F96xI08yIE=;
        b=P/LM/mMvb/AAddQkDg2/VAofoWmOJFRBlkQFvpADgJepBL8dP3NQomBnArzh0Ts0i7
         6QFIrmsuhH8YMpWdW2dgm7YdVMnWft2eUQjW679n7UGCkFQwAK+zArHVn8hO/14UmYbd
         ONAVjTeVYAcVOdghwdnDkLbAw8ZWqumFZnfehiT11hUtWgwr+e0Gfy2skZ/j02QJ8jcg
         eHwLiGf/7kZPHD1in5fViCkpOqfRYmpcuWpiesvbcwFEOg8z2ciN44418xYo9Zfsrx0L
         0kvslWuwK1jI/6ysBjaKqX9XwFVC7/OMgGaTEfQ8nW3/vJVnBNBpnsSHkLeJgaiy+zlv
         hHVA==
X-Forwarded-Encrypted: i=1; AJvYcCXB5H0/yuc3r7UWLP6z5oTBUZDVx0Rlc8WGNS3yNxC4PO9bncVhDxOqdv0ZBsx/kOeo/EKvPnzl09IHLz5c4AubgjY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVW+hf+wxUQtoCOX647ELIYAyoUD27oTi1psGNHNpx3H6RMKjz
	gNAPBoZlBbgLDKKUPsAer7vD3y8a/O4kh6/5Qfz9q+VONBwrY5vWb/do
X-Gm-Gg: ATEYQzzMZH8ZYEZ0n/+lnwPCYPGy2gmXy1r++1+nEJ6wqWOh8Vwfr9jfxs7sHAOA7rT
	JTAwgZmjHmXaFXY925FOP9hK7J6DnZvAXuEGJsJUiSHMXT5rWE+qFVWq99LTd1c9dldok6HBtYJ
	xpEFMXluvlFl3oJZqRPWh77eqeBmrJdRTPKaWEqMKAF9Y9QfBVhdU99VCPoOaF5PV3LXKF/x8NO
	IYL6cMbaH9aIa1CHTWAdAjvjtQWKyLTioTozwJd1tiXCU3P60dr8EPWxq1NMZyMy88O7Tmbhcij
	fOfLcGLHN3LDFScnR7ls+Tke5nxjG7IWoE0wlp/vwPiWgWd39BmsM1RllOLiLz3KArBnKSnuQp8
	i0NoCKmV776fKVQCBraogrwamTZnqeFd4UIlByMmhxMR1y/8c7q81n6IHFc7tYvmhaw7JHpIAow
	oXaT8wg4NEbNZPKDp7EhR++VTw54KXa/4=
X-Received: by 2002:a05:600c:a416:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-486ff0303admr176850635e9.24.1774330852272;
        Mon, 23 Mar 2026 22:40:52 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711709e95sm22482685e9.8.2026.03.23.22.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:40:51 -0700 (PDT)
Message-ID: <1c0a5fcf-f673-47ba-a989-adcf5691fdbc@gmail.com>
Date: Tue, 24 Mar 2026 06:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] image_types_sparse: switch ext*
 conversion to ext2simg_android
To: git-patches@bmwtechworks.in, openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
References: <20260323091500.1196198-1-git-patches@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260323091500.1196198-1-git-patches@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 05:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125537

One last thing: could you please also break this up into multiple
patches? Like 1 to extend android-tools recipe, 1 to add the new recipe,
1 to change the bbclass, or something along these lines.



On 3/23/26 10:15, Ashish Kumar Mishra via lists.openembedded.org wrote:
> We have RFC discussion at
> https://lists.openembedded.org/g/openembedded-devel/message/124499
> 
> Move ext* sparse image generation from 'img2simg' to ' ext2simg_android'
> Summary of changes:
> - android-tools: Export libsparse/libbase/liblog headers and libs to
>   sysroot to allow external linking. Masked v5.1.1.
> 
> - image_types_sparse.bbclass: Update CONVERSION_CMD to use  ext2simg_android
>   for ext* types
> 
> - Add a custom do_compile step to build the  ext2simg_android utility (ext2simg)
>   when building for the native class.
> 
> - Added 'image_types_sparse' to IMAGE_CLASSES and enabled 'ext4.sparse'
>   in IMAGE_FSTYPES.
>   This allows the build system to generate Android-style sparse image
> 
> Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> ---
> v2:
>     - e2fsprogs-ext4sparse: 
>       Dropped redundant class-native overrides where the recipe
>       Added comment on usage of $ORIGIN/../${baselib}: 
>     - image_types_sparse: 
>       Replaced informational bbwarn usage with bbnote (kept bberror for failures).
>     - layer.conf: 
>       Dropped layer-level BBMASK and switched to PREFERRED_VERSION 
>       for android-tools recipe selection.
> v1:
>     - Initial implementation as per RFC 
>       https://lists.openembedded.org/g/openembedded-devel/message/124499 
> 
>  meta-oe/classes/image_types_sparse.bbclass    | 17 +++--
>  meta-oe/conf/layer.conf                       | 10 ++-
>  .../android-tools/android-tools_29.0.6.r14.bb | 44 +++++++++++++
>  .../e2fsprogs-ext4sparse.inc                  | 26 ++++++++
>  ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 ++++++++++++
>  ...-missing-check-for-permission-denied.patch | 32 ++++++++++
>  .../e2fsprogs-ext4sparse/mkdir_p.patch        | 28 +++++++++
>  .../e2fsprogs-ext4sparse/quiet-debugfs.patch  | 27 ++++++++
>  .../remove.ldconfig.call.patch                | 41 ++++++++++++
>  .../e2fsprogs-ext4sparse_1.0.bb               | 62 +++++++++++++++++++
>  10 files changed, 322 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse.inc
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/e2fsprogs-fix-missing-check-for-permission-denied.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/mkdir_p.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/quiet-debugfs.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/remove.ldconfig.call.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb
> 
> diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
> index 5416c2a019..ee9eefebb3 100644
> --- a/meta-oe/classes/image_types_sparse.bbclass
> +++ b/meta-oe/classes/image_types_sparse.bbclass
> @@ -13,11 +13,20 @@ DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
>  
>  CONVERSION_CMD:sparse = " \
>      truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${type}"; \
> -    img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${SPARSE_BLOCK_SIZE}; \
> +    case '${type}' in \
> +        ext*) \
> +            bbnote 'Running e2fsprogs-derived ext2simg_android..' ; \
> +            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.simg' || bberror 'ext2simg_android failed' \
> +            ;; \
> +        *) \
> +            bbnote 'Generating sparse image for non-ext filesystem...'; \
> +            img2simg -s '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.sparse' ${SPARSE_BLOCK_SIZE}; \
> +            ;; \
> +    esac; \
>      if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
>          rm -f ${IMAGE_NAME}.${type};\
> -        bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
> +        bbnote "Raw file ${IMAGE_NAME}.${type} removed" ;\
>      fi;\
>   "
> -
> -CONVERSION_DEPENDS_sparse = "android-tools-native"
> +CONVERSION_DEPENDS:sparse = "android-tools-native e2fsprogs-ext4sparse-native"
> +do_image_ext4[depends] += "e2fsprogs-ext4sparse-native:do_populate_sysroot"
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 186ff9a488..b7ab46f12b 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -12,8 +12,16 @@
>  BBPATH .= ":${LAYERDIR}"
>  
>  # We have a recipes directory, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
> +# Adding dynamic layers recipes
> +BBFILES += "\
> +    ${LAYERDIR}/recipes-*/*/*.bb \
> +    ${LAYERDIR}/recipes-*/*/*.bbappend \
> +    ${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bb \
> +    ${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bbappend \
> +"
>  
> +# Prefer android-tools from selinux dynamic layer (29.0.6) over the older version (5.1.1)
> +PREFERRED_VERSION:pn-android-tools = "29.0.6.r14%"
>  BBFILE_COLLECTIONS += "openembedded-layer"
>  BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
>  
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> index 74928ed171..39b8ef5fe8 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> @@ -166,6 +166,37 @@ do_install() {
>          install -d ${D}${bindir}
>          install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
>      fi
> +
> +    # e2fsprogs expecting headers in sparse/ subdirectory
> +    # to resolve the "Multiple shlib providers" conflict.
> +    rm -f ${D}${libdir}/android/libsparse.so*
> +    rm -f ${D}${libdir}/android/libbase.so*
> +    rm -f ${D}${libdir}/android/liblog.so*
> +
> +    if [ -d "${S}/system/core/libsparse/include/sparse" ]; then
> +        install -d ${D}${includedir}/sparse
> +        cp -r ${S}/system/core/libsparse/include/sparse/* ${D}${includedir}/sparse/
> +    else
> +        bberror "Sparse headers not found in ${S}/system/core/libsparse/include/sparse"
> +    fi
> +
> +    install -d ${D}${libdir}
> +    for lib in libsparse libbase liblog; do
> +        if [ -f "${S}/debian/out/system/core/${lib}.so" ]; then
> +            bbwarn "Installing ${lib} to sysroot"
> +            install -m 0755 ${S}/debian/out/system/core/${lib}.so ${D}${libdir}/${lib}.so.0
> +            ln -sf ${lib}.so.0 ${D}${libdir}/${lib}.so
> +        fi
> +    done
> +
> +    install -d ${D}${libdir}/android
> +    for lib in libsparse libbase liblog; do
> +        if [ -f "${D}${libdir}/${lib}.so.0" ]; then
> +            ln -sf ../${lib}.so.0 ${D}${libdir}/android/${lib}.so.0
> +            ln -sf ../${lib}.so ${D}${libdir}/android/${lib}.so
> +        fi
> +    done
> +
>  }
>  
>  PACKAGES =+ "${PN}-fstools ${PN}-adbd"
> @@ -190,3 +221,16 @@ FILES:${PN}-fstools = "\
>  FILES:${PN} += "${libdir}/android ${libdir}/android/*"
>  
>  BBCLASSEXTEND = "native"
> +
> +FILES:${PN}-dev += " \
> +    ${includedir}/sparse \
> +    ${libdir}/lib*.so \
> +    ${libdir}/android/lib*.so \
> +"
> +
> +FILES:${PN} += " \
> +    ${libdir}/lib*.so.* \
> +    ${libdir}/android/lib*.so.* \
> +"
> +
> +SYSROOT_DIRS:append:class-native = " ${includedir} ${libdir}"
> diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse.inc b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse.inc
> new file mode 100644
> index 0000000000..80c283ef4a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse.inc
> @@ -0,0 +1,26 @@
> +SUMMARY = "Ext2 Filesystem Utilities"
> +DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the standard utilities for creating, \
> +fixing, configuring , and debugging ext2 filesystems."
> +HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
> +
> +LICENSE = "GPL-2.0-only & LGPL-2.0-only & BSD-3-Clause & MIT"
> +LICENSE:e2fsprogs-dumpe2fs = "GPL-2.0-only"
> +LICENSE:e2fsprogs-e2fsck = "GPL-2.0-only"
> +LICENSE:e2fsprogs-mke2fs = "GPL-2.0-only"
> +LICENSE:e2fsprogs-tune2fs = "GPL-2.0-only"
> +LICENSE:e2fsprogs-badblocks = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
> +                      file://lib/ext2fs/ext2fs.h;beginline=1;endline=9;md5=596a8dedcb4e731c6b21c7a46fba6bef \
> +                      file://lib/e2p/e2p.h;beginline=1;endline=7;md5=8a74ade8f9d65095d70ef2d4bf48e36a \
> +                      file://lib/uuid/uuid.h.in;beginline=1;endline=32;md5=dbb8079e114a5f841934b99e59c8820a \
> +                      file://lib/uuid/COPYING;md5=58dcd8452651fc8b07d1f65ce07ca8af \
> +                      file://lib/et/et_name.c;beginline=1;endline=11;md5=ead236447dac7b980dbc5b4804d8c836 \
> +                      file://lib/ss/ss.h;beginline=1;endline=20;md5=6e89ad47da6e75fecd2b5e0e81e1d4a6"
> +SECTION = "base"
> +DEPENDS = "util-linux attr autoconf-archive-native"
> +
> +SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https"
> +
> +inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives 
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
> new file mode 100644
> index 0000000000..1c578022fb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
> @@ -0,0 +1,40 @@
> +From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Sun, 30 Nov 2025 21:47:50 +0800
> +Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
> +
> +Fixed:
> +$ dd if=/dev/zero of=../image.ext4 bs=1M count=4k
> +$ dd if=/dev/random of=../rootfs/largefile bs=1M count=3k
> +$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
> +__populate_fs: Ext2 file too big while writing file "largefile"
> +mke2fs: Ext2 file too big while populating file system
> +
> +This was because the offset is overflow, use __u64 to fix the problem.
> +
> +Another code which uses ext2_off_t is copy_fs_verity_data(), but it only copies
> +the metadata, so it should be enough large for it, just leave it there.
> +
> +Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/258]
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + misc/create_inode.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/misc/create_inode.c b/misc/create_inode.c
> +index 624efc03..14273534 100644
> +--- a/misc/create_inode.c
> ++++ b/misc/create_inode.c
> +@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t count, off_t offset)
> + }
> + #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
> + 
> +-static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const char *buf, unsigned int n_bytes) {
> ++static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char *buf, unsigned int n_bytes) {
> + 	errcode_t err = ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET, NULL);
> + 	if (err)
> + 		return err;
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/e2fsprogs-fix-missing-check-for-permission-denied.patch
> new file mode 100644
> index 0000000000..4cd1098597
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/e2fsprogs-fix-missing-check-for-permission-denied.patch
> @@ -0,0 +1,32 @@
> +From 1c7078fda6d23f1d80b0d95ac3e908364749e188 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Wed, 10 Aug 2016 11:19:44 +0800
> +Subject: [PATCH] Fix missing check for permission denied.
> +
> +If the path to "ROOT_SYSCONFDIR/mke2fs.conf" has a permission denied problem,
> +then the get_dirlist() call will return EACCES. But the code in profile_init
> +will treat that as a fatal error and all executions will fail with:
> +      Couldn't init profile successfully (error: 13).
> +
> +Upstream-Status: Pending
> +
> +Written-by: Henrik Wallin <henrik.b.wallin@ericsson.com>
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + lib/support/profile.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/support/profile.c b/lib/support/profile.c
> +index bdb14b17..1bd62406 100644
> +--- a/lib/support/profile.c
> ++++ b/lib/support/profile.c
> +@@ -335,7 +335,7 @@ profile_init(const char * const *files, profile_t *ret_profile)
> + 				*last = new_file;
> + 				last = &new_file->next;
> + 			}
> +-		} else if ((retval != ENOTDIR) &&
> ++		} else if ((retval != ENOTDIR) && (retval != EACCES) &&
> + 			   strcmp(*fs, default_filename))
> + 			goto errout;
> + 
> diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/mkdir_p.patch b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/mkdir_p.patch
> new file mode 100644
> index 0000000000..2dbeba1095
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/mkdir_p.patch
> @@ -0,0 +1,28 @@
> +From e143a900199c5bb10b28f3fc8f4d36bbb6ffdd5f Mon Sep 17 00:00:00 2001
> +From: Joe Slater <jslater@windriver.com>
> +Date: Tue, 7 Mar 2017 14:53:19 -0800
> +Subject: [PATCH] e2fsprogs: expand @mkdir_p@
> +
> +Add AC_SUBST to configure.ac.  @mkdir_p@ is currently
> +not expanded so no locale data is written into usr/share/locale.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <jslater@windriver.com>
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 131caef3..ca448d97 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -938,6 +938,8 @@ AC_SUBST(PACKAGE)
> + AC_SUBST(VERSION)
> + 
> + AM_GNU_GETTEXT([external])
> ++dnl @MKDIR_P@ is expanded in AM_GNU_GETTEXT
> ++AC_SUBST([mkdir_p],['$(MKDIR_P)'])
> + dnl
> + dnl End of configuration options
> + dnl
> diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/quiet-debugfs.patch b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/quiet-debugfs.patch
> new file mode 100644
> index 0000000000..4ba150e27d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/quiet-debugfs.patch
> @@ -0,0 +1,27 @@
> +From b66c973e004e0c458ef275b41ac2d8d9ff33d29f Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Mon, 23 Dec 2013 13:38:34 +0000
> +Subject: [PATCH] e2fsprogs: silence debugfs
> +
> +When executing a script don't echo every command, as we do this for entire
> +filesystems at rootfs time.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +---
> + debugfs/debugfs.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
> +index 909c1df3..0842369e 100644
> +--- a/debugfs/debugfs.c
> ++++ b/debugfs/debugfs.c
> +@@ -2529,7 +2529,7 @@ static int source_file(const char *cmd_file, int ss_idx)
> + 		cp = strchr(buf, '\r');
> + 		if (cp)
> + 			*cp = 0;
> +-		printf("debugfs: %s\n", buf);
> ++		/*printf("debugfs: %s\n", buf);*/
> + 		retval = ss_execute_line(ss_idx, buf);
> + 		if (retval) {
> + 			ss_perror(ss_idx, retval, buf);
> diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/remove.ldconfig.call.patch b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/remove.ldconfig.call.patch
> new file mode 100644
> index 0000000000..307088d42b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/remove.ldconfig.call.patch
> @@ -0,0 +1,41 @@
> +From 972086935d6c7f6e603004fd7f94bd13a65f470c Mon Sep 17 00:00:00 2001
> +From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +Date: Wed, 30 Jan 2013 15:22:04 +0200
> +Subject: [PATCH] When /etc/ld.so.cache is writeable by user running bitbake
> + then it creates invalid cache (in my case libstdc++.so cannot be found after
> + building zlib(-native) and I have to call touch */libstdc++.so &&
> + /sbin/ldconfig to fix it.
> +
> +So remove ldconfig call from make install-libs
> +
> +Patch authored by Martin Jansa.
> +
> +Upstream-Status: Inappropriate [disable feature]
> +
> +Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> +Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +---
> + lib/Makefile.elf-lib | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/lib/Makefile.elf-lib b/lib/Makefile.elf-lib
> +index f850f3dd..cc1e6a70 100644
> +--- a/lib/Makefile.elf-lib
> ++++ b/lib/Makefile.elf-lib
> +@@ -50,8 +50,6 @@ install-shlibs install:: $(ELF_LIB) installdirs-elf-lib $(DEP_INSTALL_SYMLINK)
> + 	$(E) "	SYMLINK $(libdir)/$(ELF_IMAGE).so"
> + 	$(Q) $(INSTALL_SYMLINK) $(ELF_INSTALL_DIR)/$(ELF_SONAME) \
> + 		$(libdir)/$(ELF_IMAGE).so $(DESTDIR)
> +-	$(E) "	LDCONFIG"
> +-	$(Q) -$(LDCONFIG)
> + 
> + install-strip: install
> + 	$(E) "	STRIP-LIB $(ELF_INSTALL_DIR)/$(ELF_LIB)"
> +@@ -67,7 +65,6 @@ uninstall-shlibs uninstall::
> + 	$(RM) -f $(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_LIB) \
> + 		$(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_SONAME) \
> + 		$(DESTDIR)$(libdir)/$(ELF_IMAGE).so
> +-	-$(LDCONFIG)
> + 
> + clean::
> + 	$(RM) -rf elfshared
> diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb
> new file mode 100644
> index 0000000000..477b49cbda
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb
> @@ -0,0 +1,62 @@
> +# 
> +# This recipe is based on openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
> +# We are stripping the refernce recipe and keeping only the bare minimum to get the ext2simg.c compiled
> +#
> +require e2fsprogs-ext4sparse.inc
> +
> +inherit native
> +
> +SRC_URI += "file://remove.ldconfig.call.patch \
> +           file://mkdir_p.patch \
> +           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch \
> +           file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
> +           file://quiet-debugfs.patch \
> +           "
> +
> +SRCREV = "da631e117dcf8797bfda0f48bdaa05ac0fbcf7af"
> +
> +EXTRA_OECONF = " \
> +    --libdir=${base_libdir} \
> +    --sbindir=${base_sbindir} \
> +    --enable-elf-shlibs \
> +    --enable-largefile \
> +    --disable-libuuid \
> +    --disable-libblkid \
> +    --disable-uuidd \
> +    --disable-fuse2fs \
> +    --with-crond-dir=no \
> +"
> +
> +# Fix do_compile error with old kernel such as 5.10
> +CACHED_CONFIGUREVARS = "ac_cv_header_linux_fsverity_h=no"
> +
> +PACKAGES = "${PN}"
> +FILES:${PN} = "${bindir}/ext2simg_android"
> +
> +DEPENDS += "util-linux-native android-tools-native"
> +
> +do_compile () {
> +    oe_runmake -C ${B}/lib/et
> +    oe_runmake -C ${B}/lib/ext2fs
> +
> +    # Source directory for ext2simg.c in the e2fsprogs tree
> +    SRC_EXT2SIMG="${S}/contrib/android"
> +
> +    INCLUDES="-I${S}/lib -I${B}/lib -I${SRC_EXT2SIMG}/lib"
> +
> +    # STAGING_LIBDIR_NATIVE: where android-tools-native installed libsparse
> +    LIBS="-L${B}/lib -L${STAGING_LIBDIR_NATIVE} -lsparse -lext2fs -lz -lcom_err"
> +
> +    ${CC} ${CFLAGS} ${LDFLAGS} -o "${B}/ext2simg_android" "${SRC_EXT2SIMG}/ext2simg.c" ${INCLUDES} ${LIBS}
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/ext2simg_android ${D}${bindir}/ext2simg_android
> +}
> +
> +# Use RPATH to embed the path to libsparse (from android-tools-native) directly into the binary
> +# $ORIGIN allows the binary to locate its dependencies relative to its own location
> +# ensuring it works in any build environment without LD_LIBRARY_PATH manipulation
> +BUILD_LDFLAGS  += "-Wl,-rpath,'\$ORIGIN/../${baselib}'"
> +TARGET_LDFLAGS += "-Wl,-rpath,'\$ORIGIN/../${baselib}'"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125497): https://lists.openembedded.org/g/openembedded-devel/message/125497
> Mute This Topic: https://lists.openembedded.org/mt/118461929/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


