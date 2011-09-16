Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Sd7-0000Wp-2T
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 09:14:33 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1430885fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TqiSK1SskILgUhP+3HznVocOkB0DOHFxAdr9I40q1vc=;
	b=wC1TJRJe3fndiY2DwrzdMNkS24/O8AQK3Nycmd5s1yjojOicd0aDkajPIFDb+1YCsU
	93/FMdQ1Hvv+RJfOdHGPT75eWuOdTmZ+Qe34fglWxW+VozDb85i8kFhP+3jYIJOcCGos
	QdAqZi0Q5JsDyWyke+/Y5pKySKn6aJWvMOTBs=
Received: by 10.223.101.2 with SMTP id a2mr871724fao.2.1316156963014;
	Fri, 16 Sep 2011 00:09:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w6sm9510469fah.0.2011.09.16.00.09.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 00:09:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 09:08:49 +0200
Message-Id: <883d50c9ae48d25cb4b67550a33152dc98502240.1316156746.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <11e808e3b3307d12b7c6c8f02a9bd4d7a0a14da6.1316156746.git.Martin.Jansa@gmail.com>
References: <11e808e3b3307d12b7c6c8f02a9bd4d7a0a14da6.1316156746.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316156746.git.Martin.Jansa@gmail.com>
References: <cover.1316156746.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 4/4] enjoy: Add gst-plugins-good-autodetect to RDEPENDS
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
X-List-Received-Date: Fri, 16 Sep 2011 07:14:33 -0000

From: pespin <pespin.shar@gmail.com>

* This plugin is needed in newer versions of enjoy. The app won't play any sound files without this plugin.

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index d2f6b03..8c4d4c2 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -14,7 +14,7 @@ DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '
 #4th needed for flac playback
 #5th needed binary to create db
 RDEPENDS += "\
-       gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 \
+       gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 gst-plugins-good-autodetect \
        ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \
        gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
        gst-plugins-good-flac \
-- 
1.7.6.1



