Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.8640.1586006951359059964
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id z5so10339127oth.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qP6MN3daAclblwqSW48vDRhDGa/+hgPX/sujZHFBi2c=;
        b=PrLigIPczKFSvOhcHpT5//OF+mwlBavJOBU4QOjafPJdSECFjNvLPFGXiJAaiIsKXg
         FIHGG4WFgN1Eupp9fKjlJhlFE1i/JvkOxQ5UVsQyOE9J7AI3SoebF0VbhqmQuKZRwTdO
         9pUhrjqPq5ZVuDwgn4oYAEpGanj5yzLoLOatf//3FZlTgRfW6vzU82R9HUxlmQyVB+GN
         g/PgdJwWWeJETlTFZYZSHQkRcQkW89NCo/pKFANinbVrkIGIoebGzxotQEAsltlK82x4
         BeVVOLQFVcjSkYwDpIRlFD+BpC9Sk8qg1kv1aIWtcdc2hqYAy6KBgy6HSl4i20fOBFpQ
         ArRg==
X-Gm-Message-State: AGi0PuYmgpC3dwjz2BY39vkXiQmfZiTLvm+cgU+AtwMlXpWV/+XN7Wvx
	R8S8/KXOXElUoaruZzzqysT63e7VogU=
X-Google-Smtp-Source: APiQypLcoZlknnVoeKQimebIwP15fhas98wvEt5sK+QiD4Y6zhZ20JIKhItI8xntwJx3Vl2hLhJo+A==
X-Received: by 2002:a05:6830:19e2:: with SMTP id t2mr9752372ott.97.1586006950323;
        Sat, 04 Apr 2020 06:29:10 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:09 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/11] python-waitress: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:37 -0400
Message-Id: <20200404132846.16832-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-waitress.inc      | 10 ----------
 .../python/python3-waitress_1.4.2.bb                 | 12 +++++++++++-
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-waitress.inc

diff --git a/meta-python/recipes-devtools/python/python-waitress.inc b/meta-python/recipes-devtools/python/python-waitress.inc
deleted file mode 100644
index 0c288d52ff..0000000000
--- a/meta-python/recipes-devtools/python/python-waitress.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "A WSGI server for Python"
-DESCRIPTION = "Waitress is meant to be a production-quality pure-Python WSGI \
-    server with very acceptable performance."
-HOMEPAGE = "https://github.com/Pylons/waitress"
-SECTION = "devel/python"
-LICENSE = "ZPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
-
-SRC_URI[md5sum] = "fdeed7ec32bbba011e90801208378c89"
-SRC_URI[sha256sum] = "67a60a376f0eb335ed88967c42b73983a58d66a2a72eb9009a42725f7453b142"
diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb b/meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb
index 83c8b66d82..257993f8fb 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb
@@ -1,2 +1,12 @@
+SUMMARY = "A WSGI server for Python"
+DESCRIPTION = "Waitress is meant to be a production-quality pure-Python WSGI \
+    server with very acceptable performance."
+HOMEPAGE = "https://github.com/Pylons/waitress"
+SECTION = "devel/python"
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
+
+SRC_URI[md5sum] = "fdeed7ec32bbba011e90801208378c89"
+SRC_URI[sha256sum] = "67a60a376f0eb335ed88967c42b73983a58d66a2a72eb9009a42725f7453b142"
+
 inherit setuptools3 pypi
-require python-waitress.inc
-- 
2.17.1

