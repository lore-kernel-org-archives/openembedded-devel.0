Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QtYBl-0000ol-9a
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 06:57:13 +0200
Received: by wyf19 with SMTP id 19so461823wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 21:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oEloEkNUFDsXZkieasUmF5cbSQZj/0wAOw3KpdGWeGg=;
	b=NNvmwgvxYP57g2ume9f3/73fZ8vWxEDyi+OZyl4xhXJ67/5fl6WENNU9EURgYrSUIs
	k3xyNssyia/KKcbOwNuiWU0QMoCseQZCpypS2hpxySvklpDAbTrsFvGa8ILXc1n63krl
	blmKoTn2noQJRUqejDCFC9fPlPxwt9DNU+Eig=
Received: by 10.216.80.96 with SMTP id j74mr397629wee.72.1313556755483;
	Tue, 16 Aug 2011 21:52:35 -0700 (PDT)
Received: from localhost.localdomain (70.pool85-50-85.dynamic.orange.es
	[85.50.85.70])
	by mx.google.com with ESMTPS id p49sm492690weq.31.2011.08.16.21.52.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 21:52:34 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2011 06:51:55 +0200
Message-Id: <1313556715-28652-2-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1313556715-28652-1-git-send-email-pespin.shar@gmail.com>
References: <1313556715-28652-1-git-send-email-pespin.shar@gmail.com>
Subject: [PATCH 2/2] enjoy: make it work with shr-core
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
X-List-Received-Date: Wed, 17 Aug 2011 04:57:13 -0000

* added LIC_FILES_CHKSUM
* added virtual/gettext as it seems it is needed now (it didn't build fine without it)
* RDEPENDS: added new gstreamer module gst-plugins-good-autodetect needed for enjoy to be able to play files
* RDEPENDS: updated all other module names because they changed in shr-core

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index eab81b4..c6394c7 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -5,7 +5,10 @@ SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
 PR = "r4"
 
-DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0f507c68d42d1cc0fcb507d007112bf2"
+
+
+DEPENDS += "virtual/gettext gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
 
 #1st needed for all formats
 #2nd needed for mp3 playback
@@ -13,10 +16,10 @@ DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '
 #4th needed for flac playback
 #5th needed binary to create db
 RDEPENDS += "\
-	gst-plugin-typefindfunctions gst-plugin-playbin gst-plugin-volume gst-plugin-decodebin2  \
-	${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad gst-plugin-id3demux', d)} \
-	gst-plugin-ogg gst-plugin-ivorbisdec \
-	gst-plugin-flac \
+	gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 gst-plugins-good-autodetect \
+	${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \
+	gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
+	gst-plugins-good-flac \
 	lightmediascanner-test \
 	"
 
-- 
1.7.6



