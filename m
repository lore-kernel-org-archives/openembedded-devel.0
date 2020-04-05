Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.26068.1586119359981414390
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 13:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id l22so11277715oii.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 13:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9CI1VH0Uo3Y3S8rLk2qS97LamvlmewDSCzS4dwul+KQ=;
        b=GMr84pQVE/KxFoVQzYSdtFWDnGV3ldvbDE9uBwg5eCNQrDZJGqb7Z9At0u2HeIL/Jf
         KvgYwavd8OjthHNk5UoX2tWIsZvNWaSXE0FE03gNqB7cN0Kl+r49qULkSn7bX6dlPbXQ
         nEKJLt/xuuyKzCIEKeAV7+aWMchPEtPlaHVyPvFsqljKLlIeKxLkA4u13RTaEhosmWxI
         7H/Nd+42AoMq4NiJSLrWISU8VwCgFSLttfXSUDsA4G/7VXFGaGEbpOKILQmUUzj0OQ/K
         6CpWt5ACx42vh3TtVmuzQ7RqFBfXpwUzL7Jm+rq2c9bmErxuVqgI6QdlVuK4i3hdMhuF
         w82A==
X-Gm-Message-State: AGi0PuZq+oyA9GDQyvADL3pNHSLdbPReKmdnzzRkVfxeoGj6RPXl7Kds
	/W+kLZ2YwiDic1B7znB4MeuUSOO4AzU=
X-Google-Smtp-Source: APiQypLY4JTd7mSyYAjqdEDkAY1r6qQn91ZRu9GkuxEt9CWJ7IV8L4haD44JdUWwrHz2n+/5MrSaLQ==
X-Received: by 2002:aca:3284:: with SMTP id y126mr10078937oiy.175.1586119358841;
        Sun, 05 Apr 2020 13:42:38 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id d6sm3905295oos.10.2020.04.05.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 13:42:38 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 3/4] python-pycodestyle: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 16:42:14 -0400
Message-Id: <20200405204215.8292-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405204215.8292-1-derek@asterius.io>
References: <20200405204215.8292-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pycodestyle.inc | 12 ------------
 .../python/python3-pycodestyle_2.5.0.bb            | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycodestyle.inc

diff --git a/meta-python/recipes-devtools/python/python-pycodestyle.inc b/meta-python/recipes-devtools/python/python-pycodestyle.inc
deleted file mode 100644
index 96cdc5deeb..0000000000
--- a/meta-python/recipes-devtools/python/python-pycodestyle.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Python style guide checker (formly called pep8)"
-HOMEPAGE = "https://pypi.org/project/pycodestyle"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01831ddbaf398471da3cc87f5037e822"
-
-SRC_URI[md5sum] = "40e7a76f364a18f531aaba11a4476e21"
-SRC_URI[sha256sum] = "e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0ca976c"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
index cedcdb3bf8..7f00ab6291 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
@@ -1,2 +1,12 @@
-inherit setuptools3
-require python-pycodestyle.inc
+SUMMARY = "Python style guide checker (formly called pep8)"
+HOMEPAGE = "https://pypi.org/project/pycodestyle"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01831ddbaf398471da3cc87f5037e822"
+
+SRC_URI[md5sum] = "40e7a76f364a18f531aaba11a4476e21"
+SRC_URI[sha256sum] = "e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0ca976c"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

