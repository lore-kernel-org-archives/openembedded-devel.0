Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEFEC54E69
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:01:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.52188.1710784911110773314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 11:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fdMq2ziV;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4140870914fso16566305e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710784909; x=1711389709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6tXDLflicFoPZKeCGAt6V3T1oN+/DNUcHy+5v3aM/k=;
        b=fdMq2ziVVoCVk+vi/arf5dFvcJ1E/tm/io3g4vNaOJs5AUh3tvlTc1/yJ8+a7tNDZL
         R1JUYAY1nzrYu3fwX3s0yA8OciMYc1aRa2iET8zrCjYO4U1mgIWNX66394mY9fzA1/7t
         f8IzzKwcKg/NUD6IK7mnVg4c7KK5ivCiMd9vVi0SyBU03NkFf2s5CyHGxx/23I2AqgFC
         ElP5sYxjEuIQjvByFPPe//Owg2VZA7z8gDftrGTyDA1tmmsynz9C97y8h+nKsGlL6ocI
         K83HxTZvZNIvO5kulGA711o43bjdNfFUH0Zab6QW8Sh4VBghqYC2elY/uXvd6iP+5nKp
         ObkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710784909; x=1711389709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6tXDLflicFoPZKeCGAt6V3T1oN+/DNUcHy+5v3aM/k=;
        b=Mnk29XbBxAqdMf5NQv7Viifi3MixbMjXiuQxko4kRrFjNOl0pGYo8dJJlPHFV5itK+
         wwIPE/OFkn1+pXQkrqdg8xAup5VvvUI/XQHaCpslcC7JpA34P9TGkAqFtR61S/8eAUTb
         dtptu2YhaI0Znj5jFovCMRWg6gudyPoSGbg1GyVb9Sm8KoQ6MkFrljCXO70bvLq+GS1P
         rYkciSAmROS3eHRr0HD1C4JEHNmDsfSFDgN75XMyGOfxuGa3lXIUmdtDdtihYDNVrI8j
         kvy7Coo7DipizKwtPQ8d31rw93zw4iYdxKQajbfGvCWp7bXa0wTZfZh8dOdmllQF0yaR
         E1LA==
X-Gm-Message-State: AOJu0YzGTU4E2+lBf+HfIS/nLGprvP6KclAElnh1mQHxMfpAn1HXoMqF
	vH3zff5ASSTBHlG943vrKFIgJpMa9SsoTd16IVn7bFbDr7uGjIDAWxvFkDLa
X-Google-Smtp-Source: AGHT+IHElzR+ZoW8IxX87klMMTWMOpvvnks5X0bphbdKE3F72bhAwJ6X+23TSMN0TOUnpZklcCMP9g==
X-Received: by 2002:a05:600c:3548:b0:414:60fe:8f2b with SMTP id i8-20020a05600c354800b0041460fe8f2bmr839148wmq.18.1710784908828;
        Mon, 18 Mar 2024 11:01:48 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id f10-20020adffcca000000b0033d640c8942sm10340634wrs.10.2024.03.18.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:01:48 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH] ostree: Upgrade 2024.4 -> 2024.5
Date: Mon, 18 Mar 2024 18:01:42 +0000
Message-ID: <20240318180142.700900-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 18:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109408

$ git --no-pager log --oneline v2023.8...v2024.1
f3b66e8c (tag: v2024.5) Release 2024.5
756e2dad Merge pull request #3214 from cgwalters/checkout-overwrite-force
bb6dfd3a checkout: Always replace existing content in overlay mode
c314eaa9 Merge pull request #3213 from rborn-tx/fix-early-prune
4efb44f3 deploy: Ensure boot directory is open before accessing it
223a1af4 Merge pull request #3208 from HuijingHei/split-whitespace
abc7d5b9 kargs: parse spaces in kargs input and keep quotes
d95c2f8d Merge pull request #3206 from cgwalters/enable-new-naming
2fb7a048 sysroot: Turn on bootloader-naming-2 by default
f1e663bd Merge pull request #3205 from cgwalters/fix-grub-probing
e47b3709 bootloader/grub2: Don't do anything if we have static configs
b4a1e383 Merge pull request #3204 from cgwalters/quiet-config-load
1a54d94f Merge pull request #3203 from dbnicholson/version-sigpipe
bf811629 otcore: Drop config load print
422a2887 main: Ignore SIGPIPE when printing version
1b3ffe54 Merge pull request #3196 from cgwalters/fix-sepolicy-public
3ae7118e Merge pull request #3199 from travier/docs-fix
a63f9516 docs: Cleanup title for historical OSTree README
4ae50658 docs: Move SPDX identifiers under first title
cdb4cad4 Merge pull request #3197 from cgwalters/release
084e027d sepolicy: Fix publicity mismatch for ostree_sepolicy_host_enabled
14a5746d Post-release version bump

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../ostree/{ostree_2024.4.bb => ostree_2024.5.bb}                 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.4.bb => ostree_2024.5.bb} (100%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.4.bb b/meta-oe/recipes-extended/ostree/ostree_2024.5.bb
similarity index 100%
rename from meta-oe/recipes-extended/ostree/ostree_2024.4.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.5.bb
-- 
2.44.0


