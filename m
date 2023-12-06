Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BC1C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 12:37:17 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.30252.1701866235198633624
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 04:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f6v0BgXb;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c9e9c2989dso62107911fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 04:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701866233; x=1702471033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CMZfUzIvKpJZ+tRon3lMb5a6TFuP5KuCH9XSJSRM8o=;
        b=f6v0BgXbafmd+I7Muiu9RL1zF8ddXt5tM8eP/wvuG2Q8e9IFT29An7P0C7poy5o/w2
         zKdCEa0RWOKsM2SlNHABFy/CDjVv9XQTZWh6hZ+9l90hY1MysmpfqNpgrMekfT+tmLXZ
         N2lJotneJViEBcL9NMNlgemgftxfmnwIhI7JokHp2NYCWPuhfMI7dE3Y0jnp9W1Sri2G
         0NqGAkNpP9yW17jOTpzy12sJhMI1Qoof+eDs0wybgoPT1p/PhE7G5sYPVVW9utdtbbN1
         tMaQvc/OsxATiKTZT5xpBk2DuMglhHP6qzlqY0RdsZU03mN3EUfUShNTvK3lF/S0XX2o
         oLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701866233; x=1702471033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CMZfUzIvKpJZ+tRon3lMb5a6TFuP5KuCH9XSJSRM8o=;
        b=AnjBdFWrJy+iN97v/wdZ7zf2xtBpa0CErKBmENmvTpgC+AXSjbJZRdyZGkVPhXW2c3
         XmZ6QuNm06+7eoSzzNTnhTJcFw89GBIYYhpK0bKFBCf3jp5Rm52k/FVJ4nsKdKxHV3Ri
         046Zn4gnYQOFmzOq3enCpfMnIViq5cOjY4YWMcFeuvpP97vC1BncqalD+wtF0lge9rQe
         mDS3G0+klYUdQQLuTeP/puQvuGH7cgM16lGMrkO63wqrT7vmCP+uRZToGTmMt3nFW2Cf
         hExk+svXFGDYlUkhJ7Fdfz6ZfZMK0Y4lqhRSoq3iO2xmM9h1G1BljLCSKL8f1J9CQzqu
         ed8w==
X-Gm-Message-State: AOJu0YxwEu4bywJQtJAvmjy+ExU775d7GeuhCoErDcVVyhq/oK8/gNv0
	GztQpeX9JsNiBDoN460UoZ8p3+hScGwV/g==
X-Google-Smtp-Source: AGHT+IG3PQDddS5OIzTV4536s24XMi7sYRUCc3wqdhB22qvtEJYxr0rd3VxRsQ5I42tPAjXfwShQNQ==
X-Received: by 2002:a2e:300b:0:b0:2c9:f9ef:d03 with SMTP id w11-20020a2e300b000000b002c9f9ef0d03mr464900ljw.82.1701866232564;
        Wed, 06 Dec 2023 04:37:12 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709061bb100b00a1d9afe42f0sm929195ejg.35.2023.12.06.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 04:37:12 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xstdcmap: upgrade 1.0.4 -> 1.0.5
Date: Wed,  6 Dec 2023 15:37:06 +0300
Message-Id: <20231206123706.286090-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 12:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107245

Changelog:

* Remove unneeded variable initializations
* Remove unnecessary cast of XFree() argument
* Use C99 loop variable declarations
* Build xz tarballs instead of bzip2

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-app/{xstdcmap_1.0.4.bb => xstdcmap_1.0.5.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xstdcmap_1.0.4.bb => xstdcmap_1.0.5.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb
index 9d523bd7b..657c51732 100644
--- a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb
@@ -8,9 +8,10 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b08d9e2e718ac83e6fe2b974d4b5fd8"
 
+SRC_URI_EXT = "gz"
+
 DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "da67142c128d18386ff145882e0afc66"
-SRC_URI[sha256sum] = "06898b3f1eaad0b205ff3c75bdefa3207868b889d4cb37b32b8267b2bbfe6f8b"
+SRC_URI[sha256sum] = "70bd5909d6f1b4d9b038593f72ce70b0095a6f773e1dd8059136bbeb021b8771"
 
-- 
2.25.1


