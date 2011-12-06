Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrth-0004Wz-6d
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:05:14 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pMlkj34sfF7cWsY5K4Y09aBdDv+vz7XFAOBk1mwvDDI=;
	b=G/oxa2nbEeVc2ji1FTBlyh7jtFxb6FBclDOKcV1Ew3SwzfNSXXAtyAPGn0lRRQi0ad
	sG16FCHh+txZUoq9wD5TutKS/v6pojjnSpkB9bPi8oF1y1ysYYSSt3IJbLEVOhZausX7
	eKg2OtxM3YhWl7yc7jxIVNS1kmcJa+Ud+HcKk=
Received: by 10.213.17.208 with SMTP id t16mr1738022eba.117.1323165507840;
	Tue, 06 Dec 2011 01:58:27 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm69318633eea.6.2011.12.06.01.58.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:58:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:08 +0100
Message-Id: <3d3a0f333645bb978ee87f3e5dd8cd6942e3cf69.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 09/16] enjoy: Update gstreamer package names in RDEPENDS
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
X-List-Received-Date: Tue, 06 Dec 2011 10:05:14 -0000

From: pespin <pespin.shar@gmail.com>

* I know there is plan to change gstreamer packaging in oe-core to match
  package names from OE-classic, but this patch is here for more then 3
  months and there is no good reason to keep enjoy broken in meta-efl
  master!
* we'll update gstreamer package names again as soon as gstreamer
  packaging is improved in oe-core
* Add gst-plugins-good-autodetect to RDEPENDS
  This plugin is needed in newer versions of enjoy. The app won't play any sound files without this plugin.

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 78020c1..5c7d09b 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -14,12 +14,12 @@ DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '
 #4th needed for flac playback
 #5th needed binary to create db
 RDEPENDS += "\
-	gst-plugin-typefindfunctions gst-plugin-playbin gst-plugin-volume gst-plugin-decodebin2  \
-	${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad gst-plugin-id3demux', d)} \
-	gst-plugin-ogg gst-plugin-ivorbisdec \
-	gst-plugin-flac \
-	lightmediascanner-test \
-	"
+       gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 gst-plugins-good-autodetect \
+       ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \
+       gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
+       gst-plugins-good-flac \
+       lightmediascanner-test \
+       "
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
-- 
1.7.8



