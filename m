Return-Path: <ashcharles@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id AFAC76AC33;
	Mon, 23 Mar 2015 16:05:58 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so191803566pdb.1;
	Mon, 23 Mar 2015 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WAeGKxjSaQAA0bCvsXdriWQjUa/LLgn/XfnBw+fst5k=;
	b=ZCMWNp/bkZocSvXxQNnblZJv/WR+CiW6hT7WflkExKn2mdHV+tfZ72T7jAojNbakwF
	kwrS13RnZNkp+tfvprqVfXPcg8lsfNdXlMnMDCTr1anQluSXphQAjk/D+V+nNUMKQfLM
	dMFRRG6DKTMD2+2n3/8ik3wEEdMPAGjxuq7VPBnr+m3f4gNwbNXJYQ+QcZtHw8ATqThw
	uhZZlqitn60nZlEHE8HTd8xSUtvrp+RyFNWRwLISDUfbpQUtBGL5jBkqIY2Csxsdf0P7
	hy919rUXGAxQQFcUbGUlxXlX9RbFDSnvrPxHwZZvr/P9l9ep9KVr0eWfNXWYdb5tl/t2
	KANQ==
X-Received: by 10.68.220.227 with SMTP id pz3mr22174236pbc.72.1427126759229;
	Mon, 23 Mar 2015 09:05:59 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by mx.google.com with ESMTPSA id jy9sm1465686pbc.31.2015.03.23.09.05.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Mar 2015 09:05:58 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: martin.jansa@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2015 09:05:57 -0700
Message-Id: <1427126757-16368-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <20150321153245.GK4738@jama>
References: <20150321153245.GK4738@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: [PATCH] mpd: Add build dependency on samba
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
X-List-Received-Date: Mon, 23 Mar 2015 16:05:59 -0000

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
index feec985..b3d88e0 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://www.musicpd.org"
 
-DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu dbus expat zlib"
+DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu dbus expat zlib samba"
 
 SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
-- 
2.1.0


