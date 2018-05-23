Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2B50A745A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 20:46:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4NKkQUD007808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 13:46:26 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 May 2018 13:46:25 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 May 2018 13:46:25 -0700
Message-ID: <20180523204625.48883-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] opencv: Work around deprecated ffmpeg functions
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
X-List-Received-Date: Wed, 23 May 2018 20:46:25 -0000
Content-Type: text/plain

The ffmpeg no longer makes use of the AVFMT_RAWPICTURE format, but
opencv still has code in it for dealing with this type of exported
format.  For now it is easier to work around it and allow the code to
compile and it will just not get used.  A future version of OpenCV
will remove the AVFMT_RAWPICTURE handler.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 ...-work-around-deprecated-ffmpeg-RAW-functi.patch | 33 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.3.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
new file mode 100644
index 000000000..63cb7f943
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
@@ -0,0 +1,33 @@
+From 7d31f41d2a6759e244983504ce855fc32916b97a Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Wed, 9 May 2018 13:33:59 -0700
+Subject: [PATCH] Temporarliy work around deprecated ffmpeg RAW function
+ compile failure until next uprev
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+---
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index 5a9b10f075..97c6b74b07 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -667,6 +667,14 @@ struct ImplMutex::Impl
+ 
+ #endif
+ 
++/* NOTE This is deprecated in ffmpeg and the code should be removed */
++#ifndef AVFMT_RAWPICTURE
++#define AVFMT_RAWPICTURE	0x0020
++#endif /* AVFMT_RAWPICTURE */
++#ifndef CODEC_FLAG_GLOBAL_HEADER
++#define CODEC_FLAG_GLOBAL_HEADER	AV_CODEC_FLAG_GLOBAL_HEADER
++#endif
++
+ void ImplMutex::init()
+ {
+     impl = new Impl();
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index ca62de7c8..b697f44d1 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -60,6 +60,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://javagen.patch \
     file://protobuf.patch \
     file://already-exists.patch \
+    file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
 "
 PV = "3.3+git${SRCPV}"
 
-- 
2.11.0


