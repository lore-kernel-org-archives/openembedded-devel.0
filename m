Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.230.1617899790542200733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hCP4j5ex;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id x207so2821763oif.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kp8f1m4ZvozgKqoTZKM2C9Ry57GaSpDavkDOUbyUvG4=;
        b=hCP4j5exJLfyPF+xxIflleOSXBmsANZczdeaWFCGXQi/HqOvy4nxPT9juVLYS7ZZZz
         EV0RqxofjAgJ2FGYVGZAywzw2R+XLiCIdZS5NzA7Jt+Hf7b/qfBWoAIC+mQqHn/WEyYH
         dWB+525ZOouK3eKi9U0K713zD5uHeF6SekBKSg7TkAuuBnJjKkvkjBoD6OPGfY24gBAu
         NDrb0ciqkUpAVXAjmO63pPpK0O135nIpDi4wwXm0HgLpjF8MTyym1WLwQF2r2hiCLQiX
         ZzGaQnVxyU4/YwBaMZp8asUiIXfeiBqH5VApJLOKABUOIupYUCy50EECOH5Dbszvul/f
         vqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kp8f1m4ZvozgKqoTZKM2C9Ry57GaSpDavkDOUbyUvG4=;
        b=orrPPScGPX9kKwVvVnejha9L4wq9St3E1X+MTN37n2CXRCwQkXR85VQTygDgXzTqpx
         zVuS8sHDg8PfYUi7yxKiP1cyJ4JVdKz3/ZdFLY7ee1no5cNWOGmw+Wi/flKUfo69yZHm
         wgtcTXaumO7RhUDLYiF7i6B3eUU0z3uDeTScqAI1lkJ8ETjhAeqM/qchZMpcgZcXDc7E
         L+xyYvgj/6t0HZfiGeJR0Td3cx1dwtqvu8OWJiYUksN0rtGrfgR63vPnlFZPqMRAob7G
         klczeQLHBQEOUB6jtXgNN5cKWuEtdswgf/cf801kJCWzg7i7GBRzLw5yokcw3dsmlLO8
         7bSA==
X-Gm-Message-State: AOAM5332E2iYIFaP2iG/U12FOyHd4VPcwnpNdC5ftYHmgWJsgtDeETDe
	++E4JK6KSLJazyaPLszDcCBz8jdbheI=
X-Google-Smtp-Source: ABdhPJx8q5XdgRn4hBn5K7rINVaMg4iPOy2PYjJNiceFXXZw3Lk7xm33qJdnZut7jXhNg06qywK63w==
X-Received: by 2002:aca:4f51:: with SMTP id d78mr623398oib.106.1617899789766;
        Thu, 08 Apr 2021 09:36:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:29 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 18/64] python3-matplotlib: Upgrade 3.3.4 -> 3.4.1
Date: Thu,  8 Apr 2021 09:35:25 -0700
Message-Id: <cc73b987551feed0e142fafc69c701eec01daca3.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to relase 3.4.1:

- fix errorbar when specifying fillstyle
- fix Inkscape cleanup at exit on Windows for tests
- fix legends of colour-mapped scatter plots
- fix positioning of annotation fancy arrows
- fix size and color rendering for 3D scatter plots
- fix suptitle manual positioning when using constrained layout
- respect antialiasing settings in cairo backends as well

License-Update: Adjust setup.py line for to check the license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit ba370b99afeac30ad1e8e02cde73b91a4b6cc525)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...thon3-matplotlib_3.3.4.bb => python3-matplotlib_3.4.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.4.bb => python3-matplotlib_3.4.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb
index a4df9a6fe60..21c29aa2ce3 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=273;endline=273;md5=e0ef37de7122ce842bcd1fb54482b353 \
+    file://setup.py;beginline=282;endline=282;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 DEPENDS = "\
@@ -19,8 +19,7 @@ DEPENDS = "\
     python3-certifi-native \
 "
 
-SRC_URI[md5sum] = "0b48f34ec623e765a1bda15924ce0b56"
-SRC_URI[sha256sum] = "3e477db76c22929e4c6876c44f88d790aacdf3c3f8f3a90cb1975c0bf37825b0"
+SRC_URI[sha256sum] = "84d4c4f650f356678a5d658a43ca21a41fca13f9b8b00169c0b76e6a6a948908"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.17.1

