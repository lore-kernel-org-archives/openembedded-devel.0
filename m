Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.6858.1585948925452421221
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id z5so8819362oth.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3MxrstL7qx0IetszV4pzHAMTZsSKZrvP041L7rfBGaI=;
        b=dMQgr6NKkvhc+qsY+9igtEWBivcZwmQpRXrxOL6qZ0piSHhZ3K4j+SU77Y955bOc1T
         DJX/k2d2dTQhW7hP6Wm9ViB44rLQcoc8i4SWC0VOeov9oZDhPn+8Ij+l2mI57qVoiie5
         cgqDxmRbklFJH1iFElqdVb+/lh36QSWLkOwDWCKvaCbbVvth+67OD/VzwZd+U+y8hAB9
         kQuc1IuWbe4kk4NPgPu+EZvWSd0hoEPeM4usqqFM+uZUYsyG91C+rgKksjZvBjcubBth
         PxOiT90PEPk56nPFVlqk7/Y5YzsBeBV9suZ7n90FKOBjVyqfZ5I3Wo1ihUOwndGf/kIM
         V/YQ==
X-Gm-Message-State: AGi0PuZcCxHewaK0bo+8jsjHjUbVuhya63gjE+d4x+DaTtXDrnVAIzB/
	xhmPqHhhFvpyAN96y/E0ytsiUJNMcZs=
X-Google-Smtp-Source: APiQypKK1ySodw6Bn4zKu5VRTL2ZgeH5G9l8V4J1Vdl2nRXA9cBoKNeueZePzYDeY4g3qWULK1tihQ==
X-Received: by 2002:a05:6830:17ca:: with SMTP id p10mr8346187ota.165.1585948924235;
        Fri, 03 Apr 2020 14:22:04 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:03 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/10] python-zipp: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:12 -0400
Message-Id: <20200403212120.23481-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-zipp.inc       | 12 ------------
 .../recipes-devtools/python/python3-zipp_0.6.0.bb | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-zipp.inc

diff --git a/meta-python/recipes-devtools/python/python-zipp.inc b/meta-python/recipes-devtools/python/python-zipp.inc
deleted file mode 100644
index 5f63852ad9..0000000000
--- a/meta-python/recipes-devtools/python/python-zipp.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Backport of pathlib-compatible object wrapper for zip files"
-HOMEPAGE = "https://github.com/jaraco/zipp"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
-
-SRC_URI[md5sum] = "d4451a749d8a7c3c392a9edd1864a937"
-SRC_URI[sha256sum] = "3718b1cbcd963c7d4c5511a8240812904164b7f381b647143a89d3b98f9bcd8e"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-more-itertools"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb b/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
index b78663fd61..1019081f38 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
@@ -1,2 +1,15 @@
+DESCRIPTION = "Backport of pathlib-compatible object wrapper for zip files"
+HOMEPAGE = "https://github.com/jaraco/zipp"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
+
+SRC_URI[md5sum] = "d4451a749d8a7c3c392a9edd1864a937"
+SRC_URI[sha256sum] = "3718b1cbcd963c7d4c5511a8240812904164b7f381b647143a89d3b98f9bcd8e"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 inherit pypi setuptools3
-require python-zipp.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-more-itertools"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

