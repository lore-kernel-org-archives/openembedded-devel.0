Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0766E7D4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 22:49:55 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rp16so4925862pbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 15:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rVnQIRsmHAocSliV+7msPSujpFG8a3O4h3AOCXxg13o=;
	b=lTo1ZqN2xmJkuV9e72aWNV+dQmguCTrY1JnCUteqqTJbZi8nmFVDrzJnMDenOSmpnh
	Fj05docQ3sbPugGV8q+zFQWpoSbvuZZV9qPb17Hc6SvVN3bs0pOGENw7N9cRAQGPQEgf
	Tphb4c163/4oe/cm9qyBVNVjJRN7hN7PlxndeYstFlCq4SI7UQvv5BMyCivR1UKU4kJK
	51lNchKZPagaMDsO23iHijZPmCosZrpyBXu2ui1h79ifu8uPgnFz6rroZQEiqilNuaoA
	FVnLiJw45DSs9EDsWDQQLMcw76c4LebpYjbyUXyaYx0PXWR6VvgC9S3G0gyZnz7sS1FI
	lPJQ==
X-Received: by 10.67.11.12 with SMTP id ee12mr131708pad.132.1395010196262;
	Sun, 16 Mar 2014 15:49:56 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id
	fg12sm62211826pac.28.2014.03.16.15.49.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Mar 2014 15:49:55 -0700 (PDT)
From: "stephen.arnold42" <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Mar 2014 15:48:58 -0700
Message-Id: <1395010139-15359-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-multimedia][PATCH] updated mpd to current upstream stable
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
X-List-Received-Date: Sun, 16 Mar 2014 22:49:59 -0000

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


