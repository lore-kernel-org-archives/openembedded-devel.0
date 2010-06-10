Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OMiU3-0007pD-Jr
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 16:11:54 +0200
Received: by fxm9 with SMTP id 9so4546946fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 07:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=XAxI02WzZ5plDimyoUFISpIiDi7hd4C/cJdvgHcJRRY=;
	b=i1czM26CAcUrk0znjMkVR5+hst1mYeFogtc3yqFkkprEdXV45OmBY6gCe/1Fzl5E5K
	N/rPxYRMqPGa8TWc7hsJlm5nhJGQwiJB8gZnKi+NBJ3juQHeFPS6H5d5PAXulML5pvfF
	FCxP4THdkEZiUKPDD/naRwp3tpQcWUuZse7L4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rMhefm5pOkM551EeElQ3nDvPfYNRmE904szunh5iGMEoKWh/894RUkoXZ4HFUEYP8K
	jHp3gWiR2NPt55BYJ6DgsTXbt6bZ50pyvB49Dv+uqhMQjUd3867DvNbqjSYupFQqfTkn
	RIDO3pXcDNhoNnci9gjwuklJFYzWmvMoRUoJw=
Received: by 10.223.101.81 with SMTP id b17mr330223fao.17.1276178846665;
	Thu, 10 Jun 2010 07:07:26 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm162793fad.19.2010.06.10.07.07.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 07:07:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jun 2010 16:07:13 +0200
Message-Id: <1276178833-30841-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	URI_NOVOWEL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] recipes: conform to OE packaging guidelines with RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES
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
X-List-Received-Date: Thu, 10 Jun 2010 14:11:54 -0000

* even worse than last RDEPENDS/RRECOMMENDS change, because now ie:
  opkg info coreutils-doc
  Provides: textutils, shellutils, fileutils
  Replaces: textutils, shellutils, fileutils

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/abiword/abiword-embedded_2.4.6.bb          |    4 ++--
 recipes/abiword/abiword-embedded_2.5.2.bb          |    4 ++--
 recipes/abiword/abiword-embedded_2.6.4.bb          |    4 ++--
 recipes/abiword/abiword-embedded_2.6.8.bb          |    4 ++--
 recipes/abiword/abiword_2.4.6.bb                   |    2 +-
 recipes/abiword/abiword_2.5.1.bb                   |    2 +-
 recipes/abiword/abiword_2.5.2.bb                   |    2 +-
 recipes/abiword/abiword_2.6.0.bb                   |    2 +-
 recipes/abiword/abiword_2.6.3.bb                   |    2 +-
 recipes/abiword/abiword_2.6.4.bb                   |    2 +-
 recipes/abiword/abiword_2.6.8.bb                   |    2 +-
 recipes/abiword/abiword_2.8.1.bb                   |    2 +-
 recipes/angstrom/epiphany-firefox-replacement.bb   |    2 +-
 recipes/at/at_3.1.8.bb                             |    4 ++--
 recipes/atd/atd_0.70.bb                            |    4 ++--
 recipes/atd/atd_0.80.bb                            |    4 ++--
 recipes/bluez/bluez-utils.inc                      |    2 +-
 recipes/bluez/bluez-utils3.inc                     |    2 +-
 recipes/bluez/bluez.inc                            |    2 +-
 recipes/boa/boa_0.94.13.bb                         |    2 +-
 recipes/cairo/cairo-directfb_1.4.8.bb              |    4 ++--
 recipes/cairo/cairo-directfb_1.6.4.bb              |    4 ++--
 recipes/classpath/classpath.inc                    |    2 +-
 recipes/coreutils/coreutils.inc                    |    4 ++--
 recipes/dillo/dillo_0.8.6.bb                       |    2 +-
 recipes/dropbear/dropbear.inc                      |    2 +-
 recipes/emacs/emacs-x11_22.3.bb                    |    2 +-
 recipes/emacs/emacs-x11_23.1.bb                    |    2 +-
 recipes/emacs/emacs-x11_cvs.bb                     |    2 +-
 recipes/ffalarms/ffalarms_git.bb                   |    2 +-
 recipes/ffmpeg/ffmpeg.inc                          |    2 +-
 recipes/fftw/fftw.inc                              |    2 +-
 recipes/freesmartphone/fso-apm_git.bb              |    2 +-
 recipes/freesmartphone/fso-gsm0710muxd_git.bb      |    4 ++--
 recipes/gnome/gnome-vfs_2.22.0.bb                  |    2 +-
 recipes/gnome/gnome-vfs_2.24.1.bb                  |    2 +-
 recipes/gpe-icons/gpe-theme-neo_git.bb             |    2 +-
 recipes/gpe-scap/gpe-scap_1.2.bb                   |    2 +-
 recipes/gpe-scap/gpe-scap_1.3.bb                   |    2 +-
 recipes/gpe-scap/gpe-scap_1.4.bb                   |    2 +-
 recipes/gpe-scap/gpe-scap_svn.bb                   |    2 +-
 recipes/hotplug-ng/hotplug-ng_001.bb               |    6 +++---
 recipes/initscripts/initscripts-openprotium_1.0.bb |    2 +-
 recipes/initscripts/initscripts-slugos_1.0.bb      |    2 +-
 recipes/irk/irk-belkin_0.11.bb                     |    4 ++--
 recipes/irk/irk-targus_0.11.0.bb                   |    4 ++--
 recipes/libgpepimc/libgpepimc-hildon_0.5.bb        |    2 +-
 recipes/libgpepimc/libgpepimc.inc                  |    2 +-
 recipes/libgpepimc/libgpepimc_svn.bb               |    2 +-
 recipes/libgpewidget/libgpewidget-hildon_0.102.bb  |    2 +-
 recipes/links/links-x11_2.0+2.1pre30.bb            |    2 +-
 recipes/links/links_2.0+2.1pre30.bb                |    2 +-
 recipes/linux-hotplug/linux-hotplug_20040920.bb    |    2 +-
 recipes/logrotate/logrotate_3.7.1.bb               |    2 +-
 recipes/lyx/lyx_1.6.1.bb                           |    2 +-
 recipes/lyx/lyx_1.6.4.1.bb                         |    2 +-
 recipes/mamona/bash-noemu_3.2.bb                   |    4 ++--
 recipes/mamona/binutils-noemu_2.17.50.0.5.bb       |    4 ++--
 recipes/mamona/binutils-noemu_2.18.bb              |    4 ++--
 recipes/mamona/gcc-noemu_4.1.1.bb                  |    4 ++--
 recipes/mamona/gcc-noemu_4.1.2.bb                  |    4 ++--
 recipes/matchbox-keyboard/matchbox-keyboard_svn.bb |    2 +-
 recipes/matchbox-sato/matchbox-sato_0.1.bb         |    2 +-
 recipes/matchbox-session/matchbox-session.bb       |    2 +-
 recipes/meta/external-toolchain-generic.bb         |    2 +-
 recipes/meta/external-toolchain.bb                 |    2 +-
 .../midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb   |    2 +-
 recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb  |    2 +-
 recipes/midpath/midpath-cldc_0.2+0.3rc2.bb         |    2 +-
 recipes/midpath/midpath.inc                        |    2 +-
 recipes/misc-binary-only/prism-firmware.bb         |    4 ++--
 recipes/monotone/monotone-6_0.33.bb                |    2 +-
 recipes/monotone/monotone-6_0.34.bb                |    2 +-
 recipes/monotone/monotone-6_0.37.bb                |    2 +-
 recipes/motion/motion_3.2.11.bb                    |    2 +-
 recipes/multitap-pad/multitap-pad_svn.bb           |    2 +-
 recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb   |    4 ++--
 recipes/ntp/ntp.inc                                |    2 +-
 recipes/obsolete/ffalarms/ffalarms_0.2.2.bb        |    2 +-
 .../obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb    |    2 +-
 recipes/obsolete/shr/etk-theme-neo_git.bb          |    2 +-
 .../libframeworkd-phonegui-efl-theme-neo_git.bb    |    2 +-
 recipes/obsolete/tasks/task-bootstrap-unionroot.bb |    2 +-
 recipes/openmoko-projects/illume-theme-asu_svn.bb  |    2 +-
 recipes/openmoko2/openmoko-sound-system2_0.1.0.bb  |    4 ++--
 .../openmoko-sound-theme-standard2_svn.bb          |    4 ++--
 .../openmoko2/openmoko-theme-standard2-qvga_svn.bb |    4 ++--
 recipes/openmoko2/openmoko-theme-standard2_svn.bb  |    2 +-
 ...opie-mediaplayer2-skin-default-landscape_cvs.bb |    2 +-
 .../opie-mediaplayer2-skin-default_1.2.3.bb        |    2 +-
 .../opie-mediaplayer2-skin-default_1.2.4.bb        |    2 +-
 .../opie-mediaplayer2-skin-default_cvs.bb          |    2 +-
 .../opie-mediaplayer2-skin-pod_1.2.3.bb            |    2 +-
 .../opie-mediaplayer2-skin-pod_1.2.4.bb            |    2 +-
 .../opie-mediaplayer2-skin-pod_cvs.bb              |    2 +-
 .../opie-mediaplayer2-skin-techno_1.2.3.bb         |    2 +-
 .../opie-mediaplayer2-skin-techno_1.2.4.bb         |    2 +-
 .../opie-mediaplayer2-skin-techno_cvs.bb           |    2 +-
 recipes/opie-taskbar/opie-taskbar-images.inc       |    2 +-
 recipes/pulseaudio/pulseaudio-esd-wrapper.bb       |    4 ++--
 recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb |    4 ++--
 recipes/qpf-fonts/qpf-unifont_1.0.bb               |    2 +-
 recipes/qpf-fonts/qpf-unismall_1.0.0.bb            |    2 +-
 recipes/samba/samba-essential_3.0.20.bb            |    2 +-
 recipes/sarg/sarg_2.2.7.1.bb                       |    2 +-
 recipes/sharp-binary-only/sharp-compat-libs_0.5.bb |    4 ++--
 .../sharprom-toolchain-native_1.0.bb               |    2 +-
 recipes/shr/e-wm-theme-illume-neo_git.bb           |    2 +-
 recipes/shr/elementary-theme-neo_git.bb            |    2 +-
 recipes/shr/elementary-theme-o2_git.bb             |    2 +-
 recipes/shr/gtk-theme-neo_git.bb                   |    2 +-
 recipes/shr/icon-theme-neo_git.bb                  |    2 +-
 recipes/shr/phoneui-shr-theme-neo_git.bb           |    2 +-
 recipes/shr/phoneui-shr-theme-o2_git.bb            |    2 +-
 recipes/socketcan/canutils.inc                     |    2 +-
 recipes/socketcan/socketcan-utils-test_svn.bb      |    2 +-
 recipes/swt/swt3.4-gtk_3.4.2.bb                    |    2 +-
 recipes/swt/swt3.5-gtk_3.5.1.bb                    |    2 +-
 recipes/tasks/task-mamona-sdk-noemu.bb             |    4 ++--
 recipes/tasks/task-mamona-sdk.bb                   |    4 ++--
 recipes/ttf-fonts/ttf-arphic-uming_20080216.bb     |    2 +-
 recipes/ttf-fonts/ttf-sazanami_20040629.bb         |    2 +-
 recipes/vala-terminal/vala-terminal_git.bb         |    4 ++--
 recipes/vim/gvim_7.2.bb                            |    2 +-
 recipes/vnc/fbvncserver2_cvs.bb                    |    2 +-
 recipes/wpa-supplicant/wpa-supplicant-0.6.inc      |    2 +-
 recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb    |    2 +-
 .../xcursor-watchonly-theme_0.1.1.bb               |    4 ++--
 recipes/xfce-extras/orage_4.4.2.bb                 |    2 +-
 recipes/xfce-extras/orage_4.6.1.bb                 |    2 +-
 recipes/xorg-lib/libx11_git.bb                     |    2 +-
 recipes/xorg-lib/libxscrnsaver_1.1.2.bb            |    2 +-
 recipes/xorg-lib/libxscrnsaver_1.1.3.bb            |    2 +-
 recipes/xorg-lib/libxscrnsaver_1.2.0.bb            |    2 +-
 recipes/zsafe/zsafe_2.1.3.bb                       |    2 +-
 recipes/zten/zten_1.6.2.bb                         |    2 +-
 136 files changed, 168 insertions(+), 168 deletions(-)

