Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.20831.1586104951601164816
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 09:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 22so12869068otf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 09:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L7FmgEy6wfeguX6Wv6vFWoET8XDedPVjI5Z7hgHEo9o=;
        b=LJNjSORdZDBzqFkjW8pxuv0P4caTbYf344QN8C21XPcyXkiam69nHqOcDKJ3FgVHkv
         kVl2ME5grDiAi7npplKO4DtUWvSK8Yvhv+ATa9TSie1SkcuNAlOtqc92yV9X6hTjBs2W
         J14uCeLjiQqkaFOQM8cVnZYFCXN7A4RiVBOkkV5FMqkIzvNGezViYWriK0d3TO4J7mcW
         9p8uB0xmGRTnW7Y9U5mRrsAts+hYl2p/gh0tcCV3wnZZ1XlMqbJ9CxEcMjCiYrNYnjRE
         BIH3PW1XKLHUZTHHYYghRq3ip+UHd1+dtICyfksURVDUHO7jMglrA/QnMY+KA35G1an4
         JhEA==
X-Gm-Message-State: AGi0PuatVemtmyQjPBjLJa5UzSentQKqjtr+gGXhaF1JM9YKffcBPBPU
	CIPlpvK6zhlhZ/Yh3yXs9OMCKrnmjuE=
X-Google-Smtp-Source: APiQypI8nw0+i5w1yt6sLak4tdXufEnRHRWBsWWM/gSXYS3KxTJEnpme/iwuo/hBnmTKQ9HSq0P8Fg==
X-Received: by 2002:a4a:cb02:: with SMTP id r2mr14691851ooq.28.1586104950643;
        Sun, 05 Apr 2020 09:42:30 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id r15sm3866573oie.18.2020.04.05.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 09:42:30 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 5/6] python-pyparsing: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 12:41:59 -0400
Message-Id: <20200405164200.31599-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405164200.31599-1-derek@asterius.io>
References: <20200405164200.31599-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pyparsing.inc               | 21 -----------------
 .../python/python3-pyparsing_2.4.6.bb         | 23 +++++++++++++++++--
 2 files changed, 21 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyparsing.inc

diff --git a/meta-python/recipes-devtools/python/python-pyparsing.inc b/meta-python/recipes-devtools/python/python-pyparsing.inc
deleted file mode 100644
index 2b9925f495..0000000000
--- a/meta-python/recipes-devtools/python/python-pyparsing.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Python parsing module"
-HOMEPAGE = "http://pyparsing.wikispaces.com/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
-
-SRC_URI[md5sum] = "29733ea8cbee0291aad121c69c6e51a1"
-SRC_URI[sha256sum] = "4c830582a84fb022400b85429791bc551f1f4871c33f23e44f353119e92f969f"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb b/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb
index 0805fee3e2..a6ec1cb9c3 100644
--- a/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb
@@ -1,2 +1,21 @@
-inherit setuptools3
-require python-pyparsing.inc
+SUMMARY = "Python parsing module"
+HOMEPAGE = "http://pyparsing.wikispaces.com/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
+
+SRC_URI[md5sum] = "29733ea8cbee0291aad121c69c6e51a1"
+SRC_URI[sha256sum] = "4c830582a84fb022400b85429791bc551f1f4871c33f23e44f353119e92f969f"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

