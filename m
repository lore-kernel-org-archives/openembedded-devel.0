Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id A81737018F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:34:19 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hy4so11532734vcb.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=zGuG9hjYuD7Mi1AtJsp1CvsSoBNK8/ndk5M8Z0XpHXI=;
	b=iQ3ZjoN7NLjOSTRIlt08hK7CaXrrDhzu2/8YnfQmG/PaGW4w8LafWOWIpxhsaDmf4j
	3JJgz6Inbf1giCVK1Mg0pukNckoAXwI4gZtpWywmzlBVrgkaCorSHu4T4ki6a9DR8Eln
	mKBgmHPGTUBqP4d2MiMeW0IQ+AHR7vePc3TnPSUDzHF13nRqS7CbUGitTObTsU/P9m9F
	b8GZt3HoRiMBnK7tSlCuiP55nwweZHXkBbH/RtborYnd56Mo1CSynCZttBXL7ayaWohY
	TCGXVUsk+J3ywt2/IZe25yABehRhQfo3OvlzsEAGeqUCEFA20YpJdRg2oiB2BcPNhi01
	o5rw==
X-Received: by 10.52.101.168 with SMTP id fh8mr39377762vdb.34.1406568860706;
	Mon, 28 Jul 2014 10:34:20 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id n7sm7055043ven.1.2014.07.28.10.34.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jul 2014 10:34:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 657C41C23C158; Mon, 28 Jul 2014 14:34:16 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jul 2014 14:34:15 -0300
Message-Id: <1406568855-6589-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] xf86-video-geode: Update to 2.11.16
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
X-List-Received-Date: Mon, 28 Jul 2014 17:34:21 -0000

This release includes the patch needed for Xorg 1.15 support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xf86-video-geode/xf86SetModeDefaultName.patch      | 18 ------------------
 ...eo-geode_2.11.15.bb => xf86-video-geode_2.11.16.bb} |  6 ++----
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-geode_2.11.15.bb => xf86-video-geode_2.11.16.bb} (60%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch
deleted file mode 100644
index b3e6109..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-The latest driver corrected a number of issues and compiles without
-warnings with just one patch.  The header included by the given patch
-is already included in the geode master line, so will not be be
-required after the next geode version release.
-
-Upstream-Status: Backport
-
-diff -up xf86-video-geode-2.11.14/src/geode_dcon.c.jx xf86-video-geode-2.11.14/src/geode_dcon.c
---- xf86-video-geode-2.11.14/src/geode_dcon.c.jx	2012-11-24 05:01:15.000000000 -0500
-+++ xf86-video-geode-2.11.14/src/geode_dcon.c	2013-10-25 16:19:35.950234174 -0400
-@@ -29,6 +29,7 @@
- 
- /* Includes that are used by all drivers */
- #include <xf86.h>
-+#include <xf86Modes.h>
- #include <xf86_OSproc.h>
- #include <compiler.h>
- 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
similarity index 60%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
index 07d2d9b..4e8df46 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
 SUMMARY = "X.org server -- Geode GX2/LX display driver"
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "7dafd19e274c771539b6d4d459423ccf"
-SRC_URI[sha256sum] = "00db3bd697b32286eb0e42f5dbd7fcc8d7255dd11c299b1ee16a06a244868ff0"
-
-SRC_URI += "file://xf86SetModeDefaultName.patch"
+SRC_URI[md5sum] = "35fa387f6a33f6b22a56ce4bda424392"
+SRC_URI[sha256sum] = "38fc1f55e29fb7985b90c9021a4b7e5295d42888bd669174f42f3b7f681fc1a7"
 
 COMPATIBLE_HOST = "i.86.*-linux"
 
-- 
2.0.1


