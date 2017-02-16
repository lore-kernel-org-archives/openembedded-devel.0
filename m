Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 18C83772B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 22:12:24 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u25so4320538qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 14:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jw+McZBhGznnJ+Epy5CAMbMgsYJX8b7Hxyt9Hhj8SkM=;
	b=mjA8Rm1cvhdYUreTukhDiX7BZKJFDgCGsaRbMu+bKsTtC5bKxKtkhJgmtH8SiWyJGV
	2T5q3JAl6X9Tphvv3PsFLitSNrW9hZFfDzjxYDDRYWSqvt+IHZi7zELWd/B7O2ZDZzE0
	QHh3U2JYGbM7gU31yuAmBPmbewREbniPFWJnaeWCVGEQjvLIX0d0HK5B70cqQyMqCBsJ
	fqpvvZ/c78HH3PRBvkLstm/DpbRaXKIfBrmIevLtjkE6zy6NoCfavLFG2hyK7+6Vg0oP
	2xPBXVvpa3lVjhcfKlXI7uyehkxz3aROZkNxIRTjx4oqDTN7l7qhPWtzb1qsKwQBOffI
	6mTQ==
X-Gm-Message-State: AMke39m+9nNRGGKdcVXpsO9K4LihIAU8nVTdTsXNDPgoAvdku8XBVXCMqqX0XdrTQXImlQ==
X-Received: by 10.55.129.71 with SMTP id c68mr4317666qkd.195.1487283144879;
	Thu, 16 Feb 2017 14:12:24 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	x22sm5242581qkb.12.2017.02.16.14.12.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 14:12:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:12:17 -0500
Message-Id: <1487283137-8635-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.1.3
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
X-List-Received-Date: Thu, 16 Feb 2017 22:12:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.0.1.bb => python-psutil_5.1.3.bb}         | 0
 .../python/{python3-psutil_5.0.1.bb => python3-psutil_5.1.3.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.0.1.bb => python-psutil_5.1.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.0.1.bb => python3-psutil_5.1.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index e97fe46..57bfc88 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "153dc8be94badc4072016ceeac7808dc"
-SRC_URI[sha256sum] = "9d8b7f8353a2b2eb6eb7271d42ec99d0d264a9338a37be46424d56b4e473b39e"
+SRC_URI[md5sum] = "3090e32d42761086ae82036cadb95ba3"
+SRC_URI[sha256sum] = "959bd58bdc8152b0a143cb3bd822d4a1b8f7230617b0e3eb2ff6e63812120f2b"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.0.1.bb b/meta-python/recipes-devtools/python/python-psutil_5.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.0.1.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.1.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.0.1.bb b/meta-python/recipes-devtools/python/python3-psutil_5.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.1.3.bb
-- 
2.7.4


