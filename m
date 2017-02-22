Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 030DA73034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 07:02:10 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x35so284129qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LE4AqVlq1FioNbsW1ADOf98PBcq/SA3ccDEsWKiEpwE=;
	b=hZCh1MK7f3Vhn3m81uiIDouNBqygWf9uqVgO2hzrmKVCI9+vfeytQYu6zzy1HgUBJl
	dSqiHRyG2d7muI3flZXz0MTibO3mNeNYlnjUQ9yfCwPzvqGQh97MxwGeAV1mRXDfjlHm
	0I4eLGrsKYpKgXtq3v13W+XxkBJRcETQ42IvHD+WoTD1+UC61WBBb3iKd7Bh0mcPJ/bC
	3i+0F3kABDEKCk212BRrt2RRimsGY6tK6ybuq0Dm/USdbWQOLvodwjW09uPnIuVWlWn1
	k54FeGZcWw5/itVbFvnZVdFFGTI863aR78JSG0daGlLlzLj5rWlDl46OZuq/iT4BUwkV
	WhoQ==
X-Gm-Message-State: AMke39ljCQrR/ymqW1AW0+a5gMgqeROqbRjyiqCXLjVPnN+ZZU0hVsEtQHqrDyihLRN29Q==
X-Received: by 10.200.53.69 with SMTP id z5mr14798056qtb.120.1487746931334;
	Tue, 21 Feb 2017 23:02:11 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id u54sm194688qtu.35.2017.02.21.23.02.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 23:02:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 02:02:03 -0500
Message-Id: <1487746923-29720-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-prompt-toolkit: update to version 1.0.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2017 07:02:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc         | 4 ++--
 ...python-prompt-toolkit_1.0.7.bb => python-prompt-toolkit_1.0.13.bb} | 0
 ...thon3-prompt-toolkit_1.0.7.bb => python3-prompt-toolkit_1.0.13.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-prompt-toolkit_1.0.7.bb => python-prompt-toolkit_1.0.13.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_1.0.7.bb => python3-prompt-toolkit_1.0.13.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index 8554aea..30c2c81 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -2,8 +2,8 @@ SUMMARY = "Library for building powerful interactive command lines in Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "f74cd8ac84176fac1cdb136843ccb0d6"
-SRC_URI[sha256sum] = "ef0b8188179fe7d052161ed274b43e18f5a680ff84d01462293b327e1668d2ef"
+SRC_URI[md5sum] = "427b496d2c147bd3819bc3a7f6e0d493"
+SRC_URI[sha256sum] = "33d68ca09f76cd73287fde7df5748ffacf26a8238dd61ee81ac50860ea7c6776"
 
 PYPI_PACKAGE = "prompt_toolkit"
 
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.7.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.7.bb
rename to meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.13.bb
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.7.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.7.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.13.bb
-- 
2.7.4


