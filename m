Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.12374.1612990560682259109
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PQFjKnO7;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id y134so3142156wmd.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f1AhTNRKiA2h6/biTI0lWzf4vnrGU6Rht1Udwohp+I4=;
        b=PQFjKnO7K24YuYEE2UXge4Toxiamb+hEB8Z2PpHYzW7HissjBLcYsE401vIL8CZTaz
         PV2wrzQAE8KIgMVgfg/sQ10AgaJ5jJzpKKMKGuzAg3gUBzFuG69/NZpBO9ttrWzDvnVv
         6neGKDqdHvQR13E00wnZzZfDg09SmhbXi0hpszdg1GInYnr6N05uzWvGXoN7UmseVCIR
         pNzVzQ602cMpN1LaOx3/p7sxJ3cyZF3bwjwowP/95QIeJ+vTwn60IrgpHvSDvy3FFs7F
         B51dufyTE+1Q/ULKh9v8aalVcM/XeGG971qoWl/bX63jIyBMvV3xprFYNqaZ8BKc//Me
         pP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1AhTNRKiA2h6/biTI0lWzf4vnrGU6Rht1Udwohp+I4=;
        b=VYGFkxXu3f0W8WP11osE6ijJsIhWAdh2akrbct3BtM9e3vix48dKQUaDFyzXakuZm/
         sz5s838YMesiF7LB8UR/SWUwtOiZImIxmU/aUatoEu7Nr9bmcz7E25uVFwxdRyp+4YRh
         RYStumrMISTzr5vV+V0dYZ80JgwlVeDb2BcCYJIUaqku+KrLwUPurmiz1N2T8v0DdcSD
         XGOz32eHCA8VAKK+qU6gPZrNPZUAd4YOcbG04jdz8pVR1q4sR+J7b8RGVzVV8xnUCNoy
         gAfdpfTTh4+d3z+7pVzwmSIg58ouq4hCPTHGaoB4dfqTVkopjQv2rP9E+rP+Eh6BJTSq
         /Buw==
X-Gm-Message-State: AOAM530dCe8T+WbS5Q18Hxc+QByThRz4t4/PBlmEuuAECUBjh+93K3wh
	j2HYE8eQsjy8oIFbEdNdUa2rR1mugxs=
X-Google-Smtp-Source: ABdhPJzuB8ptyE6V9KsdhzfPXo7UH5YtOK94U1hGBWbAEflhfWFwW2Yk2VE0Hx0nU904lBZv8WcMTQ==
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr878064wmj.1.1612990559367;
        Wed, 10 Feb 2021 12:55:59 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:58 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/13] pangomm4: initial add 2.48.0
Date: Wed, 10 Feb 2021 21:55:36 +0100
Message-Id: <20210210205538.690009-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-graphics/pango/pangomm4_2.48.0.bb | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/pango/pangomm4_2.48.0.bb

diff --git a/meta-oe/recipes-graphics/pango/pangomm4_2.48.0.bb b/meta-oe/recipes-graphics/pango/pangomm4_2.48.0.bb
new file mode 100644
index 000000000..9ecbeb25b
--- /dev/null
+++ b/meta-oe/recipes-graphics/pango/pangomm4_2.48.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "C++ bindings for the pango library"
+SECTION = "libs"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "mm-common cairomm3 glibmm3 pango"
+
+BPN = "pangomm"
+
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
+SRC_URI[sha256sum] = "9e0ed474c33f8c2002ca9e2b61ca0d1f3d8e409e09e99f4d8c19eeafccf55b78"
+
+inherit features_check meson pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+EXTRA_OECONF = " --disable-documentation "
+
+FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${libdir}/*/include/ ${libdir}/pangomm-*/"
+
-- 
2.26.2

