Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4BB7457E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 16:42:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c13-v6so15283259wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0wtt1Ggbh8jruc+a1Ew2oK0rel4uwpStxybtO3U/x80=;
	b=tryrV6QaWo/0ZHD2pwOv8APkcpJFjCf0pGIUEUujllFN3Ucxd7IcXj7AqTPhqdSJM6
	GSPDoMQyxJ0zvpFmtqxI2HOx3PqyDA2BI4XvU03iwq+FikLqrtImrsdCtjWEHauk1zIV
	uTOgveeeieLYsch8aTQBEGH93AbYSs15O9rYhqOSaMTtnHmBv+/belu3i4/ZPNXxHr/7
	h8Jz0L2QkXuihRbY9rpCGBM+DVfZCn+m0BPUpeNixkAav6ZIRvj45/oG0Mtpujv+o23T
	asZ7snXsdxqqqEO+C/Xcgc/TwT38o4BzLguCZY589+UTVEifpcIuujL7T2GdIuQ/bs4p
	Zw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0wtt1Ggbh8jruc+a1Ew2oK0rel4uwpStxybtO3U/x80=;
	b=Cx/z5f6XeGaRjc/RNzuB5lG5KMBkuMJ/pdzsktdGDN58z9OtQYTKOzwSQg3CDrNTMA
	5yxBV4rc8BXImJesYjE7onTxp4Z6vGdF0ABcZolZMwmS75OGQm2x+v8gfUPbBenKNUIy
	9S5cW+F9FAfqxOsfIZwFpSndyr8kU1CBEBLptuFCnLpr9TA+KKY8H6//Yl7zIM1M3t3A
	OME8obvCPOEvXhG4KCPAUY+b9hd2azE7Urr6MjjUoDJ8fjQFHGWeHLhRtFXPTU5ituWa
	gxbmnNJx7lr0UXWoSa0I759vt13LoZqbsbqqwpOCC/EBRikn8QZluw/0zlcbZmGRY3UR
	D0Dg==
X-Gm-Message-State: APt69E1EFrTjI5hCkXGzYMHEC88yhBxHoW8U0S1s1ETa4DczyiLhG8/X
	3HMkUBz0M6xeuxxABHfKZ3gyyMRa
X-Google-Smtp-Source: AAOMgpfwgcZy7hmBm/cFM9IY9UTDote9rAXbs7BaOF3fOA1Md8+sUDuqN0MFQN9Vi4NZ/mC1kJBGbQ==
X-Received: by 2002:a5d:4542:: with SMTP id
	p2-v6mr18088940wrr.191.1531240979648; 
	Tue, 10 Jul 2018 09:42:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	35-v6sm12868251wri.78.2018.07.10.09.42.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 09:42:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 17:42:57 +0100
Message-Id: <20180710164257.31328-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][meta-python] python3-bandit: add the Bandit security scanner
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
X-List-Received-Date: Tue, 10 Jul 2018 16:42:59 -0000

Bandit is a security scanner for Python code.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb b/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb
new file mode 100644
index 0000000000..2d24c8b0f7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Security oriented static analyser for python code."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "f74155cb9921be857693b32d2531e857"
+SRC_URI[sha256sum] = "cb977045497f83ec3a02616973ab845c829cdab8144ce2e757fe031104a9abd4"
+
+DEPENDS = "python3-pyyaml python3-six python3-stevedore"
+
+inherit setuptools3 pypi
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


