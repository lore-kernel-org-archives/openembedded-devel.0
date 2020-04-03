Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.6961.1585948930912602220
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 22so8909348otf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/KF3i7joC+7ibIamm54uoX6Ljnlvv2hxWswFeuirAU0=;
        b=VrJV+gdl2gaESYLiDPMAAaJhgFn7SZEDODPeooKvK2e6VPLri8Vn28CGtgNWtIJvO0
         ocMcUPr481Dct2z3i0A5yQzNiEG+p6zzf26N8RPGu76Pv2ncB5XtwwxIlOSh4snPIw40
         V0rAa2vZN1JH8XpecnJFvEpqwae0uShgF36Az0RukcYsKNmjeO7q9q031cYpbgKT06aL
         D92wCywD/WucS9VoPVBnyfy9d7imxRkOS45sZpJcK2XU+UhOZ3eZQ2VxoAABNiLHwQhF
         dTgIir9flIHlu25LWEHExTwSZ/sN/2NaHpbMPiI55ltH3GWBwOpj3rOd0RuhG9UWUk1e
         P2KQ==
X-Gm-Message-State: AGi0PuZbO4Vspc1YXgkV+JYOLbZOxLv/UxveqTcsMAdaQ+2itQ7DnpVz
	xB4txcx8oj8zSptKhFbgJMONmkwZzF0=
X-Google-Smtp-Source: APiQypJJUntbbHjgqyYpAxf0HgyKjwh64VID/iVifwxvAD9yxYbJM5UY1it7FPt/S1Ne6j1Nt8K64A==
X-Received: by 2002:a05:6830:1f56:: with SMTP id u22mr8352612oth.55.1585948929704;
        Fri, 03 Apr 2020 14:22:09 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:08 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/10] python-xstatic-font-awesome: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:18 -0400
Message-Id: <20200403212120.23481-8-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-xstatic-font-awesome.inc      | 17 -----------------
 .../python3-xstatic-font-awesome_4.7.0.0.bb     | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc

diff --git a/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc b/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
deleted file mode 100644
index d13cb83f6e..0000000000
--- a/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
-
-PYPI_PACKAGE = "XStatic-Font-Awesome"
-
-inherit pypi
-
-SRC_URI[md5sum] = "141a0e9a7e21e82f922573a00ae0c166"
-SRC_URI[sha256sum] = "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c"
-
-DEPENDS += " \
-        ${PYTHON_PN}-xstatic \
-        ${PYTHON_PN}-pip \
-        "
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
index 639f80de91..b45e96d387 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
@@ -1,2 +1,17 @@
+DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
+
+PYPI_PACKAGE = "XStatic-Font-Awesome"
+
+SRC_URI[md5sum] = "141a0e9a7e21e82f922573a00ae0c166"
+SRC_URI[sha256sum] = "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c"
+
+DEPENDS += " \
+    ${PYTHON_PN}-xstatic \
+    ${PYTHON_PN}-pip \
+"
+
 inherit pypi setuptools3
-require python-xstatic-font-awesome.inc
-- 
2.17.1

