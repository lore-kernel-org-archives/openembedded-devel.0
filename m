Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6321D60601
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 16:40:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Oct 2014 09:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,776,1406617200"; d="scan'208";a="624095791"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 23 Oct 2014 09:40:55 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Oct 2014 19:40:29 +0300
Message-Id: <1414082432-14111-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
References: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
Cc: Cristian Iorga <ubik3000@gmail.com>
Subject: [PATCH 1/3] mpd: fix fetch failure for 0.18.x
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
X-List-Received-Date: Thu, 23 Oct 2014 16:40:58 -0000

From: Cristian Iorga <ubik3000@gmail.com>

MPD stable download location will contain only the latest
stable branch, so fetch will not work in case of an older
OE recipe. i.e., mpd 0.18.x recipe will no longer work
after 0.19 branch is released (as it is the case now).

Signed-off-by: Cristian Iorga <ubik3000@gmail.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
index a2410ce..997a421 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
@@ -6,7 +6,7 @@ HOMEPAGE ="http://www.musicpd.org"
 DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug"
 
 SRC_URI = " \
-    http://www.musicpd.org/download/${BPN}/stable/${BP}.tar.xz \
+    http://www.musicpd.org/download/${BPN}/0.18/${BP}.tar.xz \
     file://mpd.conf.in \
 "
 
-- 
1.9.1


