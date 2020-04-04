Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.1895.1586021376342660733
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id l23so10850556otf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CZcZAcWjLMsv98U3ybmTSq4OmUq6cYXt3DteRmq9+T8=;
        b=lI6QDp8zbUz4nUITTgaHIz7G9E3HCdUpVoIGlnDAeFxcOl+S6TdcjghtKE5X/nBsbu
         esVjr79t6Fr8prCi504+LJ843UMwiuP1Yw02D5aXDUsGEeU7CfG2tx5CXLNn/wLPSTUh
         Hwnmy9u/aRCDkNpj2aPrhQ2dMeGhv6Qtt5ZSfC0EJAE4srhbpOZUyAcho/OfWA9fJb27
         EV7xvoan0Ash3uS+CQ2O85i/zH9Tb1+5yDBlQmBhwbB+hfIUUX5En8UbkxRB/L7y+1xB
         D4WosSZNYSg9A+2a8IqZbGRcQbfDj445dJC+ivbpNaCKLp4jPs5kZvruVSX+dL7H1ICm
         CKAQ==
X-Gm-Message-State: AGi0PuYgtCqzMpFs+f0336Fatbn5BjKgBd/nhDnp8p5YSePt+7udWOgx
	T3Uxn50nKFm/z22lQHmlQgMN9fJ9O3c=
X-Google-Smtp-Source: APiQypJpqMIBTgoZDQkRnFtO580C72sd3noccuJ2fzrLUZlGBsJhRYjSiIbIBlYpGM2JrsjIGqRhKA==
X-Received: by 2002:a9d:6c89:: with SMTP id c9mr10904012otr.337.1586021375414;
        Sat, 04 Apr 2020 10:29:35 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id e22sm3068964ote.32.2020.04.04.10.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:29:34 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 7/7] python-requests-oauthlib: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:29:11 -0400
Message-Id: <20200404172911.26978-7-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404172911.26978-1-derek@asterius.io>
References: <20200404172911.26978-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-requests-oauthlib.inc  | 7 -------
 .../python/python3-requests-oauthlib_1.3.0.bb             | 8 +++++++-
 2 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib.inc

diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib.inc b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
deleted file mode 100644
index 7c4d85f2a5..0000000000
--- a/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
-
-SRC_URI[md5sum] = "1ebcd55f1b1b9281940b4bc33010e2ba"
-SRC_URI[sha256sum] = "b4261601a71fd721a8bd6d7aa1cc1d6a8a93b4a9f5e96626f8e4d91e8beeaa6a"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb
index 1294661509..fd48cd33a2 100644
--- a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.0.bb
@@ -1,3 +1,9 @@
-require python-requests-oauthlib.inc
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
+
+SRC_URI[md5sum] = "1ebcd55f1b1b9281940b4bc33010e2ba"
+SRC_URI[sha256sum] = "b4261601a71fd721a8bd6d7aa1cc1d6a8a93b4a9f5e96626f8e4d91e8beeaa6a"
+
 inherit pypi setuptools3
 
+RDEPENDS_${PN} += "${PYTHON_PN}-requests"
-- 
2.17.1

