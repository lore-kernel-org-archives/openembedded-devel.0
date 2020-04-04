Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.1535.1586020409675866715
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id v2so10814034oto.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uGcl65TLAfBHSRda5xlRKvmKKWLaSZQKOboM9ufb15E=;
        b=VssNIeQRcRjSQNXNU4nEIcvt3zUdXnWyJSHwie3nzNU8Q4zGvEbfsC6luFtp9OVvGp
         +6tTGR/X0wWeU04TNL0Ka37UWi5/JHTablSPt2z1ysFAdOSDmpVlw+ADWSIe5IMB/W44
         kMrZameL3Xt6OLWESm/oNzyqf7UmLCNnDXAmMKvpXHpnWBX4JxPrQ/B28fFmAzocdzmB
         8dQwT5HhJXOHWmJxusfd1vqPJKKyvYgAd4RTwBndUtdnemGKGFuPCfyTuWWUYAcBXLfU
         nwzPTm+Liah4dR65/frf+U371fy8ZS5xVfGRCgnModOYzcWuOv405wNpuuiCSAz5J54b
         cUpQ==
X-Gm-Message-State: AGi0Pua+wh7ZaYRhzdw3mcPTvGlVEcGjJKcM28iRzswbdcvNHsTzeXMM
	ijFY3ZJ4TpHu7avFbGfBfUN3KT7BZFg=
X-Google-Smtp-Source: APiQypJFemejhQXmXSgXDfcrFioNDGWbhV0832lvUe2UDBSw6ziDKcVH1rVvPWPYkSujZotfLb9V7w==
X-Received: by 2002:a05:6830:1d91:: with SMTP id y17mr10944438oti.184.1586020408732;
        Sat, 04 Apr 2020 10:13:28 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:28 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 24/27] python-sentry-sdk: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:48 -0400
Message-Id: <20200404171251.19823-24-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-sentry-sdk.inc  | 12 ------------
 .../python/python3-sentry-sdk_0.14.0.bb            | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-sentry-sdk.inc

diff --git a/meta-python/recipes-devtools/python/python-sentry-sdk.inc b/meta-python/recipes-devtools/python/python-sentry-sdk.inc
deleted file mode 100644
index 3714cd0ffc..0000000000
--- a/meta-python/recipes-devtools/python/python-sentry-sdk.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "The new Python SDK for Sentry.io"
-DESCRIPTION = "This is the next line of the Python SDK \
-for Sentry, intended to replace the raven package on PyPI."
-HOMEPAGE = "https://github.com/getsentry/sentry-python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
-
-SRC_URI[md5sum] = "2d5cc43c8a178134b739c77439d1f26b"
-SRC_URI[sha256sum] = "8e2d38dc58dc992280487e553ec3d97a424e4d179f4fad802ef3b08f64ccf4d8"
-
-PYPI_PACKAGE = "sentry-sdk"
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
index 840df93404..894e1f9020 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
@@ -1,2 +1,12 @@
-inherit setuptools3
-require python-sentry-sdk.inc
+SUMMARY = "The new Python SDK for Sentry.io"
+DESCRIPTION = "This is the next line of the Python SDK \
+for Sentry, intended to replace the raven package on PyPI."
+HOMEPAGE = "https://github.com/getsentry/sentry-python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
+
+SRC_URI[md5sum] = "2d5cc43c8a178134b739c77439d1f26b"
+SRC_URI[sha256sum] = "8e2d38dc58dc992280487e553ec3d97a424e4d179f4fad802ef3b08f64ccf4d8"
+
+PYPI_PACKAGE = "sentry-sdk"
+inherit pypi setuptools3
-- 
2.17.1

