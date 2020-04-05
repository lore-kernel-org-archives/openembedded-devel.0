Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web12.23518.1586111989261901060
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id z5so13000746oth.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eYLnHrzXmpdsBF2Q1gMocM9tlv+yWUl/Kg0uQfvPQKA=;
        b=JluOls+Ma/a8cVVYWGtnUAG5PZtx75P9hfKHbn1+R8/YmBhYADltII2qAnsIAcjg99
         oplS+tVtyzaqGEqfnotNeuxex7i/TWOjdnCauHx5YAS4RBxg1R6sZcSrNxdX9VaAwVEa
         bF1nUXlCsp6RlPhnJFwZSRTkXyc6k6gTUk8hMnLT9Lc1lrrloPhLYECnXnlEHJvlGOT8
         uITzvnfI0aW5bsiMClTkQ34lM+tIm+UyqLoQInPpXrzfpXUObgC+/R6nE/5e7NERi5Gk
         8Tc0ey9mKeW0cLKNEgO7L9TTLumUW/i1Oasn1j73cpqNnvt/aP7hM8LT7qvaUq+RAGxn
         kApg==
X-Gm-Message-State: AGi0PubMvUbTDEyY3tkDCVIXn8m7aI669vAeInh27UB37QWc/bZiu6b5
	r4cU4u/IPH6nUcH977lbBpcUvM262ZU=
X-Google-Smtp-Source: APiQypLTBfWgEgY3AmHzGax6BURw1Q6v6VKYN1BUXSpefEuGMQUbhQY0y16jyrruPHBcaCo0fAE47A==
X-Received: by 2002:a9d:6a97:: with SMTP id l23mr14292783otq.69.1586111988349;
        Sun, 05 Apr 2020 11:39:48 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:47 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/15] python-pyjwt: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:20 -0400
Message-Id: <20200405183929.28266-6-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyjwt.inc   | 17 -----------------
 .../python/python3-pyjwt_1.7.1.bb              | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyjwt.inc

diff --git a/meta-python/recipes-devtools/python/python-pyjwt.inc b/meta-python/recipes-devtools/python/python-pyjwt.inc
deleted file mode 100644
index 9b8938530a..0000000000
--- a/meta-python/recipes-devtools/python/python-pyjwt.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "JSON Web Token implementation in Python"
-SUMMARY = "JSON Web Token implementation in Python"
-DESCRIPTION = "A Python implementation of JSON Web Token draft 32.\
- Original implementation was written by https://github.com/progrium"
-HOMEPAGE = "http://github.com/jpadilla/pyjwt"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
-
-SRC_URI[md5sum] = "a4712f980c008696e13e09504120b2a0"
-SRC_URI[sha256sum] = "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96"
-
-PYPI_PACKAGE = "PyJWT"
-inherit pypi
-
-RDEPENDS_${PN} = "${PYTHON_PN}-cryptography"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
index dc16d22825..d2f7be46cf 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
@@ -1,2 +1,16 @@
-require python-pyjwt.inc
-inherit setuptools3
+SUMMARY = "JSON Web Token implementation in Python"
+DESCRIPTION = "A Python implementation of JSON Web Token draft 32.\
+ Original implementation was written by https://github.com/progrium"
+HOMEPAGE = "http://github.com/jpadilla/pyjwt"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
+
+SRC_URI[md5sum] = "a4712f980c008696e13e09504120b2a0"
+SRC_URI[sha256sum] = "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96"
+
+PYPI_PACKAGE = "PyJWT"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "${PYTHON_PN}-cryptography"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

