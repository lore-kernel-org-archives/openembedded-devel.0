Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 48F9C60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 06:31:10 +0000 (UTC)
Received: by pdjd13 with SMTP id d13so20123120pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 23:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0RtNkMyfvJAHSdYthSDTeIrh3tTa5wqc/OpVkaPameQ=;
	b=ZyG+V8qToRxoD5uNdRRTg6svt0GkZggnjrQ5BjCF1izxTLg9oEDlCR+4f9/zOPipdp
	3a9ued8q1ONNfEy4lw60w+yFulBkHLFBqTD+MhJ7lpURDdZHio6gN84cj6lsPHyzkbU+
	CgjSVaOtIp+3k0Y8bYk/fpKAUzo6FRKXvqtXj5mOuYuZuQ4MxwncBNECOM+fLTAldTNQ
	f7d/Ha3ccciHhFvVzk2tVaMJvPGlmkPaRwzYG+/iTK5/z6V7aaoTleCmOo/d8jzjb0/+
	3moDfRDUdFRnBo3Zecw3kGz0wBGj0C0b4lVUnw80zzebmvWi3qmDBOtR6VfX7FsZiVEc
	aWDQ==
X-Received: by 10.68.224.35 with SMTP id qz3mr51241039pbc.165.1435732270747;
	Tue, 30 Jun 2015 23:31:10 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id oj15sm949405pdb.20.2015.06.30.23.31.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jun 2015 23:31:09 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2015 16:30:36 +1000
Message-Id: <1435732236-22986-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-oe][PATCH] hidapi: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 06:31:11 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-support/hidapi/hidapi_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/hidapi/hidapi_git.bb

diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
new file mode 100644
index 0000000..1f5e9fd
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
+PV = "0.8.0-rc1+git${SRCPV}"
+
+SRCREV = "d17db57b9d4354752e0af42f5f33007a42ef2906"
+SRC_URI = "git://github.com/signal11/hidapi.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.4.4


