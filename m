Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.9312.1599640974826201531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=WPx1NXRO;
 spf=pass (domain: blade-group.com, ip: 209.85.221.52, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f52.google.com with SMTP id a17so1994922wrn.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cMzwGlvH0fuJ7wTjzajG+ctlqgYkjUUgnPxjVWpQSdc=;
        b=WPx1NXROe8O9W62OomMbwXZy5Q78XJM4K2OZQiroKnEBhwY3ua911EsBMxbOvAt1Jy
         CnNBHahNxbFUiQ0eZwm0SByvtmH3bAZafnkRscCHKEZO+KOO/4mTz/dhkhIFl2q1ub3z
         4BAdDYqrCUrj0610/C9ZzKzrZYbNLlUm1q/KuP3swFgzwTGZC5EYHAF1s0Wl3srJtwF+
         5SAIKiHI947kJ7R2tJNvXNd8nlHMyUiLq/3fe80pKHDNmoG2gKE+rVYarzTYe1LKjc+S
         SQRl06o1RzQHB5UGNa2Ym3yKL5bWkrYB4jZXiLmS00dEZoIlcrUob0Z2jPWyvHbABYwb
         d/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cMzwGlvH0fuJ7wTjzajG+ctlqgYkjUUgnPxjVWpQSdc=;
        b=YUd8YoojjFy2Av/zJypfEkPK3SUvd9bzqtiG6CjwbXMY/gEtlVlEQdl4+ZEO0dxCsB
         FLSKGUGN9FR5owkPF8XYPHyIiGUWqYlubGbOjedINa0rQjd0fXHrZksBDNuZYIZiwTRs
         MLajJ1PfjKco7VIMjK1KquXBEeVPVmUwZ6BIvRsnauueca/61oKNE5o3GzdlzeP0F4jK
         GRz/RR9YznRnYN3AFBiS7AADiE+OE4K/zUPBgeEh/u5GMmiLXJW42XUkJTe8Xv9bILQY
         2f4fTEUqghC2fkiq10ugTt9qI34yrJWuHTed4W45lRI3P1JWqIbUlYQilSCCvsTRnJ9S
         1U0w==
X-Gm-Message-State: AOAM533qX0I/ftYvWclpcB6ME/MK6XP0FYYcYQ9NtHcZZhWWeka1Y8zQ
	WzwJTiRGpLljDo5l5W5gBMrToJws/1wY1Hp5
X-Google-Smtp-Source: ABdhPJzOcE5ShlgZ2gMSRj0bHrsGb1MyKmKqeYqxAICBkTSf/LWSjxT7/9re9Jaraz6t+LqiItcDAg==
X-Received: by 2002:a5d:5150:: with SMTP id u16mr2694916wrt.197.1599640972998;
        Wed, 09 Sep 2020 01:42:52 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id o4sm3027825wrv.86.2020.09.09.01.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:42:52 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch 3/4] libcec: rename libcec-tools to libcec-examples
Date: Wed,  9 Sep 2020 10:41:53 +0200
Message-Id: <20200909084154.178795-4-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909084154.178795-1-yann@blade-group.com>
References: <20200909084154.178795-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Those are really not general-usage tools, just examples of the API usage.
Let's use a more explicit package name.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-extended/libcec/libcec_6.0.2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index 94d967f4c..f55801c39 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -24,10 +24,10 @@ inherit cmake pkgconfig
 PLATFORM_CMAKE_FLAGS ?= "-DHAVE_LINUX_API=1 -DHAVE_RPI_API=0"
 EXTRA_OECMAKE += "${PLATFORM_CMAKE_FLAGS}"
 
-# Put client tools into a separate package
-PACKAGE_BEFORE_PN += "${PN}-tools"
-FILES_${PN}-tools = "${bindir}"
-RDEPENDS_${PN}-tools = "python3-${BPN} python3-core"
+# Put client examples into a separate package
+PACKAGE_BEFORE_PN += "${PN}-examples"
+FILES_${PN}-examples = "${bindir}"
+RDEPENDS_${PN}-examples = "python3-${BPN} python3-core"
 
 # Create the wrapper for python3
 PACKAGES += "python3-${BPN}"
-- 
2.28.0

