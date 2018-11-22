Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 703586C5C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 17:37:44 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k198so9904399wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 09:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Cl+txYARo0Xsl7vd4K9VKGIO2P9bR0svIq4fkBSAIHA=;
	b=ACS/Ws4fXemjeFfl20OS/E/GpKl1jioEMkUlxV/LCEowTyO59/ht+yr8wgSvWvXcbT
	UkEfE2V6hpvsoRMsLM/cuWg9LIIec+nX887QM3pYH3ZwRk7rbKVHLgtbuAo1pgTZF2JI
	+/a6knglznRReeQCU+0t4IL60/V1YY5A4pxj4CLA2pPdmmKgmUQNtDf8reruWQJlBYfe
	QIdD1Q3csXM7RtnGIEC7/U+nVLc+TQbC+1j1+qeuquHwIecJ0nfqZyVWTH2YjcUZjS1R
	U0bPYONXqJbHSvJfD3Fs9DgG9Z5WhE1tE9Boltrk8YP52doczSmGORAYqcONU+fGvgxY
	TZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Cl+txYARo0Xsl7vd4K9VKGIO2P9bR0svIq4fkBSAIHA=;
	b=ld3Tfhyksqfzyv/NvJOPM1fJCtYm2y39Ps4v70xCQGRcTsHXCew15vwOXZp366Fipd
	V860ZUymrCWYBm5uIgn4xcnAqOjaDlcX6ph8h/wTFVkiMJOtbd2aHbVimJOyP0/ActuM
	jpIzABsEaVur9bjz+/XgnVFkD5g8J0rgzucKfOBvcmpvVt1Z1juW3r0mcgcjLLp48fQt
	aDh5WPvvolmC2fp2ZMzo0ikNqldXIKb8JgHLHCSRt+T7OnLsMpuzl19XRateqtzgDB5f
	y93W81EpxQR4g1OdjyFN7ULsxJ+3XYoaBvpSpro/HBPx0gxk0TI1kw8AVgJMDSyvDxyo
	d9Xw==
X-Gm-Message-State: AA+aEWZD64CXhvIorVXaG0uRYrskrqr7BmEHXUEKhg0neFR63VZzoK0R
	uLZo7LXUNGaMQiqEtNxCP4sEZaCiyso=
X-Google-Smtp-Source: AJdET5deNBZ8bBXL39Q4aESNWFs+1+txEfVCUawtFB1/NJfo3EmYZ7tmZus/dYM1z5ySf7wUC4sTNg==
X-Received: by 2002:a1c:3288:: with SMTP id
	y130-v6mr10158081wmy.11.1542908264824; 
	Thu, 22 Nov 2018 09:37:44 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n9sm23978723wrx.80.2018.11.22.09.37.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 09:37:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2018 17:37:40 +0000
Message-Id: <20181122173740.7734-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH meta-python] python3-bandit: upgrade to 1.5.1
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
X-List-Received-Date: Thu, 22 Nov 2018 17:37:44 -0000

Update dependencies, and cheat by adding python3-modules to RDEPENDS for now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/python/python3-bandit_1.4.0.bb        | 12 ------------
 .../recipes-devtools/python/python3-bandit_1.5.1.bb        | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-bandit_1.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb b/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb
deleted file mode 100644
index 84f47614e0..0000000000
--- a/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Security oriented static analyser for python code."
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI[md5sum] = "f74155cb9921be857693b32d2531e857"
-SRC_URI[sha256sum] = "cb977045497f83ec3a02616973ab845c829cdab8144ce2e757fe031104a9abd4"
-
-DEPENDS = "python3-pyyaml python3-six python3-stevedore python3-pbr-native"
-
-inherit setuptools3 pypi
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.5.1.bb b/meta-python/recipes-devtools/python/python3-bandit_1.5.1.bb
new file mode 100644
index 0000000000..3002d5aa5d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.5.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Security oriented static analyser for python code."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "81ba3979ded1b421fa8d69e6faa06dcb"
+SRC_URI[sha256sum] = "9413facfe9de1e1bd291d525c784e1beb1a55c9916b51dae12979af63a69ba4c"
+
+DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += "python3-modules python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


