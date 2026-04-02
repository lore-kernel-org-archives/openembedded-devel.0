Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A89CC6B01
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 04:49:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8989.1775105345823204474
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 21:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VFhRsvcK;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf7683a28so260336f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 21:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775105344; x=1775710144; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yioMWOCAjk6PVdjd8MrGCia6q+0Rhk8ciDoSEY6Cm+g=;
        b=VFhRsvcKysM6Dsge4yRAXaA0HMLOdrKpQuSm5IXsHj9MUbokO1bB/pmQtWH/NBcPie
         pUuNNkhOsXDFJtYvA4gAq2fq+EUu8seOEoNBRcSuE5uwM3CJ9NT2jartrDSbk8r+isLU
         RpEHw9X0lK0rBygup1/z5l9RrBn+niw0md++Lidy4vzOubVAUtv22MagdtlfbRIUHMgJ
         aIfGN82GxQuvrQPFH4p7jl8v3sebs5KNwPThFX6JtWiVLffEec6Mo9CO0OKg6N7HESv6
         yzcIxysy9Da8U/4CahRSo6rGcwnzaZsaw+o7r2kaYwnwBNf0xKU2OsGxvKYD5izWxNEv
         Hpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775105344; x=1775710144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yioMWOCAjk6PVdjd8MrGCia6q+0Rhk8ciDoSEY6Cm+g=;
        b=ZefTnVQWBVO3xx0oPS1mNYNSaxPbGrhuDaS+nI9/w2tGHSDjGIn+4YY2wD+KTi9/PX
         4WlckxUCbu2BWaINNWYOTcYvalnjprh8Jwjr67DgkC94CnzSoVPc94kroZMgiSfvWMvK
         MdKuxasU4kKGDngm1ATNS5Ufgepw1TLD2vGtchtfSUDjkOsW9lJqbeyWxZmP+hS9/Lf9
         Dx4e/JI0IuIjmMRnnRo3Zt4tgpGh8k2UuW9mAJ3QnnhO3g14coeqG4s3dtH3P/M3v2M3
         CkIIY0FHGLvuaIHhjv8o1AfiLUw1ooHT2OGzmg14EQ9aZzrqoCs+6fXjZpFLxpfxN95c
         jZPA==
X-Forwarded-Encrypted: i=1; AJvYcCVfZHsIjFTkqEDOLJikes3SGhukZ89DC4H/TXSbOmeqm/l7zcTYF8Km7ItyocPwHcEUq51nw5kyRMLMTgf6Bkhw3zg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDFsBfG6wHq0GVCqA09WfKqapxLVIUB1tL0MT2o8AiSAdUp3mK
	eACK53vpYateY86ryn4Y5+QnVUI6K8x3e9ATC8dhKie8CCPSvK30Hb2o
X-Gm-Gg: ATEYQzx2byh868XGwftG7czGnNf4PYblnQTDpYC2bbitk64o+5urGblbIZxtLQx7vvP
	DnBjWkavK1GMJaK1fwB2iCuEo+ibG3UqDLQLiB8CjU0zF3lpXi7R0ShcaArFDZmt+DNquje7RGp
	E9ed/TFi4b0VGD6WE1/a+0J3oqxE3XB9YhkKToDaFmqC4QCBr4liHD8uXWkc2quS4IPaAXsn7ZD
	GD3gwxhvootmVf+6Qw7Ahb9E+V4FwPXUpHNCNZVJ/yJhGgEH66n6/nrpbC86svPowBOlUn2TSz/
	YTJ8OI11jYVCaUuc9I8Yq99OuZiAscgvqppmqA0mxMmzk4ItNxZZ3qzCepLlU69o+5h91eIenuL
	ZqFEYSI8WNSceoSERxqPX7xvFdB6YBGbm/Pyrw8hvWqfmo2YFXb4UGeoshJ1oe/XXiZASA6XCoe
	ZWfwRYnf7f2MGqY/1WChhKHN4tuV+nKqQ=
X-Received: by 2002:a05:6000:2886:b0:43c:fbfa:20a0 with SMTP id ffacd0b85a97d-43d150da527mr11931402f8f.25.1775105343792;
        Wed, 01 Apr 2026 21:49:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm5330478f8f.32.2026.04.01.21.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 21:49:03 -0700 (PDT)
