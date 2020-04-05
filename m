Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web10.23494.1586111997510576129
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id t25so11148821oij.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GiF0qFNlXy7NLFAgft7xh7VuGw6M3f054ywAhzf8brU=;
        b=kl8ldLTbstZ0UNUujuhKL1rHpgmJmczfPQqE+qZ69MV03+rTL5LOHRdOqW8xTc+8qK
         gGg2c69Ug3cVR/4IKMukgTbO9qT1fItFE+Zwp+muuaTfTLp53dMx7mLT/uAHY1ijt2rF
         R90OsWn/XF5B/vmmZEJ2xZWZMwUEBPSJsYlhWi3r/SP8VnvKoBiUTCjS6bBCH9NEf0rq
         Zb4y0K6PBuenrMGHRouxJq3wC/msyxTmK62uxJqPGFzCyhVSVRzJVMzhnXdQTCFQAkep
         /rQ//m3wNp7X5TB7MVH7DYt9gDjUaf492EM7ab+2uplpmIawaopYKP+bU2Lu1tN9ksrO
         BACg==
X-Gm-Message-State: AGi0PuYvFPNe6IwE7+1N2CDqmKqJYQSi7gOr/hVsDA9fq0Aq8GaDpl8/
	1gnLiSGo0HTXjH3RIQYbD9oTgI8rYJw=
X-Google-Smtp-Source: APiQypK9wF8gPMCuJpfmmaEr8EkJ5T3AaTolE6NQxldPZKVE2wEqmeHjausysNj7XhkoxJ2tGxjKMg==
X-Received: by 2002:aca:ed4b:: with SMTP id l72mr9801974oih.95.1586111996563;
        Sun, 05 Apr 2020 11:39:56 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:56 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 15/15] python-pydbus: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:29 -0400
Message-Id: <20200405183929.28266-15-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pydbus.inc     | 11 -----------
 .../python/python3-pydbus_0.6.0.bb                | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pydbus.inc

diff --git a/meta-python/recipes-devtools/python/python-pydbus.inc b/meta-python/recipes-devtools/python/python-pydbus.inc
deleted file mode 100644
index 0773b7ff88..0000000000
--- a/meta-python/recipes-devtools/python/python-pydbus.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Pythonic DBus library"
-HOMEPAGE = "https://pypi.python.org/pypi/pydbus/"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a916467b91076e631dd8edb7424769c7"
-
-SRC_URI[md5sum] = "c6abd44862322679bd4e907bebc3e0d0"
-SRC_URI[sha256sum] = "4207162eff54223822c185da06c1ba8a34137a9602f3da5a528eedf3f78d0f2c"
-
-S = "${WORKDIR}/pydbus-${PV}"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-pygobject"
diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index adaa86d5a2..931bc6f7cb 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -1,6 +1,17 @@
-require python-pydbus.inc
-inherit pypi setuptools3
+DESCRIPTION = "Pythonic DBus library"
+HOMEPAGE = "https://pypi.python.org/pypi/pydbus/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI += "file://0001-Support-asynchronous-calls-58.patch \
             file://0002-Support-transformation-between-D-Bus-errors-and-exce.patch \
 "
+
+SRC_URI[md5sum] = "c6abd44862322679bd4e907bebc3e0d0"
+SRC_URI[sha256sum] = "4207162eff54223822c185da06c1ba8a34137a9602f3da5a528eedf3f78d0f2c"
+
+inherit pypi setuptools3
+
+S = "${WORKDIR}/pydbus-${PV}"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pygobject"
-- 
2.17.1

