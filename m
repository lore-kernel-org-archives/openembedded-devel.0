Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.8627.1586006953472222879
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id m2so10392487otr.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8N/2R6no8dhPOjoULvDxCz0Eog+BLhvMsWr3WrmgKXA=;
        b=Gkb3nkuM/yDCofisc96YMWuEo5tR09GQhz0PdMxgY3TyFNFeE0B8hrjj/R6/VDdpZn
         v0p5WIDC/segajwY7i1taaw3QXcM75/L6EZWq052dj+x+9YePkQNo+UKK1455xNnrDzS
         TJCA6X721e3OMdx+Pkbh4UbVnI0Ys1PYz0co1FYprpx2ZcL3y/2BAJ56Izx1kNyGU0wr
         dbGREOGu80m3n/aT6Yy+xAAvEjxQvsIwwca5GuQKpMH34kY2V42it847Ha4N8XtLBHFi
         vvzpI71Aaj8O16wiMbGSlOjGiR2OGZqJ6Ybti7kz6Ku/5mCabDBi0OehRkFEz2/sN89D
         3uJQ==
X-Gm-Message-State: AGi0PubAG91iLfk6T9UNK2IVQMvfCAAACVO76P69oB5JFeu+BzfxC0f+
	K6wikQj9gnlrumrfnHbhTubXbpKGtZU=
X-Google-Smtp-Source: APiQypKb3SAB/2WczlkRo8sYzmz5eS30y4hYXda26rpoudwBt1VgOYY2RwX3PiJJWUqQi7TAF8wKBw==
X-Received: by 2002:a9d:340b:: with SMTP id v11mr10306324otb.14.1586006952546;
        Sat, 04 Apr 2020 06:29:12 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:11 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/11] python-versiontools: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:39 -0400
Message-Id: <20200404132846.16832-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-versiontools.inc  | 10 ----------
 .../python/python3-versiontools_1.9.1.bb             | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-versiontools.inc

diff --git a/meta-python/recipes-devtools/python/python-versiontools.inc b/meta-python/recipes-devtools/python/python-versiontools.inc
deleted file mode 100644
index b0e696f9c3..0000000000
--- a/meta-python/recipes-devtools/python/python-versiontools.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Smart replacement for plain tuple used in __version__"
-SECTION = "devel/python"
-HOMEPAGE = "https://launchpad.net/versiontools"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=20;md5=02193721a38fd8a05a4ddeb7df8e294d"
-
-inherit pypi
-
-SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
-SRC_URI[sha256sum] = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"
diff --git a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
index e8d6b7ddaf..cf0fa30a32 100644
--- a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
@@ -1,2 +1,10 @@
-inherit setuptools3
-require python-versiontools.inc
+SUMMARY = "Smart replacement for plain tuple used in __version__"
+SECTION = "devel/python"
+HOMEPAGE = "https://launchpad.net/versiontools"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=20;md5=02193721a38fd8a05a4ddeb7df8e294d"
+
+SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
+SRC_URI[sha256sum] = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"
+
+inherit pypi setuptools3
-- 
2.17.1

