Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37AEC52D1E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 17:09:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.61068.1722272973077685239
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 10:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LZIJqoag;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42819654737so13696045e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722272971; x=1722877771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTZx7PruUQmrPwvGQs4WHYVv3C1Cs5HLRcWVOQ4p08s=;
        b=LZIJqoagTMG/e2FFV8GpmsMhdno6PLseyR07fFnR2kZu1qsyCdoZYQ7Ytlvtg91lnt
         LEz9BjL2SSZ7I8lh9ICCf/eHjqJ2/S7U32BYpk/OXiBb5lNsOXIUNJFkNPJgs2KH818c
         pNnoDXrBrXM43Y4DqojkDkML0MUpz3ThznaFX78iBQ99mo6G0WN+SnyeB1cgv2s5QIXi
         aBm3f7lxwKYbvELVvD7jLRvSLJGVWdtL1Vuss6ARsGBqKUjSel9L0Z2/RsprcW5iTgWY
         nvUd/3qWD6gInP0JmejzbJrQMJavjWHfvtpORLSPCqkwEbeHzXAUjBy2xbC9N/7nMGP+
         6YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272971; x=1722877771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTZx7PruUQmrPwvGQs4WHYVv3C1Cs5HLRcWVOQ4p08s=;
        b=FwYixQ/lxtdnd3WQYBnKTjgpKAvp5A0FzGgBCusWA7GfGXTU1ZXGKSNMzEL79mrxms
         bCYoez1EHTTDQlZR6Vsg7OQJPDIsUPC2Jj6K61cauahJEZo38yol6P5A9Z8HAdOgMr8h
         7eU8c7XXHjO/xM94MJhwxoLNMfhaWBFGQSwvg2pqAzli9Zti7gciJIF+v2pIXcIorDUx
         v2FmTP2DLGCHr7TOdAn7aQcuEImqJZNH/LgynT1lBgsWAdDLKvV7GenIdryb2oA7wY40
         S5FNKqaR/b5lOQoxyh6OIMOOnWqE063oBnEcXdmBtIGnGdo/ACOeaZV3/Cay+idSyBi5
         PUaw==
X-Gm-Message-State: AOJu0YyPU5XXxSuin1nz3hlua2BAqfq3g7+BzkbAm0ZVfWjnoVWBfrBe
	wbGd9lkG0ywY0tMmQyEM6KNSRGV04bBPHBUCBGx9Gt4U0z+0tBrEHpZu3Q==
X-Google-Smtp-Source: AGHT+IEFkvWmnLet8WIjCjlvOEoh9LYGTvO7NRqjM5CvAZKwfS7euZFtbHuYki89D3DjB7Cf7tUGSQ==
X-Received: by 2002:a05:600c:35d5:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-42811dcd280mr53165495e9.26.1722272970909;
        Mon, 29 Jul 2024 10:09:30 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280fa9a30csm115340725e9.30.2024.07.29.10.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:09:30 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/7] composefs: move from meta-filesystems to meta-oe layer
Date: Mon, 29 Jul 2024 18:09:05 +0100
Message-ID: <20240729170910.2670446-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729170910.2670446-1-jose.quaresma@foundries.io>
References: <20240729170910.2670446-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111466

From: Jose Quaresma <quaresma.jose@gmail.com>

We can make this more widely available as we don't
depend anymore on fuse3.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dfae2972b4905bd9a423642641d4921334f844fb)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../recipes-support/composefs/composefs_1.0.3.bb                  | 0
 ...001-musl-basename-use-portable-implementation-for-basena.patch | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-filesystems => meta-oe}/recipes-support/composefs/composefs_1.0.3.bb (100%)
 rename {meta-filesystems => meta-oe}/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch (100%)

diff --git a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
similarity index 100%
rename from meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
rename to meta-oe/recipes-support/composefs/composefs_1.0.3.bb
diff --git a/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch b/meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
similarity index 100%
rename from meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
rename to meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
-- 
2.45.2


