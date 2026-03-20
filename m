Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CFE1093188
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 08:25:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7959.1773995099255633402
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 01:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLOTrmRA;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so12491865e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 01:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773995097; x=1774599897; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwEYSkmiDZHdHwcwl8+f44i+GZU4Xyl0v8n7ZdRueLM=;
        b=BLOTrmRAnc+2xQ8yPAcFEV7J3z7Wd0xX/5SdOVjknaegHKoP6wOM4zA1Ac5RJmhHEV
         tJxnXPrwVAnQrONCtmRNM2Uwh0/SAvQ4xQjg8Ecs+IifPTBkQbI9JISeVmZd1SWiBVsY
         42iiMLpUlvQBk+OUvoxbmUb0ICCqP61mRXDLzSqUybomH8xgZawwdO+fsfpf/Mg0F9/5
         opH0SlOPDlsvbAyz81lvfXPNnA83Vv94rvT0RkwXEVrbVYIxBXxmdjtT3ITP9BoPjmeL
         OZnl7ayo1n2wKwIHbCLQY206EcwaeZC/IhD6YnRtHo4CdV0P5kGIqBu5ixFogi67M511
         Bitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995097; x=1774599897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwEYSkmiDZHdHwcwl8+f44i+GZU4Xyl0v8n7ZdRueLM=;
        b=SgWJNzDmD2xuLge2bs9MldaJsVR12Yn1ddBVCHJ+ApGgb3IZw1juLve08dk0/vysaI
         Rqd+QS5O40NMDp1S1+BL9B5ZO6I/OHgAQxFkVUVxJGsYK5nXmrrjjstbZ5Yfn+7Pbtia
         KJePaltv0QsVujdEJa6lOvzYHu9P2R6DdTRz5K7W+Gbj+caVIeWwcNHSlVtidnFTzTUT
         w7uTHzNkPsjpc8216ywdM56egWk5HPbYhMR+zTZWqHV+UNGO9OA9mygagSO/EGAH4ATb
         BNq10bsKlMjHQVi6SS4xBNcThuDl+81uq73IALy8IjH6JVdoS7cC7dJbmhjbGpBTWl3u
         GYuA==
X-Forwarded-Encrypted: i=1; AJvYcCX74UYEa9MQ7Jd6sk+k3FupVDmPs1e0KcN45iBvoeQDb1+pfVpsqTpL7l5XyimjDGACAnxJNYLqNOCnIfYXc3HllhY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9UANEzdCzijh4aekeT/ewi82jpie9DjL84owJ0/UFNYem9fXs
	DlMS4AQUnMDK2oDxIUl8ac6tyHQspm12uTbAHfunNkHtLt21mrO7jMHI
X-Gm-Gg: ATEYQzzamyEIAykurgRmOGSBxOs9I7htq8wt4OgUE3YDwZObYryj/MiTuPUVeSgGF2M
	LBWsmmnf9ZXdNAWvPo6euYkmQ3hvCjEtlothp3AHzClM+89av+RMLvLHin2XexowdZRiNZRuSkI
	1ztJCrwQei6MbLZdaaivzp9bODqsY+r8QDG+5BHBZ2FNl+C0z/gEQJFDjPNlF1JCU6owNbrTKMd
	FZSsn+gwLhdtNskvGCU7R4JfK5oG23MVHjijgtU54K7wVObLDMaCmPDDOLVbBJM312SEwoUH9Hc
	auJhqKlxHGYDlkXsZ9ied0wCH0K+iD6K/HSJj8vxkZZyIcpJIE4Blf18vwquFiZyNnb6LpJcqGq
	FULrO6Yiu86Yf5T2eTYBqOYzRpUJN8XN1XV39bS0wocJQPgB1vrw9s9hJrDXy8VzVATq/MMY+fw
	KgSKaxxsCRQl012E+74CMyXepwenOAt+8=
X-Received: by 2002:a05:600c:c167:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-486fedd4143mr31651565e9.14.1773995097214;
        Fri, 20 Mar 2026 01:24:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm4964430f8f.16.2026.03.20.01.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 01:24:56 -0700 (PDT)
Message-ID: <f4bd5e86-4f7e-44fc-80da-ee914ed741df@gmail.com>
Date: Fri, 20 Mar 2026 09:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v1] image_types_sparse: switch ext*
 conversion to ext2simg_android
To: git-patches@bmwtechworks.in, openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
References: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 08:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125421

I have added a few notes - I would recommend to wait a couple of days
before sending a v2, there might be further feedback from others (and
maybe I will forget also something)

On 3/20/26 06:28, Ashish Kumar Mishra via lists.openembedded.org wrote:
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
> - layer.conf: Sync BBMASK and add dynamic-layer paths.


BBMASK doesn't sound something that belongs to meta-oe. There are other
ways to ignore recipes - PREFERRED_VERSION variable for example. Also,
there are/were some discussions[1] on dropping one of the android-tools
recipes - you may want to chime in and speed it up?

[1]: https://lists.openembedded.org/g/openembedded-devel/topic/117415388

> 
> - Add a custom do_compile step to build the  ext2simg_android utility (ext2simg)
>   when building for the native class.
> 
> - Added 'image_types_sparse' to IMAGE_CLASSES and enabled 'ext4.sparse'
>   in IMAGE_FSTYPES.
>   This allows the build system to generate Android-style sparse image
> 
> - Switch to using $ORIGIN/../${baselib}.
>   $ORIGIN is a special variable recognized by the dynamic linker that represents
>   the directory containing the executable.
> 

This might useful to also mention the motivation for specifying the
rpath (I still have some vague memories, but it fades by the minute)

> Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> ---
>  meta-oe/classes/image_types_sparse.bbclass    | 15 +++-
>  meta-oe/conf/layer.conf                       | 11 ++-
>  .../android-tools/android-tools_29.0.6.r14.bb | 44 ++++++++++++
>  .../e2fsprogs-ext4sparse.inc                  | 26 +++++++
>  ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 +++++++++++
>  ...-missing-check-for-permission-denied.patch | 32 +++++++++
>  .../e2fsprogs-ext4sparse/mkdir_p.patch        | 28 ++++++++
>  .../e2fsprogs-ext4sparse/quiet-debugfs.patch  | 27 ++++++++
>  .../remove.ldconfig.call.patch                | 41 +++++++++++
>  .../e2fsprogs-ext4sparse_1.0.bb               | 68 +++++++++++++++++++
>  10 files changed, 328 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse.inc
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/e2fsprogs-fix-missing-check-for-permission-denied.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/mkdir_p.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/quiet-debugfs.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/remove.ldconfig.call.patch
>  create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb
> 
> diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
> index 5416c2a019..75f0d00703 100644
> --- a/meta-oe/classes/image_types_sparse.bbclass
> +++ b/meta-oe/classes/image_types_sparse.bbclass
> @@ -13,11 +13,20 @@ DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
>  
>  CONVERSION_CMD:sparse = " \
>      truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${type}"; \
> -    img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${SPARSE_BLOCK_SIZE}; \
> +    case '${type}' in \
> +        ext*) \
> +            bbwarn 'Running e2fsprogs-derived ext2simg_android..' ; \


Please do not use bbwarn for generic logging in final patches. This
should be bbdebug or bbnote most probably. Same for the other usages also
(bberror usages look appropriate at the first sight)



> +            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.simg' || bberror 'ext2simg_android failed' \
> +            ;; \
> +        *) \
> +            bbwarn 'Generating sparse image for non-ext filesystem...'; \
> +            img2simg -s '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.sparse' ${SPARSE_BLOCK_SIZE}; \
> +            ;; \
> +    esac; \
>      if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
>          rm -f ${IMAGE_NAME}.${type};\
>          bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
>      fi;\
>   "
> -
> -CONVERSION_DEPENDS_sparse = "android-tools-native"
> +CONVERSION_DEPENDS:sparse = "android-tools-native e2fsprogs-ext4sparse-native"
> +do_image_ext4[depends] += "e2fsprogs-ext4sparse-native:do_populate_sysroot"

... snip ...

> diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb
> new file mode 100644
> index 0000000000..96f1f08177
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb
> @@ -0,0 +1,68 @@
> +require e2fsprogs-ext4sparse.inc
> +
> +inherit native
> +
> +SRC_URI += "file://remove.ldconfig.call.patch \
> +           file://mkdir_p.patch \
> +           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch \
> +           "
> +SRC_URI:append:class-native = " \
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
> +DEPENDS += "util-linux-native"
> +
> +# Fix e2fsprogs-native do_compile error with old kernel such as 5.10
> +CACHED_CONFIGUREVARS:class-native = "ac_cv_header_linux_fsverity_h=no"
> +
> +do_install () {
> +}


Why empty install for class-target? Is this a native-only recipe?


> +
> +
> +RDEPENDS:${PN} = ""
> +RRECOMMENDS:${PN} = ""
> +ALTERNATIVE:${PN} = ""


Are this overriding something?


> +
> +PACKAGES = "${PN}"
> +FILES:${PN} = "${bindir}/ext2simg_android"
> +FILES:${PN}:class-native += "${bindir}/ext2simg_android"

Does this need to be repeated? I'd expect that the first FILES
assignment would take ffect for class-native also. Is this not the case?

> +
> +DEPENDS:append:class-native = " android-tools-native "
> +
> +do_compile:append:class-native() {
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
> +do_install:append:class-native() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/ext2simg_android ${D}${bindir}/ext2simg_android
> +}
> +
> +BUILD_LDFLAGS  += "-Wl,-rpath,'\$ORIGIN/../${baselib}'"
> +TARGET_LDFLAGS += "-Wl,-rpath,'\$ORIGIN/../${baselib}'"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125420): https://lists.openembedded.org/g/openembedded-devel/message/125420
> Mute This Topic: https://lists.openembedded.org/mt/118413954/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


