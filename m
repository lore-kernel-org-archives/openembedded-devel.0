Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E06ACD13D8
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27203.1762704039133841062
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BopC4EDG;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477442b1de0so14696015e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704037; x=1763308837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxTP34t+P4UIa5I4LCM34VAcY4uWYQqZ+q7DFWF1yoU=;
        b=BopC4EDGv2l78bXpUI6lnZOn+A7mahl2YkZ3hRdrb1ypclvvd/tahWOgymDAEJiMug
         uxpjbBAqEfkewVQHNHtYPt5mhpkCr4ccro/ezUfs2U27kA2NXkiYiCrHELiCHFbtQcGu
         P5jXNICG/Qjqldt0eZqfy7ZChTDW2CVI1DVN1j+2WlhBOUKYrV3mg6dd8WxZb7N26qHD
         r5lwO+hnj7QHfTYw6RDgjTcCcaw11xt6zYTmHeFjvTQT+OhFhjhHEzkAFJeq2BWE5rjq
         XuU2GcUDs3B5CmkYLbOVz5dC0LhLW9OcpLkkNiW5xoWaFoG0hkE3GaO4mCIwS+srq2zu
         6nWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704037; x=1763308837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rxTP34t+P4UIa5I4LCM34VAcY4uWYQqZ+q7DFWF1yoU=;
        b=Dmq3/Z2A3+h/KYYUI67pf1mzTGeemfgsONLX7G6uWxYuiZg7grXXeQBiLT8HUcuxwW
         Ln+RM33SB3z4XNupuxtlQHZNgrWTzv/552pCQIMulZ9+RytlibbtcAoAbbGoEbW2bJ61
         Oz0Bto+CX5NMblu2c9Slzf07yi6GkoVPFP80UbBYl7iP+wgicdxVnTTPGcWKNZiNIQ7f
         OG5fjDPDS796H31ki66BiUAoyMi8tY/EeCF8etn8an/vSpBOHOEzNkuNcpSaNsljgqOt
         NP7CSnFbhzVbknzlfaZQ89MUSUu7Em3ZnKPeR/F53Jba/wGV1yUdR83weXXZcIiClOlT
         JOlQ==
X-Gm-Message-State: AOJu0YxIt+CHyyy12NEFrPXkVcfgYCBysE237yjChwO7SG/ngw4RVNPA
	JkVqvX/F1n0sanBFqfftZUa+2uZpyGF6ZrBjudHh2w2uHDi1kpoKO2K4kw6hQPGy
X-Gm-Gg: ASbGncuE6GvrVt8SO2sxj3A18Ik72z6SVg8aLuI+wZ/1GZBQejxS4xUq4ils91pFB5i
	MAzdbxHyPnNaalYf5VEvgsbdd9fpCEz5bPmdRWMmZ5Zxxr0d2uJzFjVwtvkCdNwuTpe5Dfdlmf5
	vah/xPCRy8J7vU8Fet8OUdQGesRIhuX/nW1EHsf5y+G9RLcg7beQbMN7gIrv1Z0vWH3mCg9l3E6
	ZyDmaCSiq0G/jvvSh3zZuvxW7rETlGfxWNcFvieIW7wyI6Jg9K/SP0htce9HAn6uWaYw4Lnx7OR
	5WvsQ81AdXnm3kXXqLVmdMHTiJ7Z4C/mUSZS35IRH4FwcbIyKz55Tbdl+VJXqeeTM2sJ1xLR7gu
	Z1H7veS2G4MwcdbbWZV//yALBF46I13Sy3mpVIjGq7rh6FzM7qta/VRyDIGIsziLrwOfQPLXf6g
	vhmTFvueNw
X-Google-Smtp-Source: AGHT+IHofcF76t/kq+ErMcR1lWrI0Z1DX1PZPHQz935xMSIyDF0qGE1r1lEO/33b2cPMHZgbYOzyDA==
X-Received: by 2002:a05:600c:4703:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-4777322f0e3mr53860945e9.12.1762704037512;
        Sun, 09 Nov 2025 08:00:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 14/27] breakpad: correct SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:06 +0100
Message-ID: <20251109160020.2522353-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121430

Master branch was renamed to main, causing fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
index 3bf4371e85..5132e1748d 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
@@ -28,7 +28,7 @@ SRCREV_lss = "9719c1e1e676814c456b55f5f070eabad6709d31"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
            git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=main;protocol=https \
-           git://github.com/protocolbuffers/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
+           git://github.com/protocolbuffers/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=main;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=git/src/third_party/lss;name=lss \
            file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
            file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \

