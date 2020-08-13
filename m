Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.4343.1597296782079605383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 22:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gN0Nza4O;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id f10so2123857plj.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 22:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TbvizERAEa4jdOewLaVfgdjlFFtRGQvnDMPzR3O5+KY=;
        b=gN0Nza4O/otVY1gyqMNHFWyqFHZVeXNRiLhKpQjxzIMybpnu1T/pIPWgmZZ2DvY0lI
         fV4Ae9klvpzNEE8k7y3mYiUVKmJonTiVQ8AIZrpCa5FaJ2HWitDJJGVjg3It8jOEQCIa
         Dy3t6lyTVUUgQqM9Vv6VCNfJW50rwTMVPinrBLXsSXQl6h9Bci4pWlueWqKLodIuTLfz
         mZ71Lj0W7rnGAZ3Y7GWSew7jerjOY/9mHcXXyUPtWQOBrI0V2VPv8jQ7BNcdrxs/j/QM
         IDvSIoVmSUdHcu7PtDd9bb3sOUfYGswoLXlE5ObZ3K13kjX10pDM5KpWnsL7rxepp22t
         zqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TbvizERAEa4jdOewLaVfgdjlFFtRGQvnDMPzR3O5+KY=;
        b=K9Z24egt23zUk3Xm1T+wyl7qO8bgKTQjd3/N3/xp+MyAgZV4Ja/sedTEBfhJme/o0K
         8wkjqKNjGC9yTZVvaHmA21NR+ZZnYsHxGbuUnSYu2MwVIbEl0l20scvWHyhnTcO5/aaU
         LaJMtHk6bBBNdQoCBZlTjncmNg0dNJLYGbl6yMHJAwJC16lIT9OEHQ/SgUl7iluklLqw
         Yh0XWUer1xpjxv0OB+DfCl1mRPeXAz3pxq5NgJS6NPtB2Gc1kg3PRN4JUTIKXkf+C7NE
         0NvcaKtdr851z5uZHQC+5FmvxN6tPuhc29HhKxIOl4WQfqz0WRI83YWqT2MsJii8ez2t
         +2KQ==
X-Gm-Message-State: AOAM532MVeaau0I87dzPmaOe525a5TUz+wxuN+CmtoxTmofg7f3Ou7mv
	08HPUQyhQJYjyYlxxE0aoFhlP90gRw8=
X-Google-Smtp-Source: ABdhPJzU8MwYHjmZv2ItKgos1HmpW2ictXslaZDsvufEe/se87c8JV8o9NBxh8Js8dlFdPXLt9Ny5A==
X-Received: by 2002:a17:90a:e511:: with SMTP id t17mr3371893pjy.189.1597296781399;
        Wed, 12 Aug 2020 22:33:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id x28sm4336801pfj.73.2020.08.12.22.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 22:33:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] kexecboot: Use -fcommon to compile
Date: Wed, 12 Aug 2020 22:32:58 -0700
Message-Id: <20200813053258.2386575-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813053258.2386575-1-raj.khem@gmail.com>
References: <20200813053258.2386575-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc10 defaults to -fno-common and kexecboot does not compile with
-fno-common, so use -fcommon explicitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index ed3dece3f6..2f46fa9523 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -13,6 +13,8 @@ inherit autotools
 
 EXTRA_OECONF = "--enable-textui --enable-delay=2 --enable-evdev-rate=1000,250"
 
+CFLAGS += "-fcommon"
+
 do_install () {
     install -D -m 0755 ${B}/src/kexecboot ${D}${bindir}/kexecboot
     install -d ${D}/proc
-- 
2.28.0

