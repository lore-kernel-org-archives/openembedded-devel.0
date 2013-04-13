Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nd-0007V6-4y
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:30 +0200
Received: by mail-ea0-f179.google.com with SMTP id f15so1562050eak.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zVEvtUdMJcTBMimd58jXxifHxawMm1TukTkGVE2h6wg=;
	b=GvKihja2Ss+GCBS9jqnaVmrvrGNdlxLMS9lD5fdEumMOwCKOLOlcHGLDPVL/yOXAyM
	8Je66IgV/FYDTlYdJpozgYaxeJwO/W1hMtLj7Hd6u3uyKoqfXvmzCGslrlyEwdr7nDTt
	Va7v1wnrnMF98B0OqjO+rqHu58BjrhiwbVrboq5fpONU3q9XuZEj/mzVP7e7q+BJxxce
	e29DiLX1cCD4lrNGJ3pIYWl+Gmv6hf2x2bgFjLLg/ZKeKYHDOE2B9uhNvZR1s7yEqwWl
	jq3NRdFIGA3v1UOHZX/2y2kRj5Yu4cw+2vR/oKeiwMJ8m+LaEN1tIAd+sG1K0fm0s7/X
	2s0g==
X-Received: by 10.15.94.200 with SMTP id bb48mr39802598eeb.21.1365859799524;
	Sat, 13 Apr 2013 06:29:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bk42sm16494430eeb.3.2013.04.13.06.29.58
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:29:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:25 +0200
Message-Id: <1365859790-20947-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 08/33] mpd: move systemd support from meta-systemd back to meta-multimedia
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb | 16 ++++++++++++++--
 .../recipes-multimedia/musicpd/mpd_0.17.1.bbappend       | 16 ----------------
 2 files changed, 14 insertions(+), 18 deletions(-)
 delete mode 100644 meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
index 2b7e555..a6b8898 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad lame libid3tag', d)}"
 
-PR = "r1"
+PR = "r4"
 
 SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
@@ -16,9 +16,10 @@ SRC_URI = " \
 SRC_URI[md5sum] = "da3f3d6617a877192db4c6f53504cd38"
 SRC_URI[sha256sum] = "b18cdb1b779ca2ab323e212a0af4a567b7da4881a4e96868a8979bdfdbe7c2e8"
 
-inherit autotools useradd
+inherit autotools useradd systemd
 
 EXTRA_OECONF = "enable_bzip2=yes"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
 do_install_append() {
     install -d ${D}/${localstatedir}/lib/mpd/music
@@ -36,8 +37,19 @@ do_install_append() {
         -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
         -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
         ${D}/${sysconfdir}/mpd.conf
+
+    if [ -e ${D}/${systemd_unitdir}/system/mpd.service ] ; then
+        sed -i \
+            's|^ExecStart=.*|ExecStart=${bindir}/mpd --no-daemon|' \
+            ${D}/${systemd_unitdir}/system/mpd.service
+    fi
 }
 
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "mpd.service"
+
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = " \
     --system --no-create-home \
diff --git a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
deleted file mode 100644
index a3f5f3b..0000000
--- a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
+++ /dev/null
@@ -1,16 +0,0 @@
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-EXTRA_OECONF += "--with-systemdsystemunitdir=${systemd_unitdir}/system"
-
-do_install_append() {
-    sed -i \
-        's|^ExecStart=.*|ExecStart=${bindir}/mpd --no-daemon|' \
-        ${D}/${systemd_unitdir}/system/mpd.service
-}
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "mpd.service"
-- 
1.8.1.5



