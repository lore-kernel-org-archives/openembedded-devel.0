Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web11.2998.1586024486641332785
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id f52so10891748otf.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C1ecDJaiOhU9KTfmVkLDgx+BoUn1k2z7GJTuWK32nAA=;
        b=gvZv5DkaDwlruiwDc3+d/g2d/xnIV68hUUWKoWIkLXm9c3iw1qCpUpCCrY2edJFDzU
         yxxPGAZZQhcAaB9Azx/FBb/QO4Xs5l4JF9sxLKU168gwEaOPUajxvQEPm7HcsgFyecpf
         UEITI20rEYIw2GUpcdpDIZqDr90JOAJFria+fRLzpAquT4z4sA9GUk4IXtZJA+Reudvz
         MvUbo0W3xFD8Mf/xAHiCG5kdj1zZkabn/dhgReNNgdkbWiry01KgnG71T3TyQct5dlPk
         4r3rMO3iicakKwofUdxGeabflHKWHiU7IAM6Vo3eP9nKtLbdrYhnRMDDm8CUliRHSUDk
         FlFQ==
X-Gm-Message-State: AGi0PuYwTuIKa8SqqW3uUpi77nc0pZkZlcyCUG/hg4HfPVVcxta4cj7h
	myYWoS3uSYiWPRvHfpoS6e/WkRuKknI=
X-Google-Smtp-Source: APiQypLWTkBv8AuYmyRFcFJuHWNzsaKc+EQ6qymJPcxxZ32l95GDipeFXr6Xgc8HB/O1BuXyc7xWuw==
X-Received: by 2002:a9d:20e4:: with SMTP id x91mr9791462ota.6.1586024485672;
        Sat, 04 Apr 2020 11:21:25 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:24 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/12] python-pytoml: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:21:01 -0400
Message-Id: <20200404182104.21027-9-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pytoml.inc        | 12 ------------
 .../recipes-devtools/python/python3-pytoml_0.1.21.bb | 12 +++++++++++-
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytoml.inc

diff --git a/meta-python/recipes-devtools/python/python-pytoml.inc b/meta-python/recipes-devtools/python/python-pytoml.inc
deleted file mode 100644
index 180531d750..0000000000
--- a/meta-python/recipes-devtools/python/python-pytoml.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "A TOML-0.4.0 parser/writer for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/pytoml/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cfff423699bdaef24331933ac4f56078"
-
-SRC_URI[md5sum] = "e59dd36a559dd2a876e4c149c69e947b"
-SRC_URI[sha256sum] = "8eecf7c8d0adcff3b375b09fe403407aa9b645c499e5ab8cac670ac4a35f61e7"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
index ed6a4d3a6b..f8c759a7d4 100644
--- a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
+++ b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
@@ -1,2 +1,12 @@
+SUMMARY = "A TOML-0.4.0 parser/writer for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/pytoml/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cfff423699bdaef24331933ac4f56078"
+
+SRC_URI[md5sum] = "e59dd36a559dd2a876e4c149c69e947b"
+SRC_URI[sha256sum] = "8eecf7c8d0adcff3b375b09fe403407aa9b645c499e5ab8cac670ac4a35f61e7"
+
 inherit pypi setuptools3
-require python-pytoml.inc
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

