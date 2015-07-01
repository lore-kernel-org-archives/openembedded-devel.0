Return-Path: <net147@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B915D65CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:07:31 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so26512041pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=M8mdGp0hVLhztcspUXxv5E0LdZTF0FDFz7vpB0Q73/o=;
	b=gU6C20cpsJ67QTKoj8s675FWtJtf0Ajx0FY1je1KqfFa3xCvw1OqEZvMNuP7PbuzNx
	1KedUF+vDj4h+xKnt/DSc8OKiBUydtJ+PGsGPeqsowb/0Xz3wGnbTxsG3qdYEtJ4qGPl
	dyWi3b6z7FWJgU6edKjpbPAFGfRu6j4Rha/LQEccwKDzFR3X8uZkKJOZf1IZv1JTo+Hl
	4szmSb15WgvYgdLaFFBCpNLZCdH2DmiAMw6d2hPjrsq8ZcDP+sDBdZpC4HY0L2T9x9VJ
	A0Cz3LncMrSuAuH3fzlCh6YonifW7hFUe8inZBtI05y8ZYesnLUiZjVo3QimH8s7Gyz0
	6+9g==
X-Received: by 10.67.4.201 with SMTP id cg9mr55777315pad.53.1435759651871;
	Wed, 01 Jul 2015 07:07:31 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id k5sm2457584pdb.53.2015.07.01.07.07.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 07:07:31 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jul 2015 00:06:59 +1000
Message-Id: <1435759619-6104-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-oe][PATCH v2] hidapi: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jul 2015 14:07:34 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-support/hidapi/hidapi_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/hidapi/hidapi_git.bb

diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
new file mode 100644
index 0000000..a34797f
--- /dev/null
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Multi-platform library to interface with USB and Bluetooth HID-Class devices"
+AUTHOR = "Alan Ott"
+HOMEPAGE = "http://www.signal11.us/oss/hidapi/"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause | GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077"
+DEPENDS = "libusb udev"
+PV = "0.7.99+0.8.0-rc1+git${SRCPV}"
+
+SRCREV = "d17db57b9d4354752e0af42f5f33007a42ef2906"
+SRC_URI = "git://github.com/signal11/hidapi.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.4.4


