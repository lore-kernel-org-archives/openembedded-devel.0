Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.8625.1586006950349847636
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id x11so10363444otp.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M0oPjn+64USpRH7v4yglb+N423DE51Altapn3V463gc=;
        b=mAAc6e1XvKcGEeN4lyVG3NCa/ENynA/WwNwPQoBdLcglse2jjsmKD5m5EZPpts5HQl
         FcbAUvpD8OKujlblhxAFRAjVS5ZifYvQGxN8McVY39UqRpKA6xHXh0RpDKQhT+ZdnDgm
         5GAIISFewjtHKv00oyGT8GptNo1sCipSjM8vpFOnUpskBz5RMmwYo/99FMWoBNtwfp7c
         rCGfnLyEuhrK5Xt+pd0ES9OEwikUdhHO2UDr2OCNKr9QhO0euIdnwgp6BgtmAwEaewXj
         H/L9i9SeoWybLU1aLSFs0qqfdKfGcC3tfacckDvnj9nVYlh+VDi7mC/nVo7co8hD0AE4
         JddQ==
X-Gm-Message-State: AGi0PubMjpCX74VWH/Y/UDrsw+lvsGnHUdaFiyLH5pqXg28/r/qkb2BK
	4UDmljlFaTWAip3wc6NF/7zHyRafLRo=
X-Google-Smtp-Source: APiQypJSrLTH50aYStngDL8yKv6O5UPNDWMDjspMue/J1AcCUDn1ubzG8jF8unD/FuHnsLIvg4sKEg==
X-Received: by 2002:a05:6830:1d91:: with SMTP id y17mr10260258oti.184.1586006949326;
        Sat, 04 Apr 2020 06:29:09 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:08 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/11] python-wcwidth: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:36 -0400
Message-Id: <20200404132846.16832-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-wcwidth.inc |  8 --------
 .../recipes-devtools/python/python3-wcwidth_0.1.8.bb   | 10 +++++++++-
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-wcwidth.inc

diff --git a/meta-python/recipes-devtools/python/python-wcwidth.inc b/meta-python/recipes-devtools/python/python-wcwidth.inc
deleted file mode 100644
index bbd0d50bf0..0000000000
--- a/meta-python/recipes-devtools/python/python-wcwidth.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Library for building powerful interactive command lines in Python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=11fba47286258744a6bc6e43530c32a1"
-
-SRC_URI[md5sum] = "dc6677d099e6f49c0f6fbc310de261e9"
-SRC_URI[sha256sum] = "f28b3e8a6483e5d49e7f8949ac1a78314e740333ae305b4ba5defd3e74fb37a8"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
index 5f6259b081..f9f6474add 100644
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
@@ -1,2 +1,10 @@
+SUMMARY = "Library for building powerful interactive command lines in Python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=11fba47286258744a6bc6e43530c32a1"
+
+SRC_URI[md5sum] = "dc6677d099e6f49c0f6fbc310de261e9"
+SRC_URI[sha256sum] = "f28b3e8a6483e5d49e7f8949ac1a78314e740333ae305b4ba5defd3e74fb37a8"
+
 inherit pypi setuptools3
-require python-wcwidth.inc
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