diff --git a/recipes/abiword/abiword-embedded_2.4.6.bb b/recipes/abiword/abiword-embedded_2.4.6.bb
index 84bb8f1..8ec9526 100644
--- a/recipes/abiword/abiword-embedded_2.4.6.bb
+++ b/recipes/abiword/abiword-embedded_2.4.6.bb
@@ -2,8 +2,8 @@ require abiword.inc
 
 EXTRA_OECONF += "--enable-embedded"
 
-RCONFLICTS = "abiword"
-RPROVIDES += "abiword"
+RCONFLICTS_${PN} = "abiword"
+RPROVIDES_${PN} += "abiword"
 
 do_compile_prepend() {
 	cp ${S}/src/af/xap/unix/hildon/xap_EmbeddedFeatures.h ${S}/src/af/xap/unix/
diff --git a/recipes/abiword/abiword-embedded_2.5.2.bb b/recipes/abiword/abiword-embedded_2.5.2.bb
index 67f516e..459cc27 100644
--- a/recipes/abiword/abiword-embedded_2.5.2.bb
+++ b/recipes/abiword/abiword-embedded_2.5.2.bb
@@ -4,8 +4,8 @@ EXTRA_OECONF += "--enable-embedded"
 
 S = "${WORKDIR}/abiword-${PV}"
 
-RCONFLICTS = "abiword"
-RPROVIDES += "abiword"
+RCONFLICTS_${PN} = "abiword"
+RPROVIDES_${PN} += "abiword"
 
 
 
diff --git a/recipes/abiword/abiword-embedded_2.6.4.bb b/recipes/abiword/abiword-embedded_2.6.4.bb
index 3580841..13951f8 100644
--- a/recipes/abiword/abiword-embedded_2.6.4.bb
+++ b/recipes/abiword/abiword-embedded_2.6.4.bb
@@ -4,8 +4,8 @@ EXTRA_OECONF += "--enable-embedded"
 
 S = "${WORKDIR}/abiword-${PV}"
 
-RCONFLICTS = "abiword"
-RPROVIDES += "abiword"
+RCONFLICTS_${PN} = "abiword"
+RPROVIDES_${PN} += "abiword"
 
 SRC_URI[md5sum] = "16748b2d6e318e0e2a25581005e1943a"
 SRC_URI[sha256sum] = "4d2d7a6b69b00ffe603a136a9df7ecda9f43448c7bc723503e76eaec9ab8e9fe"
diff --git a/recipes/abiword/abiword-embedded_2.6.8.bb b/recipes/abiword/abiword-embedded_2.6.8.bb
index fc6e2d5..ca48d77 100644
--- a/recipes/abiword/abiword-embedded_2.6.8.bb
+++ b/recipes/abiword/abiword-embedded_2.6.8.bb
@@ -4,8 +4,8 @@ EXTRA_OECONF += "--enable-embedded"
 
 S = "${WORKDIR}/abiword-${PV}"
 
-RCONFLICTS = "abiword"
-RPROVIDES += "abiword"
+RCONFLICTS_${PN} = "abiword"
+RPROVIDES_${PN} += "abiword"
 
 SRC_URI[md5sum] = "fab04d8ef999c303f720197adf261310"
 SRC_URI[sha256sum] = "b6656a0da13d94b334f02637c89d8fe13aa54752040ad1b8f14f668d8cb96e93"
diff --git a/recipes/abiword/abiword_2.4.6.bb b/recipes/abiword/abiword_2.4.6.bb
index 7911571..af0b5d4 100644
--- a/recipes/abiword/abiword_2.4.6.bb
+++ b/recipes/abiword/abiword_2.4.6.bb
@@ -1,6 +1,6 @@
 require abiword.inc
 
-RCONFLICTS = "abiword-embedded"
+RCONFLICTS_${PN} = "abiword-embedded"
 
 
 SRC_URI[md5sum] = "30fbd0a9b539f15f54f90d3812a75266"
diff --git a/recipes/abiword/abiword_2.5.1.bb b/recipes/abiword/abiword_2.5.1.bb
index fdf8fc6..2f90f52 100644
--- a/recipes/abiword/abiword_2.5.1.bb
+++ b/recipes/abiword/abiword_2.5.1.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 
 PR = "r2"
 
-RCONFLICTS = "abiword-embedded"
+RCONFLICTS_${PN} = "abiword-embedded"
 
 SRC_URI[md5sum] = "11d022458e0e090846b35ed4873c2e6e"
 SRC_URI[sha256sum] = "482891fb0e376e2aaeee25afa8b4913e6dc50f4fdc280f9f152b3ee8745d735d"
diff --git a/recipes/abiword/abiword_2.5.2.bb b/recipes/abiword/abiword_2.5.2.bb
index a9e644d..35fd966 100644
--- a/recipes/abiword/abiword_2.5.2.bb
+++ b/recipes/abiword/abiword_2.5.2.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 
 PR = "r1"
 
-RCONFLICTS = "abiword-embedded"
+RCONFLICTS_${PN} = "abiword-embedded"
 
 SRC_URI[md5sum] = "bbc9c124f8072875129bd67092f0fa0b"
 SRC_URI[sha256sum] = "db34eeb5457fb7572fc76ec2a73cdb4f7a67307e7468b6c4bde820b58c598b3f"
diff --git a/recipes/abiword/abiword_2.6.0.bb b/recipes/abiword/abiword_2.6.0.bb
index 9e9e43b..d017966 100644
--- a/recipes/abiword/abiword_2.6.0.bb
+++ b/recipes/abiword/abiword_2.6.0.bb
@@ -1,6 +1,6 @@
 require abiword-2.5.inc
 
-RCONFLICTS = "abiword-embedded"
+RCONFLICTS_${PN} = "abiword-embedded"
 
 SRC_URI[md5sum] = "d627a5d1061160c683f2257da498355b"
 SRC_URI[sha256sum] = "35b1ced07bed8706a81c2c26c42bf95bdf7a4a9c1fba98935cc5ecb5c674f0bb"
diff --git a/recipes/abiword/abiword_2.6.3.bb b/recipes/abiword/abiword_2.6.3.bb
index 960ae97..576ca9c 100644
--- a/recipes/abiword/abiword_2.6.3.bb
+++ b/recipes/abiword/abiword_2.6.3.bb
@@ -2,7 +2,7 @@ require abiword-2.5.inc
 
 PR = "r1"
 
-RCONFLICTS = "abiword-embedded"
+RCONFLICTS_${PN} = "abiword-embedded"
 
 FILES_${PN} 			+= "${datadir}/mime-info"
 FILES_abiword-strings           += "${datadir}/abiword-${SHRT_VER}/strings"
diff --git a/recipes/abiword/abiword_2.6.4.bb b/recipes/abiword/abiword_2.6.4.bb
index 711074e..e12b93d 100644
--- a/recipes/abiword/abiword_2.6.4.bb
+++ b/recipes/abiword/abiword_2.6.4.bb
@@ -2,7 +2,7 @@ require abiword-2.5.inc
 
 PR = "r2"
 
-RCONFLICTS = "abiword-embedded"
+RCONFLICTS_${PN} = "abiword-embedded"
 
 FILES_${PN} 			+= "${datadir}/mime-info"
 FILES_abiword-strings           += "${datadir}/abiword-${SHRT_VER}/strings"
diff --git a/recipes/abiword/abiword_2.6.8.bb b/recipes/abiword/abiword_2.6.8.bb
index f18bd43..4399371 100644
--- a/recipes/abiword/abiword_2.6.8.bb
+++ b/recipes/abiword/abiword_2.6.8.bb
@@ -1,6 +1,6 @@
 require abiword-2.5.inc
 
-RCONFLICTS = "abiword-embedded"
+RCONFLICTS_${PN} = "abiword-embedded"
 
 FILES_${PN} 			+= "${datadir}/mime-info"
 FILES_abiword-strings           += "${datadir}/abiword-${SHRT_VER}/strings"
diff --git a/recipes/abiword/abiword_2.8.1.bb b/recipes/abiword/abiword_2.8.1.bb
index 96bc03c..781e096 100644
--- a/recipes/abiword/abiword_2.8.1.bb
+++ b/recipes/abiword/abiword_2.8.1.bb
@@ -18,7 +18,7 @@ EXTRA_OECONF = " --disable-static  \
                  --with-libwmf-config=${STAGING_DIR} \
 "
 DEPENDS += " libwmf-native gtkmathview "
-RCONFLICTS = "abiword-embedded"
+RCONFLICTS_${PN} = "abiword-embedded"
 
 FILES_${PN} 			+= "${libdir}/libabiword-*.so ${datadir}/mime-info ${datadir}/abiword-${SHRT_VER}/certs ${datadir}/abiword-${SHRT_VER}/ui ${datadir}/abiword-${SHRT_VER}/xsl* ${datadir}/abiword-${SHRT_VER}/mime-info ${datadir}/abiword-${SHRT_VER}/Pr*.xml"
 FILES_abiword-strings           += "${datadir}/abiword-${SHRT_VER}/strings"
diff --git a/recipes/angstrom/epiphany-firefox-replacement.bb b/recipes/angstrom/epiphany-firefox-replacement.bb
index 50de217..ca08cf3 100644
--- a/recipes/angstrom/epiphany-firefox-replacement.bb
+++ b/recipes/angstrom/epiphany-firefox-replacement.bb
@@ -1,7 +1,7 @@
 # This is a hack because $*#($*($# e17 doesn't check if firefox is present and puts it in the menu blindly
 
 RDEPENDS_${PN} = "epiphany"
-RCONFLICTS = "firefox"
+RCONFLICTS_${PN} = "firefox"
 
 do_install() {
 	install -d ${D}/${bindir}
diff --git a/recipes/at/at_3.1.8.bb b/recipes/at/at_3.1.8.bb
index 79b8557..f7d692b 100644
--- a/recipes/at/at_3.1.8.bb
+++ b/recipes/at/at_3.1.8.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Delayed job execution and batch processing."
 SECTION = "base"
 LICENSE="BSD"
 DEPENDS = "flex-native"
-RCONFLICTS = "atd"
-RREPLACES = "atd"
+RCONFLICTS_${PN} = "atd"
+RREPLACES_${PN} = "atd"
 
 PR = "r2"
 
diff --git a/recipes/atd/atd_0.70.bb b/recipes/atd/atd_0.70.bb
index 5ffb386..d912ad3 100644
--- a/recipes/atd/atd_0.70.bb
+++ b/recipes/atd/atd_0.70.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Lightweight At Daemon"
 SECTION = "base"
 LICENSE = "GPLv2"
-RCONFLICTS = "at"
-RREPLACES = "at"
+RCONFLICTS_${PN} = "at"
+RREPLACES_${PN} = "at"
 
 PR = "r5"
 
diff --git a/recipes/atd/atd_0.80.bb b/recipes/atd/atd_0.80.bb
index 6ec1928..ab81b42 100644
--- a/recipes/atd/atd_0.80.bb
+++ b/recipes/atd/atd_0.80.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Lightweight At Daemon"
 SECTION = "base"
 LICENSE = "GPLv2"
-RCONFLICTS = "at"
-RREPLACES = "at"
+RCONFLICTS_${PN} = "at"
+RREPLACES_${PN} = "at"
 
 PR = "r1"
 
diff --git a/recipes/bluez/bluez-utils.inc b/recipes/bluez/bluez-utils.inc
index 9933748..dfe64c3 100644
--- a/recipes/bluez/bluez-utils.inc
+++ b/recipes/bluez/bluez-utils.inc
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 DEPENDS = "gstreamer gst-plugins-base bluez-libs-${PV} virtual/libusb0 dbus cups"
 PROVIDES = "bluez-utils-dbus"
 RPROVIDES_${PN} = "bluez-pan bluez-sdp bluez-utils-dbus"
-RREPLACES = "bluez-utils-dbus"
+RREPLACES_${PN} = "bluez-utils-dbus"
 RCONFLICTS_${PN} = "bluez-utils-nodbus"
 LICENSE = "GPL"
 
diff --git a/recipes/bluez/bluez-utils3.inc b/recipes/bluez/bluez-utils3.inc
index 16e5ede..c3899db 100644
--- a/recipes/bluez/bluez-utils3.inc
+++ b/recipes/bluez/bluez-utils3.inc
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 DEPENDS = "gstreamer gst-plugins-base bluez-libs-${PV} virtual/libusb0 dbus glib-2.0"
 PROVIDES = "bluez-utils-dbus"
 RPROVIDES_${PN} = "bluez-pan bluez-sdp bluez-utils-dbus"
-RREPLACES = "bluez-utils-dbus"
+RREPLACES_${PN} = "bluez-utils-dbus"
 RCONFLICTS_${PN} = "bluez-utils-nodbus"
 LICENSE = "GPL"
 
diff --git a/recipes/bluez/bluez.inc b/recipes/bluez/bluez.inc
index 366b5f1..3a1819a 100644
--- a/recipes/bluez/bluez.inc
+++ b/recipes/bluez/bluez.inc
@@ -8,7 +8,7 @@ PR = "r0"
 DEPENDS = "gstreamer gst-plugins-base dbus glib-2.0"
 PROVIDES = "bluez-utils-dbus"
 RPROVIDES_${PN} = "bluez-pan bluez-sdp bluez-utils-dbus"
-RREPLACES = "bluez-utils-dbus"
+RREPLACES_${PN} = "bluez-utils-dbus"
 RCONFLICTS_${PN} = "bluez-utils-nodbus"
 
 FILESPATHPKG =. "bluez-utils-${PV}:bluez-utils:"
diff --git a/recipes/boa/boa_0.94.13.bb b/recipes/boa/boa_0.94.13.bb
index 1356529..94019c8 100644
--- a/recipes/boa/boa_0.94.13.bb
+++ b/recipes/boa/boa_0.94.13.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Lightweight and High Performance WebServer"
 SECTION = "console/network"
 LICENSE = "GPL"
 RDEPENDS_${PN} = "mime-support"
-RPROVIDES = "httpd"
+RPROVIDES_${PN} = "httpd"
 PR = "r3"
 
 SRC_URI = "http://www.boa.org/boa-${PV}.tar.gz \
diff --git a/recipes/cairo/cairo-directfb_1.4.8.bb b/recipes/cairo/cairo-directfb_1.4.8.bb
index d9d3715..8315c62 100644
--- a/recipes/cairo/cairo-directfb_1.4.8.bb
+++ b/recipes/cairo/cairo-directfb_1.4.8.bb
@@ -1,6 +1,6 @@
 require cairo.inc
-RCONFLICTS = "cairo"
-RPROVIDES = "cairo-directfb"
+RCONFLICTS_${PN} = "cairo"
+RPROVIDES_${PN} = "cairo-directfb"
 DEPENDS = "directfb libsm libpng fontconfig"
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz \
 	   file://cairo_directfb_is_similar-typo.patch \
diff --git a/recipes/cairo/cairo-directfb_1.6.4.bb b/recipes/cairo/cairo-directfb_1.6.4.bb
index 55064ce..97c70cb 100644
--- a/recipes/cairo/cairo-directfb_1.6.4.bb
+++ b/recipes/cairo/cairo-directfb_1.6.4.bb
@@ -1,6 +1,6 @@
 require cairo.inc
-RCONFLICTS = "cairo"
-RPROVIDES = "cairo-directfb"
+RCONFLICTS_${PN} = "cairo"
+RPROVIDES_${PN} = "cairo-directfb"
 DEPENDS = "directfb pixman libsm libpng fontconfig"
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz \
            file://configure_fix.patch "
diff --git a/recipes/classpath/classpath.inc b/recipes/classpath/classpath.inc
index ab47635..41c7888 100644
--- a/recipes/classpath/classpath.inc
+++ b/recipes/classpath/classpath.inc
@@ -6,7 +6,7 @@ LICENSE = "Classpath"
 PBN = "classpath"
 
 DEPENDS = "virtual/javac-native fastjar-native zip-native gmp antlr-native"
-RPROVIDES = ""
+RPROVIDES_${PN} = ""
 
 RDEPENDS_${PN} = "${PBN}-common (>= ${PV})"
 RDEPENDS_${PN}-examples = "java2-runtime ${PN}-awt"
diff --git a/recipes/coreutils/coreutils.inc b/recipes/coreutils/coreutils.inc
index 38dbd1d..9242c51 100644
--- a/recipes/coreutils/coreutils.inc
+++ b/recipes/coreutils/coreutils.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A collection of core GNU utilities."
 HOMEPAGE = "http://www.gnu.org/software/coreutils"
 LICENSE = "GPL"
 SECTION = "base"
-RREPLACES = "textutils shellutils fileutils"
-RPROVIDES = "textutils shellutils fileutils"
+RREPLACES_${PN} = "textutils shellutils fileutils"
+RPROVIDES_${PN} = "textutils shellutils fileutils"
 
 inherit autotools
diff --git a/recipes/dillo/dillo_0.8.6.bb b/recipes/dillo/dillo_0.8.6.bb
index bcfb8ea..3ceb77f 100644
--- a/recipes/dillo/dillo_0.8.6.bb
+++ b/recipes/dillo/dillo_0.8.6.bb
@@ -4,7 +4,7 @@ SECTION = "x11/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "gtk+-1.2 libpng openssl"
-RCONFLICTS = "dillo2"
+RCONFLICTS_${PN} = "dillo2"
 PR = "r2"
 SRC_URI="http://www.dillo.org/download/dillo-${PV}.tar.bz2 \
          file://dillo-i18n.diff \
diff --git a/recipes/dropbear/dropbear.inc b/recipes/dropbear/dropbear.inc
index 5da00f2..e3fee80 100644
--- a/recipes/dropbear/dropbear.inc
+++ b/recipes/dropbear/dropbear.inc
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "MIT"
 DEPENDS = "zlib"
 PROVIDES = "ssh sshd"
-RPROVIDES = "ssh sshd"
+RPROVIDES_${PN} = "ssh sshd"
 
 INC_PR = "r3"
 
diff --git a/recipes/emacs/emacs-x11_22.3.bb b/recipes/emacs/emacs-x11_22.3.bb
index f00b285..c198a1f 100644
--- a/recipes/emacs/emacs-x11_22.3.bb
+++ b/recipes/emacs/emacs-x11_22.3.bb
@@ -5,7 +5,7 @@ DEPENDS += "gtk+ libungif"
 
 EXTRA_OECONF = "--without-sound --with-x-toolkit=gtk"
 
-RREPLACES = "emacs"
+RREPLACES_${PN} = "emacs"
 
 FILESPATHPKG =. "emacs-${PV}:"
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz \
diff --git a/recipes/emacs/emacs-x11_23.1.bb b/recipes/emacs/emacs-x11_23.1.bb
index f060e82..72c412d 100644
--- a/recipes/emacs/emacs-x11_23.1.bb
+++ b/recipes/emacs/emacs-x11_23.1.bb
@@ -9,7 +9,7 @@ EXTRA_OECONF = "--without-sound --with-x-toolkit=gtk"
 
 DEFAULT_PREFERENCE = "-1"
 
-RREPLACES = "emacs"
+RREPLACES_${PN} = "emacs"
 
 FILESPATHPKG =. "emacs-${PV}:"
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
diff --git a/recipes/emacs/emacs-x11_cvs.bb b/recipes/emacs/emacs-x11_cvs.bb
index 809176a..92dcce1 100644
--- a/recipes/emacs/emacs-x11_cvs.bb
+++ b/recipes/emacs/emacs-x11_cvs.bb
@@ -5,4 +5,4 @@ DEPENDS += "libx11"
 
 EXTRA_OECONF = "--without-sound"
 
-RREPLACES = "emacs"
+RREPLACES_${PN} = "emacs"
diff --git a/recipes/ffalarms/ffalarms_git.bb b/recipes/ffalarms/ffalarms_git.bb
index 07fe60f..8580bc6 100644
--- a/recipes/ffalarms/ffalarms_git.bb
+++ b/recipes/ffalarms/ffalarms_git.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPLv3"
 DEPENDS = "elementary libeflvala libical"
 RDEPENDS_${PN} = "atd alsa-utils-amixer ttf-dejavu-sans libical"
-RSUGGESTS = "mplayer alsa-utils-aplay frameworkd"
+RSUGGESTS_${PN} = "mplayer alsa-utils-aplay frameworkd"
 PV = "0.4+gitr${SRCPV}"
 PR = "r2"
 
diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
index 2b4d26e..680a76e 100644
--- a/recipes/ffmpeg/ffmpeg.inc
+++ b/recipes/ffmpeg/ffmpeg.inc
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET = "arm"
 PE = "2"
 
 DEPENDS = "zlib libogg libvorbis libtheora faac faad2 ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'lame liba52', d)}"
-RSUGGESTS = "mplayer"
+RSUGGESTS_${PN} = "mplayer"
 
 INC_PR = "r13"
 
diff --git a/recipes/fftw/fftw.inc b/recipes/fftw/fftw.inc
index acd1b27..19a9470 100644
--- a/recipes/fftw/fftw.inc
+++ b/recipes/fftw/fftw.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "FFTW"
 SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RPROVIDES += "libfftw3"
+RPROVIDES_${PN} += "libfftw3"
 
 PR = "r1"
 
diff --git a/recipes/freesmartphone/fso-apm_git.bb b/recipes/freesmartphone/fso-apm_git.bb
index 0047860..3e02149 100644
--- a/recipes/freesmartphone/fso-apm_git.bb
+++ b/recipes/freesmartphone/fso-apm_git.bb
@@ -5,7 +5,7 @@ AUTHOR = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 SECTION = "console"
 LICENSE = "GPLv2"
 PE = "1"
-RCONFLICTS = "apm"
+RCONFLICTS_${PN} = "apm"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PV = "2.0.0+gitr${SRCPV}"
 PR = "${INC_PR}.0"
diff --git a/recipes/freesmartphone/fso-gsm0710muxd_git.bb b/recipes/freesmartphone/fso-gsm0710muxd_git.bb
index 6fae6af..befffe1 100644
--- a/recipes/freesmartphone/fso-gsm0710muxd_git.bb
+++ b/recipes/freesmartphone/fso-gsm0710muxd_git.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 inherit autotools
 
 RDEPENDS_${PN} = "dbus dbus-glib"
-RCONFLICTS = "gsm0710muxd"
-RREPLACES = "gsm0710muxd"
+RCONFLICTS_${PN} = "gsm0710muxd"
+RREPLACES_${PN} = "gsm0710muxd"
 
 FILES_${PN} += "${datadir} ${sysconfdir}"
diff --git a/recipes/gnome/gnome-vfs_2.22.0.bb b/recipes/gnome/gnome-vfs_2.22.0.bb
index e0dc46f..3d40983 100644
--- a/recipes/gnome/gnome-vfs_2.22.0.bb
+++ b/recipes/gnome/gnome-vfs_2.22.0.bb
@@ -12,7 +12,7 @@ SRC_URI += "file://gconftool-lossage.patch \
 
 # This is to provide compatibility with the gnome-vfs DBus fork
 PROVIDES = "gnome-vfs-plugin-dbus"
-RREPLACES = "gnome-vfs-dbus"
+RREPLACES_${PN} = "gnome-vfs-dbus"
 
 EXTRA_OECONF = " \
                  --disable-openssl \
diff --git a/recipes/gnome/gnome-vfs_2.24.1.bb b/recipes/gnome/gnome-vfs_2.24.1.bb
index 19104d4..206e723 100644
--- a/recipes/gnome/gnome-vfs_2.24.1.bb
+++ b/recipes/gnome/gnome-vfs_2.24.1.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://gconftool-lossage.patch \
 
 # This is to provide compatibility with the gnome-vfs DBus fork
 PROVIDES = "gnome-vfs-plugin-dbus"
-RREPLACES = "gnome-vfs-dbus"
+RREPLACES_${PN} = "gnome-vfs-dbus"
 
 EXTRA_OECONF = " \
                  --disable-openssl \
diff --git a/recipes/gpe-icons/gpe-theme-neo_git.bb b/recipes/gpe-icons/gpe-theme-neo_git.bb
index 1de7fba..cdec5e5 100644
--- a/recipes/gpe-icons/gpe-theme-neo_git.bb
+++ b/recipes/gpe-icons/gpe-theme-neo_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nEo GPE theme - a very fast, high contrast GPE theme"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
-RSUGGESTS = "gpe-filemanager gpe-sketchbook elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo etk-theme-neo icon-theme-neo"
+RSUGGESTS_${PN} = "gpe-filemanager gpe-sketchbook elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo etk-theme-neo icon-theme-neo"
 LICENSE = "unknown"
 
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
diff --git a/recipes/gpe-scap/gpe-scap_1.2.bb b/recipes/gpe-scap/gpe-scap_1.2.bb
index 899b872..820c23f 100644
--- a/recipes/gpe-scap/gpe-scap_1.2.bb
+++ b/recipes/gpe-scap/gpe-scap_1.2.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 SECTION = "gpe"
 PR = "r1"
 
-RREPLACES = "gpe-screenshot"
+RREPLACES_${PN} = "gpe-screenshot"
 
 DEPENDS = "glib-2.0 gtk+ libgpewidget libglade libsoup"
 
diff --git a/recipes/gpe-scap/gpe-scap_1.3.bb b/recipes/gpe-scap/gpe-scap_1.3.bb
index edbe529..2797905 100644
--- a/recipes/gpe-scap/gpe-scap_1.3.bb
+++ b/recipes/gpe-scap/gpe-scap_1.3.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 SECTION = "gpe"
 PR = "r2"
 
-RREPLACES = "gpe-screenshot"
+RREPLACES_${PN} = "gpe-screenshot"
 
 DEPENDS = "glib-2.0 gtk+ libgpewidget libglade libsoup"
 
diff --git a/recipes/gpe-scap/gpe-scap_1.4.bb b/recipes/gpe-scap/gpe-scap_1.4.bb
index 2e29067..8f2a31c 100644
--- a/recipes/gpe-scap/gpe-scap_1.4.bb
+++ b/recipes/gpe-scap/gpe-scap_1.4.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 SECTION = "gpe"
 PR = "r0"
 
-RREPLACES = "gpe-screenshot"
+RREPLACES_${PN} = "gpe-screenshot"
 
 DEPENDS = "glib-2.0 gtk+ libgpewidget libglade libsoup"
 
diff --git a/recipes/gpe-scap/gpe-scap_svn.bb b/recipes/gpe-scap/gpe-scap_svn.bb
index 04010d7..8f8188b 100644
--- a/recipes/gpe-scap/gpe-scap_svn.bb
+++ b/recipes/gpe-scap/gpe-scap_svn.bb
@@ -1,5 +1,5 @@
 DEPENDS = "glib-2.0 gtk+ libgpewidget libglade libsoup"
-RREPLACES = "gpe-screenshot"
+RREPLACES_${PN} = "gpe-screenshot"
 PV = "1.4+svn-${SRCDATE}"
 PR = "r1"
 
diff --git a/recipes/hotplug-ng/hotplug-ng_001.bb b/recipes/hotplug-ng/hotplug-ng_001.bb
index 1b0185c..6aaa84e 100644
--- a/recipes/hotplug-ng/hotplug-ng_001.bb
+++ b/recipes/hotplug-ng/hotplug-ng_001.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "This collection of code replaces the existing linux-hotplug \
 package with very tiny, compiled executable programs, instead of the \
 existing bash scripts."
 LICENSE = "GPL"
-RPROVIDES = "hotplug"
-RCONFLICTS = "hotplug"
-RREPLACES = "hotplug"
+RPROVIDES_${PN} = "hotplug"
+RCONFLICTS_${PN} = "hotplug"
+RREPLACES_${PN} = "hotplug"
 PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/hotplug-ng-${PV}.tar.gz \
diff --git a/recipes/initscripts/initscripts-openprotium_1.0.bb b/recipes/initscripts/initscripts-openprotium_1.0.bb
index aa20e29..3e87c6d 100644
--- a/recipes/initscripts/initscripts-openprotium_1.0.bb
+++ b/recipes/initscripts/initscripts-openprotium_1.0.bb
@@ -7,7 +7,7 @@
 # in.
 include initscripts_${PV}.bb
 
-RCONFLICTS = "initscripts"
+RCONFLICTS_${PN} = "initscripts"
 # All other standard definitions inherited from initscripts
 # Except the PR which is hacked here.  The format used is
 # a suffix
diff --git a/recipes/initscripts/initscripts-slugos_1.0.bb b/recipes/initscripts/initscripts-slugos_1.0.bb
index b793514..120d4c6 100644
--- a/recipes/initscripts/initscripts-slugos_1.0.bb
+++ b/recipes/initscripts/initscripts-slugos_1.0.bb
@@ -6,7 +6,7 @@
 
 include initscripts_${PV}.bb
 
-RCONFLICTS = "initscripts"
+RCONFLICTS_${PN} = "initscripts"
 
 # SlugOS uses the busybox makedevs, so until that dependency gets virtualized
 # the below lines serve to remove the dependency on the full makedevs package,
diff --git a/recipes/irk/irk-belkin_0.11.bb b/recipes/irk/irk-belkin_0.11.bb
index e9c3dc1..93b1e61 100644
--- a/recipes/irk/irk-belkin_0.11.bb
+++ b/recipes/irk/irk-belkin_0.11.bb
@@ -1,8 +1,8 @@
 require irk.inc
 
 DESCRIPTION += "(version with Belkin support)"
-RCONFLICTS = "irk-targus"
-RREPLACES = "irk-targus"
+RCONFLICTS_${PN} = "irk-targus"
+RREPLACES_${PN} = "irk-targus"
 PR = "r3"
 
 SRC_URI = "http://www.openzaurus.org/download/3.5.4/sources/irk-current.tgz \
diff --git a/recipes/irk/irk-targus_0.11.0.bb b/recipes/irk/irk-targus_0.11.0.bb
index 30f53c8..cf8f424 100644
--- a/recipes/irk/irk-targus_0.11.0.bb
+++ b/recipes/irk/irk-targus_0.11.0.bb
@@ -4,8 +4,8 @@ PR = "r2"
 DESCRIPTION += "(version with Targus support)"
 HOMEPAGE = "http://angela1.data-uncertain.co.uk/~zaurus/irk.php"
 
-RCONFLICTS = "irk-belkin"
-RREPLACES = "irk-belkin"
+RCONFLICTS_${PN} = "irk-belkin"
+RREPLACES_${PN} = "irk-belkin"
 
 SRC_URI = "http://www.openzaurus.org/download/3.5.4/sources/irk-${PV}.tgz \
            file://install-default-conf.patch"
diff --git a/recipes/libgpepimc/libgpepimc-hildon_0.5.bb b/recipes/libgpepimc/libgpepimc-hildon_0.5.bb
index 24c659e..7ab4672 100644
--- a/recipes/libgpepimc/libgpepimc-hildon_0.5.bb
+++ b/recipes/libgpepimc/libgpepimc-hildon_0.5.bb
@@ -5,7 +5,7 @@ SECTION = "gpe/libs"
 PRIORITY    = "optional"
 DEPENDS     = "libgpewidget-hildon gtk+ sqlite hildon-lgpl"
 PROVIDES    = "libgepepimc"
-RPROVIDES   = "libgepepimc"
+RPROVIDES_${PN}   = "libgepepimc"
 
 SRC_URI     = "${GPE_MIRROR}/libgpepimc-${PV}.tar.bz2"
 
diff --git a/recipes/libgpepimc/libgpepimc.inc b/recipes/libgpepimc/libgpepimc.inc
index 3f5a60b..a56fb10 100644
--- a/recipes/libgpepimc/libgpepimc.inc
+++ b/recipes/libgpepimc/libgpepimc.inc
@@ -5,7 +5,7 @@ SECTION = "gpe/libs"
 PRIORITY    = "optional"
 DEPENDS     = "libgpewidget gtk+ sqlite"
 PROVIDES    = "libgepepimc"
-RPROVIDES   = "libgepepimc"
+RPROVIDES_${PN}   = "libgepepimc"
 
 SRC_URI     = "${GPE_MIRROR}/libgpepimc-${PV}.tar.bz2"
 
diff --git a/recipes/libgpepimc/libgpepimc_svn.bb b/recipes/libgpepimc/libgpepimc_svn.bb
index b195837..2b80adb 100644
--- a/recipes/libgpepimc/libgpepimc_svn.bb
+++ b/recipes/libgpepimc/libgpepimc_svn.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "LGPL"
 DEPENDS = "libgpewidget gtk+ sqlite"
 PROVIDES = "libgepepimc"
-RPROVIDES = "libgepepimc"
+RPROVIDES_${PN} = "libgepepimc"
 PV = "0.8+svn${SRCDATE}"
 PR = "r0"
 
diff --git a/recipes/libgpewidget/libgpewidget-hildon_0.102.bb b/recipes/libgpewidget/libgpewidget-hildon_0.102.bb
index fad3c5e..7d70913 100644
--- a/recipes/libgpewidget/libgpewidget-hildon_0.102.bb
+++ b/recipes/libgpewidget/libgpewidget-hildon_0.102.bb
@@ -21,7 +21,7 @@ do_stage () {
 }
 
 RDEPENDS_${PN} = "sdk-default-icons"
-RPROVIDES = "libgpewidget"
+RPROVIDES_${PN} = "libgpewidget"
 
 SRC_URI[md5sum] = "9eb90850adf65ec0d0ff26833f7cb8c6"
 SRC_URI[sha256sum] = "ac25c961899ac71b0df93b517ac12b7b3c3083397abe9053a77f1e763e573822"
diff --git a/recipes/links/links-x11_2.0+2.1pre30.bb b/recipes/links/links-x11_2.0+2.1pre30.bb
index 02eae77..62813c2 100644
--- a/recipes/links/links-x11_2.0+2.1pre30.bb
+++ b/recipes/links/links-x11_2.0+2.1pre30.bb
@@ -1,7 +1,7 @@
 require links.inc
 
 DEPENDS += "virtual/libx11"
-RCONFLICTS = "links"
+RCONFLICTS_${PN} = "links"
 PR = "r1"
 
 SRC_URI += " file://links2.desktop \
diff --git a/recipes/links/links_2.0+2.1pre30.bb b/recipes/links/links_2.0+2.1pre30.bb
index 9b23111..d0787cd 100644
--- a/recipes/links/links_2.0+2.1pre30.bb
+++ b/recipes/links/links_2.0+2.1pre30.bb
@@ -1,7 +1,7 @@
 require links.inc
 
 DEPENDS += "gpm"
-RCONFLICTS = "links-x11"
+RCONFLICTS_${PN} = "links-x11"
 PR = "r1"
 
 EXTRA_OECONF = "--enable-javascript --with-libfl --enable-graphics \
diff --git a/recipes/linux-hotplug/linux-hotplug_20040920.bb b/recipes/linux-hotplug/linux-hotplug_20040920.bb
index 15338e6..b25590d 100644
--- a/recipes/linux-hotplug/linux-hotplug_20040920.bb
+++ b/recipes/linux-hotplug/linux-hotplug_20040920.bb
@@ -7,7 +7,7 @@ RPROVIDES_${PN} = "hotplug"
 RCONFLICTS_${PN} = "hotplug"
 RREPLACES_${PN} = "hotplug"
 SECTION = "base"
-RSUGGESTS = "pciutils usbutils"
+RSUGGESTS_${PN} = "pciutils usbutils"
 PR = "r9"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/hotplug-2004_09_20.tar.gz \
diff --git a/recipes/logrotate/logrotate_3.7.1.bb b/recipes/logrotate/logrotate_3.7.1.bb
index 6e129ef..7e33d4c 100644
--- a/recipes/logrotate/logrotate_3.7.1.bb
+++ b/recipes/logrotate/logrotate_3.7.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Rotates, compresses, removes and mails system log files"
 HOMEPAGE = "http://packages.debian.org/unstable/admin/logrotate"
-RCONFLICTS = "logrotate-script"
+RCONFLICTS_${PN} = "logrotate-script"
 DEPENDS = "popt"
 RDEPENDS_${PN} = "cron"
 SECTION = "admin"
diff --git a/recipes/lyx/lyx_1.6.1.bb b/recipes/lyx/lyx_1.6.1.bb
index eb7200a..0949bcc 100644
--- a/recipes/lyx/lyx_1.6.1.bb
+++ b/recipes/lyx/lyx_1.6.1.bb
@@ -3,7 +3,7 @@ SECTION = "x11/office"
 LICENSE = "GPL"
 HOMEPAGE = "http://www.lyx.org"
 DEPENDS = "qt4-x11-free"
-RSUGGESTS = "tetex"
+RSUGGESTS_${PN} = "tetex"
 RDEPENDS_${PN} = "python-shell python-textutils"
 PR = "r0"
 
diff --git a/recipes/lyx/lyx_1.6.4.1.bb b/recipes/lyx/lyx_1.6.4.1.bb
index 8163c99..6fd4e4e 100644
--- a/recipes/lyx/lyx_1.6.4.1.bb
+++ b/recipes/lyx/lyx_1.6.4.1.bb
@@ -3,7 +3,7 @@ SECTION = "x11/office"
 LICENSE = "GPL"
 HOMEPAGE = "http://www.lyx.org"
 DEPENDS = "qt4-x11-free"
-RSUGGESTS = "tetex"
+RSUGGESTS_${PN} = "tetex"
 RDEPENDS_${PN} = "python-shell python-textutils"
 
 SRC_URI = "\
diff --git a/recipes/mamona/bash-noemu_3.2.bb b/recipes/mamona/bash-noemu_3.2.bb
index 4b517ec..1a1f991 100644
--- a/recipes/mamona/bash-noemu_3.2.bb
+++ b/recipes/mamona/bash-noemu_3.2.bb
@@ -1,8 +1,8 @@
 require ../bash/bash.inc
 PR = "r1"
 
-RCONFLICTS = "bash"
-RREPLACES = "bash"
+RCONFLICTS_${PN} = "bash"
+RREPLACES_${PN} = "bash"
 
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz \
            file://001-005.patch \
diff --git a/recipes/mamona/binutils-noemu_2.17.50.0.5.bb b/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
index 2ba6b44..189f13e 100644
--- a/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
+++ b/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
@@ -2,8 +2,8 @@ require ../binutils/binutils.inc
 
 PR = "r1"
 
-RCONFLICTS = "binutils"
-RREPLACES = "binutils"
+RCONFLICTS_${PN} = "binutils"
+RREPLACES_${PN} = "binutils"
 
 SRC_URI = \
     "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
diff --git a/recipes/mamona/binutils-noemu_2.18.bb b/recipes/mamona/binutils-noemu_2.18.bb
index 71ee384..e1ac7fc 100644
--- a/recipes/mamona/binutils-noemu_2.18.bb
+++ b/recipes/mamona/binutils-noemu_2.18.bb
@@ -2,8 +2,8 @@ PR = "r0"
 
 require ../binutils/binutils.inc
 
-RCONFLICTS = "binutils"
-RREPLACES = "binutils"
+RCONFLICTS_${PN} = "binutils"
+RREPLACES_${PN} = "binutils"
 RCONFLICTS_binutils-noemu-symlinks = "binutils-symlinks"
 RREPLACES_binutils-noemu-symlinks = "binutils-symlinks"
 
diff --git a/recipes/mamona/gcc-noemu_4.1.1.bb b/recipes/mamona/gcc-noemu_4.1.1.bb
index bd00ee1..f271631 100644
--- a/recipes/mamona/gcc-noemu_4.1.1.bb
+++ b/recipes/mamona/gcc-noemu_4.1.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.gnu.org/software/gcc/"
 SECTION = "devel"
 LICENSE = "GPL"
 
-RCONFLICTS = "gcc"
-RREPLACES = "gcc"
+RCONFLICTS_${PN} = "gcc"
+RREPLACES_${PN} = "gcc"
 
 inherit autotools gettext
 
diff --git a/recipes/mamona/gcc-noemu_4.1.2.bb b/recipes/mamona/gcc-noemu_4.1.2.bb
index 05cdeb0..835dcbd 100644
--- a/recipes/mamona/gcc-noemu_4.1.2.bb
+++ b/recipes/mamona/gcc-noemu_4.1.2.bb
@@ -6,8 +6,8 @@ LICENSE = "GPL"
 # remember to increment the -cross .bb PR too.
 PR = "r0"
 
-RCONFLICTS = "gcc"
-RREPLACES = "gcc"
+RCONFLICTS_${PN} = "gcc"
+RREPLACES_${PN} = "gcc"
 RCONFLICTS_g++-noemu = "g++"
 RREPLACES_g++-noemu = "g++"
 RCONFLICTS_cpp-noemu = "cpp"
diff --git a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb b/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
index d3ea264..9d50eef 100644
--- a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
+++ b/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Matchbox virtual keyboard for X11"
 LICENSE = "GPL"
 DEPENDS = "libfakekey expat libxft"
-RCONFLICTS = matchbox-keyboard-inputmethod
+RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
 RPROVIDES_${PN} = matchbox-keyboard-inputmethod
 SECTION = "x11"
 SRCREV = "1910"
diff --git a/recipes/matchbox-sato/matchbox-sato_0.1.bb b/recipes/matchbox-sato/matchbox-sato_0.1.bb
index 9d3fef6..5a44992 100644
--- a/recipes/matchbox-sato/matchbox-sato_0.1.bb
+++ b/recipes/matchbox-sato/matchbox-sato_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Custom MB session files for poky"
 LICENSE = "GPL"
 SECTION = "x11"
 RDEPENDS_${PN} = "gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato"
-RCONFLICTS = "matchbox-common"
+RCONFLICTS_${PN} = "matchbox-common"
 PR = "r17"
 
 SRC_URI = "file://etc file://matchbox-session"
diff --git a/recipes/matchbox-session/matchbox-session.bb b/recipes/matchbox-session/matchbox-session.bb
index 9976251..f872a21 100644
--- a/recipes/matchbox-session/matchbox-session.bb
+++ b/recipes/matchbox-session/matchbox-session.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Matchbox session support"
 RDEPENDS_${PN} = "matchbox-common"
 # they do the same in other way
-RCONFLICTS = "gpe-session-scripts"
+RCONFLICTS_${PN} = "gpe-session-scripts"
 
 do_install() {
         install -d ${D}${sysconfdir}/X11/Xsession.d/
diff --git a/recipes/meta/external-toolchain-generic.bb b/recipes/meta/external-toolchain-generic.bb
index c840301..3b466d4 100644
--- a/recipes/meta/external-toolchain-generic.bb
+++ b/recipes/meta/external-toolchain-generic.bb
@@ -15,7 +15,7 @@ PROVIDES = "\
     virtual/libiconv \
     "
 
-RPROVIDES = "glibc glibc-utils libsegfault glibc-thread-db libgcc-dev libgcc libstdc++-dev libstdc++ ldd"
+RPROVIDES_${PN} = "glibc glibc-utils libsegfault glibc-thread-db libgcc-dev libgcc libstdc++-dev libstdc++ ldd"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
 PR = "r2"
 
diff --git a/recipes/meta/external-toolchain.bb b/recipes/meta/external-toolchain.bb
index 3521263..48d2bcb 100644
--- a/recipes/meta/external-toolchain.bb
+++ b/recipes/meta/external-toolchain.bb
@@ -14,7 +14,7 @@ PROVIDES = "\
     virtual/libiconv \
     "
 
-RPROVIDES = "glibc-utils libsegfault glibc-thread-db libgcc-dev libgcc libstdc++-dev libstdc++"
+RPROVIDES_${PN} = "glibc-utils libsegfault glibc-thread-db libgcc-dev libgcc libstdc++-dev libstdc++"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
 PR = "r2"
 
diff --git a/recipes/midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb b/recipes/midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb
index eba507c..adcd8b7 100644
--- a/recipes/midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb
+++ b/recipes/midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb
@@ -7,7 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/midpath/midpath-0.3rc2.tar.gz"
 S = "${WORKDIR}/midpath-0.3rc2"
 
 DEPENDS = "classpath qte-mt"
-RCONFLICTS = "midpath-backend-qte"
+RCONFLICTS_${PN} = "midpath-backend-qte"
 
 inherit qt3x11
 
diff --git a/recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb b/recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb
index 3d4051b..6001abd 100644
--- a/recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb
+++ b/recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb
@@ -7,7 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/midpath/midpath-0.3rc2.tar.gz"
 S = "${WORKDIR}/midpath-0.3rc2"
 
 DEPENDS = "classpath qte-mt"
-RCONFLICTS = "midpath-backend-qt3"
+RCONFLICTS_${PN} = "midpath-backend-qt3"
 
 inherit qt3e
 
diff --git a/recipes/midpath/midpath-cldc_0.2+0.3rc2.bb b/recipes/midpath/midpath-cldc_0.2+0.3rc2.bb
index f9db194..e52ca5e 100644
--- a/recipes/midpath/midpath-cldc_0.2+0.3rc2.bb
+++ b/recipes/midpath/midpath-cldc_0.2+0.3rc2.bb
@@ -7,7 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/midpath/midpath-0.3rc2.tar.gz"
 S = "${WORKDIR}/midpath-0.3rc2"
 
 DESCRIPTION = "Implementation of the CLDC profile for use in the MIDPath library"
-RPROVIDES  = "midpath-cldc java-cldc1.1"
+RPROVIDES_${PN}  = "midpath-cldc java-cldc1.1"
 
 JAR = "midpath-cldc1.1.jar"
 
diff --git a/recipes/midpath/midpath.inc b/recipes/midpath/midpath.inc
index 50fd8ef..7859113 100644
--- a/recipes/midpath/midpath.inc
+++ b/recipes/midpath/midpath.inc
@@ -8,7 +8,7 @@ require midpath-common.inc
 RDEPENDS_${PN} = "midpath-core midpath-core-bluetooth midpath-core-ogg ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'midpath-core-mp3', d)}"
 
 PROVIDES = "midpath"
-RPROVIDES = "midpath"
+RPROVIDES_${PN} = "midpath"
 
 CONFIGURATION = "${@bb.fatal('Variable CONFIGURATION is not set in your midpath.inc-based recipe.')}"
 
diff --git a/recipes/misc-binary-only/prism-firmware.bb b/recipes/misc-binary-only/prism-firmware.bb
index fac20bc..22df8da 100644
--- a/recipes/misc-binary-only/prism-firmware.bb
+++ b/recipes/misc-binary-only/prism-firmware.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Firmware for the Prism 2.x/3 cards"
 SECTION = "base"
 LICENSE = "closed"
 RDEPENDS_${PN} = "hostap-utils"
-RREPLACES = "prism3-firmware prism3-support"
-RCONFLICTS = "prism3-firmware prism3-support"
+RREPLACES_${PN} = "prism3-firmware prism3-support"
+RCONFLICTS_${PN} = "prism3-firmware prism3-support"
 PACKAGE_ARCH = "all"
 PR = "r3"
 
diff --git a/recipes/monotone/monotone-6_0.33.bb b/recipes/monotone/monotone-6_0.33.bb
index 8bc24f2..5b50ec8 100644
--- a/recipes/monotone/monotone-6_0.33.bb
+++ b/recipes/monotone/monotone-6_0.33.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 DEPENDS = "boost"
 
 PROVIDES = "monotone"
-RPROVIDES = "monotone"
+RPROVIDES_${PN} = "monotone"
 
 S = "${WORKDIR}/monotone-${PV}"
 # no cross compile support - it tries to run the test program even with
diff --git a/recipes/monotone/monotone-6_0.34.bb b/recipes/monotone/monotone-6_0.34.bb
index 9a66952..c7a337a 100644
--- a/recipes/monotone/monotone-6_0.34.bb
+++ b/recipes/monotone/monotone-6_0.34.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 DEPENDS = "boost"
 
 PROVIDES = "monotone"
-RPROVIDES = "monotone"
+RPROVIDES_${PN} = "monotone"
 
 S = "${WORKDIR}/monotone-${PV}"
 # no cross compile support - it tries to run the test program even with
diff --git a/recipes/monotone/monotone-6_0.37.bb b/recipes/monotone/monotone-6_0.37.bb
index 716a26b..9f1bb7c 100644
--- a/recipes/monotone/monotone-6_0.37.bb
+++ b/recipes/monotone/monotone-6_0.37.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 DEPENDS = "boost"
 
 PROVIDES = "monotone"
-RPROVIDES = "monotone"
+RPROVIDES_${PN} = "monotone"
 
 S = "${WORKDIR}/monotone-${PV}"
 # no cross compile support - it tries to run the test program even with
diff --git a/recipes/motion/motion_3.2.11.bb b/recipes/motion/motion_3.2.11.bb
index d43ed27..b6f5c7a 100644
--- a/recipes/motion/motion_3.2.11.bb
+++ b/recipes/motion/motion_3.2.11.bb
@@ -5,7 +5,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "jpeg ffmpeg mysql postgresql"
 
-RSUGGESTS = "mysql-client postgresql-client"
+RSUGGESTS_${PN} = "mysql-client postgresql-client"
 
 PR = "r1"
 
diff --git a/recipes/multitap-pad/multitap-pad_svn.bb b/recipes/multitap-pad/multitap-pad_svn.bb
index efa7f04..8c7ec5a 100644
--- a/recipes/multitap-pad/multitap-pad_svn.bb
+++ b/recipes/multitap-pad/multitap-pad_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Multi-tap input method for GTK"
 LICENSE = "GPL"
 DEPENDS = "libfakekey gtk+ matchbox-panel-2"
-RCONFLICTS = matchbox-keyboard-inputmethod
+RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
 SECTION = "x11"
 SRCREV = "373"
 PV = "0.0+svnr${SRCPV}"
diff --git a/recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb b/recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb
index 2b7ea24..38c07c9 100644
--- a/recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb
+++ b/recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb
@@ -7,8 +7,8 @@ DEFAULT_PREFERENCE = "-1"
 S = "${WORKDIR}/gtk+-${PV}"
 
 
-RCONFLICTS = "gtk+"
-RPROVIDES ="gtk+-directfb"
+RCONFLICTS_${PN} = "gtk+"
+RPROVIDES_${PN} ="gtk+-directfb"
 DEPENDS = "glib-2.0 pango-directfb atk jpeg libpng gtk-doc libgcrypt cairo-directfb cups"
 LDFLAGS_append += " -ldirectfb"
 CFLAGS_append  += " -I${STAGING_INCDIR}/directfb"
diff --git a/recipes/ntp/ntp.inc b/recipes/ntp/ntp.inc
index 68b98db..5a90e74 100644
--- a/recipes/ntp/ntp.inc
+++ b/recipes/ntp/ntp.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://ntp.isc.org/bin/view/Main/WebHome"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "ntp"
-RSUGGESTS = "iana-etc"
+RSUGGESTS_${PN} = "iana-etc"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
 	file://ipv6only-workaround.patch \
diff --git a/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb b/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb
index 70a35a1..d259a26 100644
--- a/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb
+++ b/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb
@@ -20,7 +20,7 @@ RDEPENDS_${PN} += "python-re python-datetime python-edje python-ecore \
              atd-over-fso alsa-utils-amixer alsa-utils-alsactl \
              ttf-dejavu-sans"
 
-RSUGGESTS += "mplayer alsa-utils-aplay openmoko-alsa-scenarios"
+RSUGGESTS_${PN} += "mplayer alsa-utils-aplay openmoko-alsa-scenarios"
 
 SRC_URI[archive.md5sum] = "6f03b9663245b93e8370e43cc556dba1"
 SRC_URI[archive.sha256sum] = "df0561124faa5c2e64038f5efcf39432c4795829115b86819083ae66b001899a"
diff --git a/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb b/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
index c0ae618..8c14ccb 100644
--- a/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
+++ b/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 SECTION = "x11/gnome"
 PR = "r4"
 PROVIDES = "virtual/gnome-vfs"
-RPROVIDES = "gnome-vfs"
+RPROVIDES_${PN} = "gnome-vfs"
 
 inherit gnome pkgconfig
 
diff --git a/recipes/obsolete/shr/etk-theme-neo_git.bb b/recipes/obsolete/shr/etk-theme-neo_git.bb
index 42fcf70..68b83e1 100644
--- a/recipes/obsolete/shr/etk-theme-neo_git.bb
+++ b/recipes/obsolete/shr/etk-theme-neo_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nEo etk theme - a very fast, high contrast etk theme"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
-RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
+RSUGGESTS_${PN} = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
 LICENSE = "unknown"
 
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
index 637aa36..2b10c33 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "nEo libframeworkd-phonegui-efl - a very fast, high contrast etk t
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 RDEPENDS_${PN} = "libframeworkd-phonegui-efl"
-RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo etk-theme-neo gpe-theme-neo icon-theme-neo"
+RSUGGESTS_${PN} = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo etk-theme-neo gpe-theme-neo icon-theme-neo"
 LICENSE = "unknown"
 
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
diff --git a/recipes/obsolete/tasks/task-bootstrap-unionroot.bb b/recipes/obsolete/tasks/task-bootstrap-unionroot.bb
index c780979..c6f72b8 100644
--- a/recipes/obsolete/tasks/task-bootstrap-unionroot.bb
+++ b/recipes/obsolete/tasks/task-bootstrap-unionroot.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Core packages required for a basic installation with unionroot"
 PROVIDES = "task-bootstrap"
-RPROVIDES = "task-bootstrap"
+RPROVIDES_${PN} = "task-bootstrap"
 PR = "r2"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/openmoko-projects/illume-theme-asu_svn.bb b/recipes/openmoko-projects/illume-theme-asu_svn.bb
index 1798b80..174e9d3 100644
--- a/recipes/openmoko-projects/illume-theme-asu_svn.bb
+++ b/recipes/openmoko-projects/illume-theme-asu_svn.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://illume.projects.openmoko.org/"
 LICENSE = "MIT/BSD"
 DEPENDS = "edje-native eet-native"
 RPROVIDES_${PN} = "illume-theme"
-RCONFLICTS = "illume-config"
+RCONFLICTS_${PN} = "illume-config"
 SRCREV = "4881"
 PV = "0.0+svnr${SRCPV}"
 PR = "r9"
diff --git a/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb b/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
index aa93cce..3c9b693 100644
--- a/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
+++ b/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
@@ -11,8 +11,8 @@ RDEPENDS_${PN} = "\
   pulseaudio-module-cli-protocol-unix \
   gst-plugin-pulse \
 "
-RREPLACES = "openmoko-sound-system"
-RPROVIDES = "openmoko-sound-system"
+RREPLACES_${PN} = "openmoko-sound-system"
+RPROVIDES_${PN} = "openmoko-sound-system"
 PR = "r5.01"
 
 inherit openmoko-base update-rc.d
diff --git a/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb b/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
index 01385f5..a5cfaad 100644
--- a/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
+++ b/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Standard sound theme for the Openmoko framework"
 SECTION = "openmoko/base"
-RREPLACES = "openmoko-sound-theme-standard"
-RPROVIDES = "openmoko-sound-theme-standard"
+RREPLACES_${PN} = "openmoko-sound-theme-standard"
+RPROVIDES_${PN} = "openmoko-sound-theme-standard"
 SRCREV = "4271"
 PV = "0.1+svnr${SRCPV}"
 PR = "r3"
diff --git a/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb b/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
index a85ad61..640a89e 100644
--- a/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
+++ b/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Standard Gtk+ theme for the Openmoko framework, QVGA edition"
 SECTION = "openmoko/base"
-RCONFLICTS = "openmoko-theme-standard"
-RPROVIDES = "openmoko-theme-standard-2"
+RCONFLICTS_${PN} = "openmoko-theme-standard"
+RPROVIDES_${PN} = "openmoko-theme-standard-2"
 SRCREV = "3425"
 PV = "0.1.1+svnr${SRCPV}"
 PR = "r1"
diff --git a/recipes/openmoko2/openmoko-theme-standard2_svn.bb b/recipes/openmoko2/openmoko-theme-standard2_svn.bb
index cc73cc5..306e634 100644
--- a/recipes/openmoko2/openmoko-theme-standard2_svn.bb
+++ b/recipes/openmoko2/openmoko-theme-standard2_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Standard Gtk+ theme for the Openmoko framework"
 SECTION = "openmoko/base"
-RCONFLICTS = "openmoko-theme-standard"
+RCONFLICTS_${PN} = "openmoko-theme-standard"
 SRCREV = "4338"
 PV = "0.1.1+svnr${SRCPV}"
 PR = "r5"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_cvs.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_cvs.bb
index 8dc186e..1722798 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_cvs.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_cvs.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 OPIE_CVS_PV ?= "1.2.2+cvs${SRCDATE}"
 PV = "${OPIE_CVS_PV}"
 PR = "r1"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.3.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.3.bb
index e0b8efe..1847b3b 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.3.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.3.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 
 TAG = "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/pics"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.4.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.4.bb
index e0b8efe..1847b3b 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.4.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.4.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 
 TAG = "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/pics"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs.bb
index cfbba1c..c352e59 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 OPIE_CVS_PV ?= "1.2.2+cvs${SRCDATE}"
 PV = "${OPIE_CVS_PV}"
 PR = "r1"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.3.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.3.bb
index a40604c..aac3ccc 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.3.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.3.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 
 TAG = "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/pics"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.4.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.4.bb
index a40604c..aac3ccc 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.4.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.4.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 
 TAG = "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/pics"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb
index ff96d83..03cd981 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 OPIE_CVS_PV ?= "1.2.2+cvs${SRCDATE}"
 PV = "${OPIE_CVS_PV}"
 PR = "r1"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.3.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.3.bb
index 7a6715e..52a59cd 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.3.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.3.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 
 TAG = "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/pics"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.4.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.4.bb
index 7a6715e..52a59cd 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.4.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.4.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 
 TAG = "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/pics"
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.bb
index e77e00e..79d9c19 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.bb
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.bb
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "opieplayer2"
-RPROVIDES = "opie-mediaplayer2-skin"
+RPROVIDES_${PN} = "opie-mediaplayer2-skin"
 OPIE_CVS_PV ?= "1.2.2+cvs${SRCDATE}"
 PV = "${OPIE_CVS_PV}"
 PR = "r1"
diff --git a/recipes/opie-taskbar/opie-taskbar-images.inc b/recipes/opie-taskbar/opie-taskbar-images.inc
index b35dd8d..9f73d31 100644
--- a/recipes/opie-taskbar/opie-taskbar-images.inc
+++ b/recipes/opie-taskbar/opie-taskbar-images.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opie Launcher and Taskbar"
 SECTION = "opie/base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RPROVIDES = "${PN}"
+RPROVIDES_${PN} = "${PN}"
 APPNAME = "qpe"
 
 S = "${WORKDIR}/pics"
diff --git a/recipes/pulseaudio/pulseaudio-esd-wrapper.bb b/recipes/pulseaudio/pulseaudio-esd-wrapper.bb
index 1eef52b..b07cac9 100644
--- a/recipes/pulseaudio/pulseaudio-esd-wrapper.bb
+++ b/recipes/pulseaudio/pulseaudio-esd-wrapper.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv2"
 
 PR = "r1"
 
-RCONFLICTS = "esd"
-RREPLACES = "esd"
+RCONFLICTS_${PN} = "esd"
+RREPLACES_${PN} = "esd"
 
 RDEPENDS_${PN} = " \
 	pulseaudio-server \
diff --git a/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb b/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb
index fd8b456..474c474 100644
--- a/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb
+++ b/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb
@@ -5,8 +5,8 @@ LICENSE = "GPL"
 AUTHOR = "Anton Maslovsky"
 HOMEPAGE = "http://my-zaurus.narod.ru/"
 RDEPENDS_${PN} = "qpealarmclock"
-RCONFLICTS = "opie-clockapplet"
-RREPLACES = "opie-clockapplet"
+RCONFLICTS_${PN} = "opie-clockapplet"
+RREPLACES_${PN} = "opie-clockapplet"
 
 PR = "r1"
 
diff --git a/recipes/qpf-fonts/qpf-unifont_1.0.bb b/recipes/qpf-fonts/qpf-unifont_1.0.bb
index 16710e4..82510b0 100644
--- a/recipes/qpf-fonts/qpf-unifont_1.0.bb
+++ b/recipes/qpf-fonts/qpf-unifont_1.0.bb
@@ -2,7 +2,7 @@ require qpf.inc
 
 DESCRIPTION = "Unicode fonts - QPF Edition"
 LICENSE = "GPL QPL"
-RPROVIDES = "virtual-japanese-font"
+RPROVIDES_${PN} = "virtual-japanese-font"
 PR = "r2"
 
 SRC_URI = "http://www.openzaurus.org/mirror/qpf-unifont.tar.bz2"
diff --git a/recipes/qpf-fonts/qpf-unismall_1.0.0.bb b/recipes/qpf-fonts/qpf-unismall_1.0.0.bb
index ce03c03..2e37b13 100644
--- a/recipes/qpf-fonts/qpf-unismall_1.0.0.bb
+++ b/recipes/qpf-fonts/qpf-unismall_1.0.0.bb
@@ -3,7 +3,7 @@ require qpf.inc
 DESCRIPTION = "Lightweight Japanese font in 10 point suitable for 320x240 display"
 HOMEPAGE = "http://sourceforge.jp/projects/zaurus-ja/"
 LICENSE = "GPL"
-RPROVIDES = "virtual-japanese-font"
+RPROVIDES_${PN} = "virtual-japanese-font"
 PR = "r4"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/zaurus-ja/773/unismall-${PV}.tar.gz"
diff --git a/recipes/samba/samba-essential_3.0.20.bb b/recipes/samba/samba-essential_3.0.20.bb
index f3c2584..ee594cf 100644
--- a/recipes/samba/samba-essential_3.0.20.bb
+++ b/recipes/samba/samba-essential_3.0.20.bb
@@ -10,7 +10,7 @@ SRC_URI = "file://config-lfs.patch \
 	   file://smb-essential-inactive.conf \
 	   file://Managing-Samba.txt"
 
-RCONFLICTS = "samba"
+RCONFLICTS_${PN} = "samba"
 
 INITSCRIPT_NAME = "samba"
 # No dependencies, goes in at level 20 (NOTE: take care with the
diff --git a/recipes/sarg/sarg_2.2.7.1.bb b/recipes/sarg/sarg_2.2.7.1.bb
index 38283d8..ca922c6 100644
--- a/recipes/sarg/sarg_2.2.7.1.bb
+++ b/recipes/sarg/sarg_2.2.7.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Squid Analysis Report Generator"
 SECTION = "utils"
 DEPENDS = "gd"
-RSUGGESTS = "squid"
+RSUGGESTS_${PN} = "squid"
 LICENSE = "GPL"
 HOMEPAGE = "http://sarg.sourceforge.net/sarg.php"
 PR = "r0"
diff --git a/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb b/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb
index d054136..cf40a35 100644
--- a/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb
+++ b/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb
@@ -5,8 +5,8 @@ SECTION = "opie/settings"
 PRIORITY = "optional"
 DEPENDS = "opie-sh"
 RDEPENDS_${PN} = "opie-sh"
-RPROVIDES = "oz-compat"
-RCONFLICTS = "oz-compat"
+RPROVIDES_${PN} = "oz-compat"
+RCONFLICTS_${PN} = "oz-compat"
 LICENSE = "GPL"
 PR = "r2"
 
diff --git a/recipes/sharprom-toolchain/sharprom-toolchain-native_1.0.bb b/recipes/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
index c391c36..882772b 100644
--- a/recipes/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
+++ b/recipes/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
@@ -17,7 +17,7 @@ PROVIDES_sharprom-compatible = "\
   virtual/arm-linux-gcc-initial "
 PR = "r3"
 
-RPROVIDES = "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
+RPROVIDES_${PN} = "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
 
 # This needs to be extracted to /usr/local/arm :
diff --git a/recipes/shr/e-wm-theme-illume-neo_git.bb b/recipes/shr/e-wm-theme-illume-neo_git.bb
index 89b6818..dd8371b 100644
--- a/recipes/shr/e-wm-theme-illume-neo_git.bb
+++ b/recipes/shr/e-wm-theme-illume-neo_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 DEPENDS = "edje-native"
 RDEPENDS_${PN} = "e-wm"
-RSUGGESTS = "elementary-theme-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
+RSUGGESTS_${PN} = "elementary-theme-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
 LICENCE = "unknown"
 
 SRCREV = "820f4d41531ad6f790615b6a7312a60e30e99fdc"
diff --git a/recipes/shr/elementary-theme-neo_git.bb b/recipes/shr/elementary-theme-neo_git.bb
index a7080d4..480b33b 100644
--- a/recipes/shr/elementary-theme-neo_git.bb
+++ b/recipes/shr/elementary-theme-neo_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 DEPENDS = "edje-native"
-RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
+RSUGGESTS_${PN} = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
 LICENSE = "unknown"
 
 SRCREV = "fb377425e69ce1fc13f5094801b96836203e8154"
diff --git a/recipes/shr/elementary-theme-o2_git.bb b/recipes/shr/elementary-theme-o2_git.bb
index 54a7f81..61b8c36 100644
--- a/recipes/shr/elementary-theme-o2_git.bb
+++ b/recipes/shr/elementary-theme-o2_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 DEPENDS = "edje-native"
-RSUGGESTS = "phoneui-shr-theme-o2"
+RSUGGESTS_${PN} = "phoneui-shr-theme-o2"
 LICENSE = "unknown"
 
 SRCREV = "b5eb3134850c277ad8ae1a960b03ff4a509278a8"
diff --git a/recipes/shr/gtk-theme-neo_git.bb b/recipes/shr/gtk-theme-neo_git.bb
index 7f35ecd..593e525 100644
--- a/recipes/shr/gtk-theme-neo_git.bb
+++ b/recipes/shr/gtk-theme-neo_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "nEo GTK theme - a very fast, high contrast GTK theme"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 RDEPENDS_${PN} += "icon-theme-neo"
-RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gpe-theme-neo icon-theme-neo"
+RSUGGESTS_${PN} = "elementary-theme-neo e-wm-theme-illume-neo gpe-theme-neo icon-theme-neo"
 LICENSE = "unknown"
 
 SRCREV = "f847105c5ef5d488a4bce0c0a85d572c3509d56f"
diff --git a/recipes/shr/icon-theme-neo_git.bb b/recipes/shr/icon-theme-neo_git.bb
index 73c5286..7ca4d99 100644
--- a/recipes/shr/icon-theme-neo_git.bb
+++ b/recipes/shr/icon-theme-neo_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 RDEPENDS_${PN} = "e-wm"
-RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo"
+RSUGGESTS_${PN} = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo"
 LICENSE = "unknown"
 
 SRCREV = "f847105c5ef5d488a4bce0c0a85d572c3509d56f"
diff --git a/recipes/shr/phoneui-shr-theme-neo_git.bb b/recipes/shr/phoneui-shr-theme-neo_git.bb
index 9652546..30cff01 100644
--- a/recipes/shr/phoneui-shr-theme-neo_git.bb
+++ b/recipes/shr/phoneui-shr-theme-neo_git.bb
@@ -5,7 +5,7 @@ SECTION = "e/utils"
 LICENSE = "unknown"
 DEPENDS = "edje-native"
 RDEPENDS_${PN} = "libphone-ui-shr"
-RSUGGESTS = "e-wm-theme-illume-neo gtk-theme-neo icon-theme-neo elementary-theme-neo"
+RSUGGESTS_${PN} = "e-wm-theme-illume-neo gtk-theme-neo icon-theme-neo elementary-theme-neo"
 SRCREV = "20e5e82819a7612aa31c753a6898ccc9e940c7c6"
 PV = "0.1+gitr${SRCPV}"
 PR = "r0"
diff --git a/recipes/shr/phoneui-shr-theme-o2_git.bb b/recipes/shr/phoneui-shr-theme-o2_git.bb
index 1fe0e70..eceed8b 100644
--- a/recipes/shr/phoneui-shr-theme-o2_git.bb
+++ b/recipes/shr/phoneui-shr-theme-o2_git.bb
@@ -5,7 +5,7 @@ SECTION = "e/utils"
 LICENSE = "unknown"
 DEPENDS = "edje-native"
 RDEPENDS_${PN} = "libphone-ui-shr"
-RSUGGESTS = "elementary-theme-o2"
+RSUGGESTS_${PN} = "elementary-theme-o2"
 SRCREV = "20e5e82819a7612aa31c753a6898ccc9e940c7c6"
 PV = "0.1+gitr${SRCPV}"
 PR = "r0"
diff --git a/recipes/socketcan/canutils.inc b/recipes/socketcan/canutils.inc
index 596785f..841f387 100644
--- a/recipes/socketcan/canutils.inc
+++ b/recipes/socketcan/canutils.inc
@@ -5,7 +5,7 @@ SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "LGPL"
 DEPENDS = "libsocketcan"
-RCONFLICTS = "socketcan-utils-test"
+RCONFLICTS_${PN} = "socketcan-utils-test"
 INC_PR = "r0"
 
 SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git;tag=${TAG} \
diff --git a/recipes/socketcan/socketcan-utils-test_svn.bb b/recipes/socketcan/socketcan-utils-test_svn.bb
index 2239a02..b7788b6 100644
--- a/recipes/socketcan/socketcan-utils-test_svn.bb
+++ b/recipes/socketcan/socketcan-utils-test_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Socketcan user space utilities and test apps"
 HOMEPAGE = "http://developer.berlios.de/projects/socketcan/"
 SECTION = "console/utils"
 LICENSE = "GPL"
-RCONFLICTS = "canutils"
+RCONFLICTS_${PN} = "canutils"
 
 SRCREV = "917"
 PV = "0.0+svnr${SRCPV}"
diff --git a/recipes/swt/swt3.4-gtk_3.4.2.bb b/recipes/swt/swt3.4-gtk_3.4.2.bb
index 179f78a..0347aa8 100644
--- a/recipes/swt/swt3.4-gtk_3.4.2.bb
+++ b/recipes/swt/swt3.4-gtk_3.4.2.bb
@@ -10,7 +10,7 @@ SWT_API_VERSION = "3.4"
 
 PROVIDES = "swt3.4-gtk"
 
-RCONFLICTS = "libswt3.5-gtk-java"
+RCONFLICTS_${PN} = "libswt3.5-gtk-java"
 
 SRC_URI[md5sum] = "2b97f05f86bd7138491d9a8c5934e840"
 SRC_URI[sha256sum] = "30c8c545faabae331420a6c37194470a4f74f508eab4e0463c65953d09cde6eb"
diff --git a/recipes/swt/swt3.5-gtk_3.5.1.bb b/recipes/swt/swt3.5-gtk_3.5.1.bb
index 6ef9dda..d2e23bb 100644
--- a/recipes/swt/swt3.5-gtk_3.5.1.bb
+++ b/recipes/swt/swt3.5-gtk_3.5.1.bb
@@ -13,4 +13,4 @@ SWT_API_VERSION = "3.5"
 
 PROVIDES = "swt3.5-gtk"
 
-RCONFLICTS = "libswt3.4-gtk-java"
+RCONFLICTS_${PN} = "libswt3.4-gtk-java"
diff --git a/recipes/tasks/task-mamona-sdk-noemu.bb b/recipes/tasks/task-mamona-sdk-noemu.bb
index 31e7215..586ff31 100644
--- a/recipes/tasks/task-mamona-sdk-noemu.bb
+++ b/recipes/tasks/task-mamona-sdk-noemu.bb
@@ -2,8 +2,8 @@ PR = "r2"
 
 require mamona-sdk.inc
 
-RCONFLICTS = "task-mamona-sdk"
-RREPLACES = "task-mamona-sdk"
+RCONFLICTS_${PN} = "task-mamona-sdk"
+RREPLACES_${PN} = "task-mamona-sdk"
 
 RDEPENDS_${PN} += "\
   bash-noemu \
diff --git a/recipes/tasks/task-mamona-sdk.bb b/recipes/tasks/task-mamona-sdk.bb
index d2b1fca..59085e8 100644
--- a/recipes/tasks/task-mamona-sdk.bb
+++ b/recipes/tasks/task-mamona-sdk.bb
@@ -2,8 +2,8 @@ PR = "r4"
 
 include mamona-sdk.inc
 
-RCONFLICTS = "task-mamona-sdk-noemu"
-RREPLACES = "task-mamona-sdk-noemu"
+RCONFLICTS_${PN} = "task-mamona-sdk-noemu"
+RREPLACES_${PN} = "task-mamona-sdk-noemu"
 
 RDEPENDS_${PN} += "\
   bash \
diff --git a/recipes/ttf-fonts/ttf-arphic-uming_20080216.bb b/recipes/ttf-fonts/ttf-arphic-uming_20080216.bb
index e92b4ca..3348d09 100644
--- a/recipes/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/recipes/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Unicode Mingti (printed) TrueType Font"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/CJKUnifonts"
 LICENSE = "${PN}"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
-RPROVIDES = "virtual-chinese-font"
+RPROVIDES_${PN} = "virtual-chinese-font"
 PR = "r1"
 
 SRC_URI = \
diff --git a/recipes/ttf-fonts/ttf-sazanami_20040629.bb b/recipes/ttf-fonts/ttf-sazanami_20040629.bb
index bff1b75..42c6a84 100644
--- a/recipes/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/recipes/ttf-fonts/ttf-sazanami_20040629.bb
@@ -7,7 +7,7 @@ AUTHOR = "Electronic Font Open Laboratory (/efont/)"
 HOMEPAGE = "http://sourceforge.jp/projects/efont/"
 LICENSE = "${PN}"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
-RPROVIDES = "virtual-japanese-font"
+RPROVIDES_${PN} = "virtual-japanese-font"
 PR = "r4"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
diff --git a/recipes/vala-terminal/vala-terminal_git.bb b/recipes/vala-terminal/vala-terminal_git.bb
index e49b9fa..e60bac5 100644
--- a/recipes/vala-terminal/vala-terminal_git.bb
+++ b/recipes/vala-terminal/vala-terminal_git.bb
@@ -12,5 +12,5 @@ SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;protocol=git;branch=master"
 S = "${WORKDIR}/git"
 
 RDEPENDS_${PN} = "ttf-liberation-mono"
-RREPLACES = "openmoko-terminal2"
-RPROVIDES = "openmoko-terminal2"
+RREPLACES_${PN} = "openmoko-terminal2"
+RPROVIDES_${PN} = "openmoko-terminal2"
diff --git a/recipes/vim/gvim_7.2.bb b/recipes/vim/gvim_7.2.bb
index 276a9f0..842b184 100644
--- a/recipes/vim/gvim_7.2.bb
+++ b/recipes/vim/gvim_7.2.bb
@@ -7,5 +7,5 @@ DEPENDS += "gtk+ xt"
 
 EXTRA_OECONF += "--enable-gtk2-test"
 
-#might needs RREPLACES as well
+#might needs RREPLACES_${PN} as well
 RCONFLICTS_${PN} = "vim vim-tiny"
diff --git a/recipes/vnc/fbvncserver2_cvs.bb b/recipes/vnc/fbvncserver2_cvs.bb
index 023d321..d33e9d5 100644
--- a/recipes/vnc/fbvncserver2_cvs.bb
+++ b/recipes/vnc/fbvncserver2_cvs.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = "libvncserver jpeg zlib gmp tslib"
 RRECOMMENDS_${PN} = "kernel-modules-uinput kernel-module-keybdev"
-RCONFLICTS = "fbvncserver, fbvncserver-kmodule"
+RCONFLICTS_${PN} = "fbvncserver, fbvncserver-kmodule"
 PV = "0.0.0+cvs${SRCDATE}"
 PR = "r0"
 
diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.6.inc b/recipes/wpa-supplicant/wpa-supplicant-0.6.inc
index 371f276..ffd2934 100644
--- a/recipes/wpa-supplicant/wpa-supplicant-0.6.inc
+++ b/recipes/wpa-supplicant/wpa-supplicant-0.6.inc
@@ -23,7 +23,7 @@ S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
 PACKAGES_prepend = "wpa-supplicant-passphrase "
 FILES_wpa-supplicant-passphrase = "/usr/sbin/wpa_passphrase"
 
-RREPLACES = "wpa-supplicant-cli"
+RREPLACES_${PN} = "wpa-supplicant-cli"
 
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase"
 
diff --git a/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb b/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb
index 90c4909..6ed797c 100644
--- a/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb
+++ b/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/wpa_supplicant-${PV}"
 PACKAGES_prepend = "wpa-supplicant-passphrase "
 FILES_wpa-supplicant-passphrase = "/usr/sbin/wpa_passphrase"
 
-RREPLACES = "wpa-supplicant-cli"
+RREPLACES_${PN} = "wpa-supplicant-cli"
 
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase"
 
diff --git a/recipes/xcursor-transparent-theme/xcursor-watchonly-theme_0.1.1.bb b/recipes/xcursor-transparent-theme/xcursor-watchonly-theme_0.1.1.bb
index 512c5fe..fbba757 100644
--- a/recipes/xcursor-transparent-theme/xcursor-watchonly-theme_0.1.1.bb
+++ b/recipes/xcursor-transparent-theme/xcursor-watchonly-theme_0.1.1.bb
@@ -1,8 +1,8 @@
 LICENSE = "GPL"
 DESCRIPTION = "Transparent xcursor theme for handheld systems with visible watch cursor"
 SECTION = "x11/base"
-RREPLACES = "xcursor-transparent-theme"
-RPROVIDES = "xcursor-transparent-theme"
+RREPLACES_${PN} = "xcursor-transparent-theme"
+RPROVIDES_${PN} = "xcursor-transparent-theme"
 PR ="r4"
 
 SRC_URI = "http://projects.o-hand.com/matchbox/sources/utils/xcursor-transparent-theme-${PV}.tar.gz \
diff --git a/recipes/xfce-extras/orage_4.4.2.bb b/recipes/xfce-extras/orage_4.4.2.bb
index 8ed06a1..076188d 100644
--- a/recipes/xfce-extras/orage_4.4.2.bb
+++ b/recipes/xfce-extras/orage_4.4.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Calendar application for the Xfce Desktop  Environment"
 DEPENDS = "libxfcegui4 exo libxml-parser-perl-native xfce4-panel xfce-mcs-manager"
-RREPLACES = "xfcalendar"
+RREPLACES_${PN} = "xfcalendar"
 
 inherit xfce
 
diff --git a/recipes/xfce-extras/orage_4.6.1.bb b/recipes/xfce-extras/orage_4.6.1.bb
index 7d4bce7..47f17f3 100644
--- a/recipes/xfce-extras/orage_4.6.1.bb
+++ b/recipes/xfce-extras/orage_4.6.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Calendar application for the Xfce Desktop  Environment"
 DEPENDS = "libxfcegui4  exo xfce4-panel"
 RDEPENDS_${PN} = "xfce4-panel"
-RREPLACES = "xfcalendar"
+RREPLACES_${PN} = "xfcalendar"
 
 SECTION = "x11"
 PR = "r3"
diff --git a/recipes/xorg-lib/libx11_git.bb b/recipes/xorg-lib/libx11_git.bb
index 05fc3e7..240ec7e 100644
--- a/recipes/xorg-lib/libx11_git.bb
+++ b/recipes/xorg-lib/libx11_git.bb
@@ -5,7 +5,7 @@ SECTION = "x11/libs"
 LICENSE = "XFree86"
 DEPENDS = "libxcb xproto xextproto libxau xtrans libxdmcp xcmiscproto xf86bigfontproto kbproto inputproto bigreqsproto util-macros"
 PROVIDES = "virtual/libx11"
-RPROVIDES = "virtual-libx11"
+RPROVIDES_${PN} = "virtual-libx11"
 SRCREV = "c3f3e4a9e531d010312c97e753d6e543e607094d"
 PV = "1.3.3+git"
 PR = "r3"
diff --git a/recipes/xorg-lib/libxscrnsaver_1.1.2.bb b/recipes/xorg-lib/libxscrnsaver_1.1.2.bb
index 0b97380..437105a 100644
--- a/recipes/xorg-lib/libxscrnsaver_1.1.2.bb
+++ b/recipes/xorg-lib/libxscrnsaver_1.1.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "X Screen Saver extension library"
 LICENSE = "GPL"
 DEPENDS += "libxext scrnsaverproto"
 PROVIDES = "libxss"
-RREPLACES = "libxss"
+RREPLACES_${PN} = "libxss"
 PR = "r1"
 PE = "1"
 
diff --git a/recipes/xorg-lib/libxscrnsaver_1.1.3.bb b/recipes/xorg-lib/libxscrnsaver_1.1.3.bb
index 442bb74..e63c75e 100644
--- a/recipes/xorg-lib/libxscrnsaver_1.1.3.bb
+++ b/recipes/xorg-lib/libxscrnsaver_1.1.3.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "X Screen Saver extension library"
 LICENSE = "GPL"
 DEPENDS += "libxext scrnsaverproto"
 PROVIDES = "libxss"
-RREPLACES = "libxss"
+RREPLACES_${PN} = "libxss"
 PR = "r1"
 PE = "1"
 
diff --git a/recipes/xorg-lib/libxscrnsaver_1.2.0.bb b/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
index 47759c2..11462e8 100644
--- a/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
+++ b/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "X Screen Saver extension library"
 LICENSE = "GPL"
 DEPENDS += "libxext scrnsaverproto"
 PROVIDES = "libxss"
-RREPLACES = "libxss"
+RREPLACES_${PN} = "libxss"
 PR = "r1"
 PE = "1"
 
diff --git a/recipes/zsafe/zsafe_2.1.3.bb b/recipes/zsafe/zsafe_2.1.3.bb
index fcbfe1f..c25acba 100644
--- a/recipes/zsafe/zsafe_2.1.3.bb
+++ b/recipes/zsafe/zsafe_2.1.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Password manager"
 SECTION = "opie/applications"
 PRIORITY    = "optional"
 LICENSE     = "GPL"
-RCONFLICTS  = "opie-zsafe"
+RCONFLICTS_${PN}  = "opie-zsafe"
 APPNAME     = "zsafe"
 APPTYPE     = "binary"
 APPDESKTOP  = "${WORKDIR}"
diff --git a/recipes/zten/zten_1.6.2.bb b/recipes/zten/zten_1.6.2.bb
index 6be6309..3f9dcdb 100644
--- a/recipes/zten/zten_1.6.2.bb
+++ b/recipes/zten/zten_1.6.2.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "eb kakasi"
 RDEPENDS_${PN} = "virtual-japanese-font"
-RCONFLICTS = "ztenv"
+RCONFLICTS_${PN} = "ztenv"
 PR = "r1"
 
 SRC_URI = "http://www.gohome.org/cgi-bin/viewcvs.cgi/zten.tar.gz;md5sum=d24f03c8df5c98d510590bd9a63dc932 \
-- 
1.7.1



