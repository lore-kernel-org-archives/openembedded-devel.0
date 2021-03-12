Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.414.1615572502619576413
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 10:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iIh954Ne;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id 61so2269124wrm.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 10:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kASeKgI/buWUCTStGytWAKDWBcOgyghvRMNW4HUIOn4=;
        b=iIh954NexZtyQeIOyiqxo0JhzcZZ+Uwe1/nk3RRLuODELx30IZuIC91muptL6XjiIe
         XeTASztyIBkrtaGC0CaUEl0jsdgD9eOWoQItQUkr6y9JV+f1TmZ+FNUIu8CO+fLMYYv6
         QmgMstjFkNkUJp8Z4j7K1W2T67Ins4Jwk9MLSvT0Kxsce9Zvr5lnytn8NCjDpRHtNkuu
         OAWlUHMU9Gjz2349EB+HK4BW1CgG4ATEnXjtldFC7g1cvpyExjQwjmbzGgqO3Qj+zeCF
         3d11+IW/yW4B00kZytN7Xgu6r5+ftyb0CBcjreVJmfv+aqzSnJ/UUIHphcT5a5A3neWA
         pBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kASeKgI/buWUCTStGytWAKDWBcOgyghvRMNW4HUIOn4=;
        b=JTlXOoj78K1JgJsBL1Wb+Y7MQhi8ctt28q3A6UVHjCXXtvvjIblMBJSqnglRWmImS7
         /n7zKbYk07UbpOuthQ+UeQuRfknIESVHv8erjCAtc3lRKqojGleJvi3tGES0qaaGf7Dp
         QyA78dkOPIOH8cH73jQvSWw3S8Q/52FbUA2J0SNniPzcAzdvq8Cj+9YEfHhzFIEJ2hRJ
         ZgpoXiyU8iMyxx3SDBh5au4ot6Sk7+3nuLwSAefoIvxeB9IyJVI1xjOUZ1teGbJ2k7yF
         KPoPYffoqOLRrIfyymGLR9WEiyVZBFX+CWjFBWTKA56XIdylFMAKbMR0aOO59eix0BVd
         fzuQ==
X-Gm-Message-State: AOAM533u3QV6NtxHV572EU1GVnxr+WbFdPSicw+dFQj5I2vBZlLNT++S
	6U7abOlcwH7cK7Jp//aSABbOoJ9Fu0M=
X-Google-Smtp-Source: ABdhPJzRjhzT/i27WLIwgP/iBKxqFkauSqNFvYc2tuBKzxtSlH/QNUvhnKedAvVJg5yPsV8e9X1hZQ==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr15413634wrv.194.1615572500668;
        Fri, 12 Mar 2021 10:08:20 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id j4sm2783777wmo.10.2021.03.12.10.08.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 10:08:19 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cryptsetup: depend on new util-linux-uuid to break cycle
Date: Fri, 12 Mar 2021 18:08:17 +0000
Message-Id: <20210312180817.905756-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The util-linux recipe in Poky has been split, and libuuid is separate now:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d42487bf52310d095178e480b7ddec2666471009

This allows to build util-linux with cryptsetup, for native dm-verity
support.
The main cryptsetup build needs libuuid and not the full util-linux, so
switch the build-dependency over, thus allowing users to enable the
cryptsetup util-linux's PACKAGECONFIG.
The libblkid dependency is handled individually by the crypsetup's
PACKAGECONFIG option.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb
index b9a6b7179..f53bd8523 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
     json-c \
     libdevmapper \
     popt \
-    util-linux \
+    util-linux-uuid \
 "
 
 RDEPENDS_${PN} = " \
-- 
2.29.2

