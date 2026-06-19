Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EE6CD98E6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 04:36:58 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35841.1781843809744078249
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 21:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b9mwlcKJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7dfe7712572so19177687b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 21:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781843809; x=1782448609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxo0qNEZ0trjM4w590qdUAkYE69pMcH9HyIwB+tl71c=;
        b=b9mwlcKJiGCfbXk6BL2qllLJM/05V4u7GM//664OOJtWBgGYlI2B85S0dvuadgXJ4X
         9I4fVWqtryNCxMR9+IVKfqKkYZOFkRqT/PvtpTGwxsM173k9Qlk7oyJYJefp/EwGXt5p
         gebib6l/4gfXfzcCwpwrRbWALrdAah7QB9iZyXMb5zcVDOq4/kchRLaSxyqSWlRL358r
         JOqNjkv/wK+ssX7kcrvjIFNtqzo15OqQj0ePDqNBXriWsNjhWc8DmHEmqMI9cnoLQpkM
         3YC42l6Uzu3H5UqNbtHp2Xf2qmNJy89J2RHGcVgsyo+9InJVGTc6MiHqMGWmgmeKOL8F
         IC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781843809; x=1782448609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wxo0qNEZ0trjM4w590qdUAkYE69pMcH9HyIwB+tl71c=;
        b=DgFJqIQGPU12FZQ2As5maRxbLXgzQnQx5VzYKQGuV9QQHnbNbfjf3Rbkjlnv9lDET1
         kHe9kYzqN1vOvknFfD3HuiRQGBT7+GxeftNKEpKcJqyz5dA5g9Hkw8kS4JMVTOhBRdqP
         +JI2iNt23zWyxddOw6z2f76KwTUyYxMKGOG0PnueZP8QvocH5xgiGsbXvkBpSMLZU05n
         rB1jQY16j1a8nkiQVip8c9wQi2EDmqpNKwj7KxX/esrl4lNkj23e3y2Q2I/j5ESHcGQY
         Kk2kJ2fspn36TL2WrUQefUkIsKy7KKcFKleZdPr7A5y3VL9OQgs76I1Lh0Xper7ujpIt
         AfKQ==
X-Gm-Message-State: AOJu0YyTk/AjxbLtl120lazruXzSHx+w0JRxfEDP81DvBjvzl0PFDBgg
	BOAMaPbiWmjVzeeDgZA8vlb+2s3S+i3bCdFXQpFhDD/VxlSK/oLX2Hf2ldDT/lfR
X-Gm-Gg: AfdE7cn3xGlZeHVdxM8+O4Mby+wgn7tIleUUAQ1mjB8YZwKVvrB6wTIDZPNcRa7JPGu
	FivHUFbXWVyl/A6nkmK4M/wVVqIrbh6ip8uuhnRIijgvZvZuPSFL/Sjoz//Zfgw6FZxkBER7AkZ
	HIrjb4tQG6NoEWP7s/mcq7OSXfLdyPTWiivCIxySOTOBb8Y+knZtTdhcUH1FzSyeKiJUfty5hqG
	dUorezGSZG+oGNIyTCumzbOi5JCilaUD65V7K2+rSAsOWlQEFXzNZ8T/Pj7rLgyJ7fS5HH515O/
	oZMaCcWrahIIG6ujFX7iJWHRWpZ6ZsNfmNT/cSQRaijph+rVgJsN42J6uu2eyKQwE4KK6R7KDaw
	Jyq1CbJsRj79vBr68xf3y1ZeyTNA+1TXZq7MsDHJSmNaEF9Hnjc1YIehaxqYMARd4hLG8t9Bhj8
	jvE362IGUHcYNEtLxF6Sdl2Y1IZsgtJzDeJfhWOkccTP2KbnNXnIpOg9N46MYXyTGLUgBC4L1rw
	Q5F05TG58BRbdkAkiPdRl2g+aku6ZaVIAOdG51b
X-Received: by 2002:a05:690c:4886:b0:7f0:182:b59a with SMTP id 00721157ae682-801311edb56mr19071017b3.10.1781843808506;
        Thu, 18 Jun 2026 21:36:48 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8011d00e3c7sm7425357b3.31.2026.06.18.21.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:36:47 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][wrynose][PATCH] nodejs: upgrade 22.22.3 -> 22.23.0
Date: Fri, 19 Jun 2026 00:35:56 -0400
Message-ID: <20260619043556.1880365-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 04:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127678

This is the June 2026 security release.

https://nodejs.org/en/blog/vulnerability/june-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v22.23.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                                | 0
 ...oe-cache-native_22.22.bb => nodejs-oe-cache-native_22.23.bb} | 0
 .../nodejs/{nodejs_22.22.3.bb => nodejs_22.23.0.bb}             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.22 => nodejs-oe-cache-22.23}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.22.bb => nodejs-oe-cache-native_22.23.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.3.bb => nodejs_22.23.0.bb} (99%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.23/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.23/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.23.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.23.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.0.bb
similarity index 99%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.23.0.bb
index a13b71b762..a55a8d8940 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.0.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "f3e6a578db1ab335a4a72785c1e87ad18a2cf6d2fc25747a1d741fb34af0bd0f"
+SRC_URI[sha256sum] = "3acfae100c7b855a4c76520ee0f95cadcace3f4254f16b7d4887f178fc95d4a0"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


