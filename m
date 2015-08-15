Return-Path: <andreas.baak@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id B3A9460043
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 20:56:09 +0000 (UTC)
Received: by wijp15 with SMTP id p15so45993491wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 13:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=w6MV5GRO7uwLlYL/iCV6xo9vRBiQEexZ9SXCrNwrAvM=;
	b=EDojF8/lIR1hUBz4Obd+EnaBb8qEaD2YHb1NrRcICDeUg6yDqBvXEwbsQh2m6X0LIo
	L7PNHMehzFHagdqyZBT8giuslyy/lzLyAWFzNR2dXv4vS+7KkI5ZFOYuoAQGVdinSrzZ
	oUtS+XPE3nIyrJoR5SSnzzZ+o7xFn/ZmUxq8MhvjPmcCbHhunr+ovBxmFBx9zmlsGRjp
	xB3ZNtFvZ0ZCOI+9CBuS7wagHbptDgbUlYfZzLlvVrcxudw1FaJoyCmnn0ZF5yXHNjv3
	v3TzHIlxYCdl7PpAsaZYzHyQr5vxMqhNoOtuO33RwNMJ58/32nAyfUbRFfIHAwnTKY12
	Cn1g==
X-Received: by 10.180.107.34 with SMTP id gz2mr19594143wib.77.1439672169553;
	Sat, 15 Aug 2015 13:56:09 -0700 (PDT)
Received: from localhost.localdomain
	(dslb-088-064-113-036.088.064.pools.vodafone-ip.de. [88.64.113.36])
	by smtp.gmail.com with ESMTPSA id
	pn6sm14398168wjb.36.2015.08.15.13.56.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Aug 2015 13:56:08 -0700 (PDT)
From: Andreas Baak <andreas.baak@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Aug 2015 22:55:33 +0200
Message-Id: <1439672133-24167-1-git-send-email-andreas.baak@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Andreas Baak <andreas.baak@gmail.com>
Subject: [meta-oe][meta-efl][PATCH] epeg: Move tool out of efl + update to latest version
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
X-List-Received-Date: Sat, 15 Aug 2015 20:56:11 -0000

The epeg tool was originally developed in the efl project
and was replaced by the evas package in efl long ago. The old,
unmaintained source code of epeg is still available from
an efl legacy repository https://svn.enlightenment.org/svn/e/OLD/.

Updates and improvements to epeg have been developed and collected
in a new github repository. This patch deletes the deprecated
package from the efl project and introduces a new recipe
that installs the updated epeg tool.

In the license file, one copyright line has been added which
indicates the authors of the tool.
Moreover, in the license text, one sentence has been removed
which elaborated on what is meant by "making the source code
available publicly". However, the license still remains
an MIT style license.

Signed-off-by: Andreas Baak <andreas.baak@gmail.com>
---
 meta-efl/recipes-efl/efl/epeg_svn.bb     | 12 ------------
 meta-oe/recipes-support/epeg/epeg_git.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/epeg_svn.bb
 create mode 100644 meta-oe/recipes-support/epeg/epeg_git.bb

diff --git a/meta-efl/recipes-efl/efl/epeg_svn.bb b/meta-efl/recipes-efl/efl/epeg_svn.bb
deleted file mode 100644
index 1b24d91..0000000
--- a/meta-efl/recipes-efl/efl/epeg_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Epeg is a small library for handling thumbnails"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
-                    file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
-
-DEPENDS = "jpeg"
-PV = "0.9.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit efl
-SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-oe/recipes-support/epeg/epeg_git.bb b/meta-oe/recipes-support/epeg/epeg_git.bb
new file mode 100644
index 0000000..8fe19b5
--- /dev/null
+++ b/meta-oe/recipes-support/epeg/epeg_git.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Epeg is a small library for handling thumbnails"
+DESCRIPTION = "Insanely fast JPEG/ JPG thumbnail scaling with the minimum fuss and CPU overhead. It makes use of libjpeg features of being able to load an image by only decoding the DCT coefficients needed to reconstruct an image of the size desired."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e7732a9290ea1e4b034fdc15cf49968d \
+                    file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
+DEPENDS = "jpeg libexif"
+
+SRC_URI = "git://github.com/mattes/epeg.git"
+SRCREV = "d78becc558a682f1be0a78b1af90d1b4a08e5b4e"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
-- 
1.9.1


