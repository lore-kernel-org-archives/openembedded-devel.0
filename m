Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.60379.1606745364292714517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 06:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uwjq1b03;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id a3so25330088wmb.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Nov 2020 06:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mK4RpZ/zgXqwqv8HHjWWXEes5QCvx8tW14yhXxRgk1Q=;
        b=Uwjq1b03OwqsK+3qgrQ7sSjC9GKPzPmsyv00B5tg3hcB1HrmqazWgP0U1ueWmu6jdW
         D46fgMUf5SHs+guqSIRIL0EUSImyldvX29UG+3sa6Y/NE24vRHaXTwKi8PgS6P9ufrML
         YAuKcb16xEB1tA4KQ/Ct9ShgyWUSqQk1DooqN8hpIb6b0frW2l4vDVBkG6D+rnBcLS+D
         FDMEHIWtXQYtlUIIooa77vzbXT8NU74vDgpMtYadveGWcDi21rSfUq4jGf3KB8gQTtfA
         vFvMnr7Rpok8PG1/urJdWZd3A2QqyAsZUqgvb80ln2GUTsDW419i/XaGGOE21gW4dLVI
         i2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mK4RpZ/zgXqwqv8HHjWWXEes5QCvx8tW14yhXxRgk1Q=;
        b=eaWssnc6Gmck8JDpxhYjgWZ92wdVP/srF/vcHTdnxGy0xNw2BOs6IG1J09JCQzXnWm
         CO7CqlO5ktSm2ReZpeR/Ux5Gq59hQ25uCqC67XMvVtvVYCVWrOEnG90VPIlEubJ7mfXs
         uQDA2tLVFhKk7tDRuYNv0DAW4t32OLGlkDFm5iyaFbB8KX6d1v+rmG4WlggYn54QnKFF
         9tvS7n3uXck+JyjOXvl/jFcKdWPtJKKLHeR3cBEpaRDXK3d+ngxZL4tK2leZ6ZfnFdad
         vgQfEcm8VYnUSRDNN2FCZSVOfTq/iMFzvoFnJm2+4gM3ZU5VBwwgVygRh1RYAVw3x0/p
         DVFA==
X-Gm-Message-State: AOAM531bgPXJRb0FuUnAVEVC4dlwnsBzgh+bYRjux2GIL5SvfZSJ8D4+
	BMe4WC0tIdNvfrjjIeTXmnOE02ZdbQslVw==
X-Google-Smtp-Source: ABdhPJxxyQNihJOVWqn9U5CedknNiYn7Omvwn4xa4jeznItIuHxs3i8ev0yaRAHv4UoMk2eccnQwhA==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr5066909wmj.144.1606745352293;
        Mon, 30 Nov 2020 06:09:12 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id s25sm23384059wmh.16.2020.11.30.06.09.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 06:09:11 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] dbus-brocker: upgrade 23 -> 24
Date: Mon, 30 Nov 2020 14:09:07 +0000
Message-Id: <20201130140907.288760-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130140907.288760-1-luca.boccassi@gmail.com>
References: <20201130140907.288760-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

See full changelog https://github.com/bus1/dbus-broker/releases/tag/v24

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../recipes-core/dbus/{dbus-broker_23.bb => dbus-broker_24.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_23.bb => dbus-broker_24.bb} (92%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_23.bb b/meta-oe/recipes-core/dbus/dbus-broker_24.bb
similarity index 92%
rename from meta-oe/recipes-core/dbus/dbus-broker_23.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_24.bb
index 97b093843..1a32b26e8 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_23.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_24.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "95adfde56bce898c3b69eee0524732365e802348dd8189a35d5d00c30990dc81"
+SRC_URI[sha256sum] = "024b54678d67edcc72ffe65c17d2495211bd20f2430b07ef1d26fdc93b4305ac"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 
-- 
2.27.0

