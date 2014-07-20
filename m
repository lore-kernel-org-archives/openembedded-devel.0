Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 092D17036A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 17:00:16 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so5455229wgh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dQ25NC2ThXWYppJHC+CtLHRDMr0z05N5sjswfbcPVCU=;
	b=BraidE5pcOBVkGl1LAkwz34rJYLISSJcCHBCEnZLDrH1zDT2geMX4U8RAj3GnWiYGe
	oNR4+oa10VJiE9PIioPRLOdB9bUJ81wosVvT4+ezENAwkJN8kzWMytnD+0IWI9IjFtQh
	lja2dg8arJenS3pdVwWLzhNG+jSfEhY5Mj1B3yWSr0hYpV6zc049EA900gjP+Dg8J12G
	/stSF0Rl4LF43cG9rgvimAAgL/3q0su/pUMIDTtxEaZha5mPu1eYrGcbqPI4/iIf88/c
	IkgZi3qvfR6Z0vPi7WCPSY+ar87THM5Wkwf8WGvoKToc8k+aqhaU+nZmwjlVLkDsvhXH
	pPOg==
X-Received: by 10.180.183.131 with SMTP id em3mr50103412wic.56.1405875617404; 
	Sun, 20 Jul 2014 10:00:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l2sm30957768wjw.31.2014.07.20.10.00.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 10:00:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 19:00:26 +0200
Message-Id: <1405875626-8011-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405875626-8011-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405875626-8011-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 4/4] mkvtoolnix: upgrade to 7.0.0
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
X-List-Received-Date: Sun, 20 Jul 2014 17:00:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../mkvtoolnix/{mkvtoolnix_5.9.0.bb => mkvtoolnix_7.0.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-mkv/mkvtoolnix/{mkvtoolnix_5.9.0.bb => mkvtoolnix_7.0.0.bb} (88%)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_7.0.0.bb
similarity index 88%
rename from meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
rename to meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_7.0.0.bb
index 6c5be3a..bd752af 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_7.0.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis bzip2 lzo file ruby-native"
 
-SRC_URI = "http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-${PV}.tar.bz2"
-SRC_URI[md5sum] = "033621461ef8eb922fc1366e0a9a6f16"
-SRC_URI[sha256sum] = "d913f531331c3332d2fb334c872ea19bfea7293dfedc4bf33ae7162e4efcbde1"
+SRC_URI = "http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-${PV}.tar.xz"
+SRC_URI[md5sum] = "ddd5ce6288d2fdaa6b79cb6d7bfffb04"
+SRC_URI[sha256sum] = "2bbdf060e193d4a7f961f84d28b28d67d859be66e3f2cdf8ee4ae380f8d15725"
 
 inherit autotools-brokensep gettext
 
-- 
2.0.0


