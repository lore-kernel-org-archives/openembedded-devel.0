Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mporter@ti.com>)
	id 1QCfhB-0004Xx-9K; Thu, 21 Apr 2011 00:16:26 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3KM8r8e024931
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 20 Apr 2011 17:08:53 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p3KM8rbG028189;
	Wed, 20 Apr 2011 17:08:53 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3KM8rEV018873;
	Wed, 20 Apr 2011 17:08:53 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE73.ent.ti.com
	(157.170.170.88) with Microsoft SMTP Server id 8.3.106.1;
	Wed, 20 Apr 2011 17:08:35 -0500
Received: from beef.ohporter.com (h56-39.vpn.ti.com [172.24.56.39])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3KM8qbi012948;
	Wed, 20 Apr 2011 17:08:52 -0500
From: Matt Porter <mporter@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Apr 2011 18:00:06 -0400
Message-ID: <1303336806-30682-1-git-send-email-mporter@ti.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH][2011.03-maintenance] ffmpeg: switch to libav
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2011 22:16:27 -0000
Content-Type: text/plain

From: Koen Kooi <koen@openembedded.org>

cherry-picked Koen's mainline libav patch to fix invalid git.ffmpeg.org repo

Signed-off-by: Koen Kooi <koen@openembedded.org>
Signed-off-by: Matt Porter <mporter@ti.com>
---
 recipes/ffmpeg/ffmpeg_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ffmpeg/ffmpeg_git.bb b/recipes/ffmpeg/ffmpeg_git.bb
index d84653a..57b2c31 100644
--- a/recipes/ffmpeg/ffmpeg_git.bb
+++ b/recipes/ffmpeg/ffmpeg_git.bb
@@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_angstrom = "1"
 DEFAULT_PREFERENCE_shr = "1"
 
-SRC_URI = "git://git.ffmpeg.org/ffmpeg.git;protocol=git"
+SRC_URI = "git://git.libav.org/libav.git;protocol=git"
 
 S = "${WORKDIR}/git"
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
-- 
1.7.1



