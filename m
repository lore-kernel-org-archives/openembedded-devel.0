Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.23485.1586111991166089889
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id x11so13021084otp.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cs3V1m8+zZOE0JepZDfD5/GWW7YOS0WXwBGOZFrXqp8=;
        b=iZjBD+Ch8W0IKll16JPgHy01iGpVAOdqL/C3hrSZQqFPz9a/a6vQRl/brZvofYgkkd
         AKGGB6PG5q8Dy674IioWkLoiAx+/HIiUBy0yD6AWRZgq1eG2/+8ZCt1U+QXnpy5A8cAa
         vlKKnQG6EyPzmiknZUkRdN29TwHLElIhPWIIqrGjIJJjKfJiko19r1XgX3hu7gmmyaTk
         YKT/mzSCo8XslhoPFG0+IeNQLfQVTMo79MShgtwWuWMGOS1mwQq7TpXvst1JkIFRQpUO
         VmVbNnLvI2IM6sjB8Pb2nfYuXRe9j/vaODUL5qdKDweA90YKBecWx7pr/KIeae4SMZTO
         9ZPg==
X-Gm-Message-State: AGi0PuY1jh88/5SDtok9/KUNaymFwscaR3pa1SuDBVrGILGeKjOjTbNC
	NuokPUUTj6wauKplLkfiuJX/BJzk/LE=
X-Google-Smtp-Source: APiQypJh5G7rl2vPYxl7joeJgzPm020hqo187YXa1f+Yzhf2cjw1/8P2rMwQCmlz6yckhuJs0HVBDA==
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr14001723otr.107.1586111990259;
        Sun, 05 Apr 2020 11:39:50 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:49 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/15] python-pyinotify: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:22 -0400
Message-Id: <20200405183929.28266-8-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pyinotify.inc                | 16 ----------------
 .../python/python3-pyinotify_0.9.6.bb          | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyinotify.inc

diff --git a/meta-python/recipes-devtools/python/python-pyinotify.inc b/meta-python/recipes-devtools/python/python-pyinotify.inc
deleted file mode 100644
index 21abdb84f1..0000000000
--- a/meta-python/recipes-devtools/python/python-pyinotify.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-smtpd \
-"
-
-SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
-SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
index b3bab989ab..ab33953174 100644
--- a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-pyinotify.inc
+DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-smtpd \
+"
+
+SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
+SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
+
+inherit pypi setuptools3
-- 
2.17.1

