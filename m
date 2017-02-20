Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 59F1871DEC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so15747859wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9dyEBwgq7s4NezlOjMn7XMfWgUUO9/lvCr2V0OHDIoc=;
	b=EKG/D8oCg99iDgw3GeVggKHepBGRE76/K5YJnZUYS0r6N8xl2zhC3hqN1Dd+9u6QsJ
	VrxeiUHT+HVBgOKuuzs0d3CxaWo5F4jDwDCnxuhX1LLQ0qdLNvrxo/poayycAKVoUkXw
	Oh8h9xMzUfNTqV0Gyq6rrfQPyn3mP93tvejVPxU2pRIVudY3Kei5puzAc8Dw9Pyx/iID
	QbVyVUPWVehUJklumjljS2BXMnb+la3ywOgdhX8ccZDcNKcpeS8SV6nAmLLNufeTkPIl
	1nzb8RGcOdc7fb8/0m45MOtx2T6vGe/ShjmuDknGqKY7MKxVfbB5nUrfRzvVoUOynEB/
	TMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9dyEBwgq7s4NezlOjMn7XMfWgUUO9/lvCr2V0OHDIoc=;
	b=XClh1YYvwU6Hxn0ZPaPyP6g3+NRLfoDnQk+FZg7GHPSEeW2TtW4JfM4OvXmPWWC6i5
	vHijsIyK/vdQtKmQtan+ivBtMWZTSAayGnoLnal/vnfpyOqeF8j/HyqrDOQadA0/qQHh
	lZlP+CrextGtQCEMzDOBRccjQEwvnpzXPzeQncwXW5PaqZplvucZz3SAE2YK8MYphXNV
	LFAKNc6/uMxN0Dvlr/dsBXTjRdYyvxRTs6BQXHXf3DlbYKG13B8+oBgUIeJrBP+M4q+E
	mNQNJVNcNGzGNo2NlkT6gvRmwhNGvGpiIJc6MZFnl3Bl7IOx4HlbzL7FcvuEtRhmZVe3
	VbVQ==
X-Gm-Message-State: AMke39mT0F7Ko4qzuySe/+0cJ6yNKLe114p/3D91xC9HTxgp4huijfwogyH+/Ug9ekWY4A==
X-Received: by 10.28.142.16 with SMTP id q16mr20373251wmd.78.1487614044276;
	Mon, 20 Feb 2017 10:07:24 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:24 +0100
Message-Id: <20170220180700.29836-9-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/44] mpd: rework DEPENDS and unblacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 18:07:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To be honest: Have no idea why it failed detecting icu-i18n

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/mpd_0.19.21.bb      | 40 +++++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
index a2b85b8..4f22e96 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
@@ -3,7 +3,41 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://www.musicpd.org"
 
-DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu dbus expat zlib libupnp"
+inherit autotools useradd systemd
+
+DEPENDS += " \
+    alsa-lib \
+    libsamplerate0 \
+    libsndfile1 \
+    libvorbis \
+    libogg \
+    faad2 \
+    ffmpeg \
+    curl \
+    sqlite \
+    bzip2 \
+    pulseaudio \
+    tcp-wrappers \
+    openal-soft \
+    yajl \
+    jack \
+    faad2 \
+    flac \
+    libao \
+    fluidsynth \
+    libcdio \
+    wavpack \
+    libopus \
+    mpg123 \
+    libmms \
+    libmodplug \
+    boost \
+    icu \
+    dbus \
+    expat \
+    zlib \
+    libupnp \
+"
 
 SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
@@ -12,8 +46,6 @@ SRC_URI = " \
 SRC_URI[md5sum] = "fc19f76b512bd471b6af5214965ff7c5"
 SRC_URI[sha256sum] = "8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730"
 
-inherit autotools useradd systemd
-
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
@@ -63,5 +95,3 @@ USERADD_PARAM_${PN} = " \
     --home ${localstatedir}/lib/mpd \
     --groups audio \
     --user-group mpd"
-
-PNBLACKLIST[mpd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130612/"
-- 
2.9.3


