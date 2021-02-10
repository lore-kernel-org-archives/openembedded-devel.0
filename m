Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.229.1612992165139483466
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 13:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=EpVolXfL;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id b16so4772097lji.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 13:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RAJCr7g6X+kMDKUJwi5G7mRAeiQQfJYcIhyezRs8R6Q=;
        b=EpVolXfLOPINzQMg68kgnKGm+g9uVwhnBiM/28YC0xF1CId0MwebE/ZTg89+8a6kU1
         MDjSjIBTs97+r3bSh4tke4N+edSEfWjh9WIRvRVaKSm2889m9gnS7gCG/KESXbh769xt
         Z7kNfSy7FnzcwfgOBkgLfTZE/yXQWfPtRoeFKVJpNEd57jbV6WrdWtVAhWuj1AOBtDzj
         WKa0IQUOi7dJcaxGKm8ZO+h2144ZjKo0wdmUe+HF8/w9fh8Ekga9eV3Q2cWVzhJQTtSg
         o3/Vm1AVnYKPc1+uwxCda6lqQdWhuq+ZqYxRLfhaczNiAYkC5aRZILTfb+4bFUr7tTOh
         qq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RAJCr7g6X+kMDKUJwi5G7mRAeiQQfJYcIhyezRs8R6Q=;
        b=KyidCICvahBO4nP+V/+ZPFWxZ841v94V0Q1e8jx5GbJgf6jSAALh3qh5jzBEWApgTV
         5J1QabYxD8EKTIA3AX8yFikXO/hltnjbz6sYckoRpxW0tOWobZVnMPWv7d6OpaDcdvIo
         0OuI4Wk0Asj8lZG0mZ+ecu6lewHTzLFljhcCijejkerK4YrTRERep/zsaIUloxxGRvuf
         VpWdj64+fdRJs9mvjnRe2fyUzWTv0HvFIHuDnQkN5oO+V7KC3HE8oXVlnIm4DNyNJ9zM
         BdmmedD2a4YPujXqROk/eix2JrfqT6YxaO5Mtyka47dV6YVZiaFGdDrZjVF9ciRWtxu0
         KbZw==
X-Gm-Message-State: AOAM5332Mz6g3e0B00hhVO/UbpVxKejjS1+XS9yFXRwmV9mZcm2DKy4M
	T7PyokyjxPHyo/wwRlivTUPGKw+SYW6FPqmm
X-Google-Smtp-Source: ABdhPJxwLFT5FuWjwv0He9e7xJS1ELJGkS7t8FFN/+wqvRfMra382tjK/pZVTqoFyUO3UTry+lMHuA==
X-Received: by 2002:a2e:9998:: with SMTP id w24mr2985278lji.334.1612992162922;
        Wed, 10 Feb 2021 13:22:42 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id y23sm455808lfe.179.2021.02.10.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 13:22:42 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] wireshark: update to 3.4.3
Date: Wed, 10 Feb 2021 22:22:40 +0100
Message-Id: <20210210212240.1644220-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wireshark/{wireshark_3.2.10.bb => wireshark_3.4.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.10.bb => wireshark_3.4.3.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb
index d28482414..1c470d8bc 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.3.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native"
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares"
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "1e9e239f2449f240a7910ed598084ccaf8ea308b2b46b196c5adbec59612226c"
+SRC_URI[sha256sum] = "f467cc77f0fc73fce0b854cdbc292f132d4879fca69d417eccad5f967fbf262b"
 
 PE = "1"
 
-- 
2.25.1

