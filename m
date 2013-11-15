Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id EA9FB6D769
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 20:45:21 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id c50so766302eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 12:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=xF1x4W+ajlINnRvOgkYbNKr4gsVfef/twWM/4Vmhh08=;
	b=sDGO0AfAXmrupB77i8ZbWYr8EsQvIcyzCKbF1XvOdU7QtdscSqPh+WJNQmZ9ivm7RK
	ZW2APX4BAaw/6d+0YT/A+h282aJkNGRm9NOIkrwmqSQX8LXxe8URiuuEwgZ75e4yNDtW
	RtRAEzUp5AqAaHhAYmqiQfz6yGaXOE71qjGnasExQoFd00fTDWnWO/Iv9AhoRkKfVuae
	tyem6yHnLKM892Hbmr6cDWMWeF1iYaGz60QlnHHG7H8+lABYsX1F7MX/IFAhXbvrThLd
	+YhyThfE1C2N40K9IFnTBH4JzWTWDMEZav/qTpYU5LbThRVOhyD+WAeQ7v5fJnLes4tn
	ap5Q==
X-Received: by 10.14.6.134 with SMTP id 6mr4600263een.66.1384548323349;
	Fri, 15 Nov 2013 12:45:23 -0800 (PST)
Received: from localhost.localdomain (p5B0A2F0F.dip0.t-ipconnect.de.
	[91.10.47.15])
	by mx.google.com with ESMTPSA id m54sm9752664eex.2.2013.11.15.12.45.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 12:45:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2013 21:45:09 +0100
Message-Id: <1384548309-29331-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384548309-29331-1-git-send-email-schnitzeltony@googlemail.com>
References: <1384548309-29331-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mpd: update to 0.18.4 and get sources from musicpd.org
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
X-List-Received-Date: Fri, 15 Nov 2013 20:45:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../musicpd/{mpd_0.17.1.bb => mpd_0.18.4.bb}                   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.17.1.bb => mpd_0.18.4.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
index 6f2a912..b89eb0e 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
@@ -5,15 +5,15 @@ HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 
 DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio"
 
-PR = "r4"
-
 SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
+    http://www.musicpd.org/download/${PN}/stable/${PN}-0.18.tar.xz \
     file://mpd.conf.in \
 "
 
-SRC_URI[md5sum] = "da3f3d6617a877192db4c6f53504cd38"
-SRC_URI[sha256sum] = "b18cdb1b779ca2ab323e212a0af4a567b7da4881a4e96868a8979bdfdbe7c2e8"
+SRC_URI[md5sum] = "0d881fb32f9d31afcdb0bb13cb78b9ab"
+SRC_URI[sha256sum] = "6b171985f192603150c879d105dc4d05d701ac60a2db41630a4dce823e068388"
+
+S = "${WORKDIR}/${PN}-0.18"
 
 inherit autotools useradd systemd
 
-- 
1.8.3.1


