Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF60CD37B9
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6304.1762976157825421982
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGFF65hT;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c48e05aeso20753f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976156; x=1763580956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgNX4MNcXfIwDNmHZSfOMOQc5azWukyHFB6di8DU9LA=;
        b=VGFF65hTYFQ80kNvF9hvK9T5O6IdQiR5sRGgSNe/uTqVA8um76V+eH/j5d63LDw+kv
         mcodyyEKaG0QRs5Jp10YoWP/J3HhkIwEq6OEBpGbmJfbVX2wOwfwWPRX0R12/Intn853
         4XvsdGj+1N3soVW1dw4/BvpNgkfYTc9+t9RF1b8P+J6NEqLwyWtvL85B+LO5fh/OIqXV
         u6x8+WxZIFkBRortej3Xx3qrw/aM3s9zsuzcTk9qdeZjrRmftCAyLsd5PSyNe050VCaj
         h1xLpFXfxC83Tvy+diM+U0Oco1OPWGGp0Ux/CAlvjaSBGP/f/RlGHBv9mGm66G6IeWuC
         yGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976156; x=1763580956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NgNX4MNcXfIwDNmHZSfOMOQc5azWukyHFB6di8DU9LA=;
        b=Vq+nG8TyKqrzCe8uXdajIkQWct9dD/5wlsByqx785G2SPpJrs4XZiV4v6jqV+D951N
         U1NIghWDsxD3gImJHzDZhZze6kXFHQKmSwHDB2qV2goxxviHWJqvv4o8zTkxms/Z2bMU
         2Rm3UcAKUgZyrcgdi1dP8kQuV0AOd0h2ntie9Q2G3Crr1gDaZWzO9V/s7hYEkCXlG+yL
         vpop6Tf9K8U7H5C9Uyz3gA9ANwuOQmaDMivedPDK3DQNfyrcoYxxJL+VJiQL43wGA1o0
         n1+npM8mwafsamw56RI47jWDDqEdgpyW3Ugkv0LAphq8kzu60/jDvHoLTTC7pmGaQaGj
         Xq+g==
X-Gm-Message-State: AOJu0YyQ+n9cQcbJsnkWh2mah+D9sDA7J4fmDbRxbbzZa7ZVbEkZorye
	aWH3YFgz2HlkgyJ8/oy24Mi+EPmUF12uDtqZVjjTCqqcDIgBj/aoHPld4i7TYID+
X-Gm-Gg: ASbGnctxgtut1qwDItSEfh8KlDwQID3fIRJR7I57HWKp4iQhYKqqa7JdJfykgLeLVEH
	yF9pvbZ3Qigm9JVoDbtUgo/O77HzYu9roytAYcqIuIz5xYA9w2GAmEF2sGVK9TFU99E5JR3Fyv3
	WRXqPGD0nSb3YxVNdtxD+ZRsN2skd2a7p0sjNbPVf4QFDOjgZPrghaJXEZ6MeRxbuZ4IZOxv/bA
	stK1x7hb8zv8Yz5O8kphREN1lGFtjMr0Cry2XgvolswUANYLECHx4RnD8VjlUOqPFLx5oSpjk2p
	dEo0b9uAsW+tLwhY0x/XFin7W4mx5H2dFgCnivCP608I6U1cgmX917JhwG1SdilrlkvBZQMn5eI
	soNFyhkSwa3TecKz7tDo4jFoy4JqqDvF3xpXnvlW6ULiSwwHmecboR8gi7H5/iLVQBC9ZSJMHwA
	==
X-Google-Smtp-Source: AGHT+IENrXNTqnvzcZQjhfvstJWD2JJ+8a5jSq4RxBStTzwKXMLDM6Ov04F8PnbNPCGDUiMVF/WUWQ==
X-Received: by 2002:a05:6000:1886:b0:42b:2db2:159f with SMTP id ffacd0b85a97d-42b527bdbf6mr725527f8f.12.1762976156164;
        Wed, 12 Nov 2025 11:35:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 18/21] spirv-shader-generator: fix SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:38 +0100
Message-ID: <20251112193542.1589821-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121579

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
index bf0a5947b0..cdda225bdf 100644
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
@@ -6,7 +6,7 @@ SECTION = "graphics"
 
 S = "${WORKDIR}/git"
 SRCREV = "ed16b3e69985feaf565efbecea70a1cc2fca2a58"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=main;protocol=https \
 	file://0001-Add-install-PHONY-target-in-Makefile.patch \
 "
 

