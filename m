Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.4354.1623220742554129576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ctHjkkt5;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id ho18so25690397ejc.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p7b8OrrXKzj2nNo/T38GdMiZBGRZ/iJU7vq8Gw2PUwo=;
        b=ctHjkkt5Vlqi5VezsE82am+EAx5W5Fc6Dr5SdRzoWcYBOl4hfrIREEgV4VxXpOHZd/
         tK2Mg6wVZrzHSl1AYC8oFFxYKbadmqxbsym85+PAUbE7FSPHXrNogt7py/Z4XlGISOkd
         zU1x0ZSvcrKoT4EQfB9zDuYdP9FSLhz4TUniNzV0qBgW2lEqgEu4ApATqXyc48ypqhx3
         iNXadIoPa2MmsRVNjsvSj0KJb3c311MFtUu2lrWe9UxJ84fDAvNLgC+oP4KF/Khq5/q1
         RF/YZWffaYbV2ZxYnPd8TerG7UW/UTVYQ9mCwzsmRMOD9bzrvAWZw1dnVFDE8mRsM6GO
         zbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7b8OrrXKzj2nNo/T38GdMiZBGRZ/iJU7vq8Gw2PUwo=;
        b=AAjkGIcQ2z/HFUKnvVzMVYaCTPrUU5Tuafnu+ebOTIBhxLk9tPBpEYYeDe9xTT6IVS
         76Not0nK+5dZadhPlrdQqbhX7Q5hZtLvknzWNNJbNq95QakPtooLV7pz4jEGpzgCyscq
         H0bvzRtEJy61Hx9ofZw+iGXh74Ri26NtBuMlesJqNp51+RMQ6gd+pcMMl/QjKBSK3ech
         H24LaC3m9hHon6C4ErSgZ9JxwLKmTWvAFBXugpzprIux+Inz71OJfAqY+KhrCP7xIQXf
         cfi/6ofHK0AreY3SxFCMZVqFyVoXgeWoL0oJWTCtL0bS4edS7H0uQsUK+Fdg5R9y9bNT
         EsXQ==
X-Gm-Message-State: AOAM531vGPPlE+88lietnc7T3o83CWEp+DQdq5PFhZRh/24ZMHK/Cvv8
	2b5hcvRTYAw/H8n52y7BFtA0JG9L1/sb+A==
X-Google-Smtp-Source: ABdhPJyBn6LnnLBpa9H5EJ88JtRVtecJfKv70vhwUEYPfVjESv3HitNkscyHWSI8oM9aHW7tWgOJwg==
X-Received: by 2002:a17:906:724b:: with SMTP id n11mr27413940ejk.338.1623220741113;
        Tue, 08 Jun 2021 23:39:01 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.39.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:39:00 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 24/28] yelp-tools: upgrade 3.32.2 -> 40.0
Date: Wed,  9 Jun 2021 08:38:27 +0200
Message-Id: <20210609063831.3400611-24-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../yelp/{yelp-tools_3.32.2.bb => yelp-tools_40.0.bb}     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp-tools_3.32.2.bb => yelp-tools_40.0.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb b/meta-gnome/recipes-gnome/yelp/yelp-tools_40.0.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb
rename to meta-gnome/recipes-gnome/yelp/yelp-tools_40.0.bb
index af2bab380..f58c9ee4d 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_40.0.bb
@@ -5,17 +5,19 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 "
 
+GNOMEBASEBUILDCLASS = "meson"
+
 inherit gnomebase itstool
 
 DEPENDS += " \
     libxslt-native \
     libxml2-native \
+    python3-lxml-native \
     yelp-xsl \
 "
 
-SRC_URI[archive.md5sum] = "7856f9ad0492aaf9adf097f5058bfc2e"
-SRC_URI[archive.sha256sum] = "183856b5ed0b0bb2c05dd1204af023946ed436943e35e789afb0295e5e71e8f9"
+SRC_URI[archive.sha256sum] = "664bacf2f3dd65ef00a43f79487351ab64a6c4c629c56ac0ceb1723c2eb66aae"
 
-RDEPENDS_${PN} += "yelp-xsl"
+RDEPENDS_${PN} += "python3-core yelp-xsl"
 
 BBCLASSEXTEND = "native"
-- 
2.31.1

