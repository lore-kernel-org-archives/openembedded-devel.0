Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC1BC41513
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 19:04:59 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.4049.1715281496392812834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 12:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=W4kSwLpn;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43df23e034cso10318741cf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 12:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715281495; x=1715886295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZy9uqA6eeh+t6CgmyubPGq/69OoLgLUn5L+7lr4IAI=;
        b=W4kSwLpnWxJXHIJUDaQKLCjURK31MqoWU2XCyZYLACLqgzLjIvxILUu9SvMaoqGmTG
         v54EpYoAJcEB81c+/GiwK7vftZzB58B7uOQ+c9v/pO96hmzdQJmMNj0/iCjqaVTQ/QWC
         qC7o5eujYclfp4NYennJ6qipQua90AZXh+wIMZqCy36bKjV4QA8zXcIg//UPW7JeFVrC
         +jgd81g04kYtXnAi0S1b9MJuNgy4PHyUazpV3VqrHQm4pjwl4OP11mKI5qu1EcGKUh3+
         ZWbVOYKSno5EpZLcEzGa6CybF0ooxHlvkPESryJxnSMfTqAszQCUDR16wKe4k5MtkaaZ
         zesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715281495; x=1715886295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZy9uqA6eeh+t6CgmyubPGq/69OoLgLUn5L+7lr4IAI=;
        b=oG1ywMRSs/beQC5mNSF2xO29+9wPFGNRyIE6lWMAiyb2Q/njtk/vuPn9udeT4noLKg
         9O3jJyjSM3knRoqIRKju1W6hCD7RlwyOpzQIwYhCe9ov6y1SWQ7QABtkOh07rLl7WOCM
         fJpgNhP9CIasBGYtIT6ApOLv91JUTJ5OAkydkpd4QzWIi/gvPEvjLbDkmEJpLatR9m3e
         qkYIgTSVYAQj4jnhre7S6axZNUHnAApNm9RGPu9QbsaeG6FC/+3wv2p2r83W7aHduvfr
         VBSRq32YbB6IWWCYeVHmB4+ei5JdWgmXsDd0YUFDoKGYN9lALIM2JrWw7FxVdhUXMkcw
         p7sA==
X-Gm-Message-State: AOJu0YwsgBE4b0dCeiBK0XeyKbFJ+S1oKtz6F0Xe11aHkQcGX7BV/siV
	ROOQeC/juSYuQPy/7yhSVb70RXEv9VWv5kNyEhL/idGFCfKyOqCZI+vKDNYH+fVKEw1Gtna5l+z
	s
X-Google-Smtp-Source: AGHT+IFKBV5MY7XqQ2xinXo17jfaT4fhjgWlUDr2bYPzM5xuo1/qAe70j7LPfGlNIdAsWHIlntyrQw==
X-Received: by 2002:a05:622a:1aa9:b0:437:b7bd:368a with SMTP id d75a77b69052e-43dec074ac9mr62978401cf.19.1715281495303;
        Thu, 09 May 2024 12:04:55 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df87da55bsm7786441cf.33.2024.05.09.12.04.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:04:54 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] xkbutils: upgrade 1.0.5 -> 1.0.6
Date: Thu,  9 May 2024 15:04:52 -0400
Message-ID: <20240509190452.2365537-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509190452.2365537-1-tgamblin@baylibre.com>
References: <20240509190452.2365537-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 19:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110293

In particular, make it build with gcc 14.

License-Update: Remove "All rights reserved" from copyright line

Changelog:

2939632 xkbutils 1.0.6
e2ee9c2 Change sprintf calls to use snprintf instead
aa03a3b Remove uSetErrorFile()
5f875c8 xkbwatch: Fix -Wincompatible-pointer-types warning (Issue #2)
6dbcbb5 Remove "All rights reserved" from Oracle copyright notices
56c99e3 gitlab CI: stop requiring Signed-off-by in commits

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../xorg-app/{xkbutils_1.0.5.bb => xkbutils_1.0.6.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbutils_1.0.5.bb => xkbutils_1.0.6.bb} (75%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.6.bb
similarity index 75%
rename from meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.6.bb
index f078ad60e..0274608d0 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.6.bb
@@ -9,9 +9,9 @@ It includes: \
     xkbvleds - display the state of LEDs on an XKB keyboard in a window \
     xkbwatch - reports changes in the XKB keyboard state \
 "
-LIC_FILES_CHKSUM = "file://COPYING;md5=64322fab5239f5c8d97cf6e0e14f1c62"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6767a97a97e21260134637b657b922ae"
 
 DEPENDS += "libxaw libxkbfile"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "f6a4a8e9c54582beb3787b1faa8168caab125c1fee0ca9cfa5b6c9c1df25eea4"
+SRC_URI[sha256sum] = "31a2bbee1e09ccba01de92897b8f540b545de812f318d31de07bd3a5a75ee25e"
-- 
2.45.0


