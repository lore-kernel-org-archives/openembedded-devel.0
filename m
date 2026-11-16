Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33619.1794851644930409540
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FFCbkdlS;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6019101eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851644; x=1795456444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8BKaPwUlkrrvnTfx8rVbkNOmIYij4ZHDq5xjoX/pSI=;
        b=FFCbkdlSXQtvybzpX64/jU7ASoezf1gVONJjEDK4UF3Vq/rLilOnSSSJq+xfaUMKfn
         WOAzGeIX09mJESkdfgyeUGgbxLcIuqG/qVy0byJsGPxJW86JqOp3UFw7Q4INJbLcawiB
         3QyIMV2VuuhICphvRy+1Ud/ea8H34QyCjjGRvsvxC1UqVtWuQn5c17IUmt+2aGna0eX2
         2Vrp231faPmhcfoszFvzCSm713JP73NN9qAojRX8ys9dj7efpaLzoBz1ifOBbzlzqwYh
         PYaI+6bsfSkgPxXZAsF7YPRLi+Q0asbDQZMpT7DvjA1GqGRSLbJj9sdBPMfayn2n7x0q
         j90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851644; x=1795456444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8BKaPwUlkrrvnTfx8rVbkNOmIYij4ZHDq5xjoX/pSI=;
        b=0+o5bnD8d55y+qHVL4Jy/ASSjn5Ab1+zIUiR+nJ23esjX+W6p9+b+PlNoRev+r2Xuy
         oDw9BcBgLHS9nyxKgjom1LDK33U6HEAx2v/OTSJ+J6FpWccWrE0cWkSlsuUpxdTwYC2/
         tVBkR6JA3KhRtCyU4ZdfYS7Qn9/QJE3b51DeKmtjNHXMCRqj9DhEZDqmgN9gkwjNejfS
         n8lLeE8osS7LsJbzrrPVgSzoHbd5GKZZOzqhWupUwXLAwXK7fk2PXHcoelVt0lTgTYo3
         tyfKiWwsEGMed5swgzoBompeyTgUZj8uExtQ3a5EssLWLpa2R/bcNcPqqQtx6u+MQpYh
         UU8A==
X-Gm-Message-State: APuU4Z8eYB35hmtQgRqBWJL+0imVQ6Re7PP6wOV/klmkupRNmOA7quZb
	mmoOyIJT/ybzRjPZbzZGBW9EtSBf0pMIqme+daGbH2pvPajfayQY6/0dYCa717hP
X-Gm-Gg: AYBFou1/hTzLLegV7t2YYp+tXIJ8wlsPeQzK7d7a2D8NrNgfLNInoIjK6pFX9VAd8h2
	Pm0QmaexQbl5m8UOQfY5I1BTxOI5wvIMzj1LyX70Dr7JI9jxcRQnnVs+2je3mtyAVNU3x3wwpn1
	2n8o3AC9/hxbFOWfcg6qyWm+W/8dElhE5A+4z15Rk/v0eD1zm+zkPUCTRx8mnUMXdibt2419MKJ
	n7yc/cCF092IX/vEg5lptJnT0rz5tgQw1Gdf5tAOBJH6E0YwBrgDJ8lhXsvti56PyPg+24CxLIP
	RSunnvBFhxPHIDwxZDIqTHBSa8KXNzq7y7MPXBkoK41MPrYPwqbfCLLq/rEK+hy4n3iLtkh4TfI
	ifsj9830dJLLT4q4BY/O1m+Qmhbsx4HX7ZyUop56M41nrQSgo2Wz5AzRHrOlP3DIwbG4AgwxGF7
	5wnKQ6H7PXX0uBJgLOw4N98hBrKesZOkDDZgKSMy3piGfTN5s4ZxoSPQzfz6+lWeSVGxUzayObg
	jZwfjiYuWmEOMqiXlQDGHb5ZOqz8o/113rzOiwgxeqcYOdKD9JDKoKn7DA/gfXKc0avIK1JkNeS
	uBjT3NHRj5kgfAjZTninuFtKuu3I9jkhr7dI+jhJeET/5fxC3LR005WnF4iuS3ECWYmVstlBGG0
	XekGr9zd7KuhkZ9YsWOBotN2QovBz43rCOvsCRNQJDyvZyjzHl+KyYH1xuMU1gn5T2PbQJN7dhm
	T7p/7IKnMx1PIIYlAqDrWGHmHdhZFwbsT0yYuetpbiTLB3plqlBGeg2gRl63MFUv2KtqTWCLgWU
	1sHDSFguoFUX1W1t6t03hfrlPj0JLrclCDJLzefwmtq3Fq4etyOcbrmb8igNQCBp79JU9ziSk1U
	QkfD
X-Received: by 2002:a05:7300:561c:b0:375:50d9:474e with SMTP id 5a478bee46e88-3796365f291mr11462376eec.4.1794851644063;
        Mon, 16 Nov 2026 09:54:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 002/105] python3-antlr4-runtime: upgrade 4.13.1 -> 4.13.2
Date: Mon, 16 Nov 2026 09:52:14 -0800
Message-ID: <20261116175359.342679-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132458
Content-Type: text/plain; charset="utf-8"

License-Update: PKG-INFO checksum changed by the version bump only.

Changes:
- Minor release across all targets (4.13.2). Python3 runtime: fix a
  name conflict on 'state' with the Python 3 runtime (PR 4312).
- Other changes are for other targets (C++ cmake include dirs and C++17
  docs, JavaScript entrypoints/types) and need no action for Python.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-antlr4-runtime_4.13.1.bb          | 12 ------------
 .../python/python3-antlr4-runtime_4.13.2.bb          | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
deleted file mode 100644
index 068be92ddd..0000000000
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "ANTLR runtime for Python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4b18e4a9f93178eaa50a9a37f26da7f7"
-
-SRC_URI[sha256sum] = "3cd282f5ea7cfb841537fe01f143350fdb1c0b1ce7981443a2fa8513fddb6d1a"
-
-PYPI_PACKAGE = "antlr4-python3-runtime"
-PYPI_PACKAGE_SDIST = "antlr4-python3-runtime"
-
-inherit pypi python_setuptools_build_meta
-
-BBCLASSEXTEND = "nativesdk native"
diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.2.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.2.bb
new file mode 100644
index 0000000000..e28cf0b0f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "ANTLR runtime for Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=cd70187b2f2f288c20e09a358ce52b85"
+
+SRC_URI[sha256sum] = "909b647e1d2fc2b70180ac586df3933e38919c85f98ccc656a96cd3f25ef3916"
+
+PYPI_PACKAGE = "antlr4-python3-runtime"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "nativesdk native"
