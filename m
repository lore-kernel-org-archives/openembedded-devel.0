Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825E5C636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 11:12:49 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.8230.1675422767485876087
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Feb 2023 03:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hItJmlCg;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: skulkarni@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id t17so3325660pfj.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 03:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3ggH/sEN69s9zX/vZduPLubpr0q8cqIWMawiClVoMo=;
        b=hItJmlCgNP2Jv77FWpQX7Z6pqJW1Cqqo1ckkIdY4mMO2TI8smnAIcK9o5Fz5c+9aF4
         dSy/BdlKjnVbmz/cEbHHOFDSC9xdUFNVLYc7DyXcjIsDFgvPM0NK5muogum6yt0oziQd
         SkbYVgBWuoGpkXaZYdhNSl+8oAmfDSPh4hfHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3ggH/sEN69s9zX/vZduPLubpr0q8cqIWMawiClVoMo=;
        b=dkgOmxi63FjdIglGdxxlJpDKUBUhfSdeYYHMtovhk2RAP1kLA4I0bRx592cxqbvLHv
         p/VyEh3/UUVaL9v2vkBCdOg/yi9s6GvPBG6vJ71mWy9IX/pHo/5IF06Mma46OU2zBtrd
         hPQf+c9JLOMRteq9MWN6ByZmv9+O7ZlJBdK8QHcYdz2eMaEdsDhSfRGKMmHC9fHGSKj5
         zBf/j0l95pdzKV9azrZaqatGGEJDTV33vyXdSlnzfKYpq//fxdvloZmsrCV+OxjYaNXb
         AiwKCKNzrGLhRgZMVJ2nSoLeUjWtuku7VaoBww+2xXrqCNUeZ8zU0ZNjUyi0ExNiu+2K
         iIFQ==
X-Gm-Message-State: AO0yUKXc1tDTD+0msM8SGHl8TgXrw882BFSivPzE4j35ZzkuUib4NgTp
	CbOwcbLKWAlvqOwiNYQ50gY9oSomZYXYI77y
X-Google-Smtp-Source: AK7set9qjAr1f23Hk1c8iC5LmdPg/dP9Gkc5NhhXc6badpHhHEdLxRDRdYF8h1rAmOGB4AK9Sir+hw==
X-Received: by 2002:a62:db41:0:b0:592:613d:ef17 with SMTP id f62-20020a62db41000000b00592613def17mr3941095pfg.30.1675422766158;
        Fri, 03 Feb 2023 03:12:46 -0800 (PST)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id i23-20020aa79097000000b005941bb94491sm1459460pfa.4.2023.02.03.03.12.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2023 03:12:45 -0800 (PST)
From: Shubham Kulkarni <skulkarni@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [oe] [meta-python][dunfell][PATCH] python3-pillow: Security fix for CVE-2022-45198
Date: Fri,  3 Feb 2023 16:42:09 +0530
Message-Id: <1675422729-20290-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 11:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100924

Fix for CVE-2022-45198: Improper Handling of Highly Compressed GIF Data
Backport from https://github.com/python-pillow/Pillow/commit/884437f8a2b953a0abd2a3b130a87fcfb438092e

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 .../python3-pillow/0001-CVE-2022-45198.patch       | 26 ++++++++++++++++++++++
 .../python/python3-pillow_6.2.1.bb                 |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-CVE-2022-45198.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-CVE-2022-45198.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-CVE-2022-45198.patch
new file mode 100644
index 0000000..0f0cfa7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-CVE-2022-45198.patch
@@ -0,0 +1,26 @@
+From 7df88fc2319852ace202a650703d631200080e3b Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Thu, 30 Jun 2022 12:47:35 +1000
+Subject: [PATCH] Added GIF decompression bomb check
+
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/884437f8a2b953a0abd2a3b130a87fcfb438092e]
+CVE: CVE-2022-45198
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/PIL/GifImagePlugin.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/PIL/GifImagePlugin.py b/src/PIL/GifImagePlugin.py
+index 9d8e96f..c477fdd 100644
+--- a/src/PIL/GifImagePlugin.py
++++ b/src/PIL/GifImagePlugin.py
+@@ -238,6 +238,7 @@ class GifImageFile(ImageFile.ImageFile):
+                 x1, y1 = x0 + i16(s[4:]), y0 + i16(s[6:])
+                 if x1 > self.size[0] or y1 > self.size[1]:
+                     self._size = max(x1, self.size[0]), max(y1, self.size[1])
++                    Image._decompression_bomb_check(self._size)
+                 self.dispose_extent = x0, y0, x1, y1
+                 flags = i8(s[8])
+
+--
+2.7.4
diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
index 80b7e94..35330ca 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.2.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
+           file://0001-CVE-2022-45198.patch \
 "
 SRCREV ?= "6e0f07bbe38def22d36ee176b2efd9ea74b453a6"
 
-- 
2.7.4


