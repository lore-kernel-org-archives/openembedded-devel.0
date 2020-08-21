Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.138188.1598028987735489650
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 09:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bjarne.michelsen@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id w17so1992531edt.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 09:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wVCZnq0aTyAu8uD0tKnDMKQ/o8I4g2R1TQm4o5p5mhA=;
        b=bwrw6tBQp9wuymhw88l8a7JN++o+SPrdUp3IkJMAzDThWcYLi/AAPWIrxfhxykB+rx
         WAH53JmINyd0saDjGZpbRfMazZC7KgrokTZ/xZLmgSgh080FRd7yxu98NvNOurwL5Suj
         AJ9FE6BacoSWZNyW0S399GSXLpKeIC7x7V3tZAfqGSYlFO1A18P5yZcp3T3p2x7NXeKl
         v161S9pd5ZlVyt1pavXWUY0OXgR3niPLHkqShrxOsEwwuT4UFpGhbB0ozGDwi2TLakuW
         7yF7bqfYAa4pzLUSWWgeXDjDc+rV8K9NoUq5PUWOImgwUnocQBcU58Qtoi8DbLIXPuKp
         4Rlg==
X-Gm-Message-State: AOAM531nuWiPZzUSR1LK13fxlT+Bgy16q+37YcpeXUO9rQDu2MF+A8Y9
	Mi2WOV+CpGdlRZoP5m9EUTwUVHBgCxRc4HYnSgs=
X-Google-Smtp-Source: ABdhPJxbT1z3+Mnx3vk9dlt0up99/mm5hC894qQcI1SWUAYLychdmADS5CkjainOxXYT4XihscKidw==
X-Received: by 2002:aa7:d410:: with SMTP id z16mr3541631edq.287.1598028985765;
        Fri, 21 Aug 2020 09:56:25 -0700 (PDT)
Return-Path: <bjarne.michelsen@gmail.com>
Received: from bjarne-ThinkPad-X1-Extreme-2nd.fritz.box (ip5b402d63.dynamic.kabel-deutschland.de. [91.64.45.99])
        by smtp.gmail.com with ESMTPSA id o22sm1389088edt.85.2020.08.21.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 09:56:24 -0700 (PDT)
From: "Bjarne Michelsen" <bjarne_michelsen@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Subject: [PATCH] asio: extend recipe to add native support
Date: Fri, 21 Aug 2020 18:56:14 +0200
Message-Id: <20200821165614.52984-1-bjarne_michelsen@hotmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Native support is not required by anything in oe-core, but may be useful
for some project specfic use cases.

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
---
 meta-oe/recipes-support/asio/asio_1.16.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/asio/asio_1.16.1.bb b/meta-oe/recipes-support/asio/asio_1.16.1.bb
index f381d12fb..11b9730c9 100644
--- a/meta-oe/recipes-support/asio/asio_1.16.1.bb
+++ b/meta-oe/recipes-support/asio/asio_1.16.1.bb
@@ -25,3 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 PACKAGECONFIG ??= "boost"
 
 PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
+
+EXTRA_OECONF_append_class-native += "--with-boost=${STAGING_LIBDIR_NATIVE}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

