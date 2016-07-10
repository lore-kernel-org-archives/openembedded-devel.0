Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id D42DF601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 12:27:24 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n132so13827103qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 05:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o5D1vJ8XPUJSo49bj34ifKDpU6+nhTnRxS0zo8Y7EjY=;
	b=DvegtgjMhJKWoTnlkQwp4coGEEluku4axeU6GPPsk5zSA7z1GiFHvEkBooSsxZBiA9
	VDvYS7E4XtQEiZwoNPPwuqzVgC7dcsmVHQ9qr8io4waf9rfS0NcNHcb9/afGjW7si44y
	izRKkjkPlUQ8JPSl53l/qL8idbz/COzL0/BJnWykjO2nfM5POU8SbGoczf1bmPumWXKR
	Go7hFP0/hzs1DEqB/Hs4Jxs2qzfWMqwctfyGun+sLPRhhJV1xxw3A9eFO92ZdQNMev3q
	SjC5BfsB9AFcMNU1hTC/XaOCHUTcalNVEUQXa1oH8b/ZSem+aldGj/n10+QdBLd8RgRb
	obsA==
X-Gm-Message-State: ALyK8tJwMl5Rkn3W9J7yesVvFIUPNT+pebNkEgFvGnGRgfNCHYw2OR3Sh+H02XnaDpKgOg==
X-Received: by 10.55.130.1 with SMTP id e1mr19186971qkd.84.1468153645285;
	Sun, 10 Jul 2016 05:27:25 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 59sm1356879qtb.21.2016.07.10.05.27.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 05:27:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 08:27:16 -0400
Message-Id: <1468153637-19826-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/2] python-vobject: update to version 0.9.2
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
X-List-Received-Date: Sun, 10 Jul 2016 12:27:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-vobject_0.8.1c.bb     | 16 ----------------
 .../recipes-devtools/python/python-vobject_0.9.2.bb      | 10 ++++++++++
 2 files changed, 10 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
 create mode 100644 meta-python/recipes-devtools/python/python-vobject_0.9.2.bb

diff --git a/meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb b/meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
deleted file mode 100644
index a28c02f..0000000
--- a/meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Python package for parsing and generating vCard and vCalendar files"
-SECTION = "devel/python" 
-LICENSE = "Apache-2.0" 
-LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-HOMEPAGE = "http://vobject.skyhouseconsulting.com/" 
-SRCNAME = "vobject" 
-RDEPENDS_${PN} = "python python-dateutil"
-PR = "r4"
-
-SRC_URI = "http://vobject.skyhouseconsulting.com/${SRCNAME}-${PV}.tar.gz" 
-S = "${WORKDIR}/${SRCNAME}-${PV}" 
-
-inherit setuptools  
-
-SRC_URI[md5sum] = "c9686dd74d39fdae140890d9c694c076"
-SRC_URI[sha256sum] = "594113117f2017ed837c8f3ce727616f9053baa5a5463a7420c8249b8fc556f5"
diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
new file mode 100644
index 0000000..d5fd9db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Python package for parsing and generating vCard and vCalendar files"
+HOMEPAGE = "http://vobject.skyhouseconsulting.com/" 
+
+LICENSE = "Apache-2.0" 
+LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "ccf66aeb1c896d8c34ac62a8b4e7ecfb"
+SRC_URI[sha256sum] = "8b310c21a4d58e13aeb7e60fd846a1748e1c9c3374f3e2acc96f728c3ae5d6e1"
+
+inherit pypi setuptools
-- 
1.9.1


