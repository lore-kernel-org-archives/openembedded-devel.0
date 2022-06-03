Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC2ECCA47E
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:55 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.2362.1654283985679368602
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QbMiwJgJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id u4so4959149pgk.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jfu9L/PzvIN2tCX0sZ9ZyBlLe+1PrR2fRoTJjSsdUxA=;
        b=QbMiwJgJZ5AMffre5QuohltYcVw3RxR1pC4sAwD9ewuIOnf6IY7Pg7P5xaMg0RHGqJ
         3iMFliUqQr9fqMEvmkTHvVBSrspaAhJAhWdhZVPC7NaihJ+eaQBGuv4JC+miRnQiBDwb
         cXTOILjHt1HgTkNe6hqcOPK5YnjPi2uHYUnZ9G9zbv5sx5Fz38Nvd/egmDgX3X/PXzFy
         1OISl4Y0+T9wpjEmcIHcHQHvIm3lCI6J2oP+6SU0HmNFB+BnL+d1sP4DQ4DpaLWj9Z9G
         S7MFegqs0Mi+riUdoAXrD82DUBtoQqOemYkscjEBRyM+kjDjAy4CEjC+/jvjZun+Rw3i
         8x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jfu9L/PzvIN2tCX0sZ9ZyBlLe+1PrR2fRoTJjSsdUxA=;
        b=BjPN6gPK7Wp9Cjv/Q2G7UOgX3NAsys6XBP+UaWJWwD4Yf17teZSmFVfwy2kr5MIz28
         9SrrEgj4tlPyCPtlihllQWlwOtc0uQa0brFUF5nV7sxb3gl7rPrqY/WrbWpCIrLjnCmD
         2TCc3VkAEp7B+AFDn4Tj9AHLOQ+djNsA46HvMvcAm+GCkjbNprDKJuL5+uyh7ehnDPOI
         n02XqHJ988z0hhuYjAE6HPvPpSKVmsf2Y4S6uBY5Xf66JyJjJjlmSXLVdrVtY/Y6ZN8R
         KDKeKxe3Ykmcmc+v8uHzk2Xsea/lOiYpnQrGVFsj2TLNZDAuac08PYcWmP5uHtqp9P6M
         Y/rA==
X-Gm-Message-State: AOAM531jw+gYP0kI06HNnnnmDX5kBRTSnakjZ8Ise5296H3gqvSFZwOj
	qsZeQOFBr0rb6KzI8DG3hIo5EdGkNbc=
X-Google-Smtp-Source: 
 ABdhPJz/b+jPk/qgh0WMcNi7jNssOI2NXPENIK1ho8FHzUlTqtERZgQjFxMgeNYswSARzEtXPkmWjA==
X-Received: by 2002:a63:d314:0:b0:3fc:7054:bf54 with SMTP id
 b20-20020a63d314000000b003fc7054bf54mr10040170pgg.615.1654283986017;
        Fri, 03 Jun 2022 12:19:46 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 17/20] sdbus-c++-libsystemd: Fix patch fuzz
Date: Fri,  3 Jun 2022 12:17:16 -0700
Message-Id: 
 <18a923d20b1885f508dfed83daaf5a8fe0d45de9.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97406

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 397f4f054fd3600f7305055c724607973f5f5511)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0005-src-basic-missing.h-check-for-missing-strndupa.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 36545c2f60..005ef022fd 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -322,8 +322,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -12,6 +12,7 @@
- #include "set.h"
+@@ -11,6 +11,7 @@
+ #include "missing_capability.h"
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
-- 
2.25.1


