Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.24529.1612725019143868849
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b8JJ79QY;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id lw17so8370713pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O+Ymr/8+GYxEI2d0iKgTesN2TU0Hz6zw+1aRn7T8seg=;
        b=b8JJ79QY0+Cd2uOPB/ODt/5v5jmTQe0RcMxrQl2H0NMH0NPwhlHT3g+dJpGuTGoqlx
         eGAQgDxNPjCZxsfXww9US+TsiTXOFAL8MPsZXjN7jnyA/Ny5xYvjUr0QPuc9IW+0FFuG
         rKdkmajImaz1DjHzv5YwbQCwhjl/QuWsQd6+q612FWuQnk8jhsQ5jZ8KXRfd9NdIRmDw
         jE9/B3Bv/rUkSL7z2HJlRLgAeILgKOPO6hKVUGM+EsT+H4SIy4XlKhr0ENTzGksZ1Qh3
         3NhBBh8vBRVvaEsn795M29T1lCqVVlfDWT0e6rJNz3231mXLkFTbDC9Qeg4Hbmhm+lZy
         yrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O+Ymr/8+GYxEI2d0iKgTesN2TU0Hz6zw+1aRn7T8seg=;
        b=Ky8pcy7dvWwVA+EbW2nAN3K/hPvliQmnKY+hj2BItagdwJbTJx2GSxWXmexa/SYIb/
         VND1wSD3XD3bYiQ5/U0/ZhdlhASVin/Wx2DAaGVYl+oWmHXIePvd9q2ZcoMctZv6AOEP
         nVHj61LvZclmNBEWJRu9Tcfg8zgYMwsxSMqmug2ktVLezQM9ajdzScHsH30ZxuqSAnkO
         ZkPmx0wTHhXJWqNmmhvzcdFgZINGQv+wrGdUylF2Cg+tuvG187GxNewWqdqiFafYbt4A
         SZf9XU43m+skkwMk483SeIFCH6qpUUQ656dkTbKGgpKwBoXphl56WobTtglVeVdbncxI
         4oCw==
X-Gm-Message-State: AOAM531o/rX2L2gfLpmN2z+IYuGAvg3PhnqhdTFKxAxB8bbPh4N/x1NG
	pXR9gvJQ8uF3Z4hLl9iEevkrgm5hfu3NrQ==
X-Google-Smtp-Source: ABdhPJzoWUZErTa39V4lT8K/maJc1thV37dVba4yueFT1n2FwdO115h50Ktgysr/sr+MBiky3/MVhw==
X-Received: by 2002:a17:90a:fa2:: with SMTP id 31mr13171091pjz.57.1612725018540;
        Sun, 07 Feb 2021 11:10:18 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:18 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 07/10] giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT
Date: Sun,  7 Feb 2021 11:10:05 -0800
Message-Id: <4e6de3045c96fce9516311ba42911e209a1b84ba.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Backport upstream patch for CVE-2019-15133.
Set CVE_PRODUCT to "giflib_project:giflib" which is used
in NVD. https://nvd.nist.gov/vuln/detail/CVE-2019-15133

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../giflib/files/CVE-2019-15133.patch         | 23 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.1.4.bb   |  7 +++++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch

diff --git a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
new file mode 100644
index 0000000000..9957be82f3
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
@@ -0,0 +1,23 @@
+From 799eb6a3af8a3dd81e2429bf11a72a57e541f908 Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Sun, 17 Mar 2019 12:37:21 -0400
+Subject: [PATCH] Address SF bug #119: MemorySanitizer: FPE on unknown address
+
+---
+ dgif_lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-status: Backport [https://sourceforge.net/p/giflib/code/ci/799eb6a3af8a3dd81e2429bf11a72a57e541f908/]
+CVE: CVE-2019-15133
+
+--- a/lib/dgif_lib.c	2021-01-13 19:28:18.923493586 +0100
++++ b/lib/dgif_lib.c	2021-01-13 19:28:55.245863085 +0100
+@@ -1099,7 +1099,7 @@ DGifSlurp(GifFileType *GifFile)
+ 
+               sp = &GifFile->SavedImages[GifFile->ImageCount - 1];
+               /* Allocate memory for the image */
+-              if (sp->ImageDesc.Width < 0 && sp->ImageDesc.Height < 0 &&
++              if (sp->ImageDesc.Width <= 0 && sp->ImageDesc.Height <= 0 &&
+                       sp->ImageDesc.Width > (INT_MAX / sp->ImageDesc.Height)) {
+                   return GIF_ERROR;
+               }
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
index 21fa352cdc..1871bab46e 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
@@ -3,7 +3,12 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2 \
+    file://CVE-2019-15133.patch \
+"
+
+CVE_PRODUCT = "giflib_project:giflib"
 
 inherit autotools
 
-- 
2.17.1

