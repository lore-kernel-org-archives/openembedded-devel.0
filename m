Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id EE6766CFF9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2013 12:53:59 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so2983079eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2013 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8g5aY5jXhgtExFaINE8Q9oOF7UGHf/BqCsfEn3RVilQ=;
	b=RqssU1ML9p2UGAU6/MqWLKzlntCu6PWPgzcUX4HaGcZxBL1cAS/vPXBmjJ09K2+vKW
	dAkoFRH5sRpt2FrZoNCuV05ivsULpY2+dHeFLSMxef35zzEAvdpIWDH+OP3zDDaUDcDx
	HkfaDGQI1kw24+co9lRsSnf8qFrfvV/xIHlpDisNPwgf13IYXJRVA+g//sTao/9unhxo
	EFcjDhg+NXp7hSYmnUgmnv9olHe8VcxB194OosLSjMoyKjopKty7WPP93FoK646SCv0s
	+SUpAlXhxeAsYST09W8kzC/FkybO3u1g0HODyOMdXGoWBkN5vf0327GunW57WHlaqVdx
	sH/g==
X-Received: by 10.15.48.67 with SMTP id g43mr16399108eew.17.1382273641478;
	Sun, 20 Oct 2013 05:54:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-36.net.upcbroadband.cz. [62.24.80.36])
	by mx.google.com with ESMTPSA id b42sm30335267eem.9.2013.10.20.05.54.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 05:54:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Oct 2013 14:53:52 +0200
Message-Id: <1382273632-10984-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1382273632-10984-1-git-send-email-Martin.Jansa@gmail.com>
References: <1382273632-10984-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-multimedia][PATCH 2/2] bigbuckbunny: Don't use whole avi in LIC_FILES_CHKSUM and add version
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
X-List-Received-Date: Sun, 20 Oct 2013 12:54:00 -0000

* it's causing huge deploy/licenses files:
  211M    deploy/licenses/bigbuckbunny-480p
  317M    deploy/licenses/bigbuckbunny-720p
  886M    deploy/licenses/bigbuckbunny-1080p
  and avi checksum is already verified by SRC_URI checksums

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb          | 5 +++--
 .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb           | 5 +++--
 .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb           | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index 93a52c0..e49b472 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Big Buck Bunny movie - 1080P"
-LICENSE = "CC-BY"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/big_buck_bunny_1080p_surround.avi;md5=223991c8b33564eb77988a4c13c1c76a"
+LICENSE = "CC-BY-3.0"
+# http://www.bigbuckbunny.org/index.php/about/
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
 SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_surround.avi"
 SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
index 31a90ca..84f3259 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Big Buck Bunny movie - 480P"
-LICENSE = "CC-BY"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/big_buck_bunny_480p_surround-fix.avi;md5=ed7ed01e9aefba8ddd77c13332cec120"
+LICENSE = "CC-BY-3.0"
+# http://www.bigbuckbunny.org/index.php/about/
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
 SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_480p_surround-fix.avi"
 SRC_URI[md5sum] = "ed7ed01e9aefba8ddd77c13332cec120"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
index 61cdfdc..810e05f 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Big Buck Bunny movie - 720P"
-LICENSE = "CC-BY"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/big_buck_bunny_720p_surround.avi;md5=0da8fe124595f5b206d64cb1400bbefc"
+LICENSE = "CC-BY-3.0"
+# http://www.bigbuckbunny.org/index.php/about/
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
 SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_surround.avi"
 SRC_URI[md5sum] = "0da8fe124595f5b206d64cb1400bbefc"
-- 
1.8.4


