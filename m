Return-Path: <mario.goulart@gmail.com>
X-Greylist: delayed 381 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 May 2014 13:04:26 UTC
Received: from mail-yh0-f44.google.com (unknown [209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id A3C0D6B438
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 13:04:25 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id b6so6378809yha.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 06:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=nncfiwlgmT6xtSA7twtkTR/JOrXjKIxvhUOTon+z9+E=;
	b=jGK4XoOMzBNo1p+20M7oS9wJUeLjIiYHFMolTXKYG+KrCHwJrxp8P7XZO9wuGh1Oo4
	aJnJFSNvuo9V2aIKa+ROIUu33nyh76gp3PIAbgMGe6JSnkGu9oldIkuIqWiYR+qe1eqR
	OguOmKyaWdonvV6J2nkPNt+vNqZzoV2EYuVSrVeDQsB2kTCb05gx6tONICHX1CnLd08s
	D4OWUwC9yDdY01getbg3uyUIJgBkIXmv+VZQudORmQB3hlcKvxGa3nfdAegX/e6erAsc
	fVus4WiSR5aEny2QBh8KD8/SFavQmqqL0mroupuieQ4pXDQqwxyx9r2jSxWBYnKBRZyH
	CwJA==
X-Received: by 10.236.55.201 with SMTP id k49mr14162628yhc.105.1401109086186; 
	Mon, 26 May 2014 05:58:06 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	t27sm17809473yho.55.2014.05.26.05.58.04 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 05:58:05 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 09:57:42 -0300
Message-Id: <1401109064-30223-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 1/3] leptonica: add recipe for version 1.7.0
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
X-List-Received-Date: Mon, 26 May 2014 13:04:27 -0000

Leptonica is required by tesseract.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
new file mode 100644
index 0000000..6d57da7
--- /dev/null
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A pedagogically-oriented open source site containing software that is broadly useful for image processing and image analysis applications"
+DEPENDS = "jpeg tiff libpng zlib libungif"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=20cdd3af097ca431b82004c691f406a6"
+
+SRC_URI = "http://leptonica.com/source/leptonica-${PV}.tar.gz"
+SRC_URI[md5sum] = "5ac2a31cf5b4f0e8f5a853a5266c42ef"
+SRC_URI[sha256sum] = "d3d209a1f6d1f7a80119486b5011bc8c6627e582c927ab44ba33c37edb2cfba2"
+
+EXTRA_OECONF += " \
+    --without-libwebp \
+"
+
+inherit autotools pkgconfig
-- 
1.7.10.4


