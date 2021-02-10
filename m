Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.12035.1612990561447007853
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q7y5X0SZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id i9so3142579wmq.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iqLlCEMsAGoDsyuSs/PpxNBiCVCKq6MYA89KpU2HJrw=;
        b=Q7y5X0SZct+FBbKWzPZ0a17ePtI06f/We336FZUKlUH5ccxUlIp1mjYNXtLadqBPH7
         Wh8inRxJlhQ5r2VEvc5ZwqsTPHM/lS32WECg9LW2zlVJMqdbYi60Bwxalsy80uHvfmv/
         qOPy8GsmKltQDhULSa7GRY6wnc9Bj1vxeybeSZZm5ElsTM3Vy2hnE+Jo0xaLixQ4DIXZ
         dBQxlV98o6o10C1wGStQZPMgGc/GY2+Ta90UHyP/oQ5QadBzUHuYfXmmHHzOUllavxGS
         10HgjHkeIMJGuWSwJzMgDmu00nAlOyDynJK4gys96DbRfU0rtL3uU7qZs10GucXW0haJ
         8eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iqLlCEMsAGoDsyuSs/PpxNBiCVCKq6MYA89KpU2HJrw=;
        b=pQERETlogooc13MND09FvOsplEPMogaCPLjJfkxS5bccFHCrdFKp+OQnDWIB0OHwFS
         jKVQTdvBKFT4dtQNnmN6tIzeXq9hBp8G7Yc7K6A5kw+CulX3UkpvhmTm3YqKHlaSbsMS
         qnGCh+LlO4m6dvAzn0huZhBYN5bO2S2U2p84pTkWF0LVgAH+CnMRYsc7b6OCeyUtfI9O
         iDtE46VZ7Z88QvG6aDme/b4dwynC6y+QDeB809+9vjItLfqqS0k+zMS9mynu3aDAJedX
         G5KLi9b8Qt+caxqFYnmLVE8s10e82htyCkWzQBUG+I9Cnx02Y2Z4+LMRn8zM7Z4kTvXT
         A94g==
X-Gm-Message-State: AOAM531Uk0vKdZcdaOmKlBMLoprLB7YuIaO1f+o3HJBBoj6JvxTwk/7g
	gq97qpWXjbGcL9qmxkFIRwuL3DahOvg=
X-Google-Smtp-Source: ABdhPJyuI4aizwvvLlpQsWMC0/z+5fa7vH/O7kZ66Qy7fzzjm7RiJybghb9u8qo372H+18jVRwZH7A==
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr903720wmo.30.1612990560093;
        Wed, 10 Feb 2021 12:56:00 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:59 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/13] atkmm4: initial add 2.36.0
Date: Wed, 10 Feb 2021 21:55:37 +0100
Message-Id: <20210210205538.690009-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/atk/atkmm4_2.36.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/atk/atkmm4_2.36.0.bb

diff --git a/meta-oe/recipes-gnome/atk/atkmm4_2.36.0.bb b/meta-oe/recipes-gnome/atk/atkmm4_2.36.0.bb
new file mode 100644
index 000000000..8244b73e2
--- /dev/null
+++ b/meta-oe/recipes-gnome/atk/atkmm4_2.36.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "C++ bindings for the atk"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+BPN = "atkmm"
+
+DEPENDS = "atk glibmm3"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit features_check gnomebase
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.sha256sum] = "c93fa9f3876536391b54c307a923b7788e79796ace69a5e9141d67398c019973"
+
+FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.26.2

