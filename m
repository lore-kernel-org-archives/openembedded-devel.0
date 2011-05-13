Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QKrlk-0003CS-HV
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 14:47:00 +0200
Received: from localhost.localdomain (79.51.85.13) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C06BF0171; Fri, 13 May 2011 14:44:13 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Fri, 13 May 2011 14:43:04 +0200
Message-Id: <1305290588-7057-6-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305290080.2448.3.camel@gnutoo-laptop>
References: <1305290080.2448.3.camel@gnutoo-laptop>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/12] xf86-video-omapfb: use newer srcrev(fix segmentation fault for bug20)
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
X-List-Received-Date: Fri, 13 May 2011 12:47:00 -0000

Without that fix Xorg go in segmentation fault when you insert the
  bugview module(the module that has an hdmi and vga output)

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/xorg-driver/xf86-video-omapfb_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xorg-driver/xf86-video-omapfb_git.bb b/recipes/xorg-driver/xf86-video-omapfb_git.bb
index fce8ff8..bd81264 100644
--- a/recipes/xorg-driver/xf86-video-omapfb_git.bb
+++ b/recipes/xorg-driver/xf86-video-omapfb_git.bb
@@ -2,7 +2,7 @@ require xorg-driver-video.inc
 DESCRIPTION = "X.Org X server -- OMAP display driver"
 PE = "1"
 PV = "0.1.1+${PR}+gitr${SRCREV}"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI = "git://git.pingu.fi/xf86-video-omapfb.git;protocol=http \
            file://0001-blacklist-tv-out.patch \
@@ -10,7 +10,7 @@ SRC_URI = "git://git.pingu.fi/xf86-video-omapfb.git;protocol=http \
            file://0003-force-plain-mode.patch \
           "
 
-SRCREV = "044617665d6737f4909aab96f91b06261dff05d2"
+SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF_armv7a = " --enable-neon "
-- 
1.7.0.4



