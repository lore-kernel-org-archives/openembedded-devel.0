Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9F70C70A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:29 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so6922810wev.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DAo8/8x7JB7uo43ajY/O9MvMdwPpFBeW7m+mfi3YpiE=;
	b=lrHieU7mAjO7245H+14ZyA+MnkvZoblDF25aJyCCAsUqbyuBPSsmOAz85S5P62YP2g
	RT+hRa+t6aBNTPqZXoHB8OY65ZBqW4QHAfBrGjRzEaN9m/JBzaDRxZ8SwMZ39vJ/gOv3
	pLXDPN+vdQVmqSDk+YXHuyc82MpLuB0ZAeHY8D5HpmMB9G3VHKnaGUVEZTd3oYM671Gf
	nefYGGd9wkik4HbRQyodtpYlDewVSoH2Hsnw4x5deiHTG6rzxgFUL++/XUk4PKe3TRhM
	w0zw87za0TD5U76DWvzh+c8u9RegkB13daXSXkdsqc+TbOrR6qT3SO4HHKN/nYTnlKb5
	Z5bA==
X-Received: by 10.180.12.76 with SMTP id w12mr11551482wib.4.1407600510682;
	Sat, 09 Aug 2014 09:08:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm20418432wic.17.2014.08.09.09.08.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:24 +0200
Message-Id: <1407600537-10857-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/36] mpd: add all floating dependencies
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:31 -0000

* fixes following floating dependencies:
  mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda
    libcdio-paranoia libjack libmms libmodplug libopus libwrap mpg123
    openal-soft wavpack
    yajl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
index fee5740..a2410ce 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://www.musicpd.org"
 
-DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio"
+DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug"
 
 SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/stable/${BP}.tar.xz \
-- 
2.0.4


