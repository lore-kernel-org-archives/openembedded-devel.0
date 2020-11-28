Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.36788.1606592853056089464
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j8LfCWlD;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id o4so4756809pgj.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bg8lGi+BVIjMzChSW7xvQFvXaxBlokJ9yZWuHZNb2xo=;
        b=j8LfCWlDDCJLEJVfARU6RGEgc8ROClZk1v6lnHfUkLVJstj7LDMp361SleTQClcN9o
         btP2zXiqKY/03I/lFjRdN982DZZGQlq+jj3OGqHX9En744nD9bBIIJsqTqyY7WfeK4PV
         D+7hFAoAguLGzHhL9GPmNZrT39aasbhuGMwC7tm8JR6aKZh5Vs81ITdVcI5m4cXgdoKH
         G17BzghjX/J2K104PH9fL04pGctJr1Mu+7chxqb2UNm5nJlWODwvScpTx88hak2POnGG
         y+XVasimmdD+gMMRkedz0COx4WV/rgXyPXzrAO2tIHU6OtWs+nA9UEr4qlsdyrVmogAq
         JTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bg8lGi+BVIjMzChSW7xvQFvXaxBlokJ9yZWuHZNb2xo=;
        b=aADiOxoDm4W+5MTS/g5ZEX8i8h/oZxwB4iqz0ZIhXAfcmIErIi9Hqm5EBGv8cqzBwN
         57/znce0GxOOv0jA3dfQLaPBLyJGdmetFPPIpUhogQhmLhLAaikZiVWFh8mZfTdps6m2
         1ojb5sogd8aV5ArQonWbQAFKYZuUCWYstD2X9hlcdxZikXIQrBaZK8tE/BGnnQn3YQiL
         LZAyTte63otzQYQ8Q/dcrgc6i9ANQSlumaZ2p5M3Ajo1Ejeea9XFkqMhdDTBkMkN5C2Z
         Ey4z17EtRugfBuwvobHl8gG7a97cMGzX6hxRhY32UmqaUdqHmgk2AJ67JjdjDQw1Olui
         TN9w==
X-Gm-Message-State: AOAM533RDdmJAPui8yX0aJFcxg2Wwh5TgCeM4zF07jjOT3nIMtzP/vOI
	15XSt+Ynbg8rPLtiaB2N5WAMZN7dWu6Ktg==
X-Google-Smtp-Source: ABdhPJxOUyCKHhB7RzKoLd3CtGiUHhC+kvIBQ/gMl0pRdBbkfpz/6BDJEA6cf1VSJjRiPhnLTAiyZQ==
X-Received: by 2002:a05:6a00:c8:b029:18b:b0e:e51 with SMTP id e8-20020a056a0000c8b029018b0b0e0e51mr12154690pfj.37.1606592852425;
        Sat, 28 Nov 2020 11:47:32 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:31 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 14/16] python3-pytest: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:54 -0800
Message-Id: <3b068dbee56cd4fa70fabc89f2fd860a57c0163d.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 ...he-setup_requires-for-setuptools-scm.patch | 39 -------------------
 .../python/python3-pytest_6.1.2.bb            | 38 ------------------
 2 files changed, 77 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
deleted file mode 100644
index 8c5c17247e..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00 2001
-From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
-Date: Wed, 28 Aug 2019 16:12:27 +0900
-Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
- setuptools-scm
-
-The setup_requires argument forces the download of the egg file for setuptools-scm
-during the do_compile phase.  This download is incompatible with the typical fetch
-and mirror structure.  The only usage of scm is the generation of the _version.py
-file and in the release tarball it is already correctly created
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Derek Straka <derek@asterius.io>
-
-Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
-
-Rebase for pytest 6.1.0.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- setup.cfg | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.cfg b/setup.cfg
-index 60f6564..c4d1471 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -55,7 +55,6 @@ package_dir =
- 	=src
- setup_requires = 
- 	setuptools>=40.0
--	setuptools-scm
- zip_safe = no
- 
- [options.entry_points]
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
deleted file mode 100644
index 6872da5cfa..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Simple powerful testing with python"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
-
-SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
-
-SRC_URI[sha256sum] = "c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e"
-
-inherit update-alternatives pypi setuptools3
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-iniconfig \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-pluggy \
-    ${PYTHON_PN}-py \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-atomicwrites \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-pathlib2 \
-    ${PYTHON_PN}-wcwidth \
-    ${PYTHON_PN}-more-itertools \
-    ${PYTHON_PN}-packaging \
-"
-
-ALTERNATIVE_${PN} += "py.test pytest"
-
-NATIVE_LINK_NAME[pytest] = "${bindir}/pytest"
-ALTERNATIVE_TARGET[pytest] = "${bindir}/pytest"
-
-ALTERNATIVE_LINK_NAME[py.test] = "${bindir}/py.test"
-ALTERNATIVE_TARGET[py.test] = "${bindir}/py.test"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

