Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.18205.1590941815558971868
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HeUZT32G;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id r10so2358744pgv.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XOs/8eO5BbvJhP53q0rArVlUeyzXk8iCcfbEFZiLsDI=;
        b=HeUZT32G7pKutqwMnpVvP7i8g2xw+OhqBPOQhrtyqSVV8U1d9BiP8LJ9Jn3Q/ZOVqs
         hHZMWxaDhx67/2q+Tqx5O61ipTJBk/c8/hRsZS1JvjbCk5O3/TmLTbzHkGBbgRbnbvID
         sGTiH/zbUXLmd8fZ3DoJhsOpui40reYUH91NseNKcfe/uoEl+6eznObvXS8CCJOj8loe
         I+65ourf+56gD5aQF4hIrL22NZgbYq8UtU60n+/rEW4bExDbvwYKHxpBFqK4961KUVoe
         qJ7snIabFb8eN+cbKQA0F11ZiJQ2W/GPndanpePKkilwHvKymeCNAF3u6SFZ1ucA48Ft
         arUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XOs/8eO5BbvJhP53q0rArVlUeyzXk8iCcfbEFZiLsDI=;
        b=F4vYNJTWVB2kUWvL31BzvhrLuV/dQfyTMR6xrwKFeJzB1GpDN0W2IMkZWxRYu9+5zs
         1zrMjPWi/ZgVwfARIOeqHbJlVV4XIh9epbItfBsbc5EiRoQ7T6UZB6iYxHZmpPxziZtW
         Qqf2IwQyOeL+ytIwL1L687Qz218qesvEVSA/gDKqsjxw1oO4fZLLY3gSBTdxyyVGhMJe
         Wc2qAOmQObr14Dmx2mpUWzHCWFqUeY9U/LhciiOW162EE1Ozeo/LFXYD5F+J7iLYgVqF
         isxO9bX65LGmVYIsNly5sGlfoELCue2PDiYfcqGtCejyOd9kvZ/gveJ/E4iSnWHQa/LY
         3Ivw==
X-Gm-Message-State: AOAM5324nY9LPZicdkyXp90YIfMVInrDzm/MUUc2CKbn7KHbYSXo/Les
	A7sKaCFrDyyajF9USOuPmmD+1xKi
X-Google-Smtp-Source: ABdhPJymRNac+RB+kgawfGb7MjoJtfG2te44B7PYA6cvk96xxn9aUXiO4VMvbr4/NAMRpA1IjYOG6w==
X-Received: by 2002:a65:6247:: with SMTP id q7mr8554646pgv.353.1590941814882;
        Sun, 31 May 2020 09:16:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:54 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 25/35] python3-pandas: Upgrade 1.0.1 -> 1.0.3
Date: Sun, 31 May 2020 09:16:12 -0700
Message-Id: <cea2919b2f002e0c9e1ba98337498ed767317c4b.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.0.3 and consolidate into a single file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9b1a1c270ae43d06e1399cdda6f81c062e78b690)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb | 2 --
 .../python/{python-pandas.inc => python3-pandas_1.0.3.bb}   | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
 rename meta-python/recipes-devtools/python/{python-pandas.inc => python3-pandas_1.0.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
deleted file mode 100644
index b5dd5e0924..0000000000
--- a/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-pandas.inc
diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python-pandas.inc
rename to meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
index 9342cedfbc..099e035e14 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
@@ -6,10 +6,10 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "628ffa1dd5768e0be70236596cee8d6b"
-SRC_URI[sha256sum] = "3c07765308f091d81b6735d4f2242bb43c332cc3461cae60543df6b10967fe27"
+SRC_URI[md5sum] = "a3ea90326c5b55944d369bef87740a72"
+SRC_URI[sha256sum] = "32f42e322fb903d0e189a4c10b75ba70d90958cc4f66a1781ed027f1a1d14586"
 
-inherit pypi
+inherit pypi setuptools3
 
 DEPENDS += " \
     ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
-- 
2.17.1

