Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id 0122E6CA5C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAg4nW013454; 
	Sat, 21 Sep 2013 12:42:04 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAg38b013453;
	Sat, 21 Sep 2013 12:42:03 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:38 +0200
Message-Id: <1379760101-13380-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 07/10] xfce4-settings: add PACKAGECONFIG for sound-settings
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
X-List-Received-Date: Sat, 21 Sep 2013 10:42:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

defaults based upon DISTRO_FEATURES for alsa and pulseaudio

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 4b75dd7..227858a 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -23,9 +23,13 @@ PV = "4.10.0+git${SRCPV}"
  
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','datetime-setter','',d)}"
+PACKAGECONFIG ??= " \
+    ${@base_contains('DISTRO_FEATURES','systemd','datetime-setter','',d)} \
+    ${@base_contains('DISTRO_FEATURES','alsa','sound-setter', base_contains('DISTRO_FEATURES','pulseaudio','sound-setter','',d),d)} \
+"
 PACKAGECONFIG[datetime-setter] = "--enable-datetime-settings, --disable-datetime-settings,, tzdata"
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
+PACKAGECONFIG[sound-setter] = "--enable-sound-settings, --disable-sound-settings, libcanberra, libcanberra-gtk2 sound-theme-freedesktop"
 
 do_configure_prepend() {
     NOCONFIGURE=yes ./autogen.sh
@@ -43,3 +47,5 @@ do_install_prepend() {
 }
 
 RRECOMMENDS_${PN} += "gnome-icon-theme"
+RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','alsa','libcanberra-alsa','',d)}"
+RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','pulseaudio','libcanberra-pulse','',d)}"
-- 
1.8.3.1


