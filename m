Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.2990.1586024481164422432
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id r21so870607oij.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nb8hNnvY0z3YuNTTEPH/CwAMVRLci02GgBH0bmLIAgE=;
        b=G5tg3oaful2uLwlUSGQYFTkA0smjgUvzLLEKCBqtAHak4tgoI8Mb+5/dMzn2By8o4N
         c7X9idV002tHnkEDNkEWkxFVuq6dHBMAGpr3QMIc3LZI1xP2d08FzXPLCe/x3k2GTIu6
         2GabA165r9shqiq/lru1Ix0wdQJgny65JJXlqVnEztClLr7qiI6MEIdsevD7YpnErrKe
         TkQNqvNF5gL8USDkr67tGzUFUCPNlc7UM56SCzTdCpXvMiGJKWlKi+mnCHybr06fw6Dq
         kVB1cuOzl81ikUM5QgZROZ4ZgIhPI5SDeT8qq1RBJBOMbHjoRX7uVC4AifM8VkTpJWss
         toDw==
X-Gm-Message-State: AGi0PuYtNDsifJKzi8uycPcADwM+wY7tlSPYVkS0mr83MNcI+nzRsoUr
	thccGgLkMTsoLyNzeqIJf1LXN4nnkUA=
X-Google-Smtp-Source: APiQypI2uMq+/Y+HMxdX69gCI/AwuzZRQN4BeUyPvfPKSuMW9XHK9m2X8kGzezBv4HVGbC7g98MFDQ==
X-Received: by 2002:aca:5b09:: with SMTP id p9mr7608983oib.57.1586024479965;
        Sat, 04 Apr 2020 11:21:19 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:19 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/12] python-raven: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:20:55 -0400
Message-Id: <20200404182104.21027-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-raven.inc      | 13 -------------
 .../python/python3-raven_6.10.0.bb                | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-raven.inc

diff --git a/meta-python/recipes-devtools/python/python-raven.inc b/meta-python/recipes-devtools/python/python-raven.inc
deleted file mode 100644
index 1c65e11767..0000000000
--- a/meta-python/recipes-devtools/python/python-raven.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Raven is the legacy Python client for Sentry (getsentry.com)"
-DESCRIPTION = "\
-Raven is the official legacy Python client for Sentry, officially \
-supports Python 2.6–2.7 & 3.3–3.7, and runs on PyPy and Google App Engine."
-HOMEPAGE = "https://github.com/getsentry/raven-python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b9a4414e08f0571d55184531cefc131b"
-
-SRC_URI[md5sum] = "3676f31dadfa61526444dd0245c78a38"
-SRC_URI[sha256sum] = "3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c8fae54"
-
-PYPI_PACKAGE = "raven"
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
index 0f346e45ec..b0d19c31ad 100644
--- a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
@@ -1,2 +1,13 @@
-inherit setuptools3
-require python-raven.inc
+SUMMARY = "Raven is the legacy Python client for Sentry (getsentry.com)"
+DESCRIPTION = "\
+Raven is the official legacy Python client for Sentry, officially \
+supports Python 2.6–2.7 & 3.3–3.7, and runs on PyPy and Google App Engine."
+HOMEPAGE = "https://github.com/getsentry/raven-python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b9a4414e08f0571d55184531cefc131b"
+
+SRC_URI[md5sum] = "3676f31dadfa61526444dd0245c78a38"
+SRC_URI[sha256sum] = "3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c8fae54"
+
+PYPI_PACKAGE = "raven"
+inherit pypi setuptools3
-- 
2.17.1

