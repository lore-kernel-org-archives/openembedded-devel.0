Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web12.8710.1586006952390941602
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id r19so10350577otn.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+9aj1VTm9I/vCdzkThyEYX8fWZnB3DdTorjZghTI8y4=;
        b=VBZivzNMMcP/HVBsr2JrNPTieD/ByMs8BmmqGhDsFOnlqREsNNqsCDLAfvcZ59jBfO
         JdTg2rAAnIPTVFCMPjb9bLIqr+eMpWjhPj49MqJRynKv9MH5hWUCoeEJWw9H46kMWs0C
         q+o1X06Z+YVUJkUWTiPPCXouQytyWn7m2acOBw2XpwU+ZhO/4KNS6FcgSJnlh/+gTt71
         sf+zaCmJ9qyKUQcqIsEINJHdsN0Z3Dxj15AVC1rNbgvXwVF0+MIdPTra9hPhl2cEPH3d
         sHVlxSZppDNARwHaotNjJQYKw9bjSSX4rrB3fzmyGmMMwvvcALneGmlMWSzQ8eDohYKA
         Gdjw==
X-Gm-Message-State: AGi0PuYOFkEU14kj60tW3Pqu3p+duFuFbeIuyNbsZcPoJ5EGBIWWBv1C
	PqweX26TfDU+NOe5Prdpz0jc45mPwQA=
X-Google-Smtp-Source: APiQypJUBDnpqFXMbSpNodCuAaAgbN3C0EwbKHKGjuEk70B1M4CDdDFQ5yubmmMWZhzxTRBkt7P10A==
X-Received: by 2002:a9d:600f:: with SMTP id h15mr6321341otj.275.1586006951476;
        Sat, 04 Apr 2020 06:29:11 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:10 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/11] python-visitor: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:38 -0400
Message-Id: <20200404132846.16832-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-visitor.inc    | 6 ------
 .../recipes-devtools/python/python3-visitor_0.1.3.bb      | 8 +++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-visitor.inc

diff --git a/meta-python/recipes-devtools/python/python-visitor.inc b/meta-python/recipes-devtools/python/python-visitor.inc
deleted file mode 100644
index 8c2288cf0a..0000000000
--- a/meta-python/recipes-devtools/python/python-visitor.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-SUMMARY = "A tiny pythonic visitor implementation."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[md5sum] = "94a024ed0ec1b02b4497c15267d319ca"
-SRC_URI[sha256sum] = "2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a"
diff --git a/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb b/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
index b9bc51d4b9..ac3a90efb0 100644
--- a/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
@@ -1,2 +1,8 @@
+SUMMARY = "A tiny pythonic visitor implementation."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "94a024ed0ec1b02b4497c15267d319ca"
+SRC_URI[sha256sum] = "2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a"
+
 inherit pypi setuptools3
-require python-visitor.inc
-- 
2.17.1

