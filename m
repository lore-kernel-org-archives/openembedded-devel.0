Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QvbSM-0004n9-TV
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:50:51 +0200
Received: by wyf19 with SMTP id 19so4033077wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=nPesZ2GkVuDCoeBebywvlCuwa2+cwaCoMFlkip5AAac=;
	b=k+BKJaHMnJLbWyd/NSKO62RqHbbUl0sqMj22R23RYoFkTvpVW8DrYw3EaQaV7WnCs3
	A3WtdMdijCUnBNyE6AEhkfYjjHls0tvEYdPnKgDWIc/OEqLjz7zM/lpHMoC9glsiej+b
	bhW13VVGuT0W8F4NhZZSreD8didEQ36zYVJhk=
Received: by 10.216.169.211 with SMTP id n61mr2492891wel.83.1314045966601;
	Mon, 22 Aug 2011 13:46:06 -0700 (PDT)
Received: from localhost.localdomain (169.pool85-50-86.dynamic.orange.es
	[85.50.86.169])
	by mx.google.com with ESMTPS id j11sm4192267wed.18.2011.08.22.13.46.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:46:05 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:45:07 +0200
Message-Id: <1314045908-21970-3-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1314045908-21970-1-git-send-email-pespin.shar@gmail.com>
References: <1314045908-21970-1-git-send-email-pespin.shar@gmail.com>
Subject: [meta-efl][PATCH 3/4] enjoy: Update gstreamer package names in RDEPENDS
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
X-List-Received-Date: Mon, 22 Aug 2011 20:50:51 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
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
1.7.6



