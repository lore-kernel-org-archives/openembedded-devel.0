Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.1584.1586020401013408851
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id a49so10741316otc.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7IvBF7TV8CckT+5UW/8gIsY5tTnWGtIojbUR3DoHYLo=;
        b=WajJtulZoUT6EU9uSbYGCtG2r8dbbSjADTC4G9xU2+//vdvhzm4ofjg+cwK67GMYlq
         EgSuoWJpppaw+JpEh6EGUXgHLD2wvUSUl5fx1RnH++L6Jsb+kezc5bH3KiMmwMAFS5Zf
         OttM+AqFx8q1mygr9zZFKSjylWufqJbyawn5HPOZxQIfp6Jty6yQn0SLdxPtEiqhrxzF
         RilQmBqHvD1NRebJSYlvsoR2yVlmBBIlRKBhXW91/SSUt38XM7rEX1g/ShvnChYWHibF
         Ml7atmjb2AdnhQPTheXXMnF8+MwhqFyvM9lNaNYmmAiMKKIkrAQHhz/ssFprZ+wmfN0g
         WCJw==
X-Gm-Message-State: AGi0PuaQeVXjBOswQ02G6nTXV2xmfhxRvxrSub0MM2trVDyvZpBJ3rig
	+MWDnWZ0TMfi+e0Q3iVCp6FIQxT7xxc=
X-Google-Smtp-Source: APiQypKzCHIUOfO1CSiMW8FKiw0I39agHEV4odQJuruLsjanARxFBMFGh8lHfd9HZOJKb+zfhrFLvQ==
X-Received: by 2002:a9d:7c88:: with SMTP id q8mr11589560otn.282.1586020400037;
        Sat, 04 Apr 2020 10:13:20 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:19 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 14/27] python-soupsieve: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:38 -0400
Message-Id: <20200404171251.19823-14-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-soupsieve.inc   | 12 ------------
 .../python/python3-soupsieve_1.9.4.bb              | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-soupsieve.inc

diff --git a/meta-python/recipes-devtools/python/python-soupsieve.inc b/meta-python/recipes-devtools/python/python-soupsieve.inc
deleted file mode 100644
index ccb04f4450..0000000000
--- a/meta-python/recipes-devtools/python/python-soupsieve.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "CSS selector library for python-beautifulsoup4"
-HOMEPAGE = "https://github.com/facelessuser/soupsieve"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
-
-SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
-SRC_URI[sha256sum] = "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
index 1b9663691f..df69e007f8 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
@@ -1,2 +1,12 @@
-inherit setuptools3
-require python-soupsieve.inc
+SUMMARY = "CSS selector library for python-beautifulsoup4"
+HOMEPAGE = "https://github.com/facelessuser/soupsieve"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
+
+SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
+SRC_URI[sha256sum] = "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

