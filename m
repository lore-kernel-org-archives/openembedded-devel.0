Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 89B5C71E1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:04:18 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n13so31880787qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eTuh2a0g/uGztytMkWpXVMUVVqpWh8sQtE87fy5eVws=;
	b=CFAoo3ZsVN4pns03bD3ukjE5X49wSCVP5kr8nfIgX11VnMz36ydJA+uWVOlUxg28W5
	iJtAV+UWMuWmRJV1l4MjOt5heq9JxLYvXlh54aVyurcuWDPyZt+hi4PlEE/N4NtdZyPq
	H2TJCaUAVtseH6X2uS0RXpUQApE1wTxSaOSP8VK6x+FjfH3Ho6m/oI5w6dVqUOddlpJJ
	65GcHRxV9Y4u3bNzgH2Y0OZ4neaiVgzuaxzh5qqPVmhwom/n42mO3TsE2SqhTe8KT19q
	0Sh/+D+o8oPH4KhyxZKQfy2wNzRltQAdx9Sv3dNU6eA3r6QHu9miWFt3o05AfWjpTPU7
	HEpw==
X-Gm-Message-State: AIkVDXJgMGvPjTjwGD2hV4k6oZLr6GvdTRbfy1mtfKvzGFjaiGymIgkN/tfpqrgD53gtHg==
X-Received: by 10.237.62.232 with SMTP id o37mr33309895qtf.188.1485360258387; 
	Wed, 25 Jan 2017 08:04:18 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id t67sm645312qkd.41.2017.01.25.08.04.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 08:04:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 11:04:09 -0500
Message-Id: <1485360249-18349-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: upgrade to version 5.0.1
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
X-List-Received-Date: Wed, 25 Jan 2017 16:04:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc               | 6 ++----
 .../python/{python-psutil_5.0.0.bb => python-psutil_5.0.1.bb}       | 0
 .../python/{python3-psutil_5.0.0.bb => python3-psutil_5.0.1.bb}     | 0
 3 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.0.0.bb => python-psutil_5.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.0.0.bb => python3-psutil_5.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 13f3695..e97fe46 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,10 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "362a03686ce36940d22a548ecb47d7e0"
-SRC_URI[sha256sum] = "5411e22c63168220f4b8cc42fd05ea96f5b5e65e08b93b675ca50653aea482f8"
-
-PYPI_PACKAGE_EXT = "zip"
+SRC_URI[md5sum] = "153dc8be94badc4072016ceeac7808dc"
+SRC_URI[sha256sum] = "9d8b7f8353a2b2eb6eb7271d42ec99d0d264a9338a37be46424d56b4e473b39e"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.0.0.bb b/meta-python/recipes-devtools/python/python-psutil_5.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.0.0.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.0.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.0.1.bb
-- 
2.7.4


