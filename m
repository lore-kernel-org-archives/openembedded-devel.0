Return-Path: <zarelaky@hotmail.com>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Dec 2014 07:36:58 UTC
Received: from BLU004-OMC1S8.hotmail.com (blu004-omc1s8.hotmail.com
	[65.55.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id E9697726FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 07:36:58 +0000 (UTC)
Received: from BLU436-SMTP41 ([65.55.116.9]) by BLU004-OMC1S8.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Wed, 17 Dec 2014 23:31:15 -0800
X-TMN: [U4VBQ94tpg4JkIM5zGZrbbPAC0JNa+op]
X-Originating-Email: [zarelaky@hotmail.com]
Message-ID: <BLU436-SMTP4129F4BFDE9BD77A38C70EDC6A0@phx.gbl>
From: MingTao Qu <zarelaky@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 15:31:08 +0800
X-Mailer: git-send-email 2.2.0
X-OriginalArrivalTime: 18 Dec 2014 07:31:13.0794 (UTC)
	FILETIME=[9A2E1E20:01D01A94]
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [meta-qt5][PATCH] qtmultimedia: Fix crash when use Gstreamer 0.10 plugin
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
X-List-Received-Date: Thu, 18 Dec 2014 07:37:01 -0000
Content-Type: text/plain

In QVideoSurfaceGstSink::get_caps(), when use 0.10 version Gstreamer,
It create GstCap with a wrong type (G_TYPE_STRING) of parameter 'format',
a g_strcpy exception will be found.
This patch fixes the parameter type to use GST_TYPE_FOURCC as expacted.

Signed-off-by: Mingtao Qu <zarelaky@hotmail.com>
---
 .../qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index c32ddaf..09c4444 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1321,7 +1321,7 @@ index 81d5f60..51c4107 100644
 +#if GST_CHECK_VERSION(1,0,0)
 +                    "format"   , G_TYPE_STRING, gst_video_format_to_string(qt_yuvColorLookup[index].vfmt),
 +#else
-+                    "format"   , G_TYPE_STRING, qt_yuvColorLookup[index].fourcc,
++                    "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
 +#endif
                      NULL));
              continue;
-- 
2.2.0


