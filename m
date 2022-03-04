Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D10EC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.5139.1646383825454049062
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UdJ4WxHR;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id y11so7079043pfa.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ulOkyRzPyZVbcP2j7U5SpyG6oPNYIrTAHoZ3GgbV4Wo=;
        b=UdJ4WxHRGj5bsLd7UTs2ULe4vgBUvL1NjNrlFDhDzDz3lvmdUcV9DnLhpnFV4IUPHM
         2Lj3Lsrc1+cL/ptLEdFjmXDUwhD9YB2toj8yB2B3gKwS4b2YsgeJMKGU8nDo3Cl/DBHJ
         eFqEmlUaEXatUY52UIs0JC+xXSFAtg1sNrJXL3JWa8qVPWSk16lfgbXpf/4bL186IcZK
         xWngIrfTzLNyvfBDPHtJqAbsyR0i53z1/nqjHilLcTrtM1+Ah8RBz5eVGbkezYFstAQA
         rl0WHV3HM/tTCVCNe82N7iBN9/QzgyXejO8Ww5H2ojJV+fX2ocDgTpU5/1uyUSgNYh3t
         qX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ulOkyRzPyZVbcP2j7U5SpyG6oPNYIrTAHoZ3GgbV4Wo=;
        b=igHayK3yZ/FxexqWzYAdZRlx1v8VhcXJTD1usQcYJNf7oIeucHdG5AUSHZNG6Hc9eX
         wtxBTZgW2t29Q0yF4ukcEb2CYQsE1IiL5btFw0mRZkap6jDI9+vIrV26V6wva6FYTlf1
         nWJ0HmvPfORH3LO2tfFSziQbRQEfmEEI6ikkoMHota8Ram69vKaj8qKxRT9LQjiDwBjJ
         fcSiSVR3+W+eylUQGLcu5l+fQ0+J5z6BTXaC2hFYmIyCrAlbvCYQ9qY6HC3N8WF5bCu6
         GRNCN8blcG8ctmvi/ak1utWgeDJ6ERpNLA+nwwJWuoCaJclj49/bPoRvkOr1ZIYOCXF7
         L/+w==
X-Gm-Message-State: AOAM5337owIrhhtIJb6TC4l2Jwpy9tnZyQl+evvZX4bAAZxLSJsF7YEE
	hM2M8xouiURxvRS6trR/6EZyLceKVhctSw==
X-Google-Smtp-Source: 
 ABdhPJxnZRvpkn6WCGTYeX0bDLIXtakFWW6HTGdDI/mYXO8al69E642684Immpq90XalC3+sscoKSQ==
X-Received: by 2002:a05:6a00:150b:b0:4f6:66be:314c with SMTP id
 q11-20020a056a00150b00b004f666be314cmr8651489pfu.83.1646383824619;
        Fri, 04 Mar 2022 00:50:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 04/10] recipes: Update LICENSE variable to use
 SPDX license identifiers
Date: Fri,  4 Mar 2022 00:50:12 -0800
Message-Id: <20220304085018.1255075-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304085018.1255075-1-raj.khem@gmail.com>
References: <20220304085018.1255075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:50:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95769

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb        | 2 +-
 meta-initramfs/recipes-devtools/dracut/dracut_055.bb         | 2 +-
 meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb        | 2 +-
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb         | 2 +-
 meta-initramfs/recipes-devtools/klibc/klibc.inc              | 2 +-
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb | 2 +-
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 08d983e625..9f7a214d8b 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "kexecboot linux-as-bootloader"
 DESCRIPTION = "kexecboot is a graphical linux-as-bootloader implementation based on kexec."
 HOMEPAGE = "http://kexecboot.org"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git${SRCPV}"
 S = "${WORKDIR}/git"
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_055.bb b/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
index 3eee6669a3..a8fc5462f7 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
@@ -2,7 +2,7 @@ SUMMARY = "Initramfs generator using udev"
 HOMEPAGE = "https://dracut.wiki.kernel.org/index.php/Main_Page"
 DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the tool) is used to create an initramfs image by copying tools and files from an installed system and combining it with the dracut framework, usually found in /usr/lib/dracut/modules.d."
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
index b224a5c255..307c0e85d8 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
@@ -5,7 +5,7 @@ zipl (s390) boot loaders. It is primarily designed to be used from scripts which
 new kernels and need to find information about the current boot environment. \
 "
 HOMEPAGE = "https://github.com/rhboot/grubby"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index 43fcc1aee8..a276bf423c 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -5,7 +5,7 @@ zipl (s390) boot loaders. It is primarily designed to be used from scripts which
 new kernels and need to find information about the current boot environment. \
 "
 HOMEPAGE = "https://github.com/rhboot/grubby"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 1a188a6faf..ceb4f5ad3b 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "klibc is intended to be a minimalistic libc subset for \
 use with initramfs.  It is deliberately written for small size, \
 minimal entaglement, and portability, not speed."
 SECTION = "libs"
-LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
+LICENSE = "BSD-3-Clause & GPL-2.0-only & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 DEPENDS = "linux-libc-headers perl-native"
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index e5446c1806..8b91fb4b93 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Small sized tools from mtd-utils for use with initramfs."
 SECTION = "base"
 DEPENDS = "zlib lzo e2fsprogs util-linux"
 HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index a588296c05..88f32c8182 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Kexec tools, statically compiled against klibc"
 AUTHOR = "Eric Biederman"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
 PV = "2.0.18+git${SRCPV}"
-- 
2.35.1


