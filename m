Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33639.1794851673751019831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iKMLQ+xH;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37071c0f42aso5532781eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851673; x=1795456473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w441t9PSKTlPViePSc4eh/+91k197yafWf0Bv7Cuimk=;
        b=iKMLQ+xHNLcVgxM5pD4WyhDmJ2yVsjYGoaNweqZiEYYHMQbLlZLdt2PWKkotg4a+zb
         WydwQtWPNx+drt3JoRNP8aTZI8fLMb8gTdv0NtP+CqWNqxzysIwMHTU79WN++WNDh7qQ
         uEqfAE6OtuUWXW9+ohxykDBZMh1/GDq30tKLphUG7lP4KPzCGoezszcXfBSI6XkO4CHz
         L1GW/2N7Yc8gqeecHcFZ80AjJubbuP/7LEJ7mBtHiiD3/9ZmA0xVkYwE20XJN5Vx2+mz
         0SazDQOwpZsFkFKhAvbSuU/YZTTSCKO9yUrMo8qt99IwhYnVXDhc/ZFnr289WHsNMj9E
         8lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851673; x=1795456473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w441t9PSKTlPViePSc4eh/+91k197yafWf0Bv7Cuimk=;
        b=SOX20e9J2fdyROx3KNyFGkuMwDhzSqOkZB4Bq60DmbU6eRgqinLf2OJtT/AZWvvbk3
         pPW0d091CLoK7H4rkEyYy2vXbPbhiVXVlQe3fpM9r51ExlSwQmA2kVYQdcRFywMtaoJP
         XHW7Y2cDac6ROXQdGWq/+9U6sKgx2Qa0xicz0DEbHckS6C2aAsiVjOeU/K9Bxqv/n4xk
         PXQr7I34zIFjCwosGk20TTXJm6QLsHqRkDdzxPcUDUybzMdq6i3rXq91kTS2PGc/tYj6
         A4cN3Ju+di7B7C3PqZ4ulEQ2whRHUhMdh/rMbW2SPMFZqohysTGCdGoiozwKthmWjmjN
         eZHw==
X-Gm-Message-State: APuU4Z+CeTrFO2WmXV/2il78r2KVgiOdNp2qlubarJZCbX31CVWUf8Ut
	YgUVKpBYZq94kYybm4UdwvHCqR+E19fifuP0DSuiK9Dyz1kraHZqdYgEu3t9n1lO
X-Gm-Gg: AZFdTZf7GBbWuZXahRpg5zkbM6Lm2zH0vKUrNN/grQEdtci+0o0bbSOG1zq+xVSOPuy
	BMA247jD+/joXdJ9bWFw6jWniCXHxJuwgdYLQ507ML98oPj/KH6YJkbcccGziV8yGUdC3NMZZ9z
	7QuImqcxr1ze4rfBTkSBl5f9YN9aLtRSSyfZthO5lvc1tTJHxG/JQLbf0gPWUDbM92bMDyXIW54
	nW7zcpih00yLCE88dS+eykOnXq756grpLYBNE5yoAVE1G6+e9N3MSjmlhcAXKWmcH9JuNFR5At4
	FWAwfH1DcLcxhrcC2KZ/zP34R9zQ5u+QvLbQHhleSFoTfbX2rRTrJ/Q3nJhXLZRgr+zTlAr2lYd
	jgs3EIAzpDf1MAO9ZLeBhxjAkuBGElrNB+HbbMz/GdX6OgJRJlnTEOA4lU7RMRGHT/tbyLZmXf4
	u4LPuDGsSj65lVf4sR1Qu4E8pdtKbastWhNJBsjgjnGSZsSpTUeIRncoI6tXUfYzn5ItjDzMktC
	seb5U9QT4HwOumoyFVGA9tcq7xqL1o8AumacsLZn0iEex89L5kS3RePqIpKGFGhcEhQvsMkGaCu
	1JHzBIbMc/fNj1O/9VxEv/nmpk6RF6BoRvF+ZcGis8pw5PxjXsL6LDP2hpUb3hH0ZmwZ8ZGk/fc
	zvfuCPhRgVvorp/yO0RjUnQwssul/9n9MZk1LlfYE1djWftOK94syhO8bI+2hEx6QymyWfeo4XS
	CmVZnbmYzJ67TT5DA4tI0xU+r6DEIjh8QpzzdsNA08DDmG4TAx6IO7PxCVXnsrNxfBUnoUlAes2
	GR3xuCUIbluH0fVI2tBeDlFVVbZnYaHgW1utcqzJdL6LsRye6fg2FOYgGlvuCB7+5NQZJp46MR0
	bCFq
X-Received: by 2002:a05:7301:4206:b0:376:7d39:33a0 with SMTP id 5a478bee46e88-37967edda60mr10239292eec.26.1794851672837;
        Mon, 16 Nov 2026 09:54:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 018/105] python3-cucumber-tag-expressions: upgrade 9.1.0 -> 11.2.0
Date: Mon, 16 Nov 2026 09:52:30 -0800
Message-ID: <20261116175359.342679-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132474
Content-Type: text/plain; charset="utf-8"

Drop the uv_build bound patch; the new <0.14.0 cap allows the uv_build
in OE.

Changes:
- No Python-specific changes listed upstream between 9.1.0 and 11.2.0.
  The shared changelog covers other language ports only: C++ added
  (11.1.0), Java OSGi bundle name and jspecify range, JavaScript ESM
  (10.0.0), Ruby minimum 3.1 (11.0.0), .NET test dependency updates.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ax-required-version-of-uv-to-be-0.12.patch | 38 -------------------
 ...ython3-cucumber-tag-expressions_11.2.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch
 rename meta-python/recipes-devtools/python/{python3-cucumber-tag-expressions_9.1.0.bb => python3-cucumber-tag-expressions_11.2.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch
deleted file mode 100644
index 7016aaa4b1..0000000000
--- a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions/0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5cf10b111d61f00db2b3d9c8c6635fc31f3ceefd Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Thu, 14 May 2026 06:43:36 -0700
-Subject: [PATCH] pyprojects: Drop the uv_build upper version bound
-
-Core builds wheels with "pyproject-build --no-isolation" against whatever
-python3-uv-build is in the sysroot, and the build-system requirement is
-enforced:
-
-| * Getting build dependencies for wheel...
-|
-| ERROR Missing dependencies:
-|       uv_build<0.11.0,>=0.10.0
-
-Raising the bound only defers the problem to the next uv-build upgrade;
-the 0.11.32 -> 0.12.1 upgrade in oe-core has already invalidated the
-previous <0.12.0 bound. Since there is only ever one uv-build in the
-sysroot, drop the upper bound instead.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index b0f253e..b39d0fd 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- build-backend = "uv_build"
--requires = ["uv_build>=0.10.0,<0.11.0"]
-+requires = ["uv_build>=0.10.0"]
- 
- [project]
- name = "cucumber-tag-expressions"
diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_11.2.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_11.2.0.bb
index 1efe5f4d70..ea7c278b9b 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_9.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cucumber-tag-expressions_11.2.0.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "https://github.com/cucumber/tag-expressions"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=134f1026f0de92fd30e71976590a2868"
 
-SRC_URI += "file://0001-pyprojects-Relax-required-version-of-uv-to-be-0.12.patch"
-SRC_URI[sha256sum] = "d960383d5885300ebcbcb14e41657946fde2a59d5c0f485eb291bc6a0e228acc"
+SRC_URI[sha256sum] = "7de37ff754acd8a09a62ce37183ba235d7d1bcbfde17ea1bdbb2de517b689273"
 
 inherit pypi python_uv_build
