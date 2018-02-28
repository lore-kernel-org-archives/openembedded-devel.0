Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3EA788B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 15:26:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 07:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="20997716"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2018 07:26:42 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id BC25358038F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 07:26:41 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 17:29:32 +0200
Message-Id: <1519831772-41479-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
References: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/5] gst-ffmpeg: remove leftover patch
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
X-List-Received-Date: Wed, 28 Feb 2018 15:26:41 -0000

Remove the following left-over patch from gst-ffmpeg package which was removed
earlier:
        lower-rank.diff

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../gstreamer-0.10/gst-ffmpeg-0.10.13/lower-rank.diff    | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/lower-rank.diff

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/lower-rank.diff b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/lower-rank.diff
deleted file mode 100644
index 5f08afe..0000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/lower-rank.diff
+++ /dev/null
@@ -1,16 +0,0 @@
-Lower the rank of ffmpeg plugin so codecs that hook into accelerated pieces (e.g. dsp or hw engines) can get picked over this
-Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
---- /tmp/gstffmpegdec.c	2009-03-05 09:31:15.000000000 +0100
-+++ gst-ffmpeg-0.10.6/ext/ffmpeg/gstffmpegdec.c	2009-03-05 09:33:09.000000000 +0100
-@@ -2588,7 +2588,7 @@
-       case CODEC_ID_MSMPEG4V3:
-       case CODEC_ID_H264:
-       case CODEC_ID_COOK:
--        rank = GST_RANK_PRIMARY;
-+        rank = GST_RANK_SECONDARY;
-         break;
-       case CODEC_ID_DVVIDEO:
-         /* we have a good dv decoder, fast on both ppc as well as x86. they say
-- 
2.4.0


