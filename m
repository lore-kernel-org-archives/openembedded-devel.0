Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230B1ECAADE
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.33948.1661494315725500757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qke5wziI;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e19so720546pju.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=tYRKCpBRnRA5l3MmLO7u0Sus+tWrFc1ehPyk+RHtfaw=;
        b=qke5wziIsTHB7K2ollnCASnRuOFsGDCeRQiGuRdeWY4fdhheGp9Swch5IJE18Bkz2g
         +/6pH6/cZZDsjX/lvtrl9bhLfEQ2YXPrBdFF1rovwKyT1pxgvOER3TR2PdWr9A7Xel2k
         laLP1euAjAmpw5ImZ8nlPVAJQ9nUc8B5AyUNF/sbHuNaKW/wxBMvoBfGnwRyl35dZ+Ku
         PRtSOyXEP8Xs5i09D9N81LyRIfv9bwGTBQVZAUhNUskWq9V0MyVYF30JRltEeQIa87G2
         v7+5/BFk87E74L6fGyAmEeSNfnmz64ja6I7g8XfjOqr+4ab0sVyZDSDnvZVkCLEvOfhP
         Pvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=tYRKCpBRnRA5l3MmLO7u0Sus+tWrFc1ehPyk+RHtfaw=;
        b=SjQqdLboESwIi1r2HGiYiUb41+cpGAB6seEh1tNKWaCvPhxxFElrW3Kqb3sjMwtZly
         H39U1WETh/rmaDnOrpo8+aLQzw/L3jpihTOuB1xYnHhzJYTZnPcys1l2m4Dvc57LidWG
         EW1TgBjiu3Ou0Dbc3gwK0KTQbqUa0B/WxzvbH9FvwO0mBTGEBsyiylgIH9dois+IXJlQ
         70GT/9wv8ioDkhqbhV5A3PJqgLIv31PG8ZrOJ/9boAhasphUhJwgdKC5fLJamqcvmhmW
         UsMAYOoGQt0nlTPVJzp8aHaq6XhCMqLES3aRasMdlWFNxn8ACLkl16nWGMS7zYwQA+Dp
         ObiQ==
X-Gm-Message-State: ACgBeo3pjTHSp7QycLn3PRd5WZ6TCIkuWTt/R5ERu74WIEoKsOBTosOr
	GH7igHJ7X2T7QfElretVc6FOnVnO+Cqvqg==
X-Google-Smtp-Source: 
 AA6agR4j6HGWtS7A7AfnFNoEhm2xPMycpBoeH6aMtrurXEPx9cl3lImsB24DoKKUF+GY+oecYJSavA==
X-Received: by 2002:a17:90b:3b8a:b0:1f5:1df2:1fff with SMTP id
 pc10-20020a17090b3b8a00b001f51df21fffmr2705798pjb.169.1661494314938;
        Thu, 25 Aug 2022 23:11:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:11:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/9] gst-editing-services: Add recipe
Date: Thu, 25 Aug 2022 23:11:44 -0700
Message-Id: <20220826061150.3030485-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826061150.3030485-1-raj.khem@gmail.com>
References: <20220826061150.3030485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98466

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gst-editing-services_1.20.3.bb            | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.3.bb

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.3.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.3.bb
new file mode 100644
index 0000000000..d14869b06b
--- /dev/null
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.3.bb
@@ -0,0 +1,26 @@
+# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Gstreamer editing services"
+HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-editing-services/"
+
+LICENSE = "GPL-2.0-on-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d"
+
+DEPENDS = "flex-native gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad python3-pygobject"
+
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+GIR_MESON_OPTION = ""
+
+inherit meson pkgconfig upstream-version-is-even gobject-introspection features_check bash-completion
+
+EXTRA_OEMESON = "-Dvalidate=disabled"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
+SRC_URI[sha256sum] = "5fd896de69fbe24421eb6b0ff8d2f8b4c3cba3f3025ceacd302172f39a8abaa2"
+
+PACKAGES += "gst-validate-launcher libges"
+
+FILES:gst-validate-launcher = "${nonarch_libdir}/gst-validate-launcher ${datadir}/gstreamer-1.0/validate"
+FILES:libges = "${libdir}/gstreamer-1.0/*.so"
-- 
2.37.2


