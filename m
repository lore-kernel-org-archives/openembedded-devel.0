Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEC4C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:56:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.2880.1653616605142786772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YJXleDg6;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id x143so3140578pfc.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yzW2ha+zfBxPDOP52qh9zhS8Lqhs8p9QF4eEQlveI0k=;
        b=YJXleDg6iC94BUAnA01ulcURbzEaHeHg5Wj0+K8mfzJYtVuLZ2nMrQHwgQg+C+wWpm
         BaHuKE1mKLJX7RhBNuEJXc9KWSuqT3LisCDllIy9amxOZ/moVETqRk26hd3n1oLi/eqU
         benK9McF93gsz+4BfrMspJ3dXBwd11iweyD10NmidnkwhC+M+9LZGc/sAoWWLu1X8/i+
         MwtwEtOM6RbhdFD8pZHzU180w1jKfB+uvwufhmsdEFy1o20TBbK0cWIXGFzJxDFuLl5v
         NfUSohzj/Bkh3+tnnKNbYFHIv2HCfIRQlyk0EgMyoUqDaYgDey4rZoBLFvx8tcEhorjT
         2LDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yzW2ha+zfBxPDOP52qh9zhS8Lqhs8p9QF4eEQlveI0k=;
        b=UGC+x9o1wrwN8/zP/7NlgFbtDFX6gOabvQLMvGLWlBP0IlLrYBIb3XXKbMX8hpMz2W
         0uwt9zXFZL9BLl+raqKTPz09ReVxM1SqA++NodJjzLorRQyWxUbQYQ9+RwNkeIaw7lve
         4FLTRysJOOTOVnnePnsI9ft6rQMeHShe08FustV01rhUXTGcogfOtEvQOpqV61maOpx0
         ivGSYXU/uh9VE9S/c7uQh1iN4256NPJuMHJCecyX6ipd8mFBdHEzTMhMs73Y2MyWj1Np
         80lG3n1miJ907uC2r8eT6gWIVU4s1/X4Hy+krCJ3Yqk0sXnPUXQbi+6aop4M2vyIiRZs
         /u+Q==
X-Gm-Message-State: AOAM531hKZdXlLv7toMONhFQ6r52wwLkDYytSmG09YiKvfBxPy52YfxM
	zM1uhH7X+O5Ta2f8MeJxfqfY7DVYtCRmPQ==
X-Google-Smtp-Source: 
 ABdhPJzXoZmbJ0J/xbtxgmpQ4xVqrxS87CGayZDtZpyCn+4ymblqWQUUO4gp5dUTr7qFIkhB/VmDFg==
X-Received: by 2002:a05:6a00:2918:b0:512:e4b5:60fb with SMTP id
 cg24-20020a056a00291800b00512e4b560fbmr41818640pfb.50.1653616604256;
        Thu, 26 May 2022 18:56:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::47b1])
        by smtp.gmail.com with ESMTPSA id
 19-20020a170902e9d300b0015e8d4eb216sm2323538plk.96.2022.05.26.18.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 18:56:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] ubi-utils-klibc: Disable lzo compression by
 default
Date: Thu, 26 May 2022 18:56:41 -0700
Message-Id: <20220527015641.736815-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:56:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97302

This is still available if needed, however its obsolete and lzo has been
removed from oe-core, if needed add meta-oe to layer mix and enable this
in packageconfigs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index 8b91fb4b93..43ddb82a00 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "UBI utils statically compiled against klibc"
 DESCRIPTION = "Small sized tools from mtd-utils for use with initramfs."
 SECTION = "base"
-DEPENDS = "zlib lzo e2fsprogs util-linux"
+DEPENDS = "zlib e2fsprogs util-linux"
 HOMEPAGE = "http://www.linux-mtd.infradead.org/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
@@ -25,6 +25,7 @@ EXTRA_OECONF += "--disable-tests --without-jffs --without-ubifs"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
 PACKAGECONFIG[xattr] = ",,acl,"
+PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
-- 
2.36.1


