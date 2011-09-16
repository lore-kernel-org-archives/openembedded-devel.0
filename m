Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Sc2-0000Wp-7q
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 09:13:26 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1430885fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 00:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6jR24+wjrQXpiyBsVP0eiJ/KD6ZJZSH96qk55Syqb8E=;
	b=HLU0p7s+tYhdFFds1/7gEyJhmWvtQPx0rW6+4lgdJOmwmc1lpOako6N+Yn0Eu6+4Pn
	ORiGHA2nlOVomNLy0XI6LN7L36lSwaOdFmoMISE+Z/YCowvdmAO6KsMTY/xVp+NGofPW
	6gCw0oHeNwDZMWzLCf0f3BNqsa0dRLyayNONw=
Received: by 10.223.9.69 with SMTP id k5mr2472824fak.62.1316156896179;
	Fri, 16 Sep 2011 00:08:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m26sm3021241fac.6.2011.09.16.00.08.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 00:08:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 09:07:50 +0200
Message-Id: <4660f71cdc38b0cd9563d28a8d56caef5536f0e3.1316156827.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <11e808e3b3307d12b7c6c8f02a9bd4d7a0a14da6.1316156827.git.Martin.Jansa@gmail.com>
References: <11e808e3b3307d12b7c6c8f02a9bd4d7a0a14da6.1316156827.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316156827.git.Martin.Jansa@gmail.com>
References: <cover.1316156827.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] enjoy: Update gstreamer package names in RDEPENDS
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
X-List-Received-Date: Fri, 16 Sep 2011 07:13:26 -0000

From: pespin <pespin.shar@gmail.com>

* we'll update gstreamer package names again as soon as gstreamer
  packaging is improved in oe-core

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 90eb318..d2f6b03 100644
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
+       gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 \
+       ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \
+       gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
+       gst-plugins-good-flac \
+       lightmediascanner-test \
+       "
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
-- 
1.7.6.1



