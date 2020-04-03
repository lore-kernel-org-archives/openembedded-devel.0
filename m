Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.8886.1585955008378027595
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 16:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id y71so7652478oia.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 16:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/708+M5dqHSkrRuRQC9lXNc1dBWmZuLQ1j/epqvH8mE=;
        b=EQReUDAHpwbwmZV2ObgBtg80C3ESJmOyBdrGEx/I4crCAyyiRZcQeUnMIV1yr1z/0+
         HKKKsz3dVhk1k/Soo+UYbwEOFnoEql4Ryarpk1TlZRqwkyU1rwRKZchv5JeTBfOm44+0
         804g4m4JO3CC95+F3Blw4lkwojrXEohDAb6tHpMLYYEhDWjKjm926MCdoMukCmTl7aiL
         DSmCV/8o4OltTQx0lPI4kX2xERue5CUJeQSqh3VFAlAUQhsx7gVBk24+ZjnpuQSwLAgo
         8MHqKL1Aw3UXGtfLjJKIpJFo8gN0hj7SeyWe83sYw3QCRTHu0BzP7rDKRdwwLMz0uHxt
         fA4w==
X-Gm-Message-State: AGi0PuaiJ8HI1OeFeGynSMNdLtICxUzHv2Kf1QAasg6JF5gAWIKv4+90
	T5OwIHLEL+zWSY5YhA/5c65L0EN4Lpc=
X-Google-Smtp-Source: APiQypJdiTIXAQl1IopK6dn72WunkoLWd2eoiweCQ7fdX6Grkapufur/L1awWPvfCMARVUS0pues9g==
X-Received: by 2002:a05:6808:605:: with SMTP id y5mr5168538oih.172.1585955007394;
        Fri, 03 Apr 2020 16:03:27 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id 68sm2464665oon.14.2020.04.03.16.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 16:03:26 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 3/5] python-websocket-client: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 19:03:09 -0400
Message-Id: <20200403230311.29817-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403230311.29817-1-derek@asterius.io>
References: <20200403230311.29817-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-websocket-client.inc        | 18 -----------------
 .../python/python3-websocket-client_0.56.0.bb | 20 +++++++++++++++++--
 2 files changed, 18 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-websocket-client.inc

diff --git a/meta-python/recipes-devtools/python/python-websocket-client.inc b/meta-python/recipes-devtools/python/python-websocket-client.inc
deleted file mode 100644
index c4214b2fde..0000000000
--- a/meta-python/recipes-devtools/python/python-websocket-client.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "websocket client for python"
-DESCRIPTION = "\
-websocket-client module is WebSocket client for python. \
-This provide the low level APIs for WebSocket. All APIs \
-are the synchronous functions."
-HOMEPAGE = "https://github.com/websocket-client/websocket-client"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
-
-SRC_URI[md5sum] = "89484bd5dac71123ae6a09b2f90fe62c"
-SRC_URI[sha256sum] = "1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a"
-
-PYPI_PACKAGE = "websocket_client"
-inherit pypi
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-six \
-"
diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
index 9b6696ead1..a3e1bcf393 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
@@ -1,2 +1,18 @@
-inherit setuptools3
-require python-websocket-client.inc
+SUMMARY = "websocket client for python"
+DESCRIPTION = "\
+websocket-client module is WebSocket client for python. \
+This provide the low level APIs for WebSocket. All APIs \
+are the synchronous functions."
+HOMEPAGE = "https://github.com/websocket-client/websocket-client"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
+
+SRC_URI[md5sum] = "89484bd5dac71123ae6a09b2f90fe62c"
+SRC_URI[sha256sum] = "1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a"
+
+PYPI_PACKAGE = "websocket_client"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-six \
+"
-- 
2.17.1

