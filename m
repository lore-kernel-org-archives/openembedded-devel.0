Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CEADB719A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 08:45:48 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 89so7740849wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I4cS8oTVAStoODjFxwp6lMm5C5xwxaf31DRIZX+hUw4=;
	b=pH7L977/LbjXzgJsWeIokM9cX4HvZi8Wv/kmftrhbrOULMXhBCfdqbpXyuvifD8z98
	z7RFeVUw7RBNk4k6E91cgzVr4lR4qx7/5JDyw70W71mqvZfKPpHOWwOuknxfnVfvwgqI
	ESetF/rYCOeiufW/fg89VBk/Mm1jiAJfs3XK4Fdwtc06Q3uOESZP6bZXZh80jXg5NWrG
	+iqCzIkrCgG7H6MvBPd2UEGon5+XAka9vneLd9k3pDthhxLeBOjLzX+18CY2Da6f0bhx
	9yn23Po1TMsmIStMJs4RGd7uAKCbye3w0Q/lmv+ZPEGqo1QG8gDUM31zwIcAkqT+sVEb
	e+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I4cS8oTVAStoODjFxwp6lMm5C5xwxaf31DRIZX+hUw4=;
	b=ZibS8TQdosE0XoW+If2cPnTj5QdOZAl+JUPDE3PW0XGDCKxxDSSiqjoKpPP6ieI/US
	iJGjXa6TOPdvm+L6j3jf1+Et3XlaMtczqsLxL7VpcFTst3UWNxr8SafFlU+MpnHfL0TW
	GQ9igf7b4EL0YeeNkwNPjWGXvBobGNy40w/LU6+osSG34ucvqsmemOKkJBJTQNURKbrP
	NhX0fd1WadSH7/wdTV4S4IMKqXst6gRZd/R/Z5wIcwzIv/Z03HkGmN3CxlQOzdA/r6oV
	9tr155p6cKETMjiK+kiBLxg9ZsbWYX/MosmCOers2bLBHLx6Oo7HU37g3WFgvhPFHaxt
	3lsg==
X-Gm-Message-State: AMke39mUae7moWrplTfMxdR7rekPHevT6qdER0s2s19H9OknRWI3xmfp73RVLYClUaJR1Q==
X-Received: by 10.223.129.163 with SMTP id 32mr17964905wra.140.1487666749245; 
	Tue, 21 Feb 2017 00:45:49 -0800 (PST)
Received: from localhost.localdomain
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	h23sm18953962wrc.48.2017.02.21.00.45.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 00:45:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 09:45:13 +0100
Message-Id: <20170221084514.27766-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH V2 1/2] mpd: add pkgconfig to inherit, rework DEPENDS and unblacklist
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
X-List-Received-Date: Tue, 21 Feb 2017 08:45:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/mpd_0.19.21.bb      | 40 +++++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
index a2b85b8..c16f3be 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
@@ -3,7 +3,41 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://www.musicpd.org"
 
-DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu dbus expat zlib libupnp"
+inherit autotools useradd systemd pkgconfig
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


