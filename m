Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.1962.1586021371984823003
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id z5so10807556oth.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y+qjwaroo6OX0kJQXUE3JtJHzCHCw0ecoJQK6r2pOLQ=;
        b=OEwVqo/UTmshYTfNPhJg4SRAl1+AXy5HixKrsYTrblNpTuVLPcROZuGerLiToGtVYI
         bcNMlJorXKe6gn82vm7k8/dZiT9C8zVXPHtbcGYcDkHz5rvbWGG97W2b6L82oKwdrdIN
         duhzfQqN2kTG2jLOLEWq5gx1+I9dOV2VgRNl8o6ejFL9EiaxrU1AFmQILOlLlho+GDNO
         +1J4CUipTnnebldHQ9tnZKzStZH+1Sad2lI7uJWg3LF7MNXVzf1JIWjM8S/5kzrdRYR+
         i0tUyEeZWFjfSi9Wwnl40gXyrN+zl6GX9ct3Q1HuZlig9NrfvlaqQ5bag3tU7YqmyfM1
         PnJA==
X-Gm-Message-State: AGi0PuZKx/GDmRFmBVCB7b/ON7G1Vr8FqDO0JxWI2HTsHfA7tFIjYdjc
	jphez0t3AGERuUlAIadTkSEc8HMZtQk=
X-Google-Smtp-Source: APiQypKp0tmPDBVs6JSlesyBRFd4Pfp/Ur/EsLHjW3BSJsI+LRQM+MXArBbvFGynBaTDjrhmOCyfCA==
X-Received: by 2002:a9d:6c8f:: with SMTP id c15mr10650279otr.10.1586021370727;
        Sat, 04 Apr 2020 10:29:30 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id e22sm3068964ote.32.2020.04.04.10.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:29:29 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 2/7] python-robotframework: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:29:06 -0400
Message-Id: <20200404172911.26978-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404172911.26978-1-derek@asterius.io>
References: <20200404172911.26978-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-robotframework.inc          | 26 -----------------
 .../python/python3-robotframework_3.0.4.bb    | 28 +++++++++++++++++--
 2 files changed, 26 insertions(+), 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-robotframework.inc

diff --git a/meta-python/recipes-devtools/python/python-robotframework.inc b/meta-python/recipes-devtools/python/python-robotframework.inc
deleted file mode 100644
index e920c51da1..0000000000
--- a/meta-python/recipes-devtools/python/python-robotframework.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "A Python generic test automation framework"
-DESCRIPTION = "Generic open source test atomation framework for acceptance\
-testing and acceptance test-driven development (ATDD). It has easy-to-use\
-tabular test data syntax and it utilizes the keyword-driven testing approach.\
-Its testing capabilities can be extended by test libraries implemented either\
-with Python or Java, and users can create new higher-level keywords from\
-existing ones using the same syntax that is used for creating test cases."
-HOMEPAGE = "http://robotframework.org"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-inherit pypi
-
-SRC_URI[md5sum] = "ee753415645ff4831ff0d366a0467fe7"
-SRC_URI[sha256sum] = "ab94257cbd848dfca7148e092d233a12853cc7e840ce8231af9cbb5e7f51aa47"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-docutils \
-    ${PYTHON_PN}-ctypes \
-"
diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
index 8f613c3868..0628f92d98 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
@@ -1,2 +1,26 @@
-inherit setuptools3
-require python-robotframework.inc
+SUMMARY = "A Python generic test automation framework"
+DESCRIPTION = "Generic open source test atomation framework for acceptance\
+testing and acceptance test-driven development (ATDD). It has easy-to-use\
+tabular test data syntax and it utilizes the keyword-driven testing approach.\
+Its testing capabilities can be extended by test libraries implemented either\
+with Python or Java, and users can create new higher-level keywords from\
+existing ones using the same syntax that is used for creating test cases."
+HOMEPAGE = "http://robotframework.org"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "ee753415645ff4831ff0d366a0467fe7"
+SRC_URI[sha256sum] = "ab94257cbd848dfca7148e092d233a12853cc7e840ce8231af9cbb5e7f51aa47"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-docutils \
+    ${PYTHON_PN}-ctypes \
+"
-- 
2.17.1

