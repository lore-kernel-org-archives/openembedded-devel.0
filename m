Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 510946F6EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 00:25:04 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id p10so4837534pdj.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gi0IrR/63uJlVYICxQwca9shQoEGljk0vHBIwogQlGY=;
	b=R8IP2x5lsda2QOkOvK1xPkBUnTYSUv84PHlJ3EAinkMrVrUoTMtr+Gye/SkmrvUnKn
	KqfD7VNLy+JyVlE4TmB0Mq3vlG8amEawsnsFAyPwUwVHYyjKY8sCMBUk640Xxwh6C86U
	uHJP9rUOYMTGxeWE+sXun0mzMUw33pARmTio9hNJkwOEKGLieHhm0gIynmv1Z1R53Y0f
	PMj6I516KZcA0nyWeKA0Ei9xZZ5G06q7ZGFjGfNcWSXUHAivrNzdeuq/HkiGNvJhBfj2
	XE1xRTcYdPc45a9va+tONQqia6jFF2bcKY5EpCeFn+bcYyHbLpK9s5G+3ZEehU0ucBE5
	4m9w==
X-Received: by 10.67.1.202 with SMTP id bi10mr22490209pad.68.1395015905779;
	Sun, 16 Mar 2014 17:25:05 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id
	gg3sm37831783pbc.34.2014.03.16.17.25.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Mar 2014 17:25:04 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Mar 2014 17:24:48 -0700
Message-Id: <1395015888-18805-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-multimedia][PATCH v2 1/1] musicpd/mpd: bump to current upstream stable
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
X-List-Received-Date: Mon, 17 Mar 2014 00:25:05 -0000

From: "Stephen Arnold" <stephen.arnold42@gmail.com>

Bump music player daemon to the latest upstream stable release.
Same as previous 0.18.4 recipe with trivial updates.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 .../recipes-multimedia/musicpd/mpd_0.18.8.bb       | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
new file mode 100644
index 0000000..b6882af
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
@@ -0,0 +1,59 @@
+SUMMARY = "Music Player Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+HOMEPAGE ="http://www.musicpd.org"
+
+DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio"
+
+SRC_URI = " \
+    http://www.musicpd.org/download/${PN}/stable/${P}.tar.xz \
+    file://mpd.conf.in \
+"
+
+SRC_URI[md5sum] = "7bbe1caf5abe404dc985ca4f44984b1f"
+SRC_URI[sha256sum] = "5366378e548fb77996cc33b0e15165ddd84f1e496bdd04616bd593aecdc26450"
+
+inherit autotools useradd systemd
+
+EXTRA_OECONF = "enable_bzip2=yes"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+
+PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
+PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
+
+do_install_append() {
+    install -d ${D}/${localstatedir}/lib/mpd/music
+    chmod 775 ${D}/${localstatedir}/lib/mpd/music
+    install -d ${D}/${localstatedir}/lib/mpd/playlists
+    chown -R mpd ${D}/${localstatedir}/lib/mpd
+    chown mpd:mpd ${D}/${localstatedir}/lib/mpd/music
+
+    install -d ${D}/${sysconfdir}
+    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
+    sed -i \
+        -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
+        -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|' \
+        -e 's|%db_file%|${localstatedir}/lib/mpd/mpd.db|' \
+        -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
+        -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
+        ${D}/${sysconfdir}/mpd.conf
+
+    if [ -e ${D}/${systemd_unitdir}/system/mpd.service ] ; then
+        sed -i \
+            's|^ExecStart=.*|ExecStart=${bindir}/mpd --no-daemon|' \
+            ${D}/${systemd_unitdir}/system/mpd.service
+    fi
+}
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "mpd.service"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = " \
+    --system --no-create-home \
+    --home ${localstatedir}/lib/mpd \
+    --groups audio \
+    --user-group mpd"
-- 
1.8.5.3


