Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E1CCA101F
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 21:16:54 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.7063.1757193410973802858
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Sep 2025 14:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eGePyqkx;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4d118e13a1so2128899a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757193410; x=1757798210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYg5sau6V43/x2BXnkw7CVwroJpdFAsxaW/9x6/My2U=;
        b=eGePyqkxHlv9t9Gy5I5LS6AXitvuO3dYzcXcrEHLRpp1+G9MGKkVro7OTTjwOpDUPG
         WIk6KvYMGMe6dS53E1dwb7M57TLc9SFMMrqHDvrcYYhPf9C0Rk3KX8E3yu3dwaCbTUia
         GBhWqHPYogybP/llhNjGQPd6pfqpDCUm5OFG9bi/v81KgtgYS1KqEThCK2K9Cg3pAoo7
         NZURVg7ePCi2Gg0ACxlcKi05bRFidzGDJTETL1E4NZS2hCTlJuD0KtF8SAbO+nQxTrMt
         p3ApzaDQLnZwawOI0lrPegXrwPrPZNwJELHVUaChdaH+J7zsaGvWFzdnthYYrgXmsBdH
         psQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757193410; x=1757798210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYg5sau6V43/x2BXnkw7CVwroJpdFAsxaW/9x6/My2U=;
        b=pXXg7ekYESZ7Y7mr5hP0wes6g4sRzrJsOoVZtxFma6YfxyhU7eZomT27MRi5zGlVO2
         dKgxRatgUbjZjU2LgrOily6iM/2JheUARwDbuFeMmWCRTIwwzhkccfVDzq5/85p1Rht7
         Z5/szT868p1MQ7k3VflbTh2bAUvtfkT9cGICk+7xqr/vBVVi7sxXhb9D/bVDTAILfG/i
         Dd5W/MMhotzPxf+ZVtlco4pNH1O0XnKWswpBfGT2hrJrO8yqiBigbUZcVydGYKYReotE
         yC9U2zBVGvCpxyc7fX+MeteOXloJtWD90YeBgPpQ6iXlzm9G1B4hfHaf6x4+GJwgOfec
         J+mQ==
X-Gm-Message-State: AOJu0YyDHTxFsgPcS76cfKPxL4D1x0mi72LljWYdkFPLA1RLr0y2iMmF
	+GaL3AnRF6TYY/Xl6g/zd5qD6D8iN86aCtl5eoGzHbiBsJkfF0gH1BMa77sNunch
X-Gm-Gg: ASbGncvUUe90IgIz7mLRQ0SEfUdOxoU8NsPoKIi1HsaZBh99jBpKX6ixa7bjv3FcDgG
	jCR3BIYMMoLvBt+rr06vtZ9MSYJQB8SxIdcm27LjHJPSp+i7MOYjAsKvNztVsFCaSTsz472qTZR
	W6/VtynbLTztgkfDfbuWiO5DCdmieTCOX8zHlShGmA5dLeegOLA1x3EdPODsgZQ2sKHloBRMtTS
	OP4Nd371p3ICmI6ZpyIJXc97GrtUewphR+GBqRCPzNua3D9JBkU3ix2a2X58UReoMeRXkfY341R
	IntCKFB8FYVNAQST4imKT7avHKMj8NJYBMm6tVJsfrLtT/9R5VNpIXle9fKmnScOf9XSplcJaBc
	0LYgYDnFH9ZJqvfzE1PXc7U93GXQ4USKnfz/5eM8/kf1nmMRh4el50PUPS1eGEDTkvIdNJdMll4
	czZViSETJgRgsWAuV/u1jUQRXO38+U66FNY01dxaNrRQMsHu9+qB06ML/baTYXxg==
X-Google-Smtp-Source: AGHT+IG/UEbS+X4h6hHZawvT3IxiqfmufSLgiYF1S2N5rVhUo3s+Rs0FRMYe/c0ccRc1nuyiP1SbBw==
X-Received: by 2002:a17:902:f788:b0:24b:15b3:224f with SMTP id d9443c01a7336-25166d5326cmr39464005ad.0.1757193410136;
        Sat, 06 Sep 2025 14:16:50 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ecee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b168157b6sm130903255ad.13.2025.09.06.14.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 14:16:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] bpftrace: Fix runtime deps and enable musl builds
Date: Sat,  6 Sep 2025 14:16:46 -0700
Message-ID: <20250906211646.3814323-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250906211646.3814323-1-raj.khem@gmail.com>
References: <20250906211646.3814323-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 21:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119327

Remove systemtap from build time dependencies it seems to be
not needed and it does not build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
index 7e9cbf485e..f7b2e7485a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
@@ -9,13 +9,13 @@ DEPENDS += "bison-native \
             elfutils \
             bpftool-native \
             bcc \
-            systemtap \
             libcereal \
             libbpf \
             "
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-native', '', d)}"
 
 RDEPENDS:${PN} += "bash python3 xz"
+RDEPENDS:${PN}-ptest += "bpftool"
 
 SRC_URI = "git://github.com/iovisor/bpftrace;branch=master;protocol=https \
            file://run-ptest \
@@ -63,7 +63,6 @@ EXTRA_OECMAKE = " \
 "
 
 COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
-COMPATIBLE_HOST:libc-musl = "null"
 
 INHIBIT_PACKAGE_STRIP_FILES += "\
     ${PKGD}${PTEST_PATH}/tests/testprogs/uprobe_test \