Message-ID: <3c569855-52ed-4d3b-9e76-e646b5cb2802@gmail.com>
Date: Thu, 2 Apr 2026 06:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2 0/2] android-tools: migration and cleanup
To: git-patches@bmwtechworks.in, openembedded-devel@lists.openembedded.org
Cc: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>,
 Khem Raj <raj.khem@gmail.com>
References: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
 <20260330100744.739123-1-git-patches@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260330100744.739123-1-git-patches@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 04:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125958

Khem,

Got any opinion on this one?


On 3/30/26 12:07, Ashish Kumar Mishra via lists.openembedded.org wrote:
> From: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> 
> Following the feedback on the initial RFC, the logic has been split into two 
> distinct commits to improve clarity and maintainability:
> 
> 1. Removal of the legacy android-tools 5.x version from meta-oe/recipes-devtools.
> 2. Migration of android-tools v29.x from dynamic-layers/selinux to meta-oe.
> 
> This ensures the newer version is correctly positioned in meta-oe while 
> cleaning up the deprecated 5.x recipe.
> 
> Ashish Kumar Mishra (2):
>   android-tools: remove android-tools 5.x from meta-oe/recipes-devtools
>   android-tools: move android-tools v29.x from dynamic-layers/selinux to
>     meta-oe
> 
>  .../android-tools-conf/android-gadget-setup   |  37 --
>  .../android-tools/android-tools-conf_1.0.bb   |  20 -
>  .../android-tools/android-tools/adbd.mk       |  87 -----
>  .../android-tools/android-tools-adbd.service  |  13 -
>  .../10-adbd-configfs.conf                     |   4 -
>  .../android-gadget-cleanup                    |  24 --
>  .../android-gadget-setup                      |  38 --
>  .../android-gadget-start                      |   9 -
>  .../android-tools-conf-configfs_1.0.bb        |  38 --
>  .../android-tools/android-tools-conf_1.0.bb   |   4 +-
>  .../0001-Fixes-for-yocto-build.patch          |   0
>  .../0001-liblp-fix-building-with-GCC-14.patch |   0
>  ...difications-to-make-it-build-in-yoct.patch |   0
>  ...usbdevfs_urb-to-match-new-kernel-UAP.patch |   0
>  ...-adb-Fix-build-on-big-endian-systems.patch |   0
>  ...005-adb-Allow-adbd-to-be-run-as-root.patch |   0
>  .../android-tools/android-tools/adb.mk        |  72 ----
>  .../android-tools/android-tools/adbd.mk       | 247 +++++-------
>  ...scv-Add-risc-v-Android-config-header.patch | 361 ------------------
>  .../0001-adb-remove-selinux-extensions.patch  |  44 ---
>  ...define-strlcpy-for-glibc-based-syste.patch |  35 --
>  ...-Use-local-sockets-where-appropriate.patch |  70 ----
>  .../core/0003-adb-define-shell-command.patch  |  29 --
>  ...-adb-Fix-build-on-big-endian-systems.patch |  47 ---
>  .../0005-adb-add-base64-implementation.patch  | 350 -----------------
>  .../core/0006-adb-Musl-fixes.patch            | 130 -------
>  ...sb_linux.c-fix-build-with-glibc-2.28.patch |  26 --
>  ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  23 --
>  ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
>  ...ux-capability.h-on-linux-systems-too.patch |  23 --
>  .../0011-Remove-bionic-specific-calls.patch   |  64 ----
>  ...laration-of-stlcat-strlcopy-function.patch |  50 ---
>  .../core/0013-adb-Support-riscv64.patch       | 191 ---------
>  ...add-u3-ss-descriptor-support-for-adb.patch | 344 -----------------
>  ...off-most-of-sparse_file_read_normal-.patch |  60 ---
>  ...se-Add-hole-mode-to-sparse_file_read.patch | 188 ---------
>  ...port-for-converting-holes-to-don-t-c.patch | 114 ------
>  .../android-tools/core/adb_libssl_11.diff     |  48 ---
>  .../core/b64_pton_function_decl.patch         |  14 -
>  .../debian/Add-riscv64-support.patch          |   0
>  .../debian/Added-missing-headers.patch        |   0
>  .../android-tools/debian/Nonnull.patch        |   0
>  .../android-tools/debian/Vector-cast.patch    |   0
>  .../debian/add-missing-headers.patch          |   0
>  .../20150704-CVE-2015-3239_dwarf_i.h.patch    |   0
>  .../legacy_built-in_sync_functions.patch      |   0
>  ...nd-fix-strchr-conformance-to-ISO-C23.patch |   0
>  ...unreachable-macro-to-avoid-redefinit.patch |   0
>  .../external/libunwind/user_pt_regs.patch     |   0
>  .../debian/fix-attribute-issue-with-gcc.patch |   0
>  .../debian/fix-build-on-non-x86.patch         |   0
>  .../fix-gettid-exception-declaration.patch    |   0
>  .../fix-standard-namespace-errors.patch       |   0
>  .../debian/hard-code-build-number.patch       |   0
>  .../debian/libusb-header-path.patch           |   0
>  .../debian/move-log-file-to-proper-dir.patch  |   0
>  .../debian/simg_dump-python3.patch            |   0
>  .../android-tools/debian/stdatomic.patch      |   0
>  .../debian/stub-out-fastdeploy.patch          |   0
>  .../system/core/Add-riscv64-support.patch     |   0
>  .../system/core/Added-missing-headers.patch   |   0
>  .../debian/system/core/Nonnull.patch          |   0
>  .../debian/system/core/Vector-cast.patch      |   0
>  .../system/core/add-missing-headers.patch     |   0
>  ...ope-write-macro-to-prevent-conflict-.patch |   0
>  .../core/fix-attribute-issue-with-gcc.patch   |   0
>  .../system/core/fix-build-on-non-x86.patch    |   0
>  .../fix-gettid-exception-declaration.patch    |   0
>  .../core/fix-standard-namespace-errors.patch  |   0
>  .../system/core/hard-code-build-number.patch  |   0
>  .../system/core/libusb-header-path.patch      |   0
>  ...x-missing-fixed-width-integer-types-.patch |   0
>  .../core/move-log-file-to-proper-dir.patch    |   0
>  .../system/core/simg_dump-python3.patch       |   0
>  .../debian/system/core/stdatomic.patch        |   0
>  .../system/core/stub-out-fastdeploy.patch     |   0
>  .../core/throw-exception-on-unknown-os.patch  |   0
>  .../throw-exception-on-unknown-os.patch       |   0
>  .../android-tools/android-tools/ext4_utils.mk | 103 -----
>  ...ext4_utils-remove-selinux-extensions.patch |  39 --
>  ...add-o-argument-to-preserve-ownership.patch |  78 ----
>  ...unused-parameter-from-allocate_inode.patch |  69 ----
>  .../android-tools/android-tools/fastboot.mk   |  89 -----
>  .../android-tools/android-tools/gitignore     |  59 ---
>  .../0001-Remove-bionic-specific-calls.patch   |  25 --
>  ...t-define-gettid-if-glibc-2.30-is-use.patch |  51 ---
>  .../android-tools/android-tools/mkbootimg.mk  |  29 --
>  .../android-tools/android-tools/remount       |   0
>  .../android-tools/rules_yocto.mk              |   0
>  .../android-tools/android-tools_29.0.6.r14.bb |   7 +-
>  .../android-tools/android-tools_5.1.1.r37.bb  | 189 ---------
>  91 files changed, 92 insertions(+), 3560 deletions(-)
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf/android-gadget-setup
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/adbd.mk
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/android-tools-adbd.service
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0001-Fixes-for-yocto-build.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch (100%)
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_function_decl.patch
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/Add-riscv64-support.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/Added-missing-headers.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/Nonnull.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/Vector-cast.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/add-missing-headers.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/fix-build-on-non-x86.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/fix-standard-namespace-errors.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/hard-code-build-number.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/libusb-header-path.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/simg_dump-python3.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/stdatomic.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/stub-out-fastdeploy.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/Added-missing-headers.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/Nonnull.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/Vector-cast.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/add-missing-headers.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/hard-code-build-number.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/libusb-header-path.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/simg_dump-python3.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/stdatomic.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch (100%)
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/gitignore
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/remount (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/rules_yocto.mk (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools_29.0.6.r14.bb (96%)
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125864): https://lists.openembedded.org/g/openembedded-devel/message/125864
> Mute This Topic: https://lists.openembedded.org/mt/118576547/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


