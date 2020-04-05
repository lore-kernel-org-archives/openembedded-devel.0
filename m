Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.20860.1586104950712230900
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 09:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id f52so12768377otf.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 09:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=n4A7YhHlnKcpucFkx+Ib6NvZKuMyxg/LkjX873gjm8I=;
        b=jmGNXIkn6jfCDqMTZGdcTA97mU7ffsFFWcim3GqqtKlgPsEWXSZBNjbq7tGrCdmXPj
         +6y9eX86Qfv4cR2c5jDak3mSuCMgxVZrv2YwjkH3VXsXsTZq1CkxNcvvfzsCZWGuy4QD
         D+W4YO4KxDsTG4WhFYh00HkUslENGIcSVrX8LzAei4Gwg0zj7XDqoWBdhhQ+lChTX5qc
         OM4Jq1XERlEvP+rgD1g4UwyF9QzwXugnTCzzfP3RX3UmDLz6/wVCpyyIsH2dbsTSyzOL
         vGrFK/o6138qeXh+2/6k+o/6V6jjwY8/3nQqo2xSLnPoFGALZeuZ028Xo7VSiJJmrYf7
         YYIA==
X-Gm-Message-State: AGi0PuYXjEoNuTo2oi4sGOo5Fe9Zb/edYXsDtH2D5U0NBp6vymdwT8DG
	qveFuXM4u1Ks75mtcXsxfWrezZmaWsM=
X-Google-Smtp-Source: APiQypIgg4d2EfWQIKOr+x1ebD9ibRXSAb5Jyj97KEVQy2cX77frP62p0qZJHrfUbDwHYsvUUUyMGw==
X-Received: by 2002:a05:6830:17ca:: with SMTP id p10mr14830795ota.165.1586104949768;
        Sun, 05 Apr 2020 09:42:29 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id r15sm3866573oie.18.2020.04.05.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 09:42:29 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 4/6] python-pyperclip: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 12:41:58 -0400
Message-Id: <20200405164200.31599-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405164200.31599-1-derek@asterius.io>
References: <20200405164200.31599-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyperclip.inc | 14 --------------
 .../python/python3-pyperclip_1.7.0.bb            | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyperclip.inc

diff --git a/meta-python/recipes-devtools/python/python-pyperclip.inc b/meta-python/recipes-devtools/python/python-pyperclip.inc
deleted file mode 100644
index 85a4312c25..0000000000
--- a/meta-python/recipes-devtools/python/python-pyperclip.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a428356ada7737b416ec4b63dc65d581"
-
-SRC_URI[md5sum] = "6bbb8598579cc3ee50554b4c59d0cfae"
-SRC_URI[sha256sum] = "979325468ccf682104d5dcaf753f869868100631301d3e72f47babdea5700d1c"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-ctypes \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
index ee6f88bbbc..52d109abc8 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-pyperclip.inc
+DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a428356ada7737b416ec4b63dc65d581"
+
+SRC_URI[md5sum] = "6bbb8598579cc3ee50554b4c59d0cfae"
+SRC_URI[sha256sum] = "979325468ccf682104d5dcaf753f869868100631301d3e72f47babdea5700d1c"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-ctypes \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

