Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80614D1681C
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 11:51:27 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8403.1767959485001017234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 03:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout12.t-online.de (Postfix) with SMTP id AD460F3E1
	for <openembedded-devel@lists.openembedded.org>; Fri,  9 Jan 2026 12:50:55 +0100 (CET)
Received: from [192.168.178.36] ([79.219.239.35]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1veB10-24lpya0; Fri, 9 Jan 2026 12:50:50 +0100
Date: Fri, 09 Jan 2026 12:50:45 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-disk-utility: remove outdated
 patch
To: openembedded-devel@lists.openembedded.org
Message-Id: <L8IL8T.A7U5A69AD7IK@t-online.de>
In-Reply-To: <18890DAA9A5AA01F.2339348@lists.openembedded.org>
References: <18890DAA9A5AA01F.2339348@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oPGoPeBKmCeClBYbMmDT"
X-TOI-EXPURGATEID: 150726::1767959450-8FFFC85C-74650917/0/0 CLEAN NORMAL
X-TOI-MSGID: 4df49d74-bc88-4acc-b16d-5ba9861055c3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 11:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123297

--=-oPGoPeBKmCeClBYbMmDT
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: also remove the x11 packageconfig

On Fri, Jan 9 2026 at 12:48:21 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Dont remove libcanberra dependency. Meanwhile it can be built without
> pulling in gtk2
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...tility-remove-libcanberra-dependency.patch | 135 
> ------------------
>  .../gnome-disk-utility_46.1.bb                |   7 +-
>  2 files changed, 3 insertions(+), 139 deletions(-)
>  delete mode 100644 
> meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch 
> b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch
> deleted file mode 100644
> index 675f4635ba..0000000000
> --- 
> a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -From 36cbdd82f21e4ef37da9f05c1c5e770b6cd66df2 Mon Sep 17 00:00:00 
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Sun, 29 May 2022 06:35:26 +0200
> -Subject: [PATCH] gnome-disk-utility: remove libcanberra dependency
> -
> -libcanberra-gtk3 module isn't buildable for wayland.
> -Remove its dpendency.
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> -
> -Upstream-Status: Inappropriate
> ----
> - meson.build                           |  1 -
> - src/disks/gducreatediskimagedialog.c  | 27 
> ++-------------------------
> - src/disks/gdurestorediskimagedialog.c | 20 +-------------------
> - src/disks/meson.build                 |  1 -
> - 4 files changed, 3 insertions(+), 46 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 0daf7f82..cba6c74b 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -72,7 +72,6 @@ dvdread_dep = dependency('dvdread', version: '>= 
> 4.2.0')
> - gio_unix_dep = dependency('gio-unix-2.0', version: '>= 2.31.0')
> - gmodule_dep = dependency('gmodule-2.0')
> - gtk_dep = dependency('gtk+-3.0', version: '>= 3.16.0')
> --libcanberra_dep = dependency('libcanberra-gtk3', version: '>= 0.1')
> - # Keep the version here synchronised with subprojects/libhandy.wrap
> - libhandy_dep = dependency('libhandy-1', version: '>= 1.5.0', 
> fallback: ['libhandy', 'libhandy_dep'])
> - liblzma_dep = dependency('liblzma', version: '>= 5.0.5')
> -diff --git a/src/disks/gducreatediskimagedialog.c 
> b/src/disks/gducreatediskimagedialog.c
> -index 181b2892..a22004cf 100644
> ---- a/src/disks/gducreatediskimagedialog.c
> -+++ b/src/disks/gducreatediskimagedialog.c
> -@@ -21,8 +21,6 @@
> - #include <sys/ioctl.h>
> - #include <linux/fs.h>
> -
> --#include <canberra-gtk.h>
> --
> - #include "gduapplication.h"
> - #include "gduwindow.h"
> - #include "gducreatediskimagedialog.h"
> -@@ -297,19 +295,7 @@ create_disk_image_populate (DialogData *data)
> -
> - static void
> - play_read_error_sound (DialogData *data)
> --{
> --  const gchar *sound_message;
> --
> --  /* Translators: A descriptive string for the sound played when
> --   * there's a read error that's being ignored, see
> --   * CA_PROP_EVENT_DESCRIPTION
> --   */
> --  sound_message = _("Disk image read error");
> --  ca_gtk_play_for_widget (GTK_WIDGET (data->window), 0,
> --                          CA_PROP_EVENT_ID, "dialog-warning",
> --                          CA_PROP_EVENT_DESCRIPTION, sound_message,
> --                          NULL);
> --}
> -+{}
> -
> - /* 
> ---------------------------------------------------------------------------------------------------- 
> */
> -
> -@@ -403,16 +389,7 @@ update_job (DialogData *data,
> -
> - static void
> - play_complete_sound (DialogData *data)
> --{
> --  const gchar *sound_message;
> --
> --  /* Translators: A descriptive string for the 'complete' sound, 
> see CA_PROP_EVENT_DESCRIPTION */
> --  sound_message = _("Disk image copying complete");
> --  ca_gtk_play_for_widget (GTK_WIDGET (data->window), 0,
> --                          CA_PROP_EVENT_ID, "complete",
> --                          CA_PROP_EVENT_DESCRIPTION, sound_message,
> --                          NULL);
> --}
> -+{}
> -
> - /* 
> ---------------------------------------------------------------------------------------------------- 
> */
> -
> -diff --git a/src/disks/gdurestorediskimagedialog.c 
> b/src/disks/gdurestorediskimagedialog.c
> -index bccf97e9..e7ec81cb 100644
> ---- a/src/disks/gdurestorediskimagedialog.c
> -+++ b/src/disks/gdurestorediskimagedialog.c
> -@@ -17,8 +17,6 @@
> - #include <sys/ioctl.h>
> - #include <linux/fs.h>
> -
> --#include <canberra-gtk.h>
> --
> - #include "gduapplication.h"
> - #include "gduwindow.h"
> - #include "gdurestorediskimagedialog.h"
> -@@ -606,23 +604,7 @@ update_job (DialogData *data,
> -
> - static void
> - play_complete_sound (DialogData *data)
> --{
> --  const gchar *sound_message;
> --
> --  /* Translators: A descriptive string for the 'complete' sound, 
> see CA_PROP_EVENT_DESCRIPTION */
> --  sound_message = _("Disk image copying complete");
> --  ca_gtk_play_for_widget (GTK_WIDGET (data->dialog), 0,
> --                          CA_PROP_EVENT_ID, "complete",
> --                          CA_PROP_EVENT_DESCRIPTION, sound_message,
> --                          NULL);
> --
> --  if (data->inhibit_cookie > 0)
> --    {
> --      gtk_application_uninhibit (GTK_APPLICATION 
> (gdu_window_get_application (data->window)),
> --                                 data->inhibit_cookie);
> --      data->inhibit_cookie = 0;
> --    }
> --}
> -+{}
> -
> - /* 
> ---------------------------------------------------------------------------------------------------- 
> */
> -
> -diff --git a/src/disks/meson.build b/src/disks/meson.build
> -index 35b2f103..6fc367b4 100644
> ---- a/src/disks/meson.build
> -+++ b/src/disks/meson.build
> -@@ -85,7 +85,6 @@ deps = [
> -   dvdread_dep,
> -   gio_unix_dep,
> -   gmodule_dep,
> --  libcanberra_dep,
> -   libgdu_dep,
> -   libhandy_dep,
> -   liblzma_dep,
> ---
> -2.25.1
> -
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb 
> b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
> index 6f910c4c13..08854befa8 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
> @@ -2,11 +2,12 @@ SUMMARY = "GNOME disk utility"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> 
> -SECTION = "x11/gnome"
> +SECTION = "gnome"
> 
>  DEPENDS = " \
>      desktop-file-utils-native \
>      gtk+3 \
> +    libcanberra \
>      libdvdread \
>      libnotify \
>      libsecret \
> @@ -22,13 +23,11 @@ inherit gnomebase gsettings gtk-icon-cache 
> gettext features_check mime-xdg
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES = "polkit"
> 
> -PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd x11', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd', d)}"
> 
>  # As soon as elogind is of interest this needs rework: meson option 
> is combo
>  PACKAGECONFIG[systemd] = "-Dlogind=libsystemd,-Dlogind=none,systemd"
> -PACKAGECONFIG[x11] = ",,libcanberra"
> 
> -SRC_URI:append = " ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 
> 'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', 
> <file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch',/> 
> '', d)}"
>  SRC_URI[archive.sha256sum] = 
> "c24e9439a04d70bcfae349ca134c7005435fe2b6f452114df878bff0b89bbffe"
> 
>  EXTRA_OEMESON = "-Dman=false"
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123296): 
> <https://lists.openembedded.org/g/openembedded-devel/message/123296>
> Mute This Topic: <https://lists.openembedded.org/mt/117173371/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-oPGoPeBKmCeClBYbMmDT
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: also remove the x11 packageconfig</div></div><div id="geary-quote" dir="auto"><br>On Fri, Jan 9 2026 at 12:48:21 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Dont remove libcanberra dependency. Meanwhile it can be built without
pulling in gtk2

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...tility-remove-libcanberra-dependency.patch | 135 ------------------
 .../gnome-disk-utility_46.1.bb                |   7 +-
 2 files changed, 3 insertions(+), 139 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch
deleted file mode 100644
index 675f4635ba..0000000000
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 36cbdd82f21e4ef37da9f05c1c5e770b6cd66df2 Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-Date: Sun, 29 May 2022 06:35:26 +0200
-Subject: [PATCH] gnome-disk-utility: remove libcanberra dependency
-
-libcanberra-gtk3 module isn't buildable for wayland.
-Remove its dpendency.
-
-Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-
-Upstream-Status: Inappropriate
----
- meson.build                           |  1 -
- src/disks/gducreatediskimagedialog.c  | 27 ++-------------------------
- src/disks/gdurestorediskimagedialog.c | 20 +-------------------
- src/disks/meson.build                 |  1 -
- 4 files changed, 3 insertions(+), 46 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 0daf7f82..cba6c74b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -72,7 +72,6 @@ dvdread_dep = dependency('dvdread', version: '&gt;= 4.2.0')
- gio_unix_dep = dependency('gio-unix-2.0', version: '&gt;= 2.31.0')
- gmodule_dep = dependency('gmodule-2.0')
- gtk_dep = dependency('gtk+-3.0', version: '&gt;= 3.16.0')
--libcanberra_dep = dependency('libcanberra-gtk3', version: '&gt;= 0.1')
- # Keep the version here synchronised with subprojects/libhandy.wrap
- libhandy_dep = dependency('libhandy-1', version: '&gt;= 1.5.0', fallback: ['libhandy', 'libhandy_dep'])
- liblzma_dep = dependency('liblzma', version: '&gt;= 5.0.5')
-diff --git a/src/disks/gducreatediskimagedialog.c b/src/disks/gducreatediskimagedialog.c
-index 181b2892..a22004cf 100644
---- a/src/disks/gducreatediskimagedialog.c
-+++ b/src/disks/gducreatediskimagedialog.c
-@@ -21,8 +21,6 @@
- #include &lt;sys/ioctl.h&gt;
- #include &lt;linux/fs.h&gt;
- 
--#include &lt;canberra-gtk.h&gt;
--
- #include "gduapplication.h"
- #include "gduwindow.h"
- #include "gducreatediskimagedialog.h"
-@@ -297,19 +295,7 @@ create_disk_image_populate (DialogData *data)
- 
- static void
- play_read_error_sound (DialogData *data)
--{
--  const gchar *sound_message;
--
--  /* Translators: A descriptive string for the sound played when
--   * there's a read error that's being ignored, see
--   * CA_PROP_EVENT_DESCRIPTION
--   */
--  sound_message = _("Disk image read error");
--  ca_gtk_play_for_widget (GTK_WIDGET (data-&gt;window), 0,
--                          CA_PROP_EVENT_ID, "dialog-warning",
--                          CA_PROP_EVENT_DESCRIPTION, sound_message,
--                          NULL);
--}
-+{}
- 
- /* ---------------------------------------------------------------------------------------------------- */
- 
-@@ -403,16 +389,7 @@ update_job (DialogData *data,
- 
- static void
- play_complete_sound (DialogData *data)
--{
--  const gchar *sound_message;
--
--  /* Translators: A descriptive string for the 'complete' sound, see CA_PROP_EVENT_DESCRIPTION */
--  sound_message = _("Disk image copying complete");
--  ca_gtk_play_for_widget (GTK_WIDGET (data-&gt;window), 0,
--                          CA_PROP_EVENT_ID, "complete",
--                          CA_PROP_EVENT_DESCRIPTION, sound_message,
--                          NULL);
--}
-+{}
- 
- /* ---------------------------------------------------------------------------------------------------- */
- 
-diff --git a/src/disks/gdurestorediskimagedialog.c b/src/disks/gdurestorediskimagedialog.c
-index bccf97e9..e7ec81cb 100644
---- a/src/disks/gdurestorediskimagedialog.c
-+++ b/src/disks/gdurestorediskimagedialog.c
-@@ -17,8 +17,6 @@
- #include &lt;sys/ioctl.h&gt;
- #include &lt;linux/fs.h&gt;
- 
--#include &lt;canberra-gtk.h&gt;
--
- #include "gduapplication.h"
- #include "gduwindow.h"
- #include "gdurestorediskimagedialog.h"
-@@ -606,23 +604,7 @@ update_job (DialogData *data,
- 
- static void
- play_complete_sound (DialogData *data)
--{
--  const gchar *sound_message;
--
--  /* Translators: A descriptive string for the 'complete' sound, see CA_PROP_EVENT_DESCRIPTION */
--  sound_message = _("Disk image copying complete");
--  ca_gtk_play_for_widget (GTK_WIDGET (data-&gt;dialog), 0,
--                          CA_PROP_EVENT_ID, "complete",
--                          CA_PROP_EVENT_DESCRIPTION, sound_message,
--                          NULL);
--
--  if (data-&gt;inhibit_cookie &gt; 0)
--    {
--      gtk_application_uninhibit (GTK_APPLICATION (gdu_window_get_application (data-&gt;window)),
--                                 data-&gt;inhibit_cookie);
--      data-&gt;inhibit_cookie = 0;
--    }
--}
-+{}
- 
- /* ---------------------------------------------------------------------------------------------------- */
- 
-diff --git a/src/disks/meson.build b/src/disks/meson.build
-index 35b2f103..6fc367b4 100644
---- a/src/disks/meson.build
-+++ b/src/disks/meson.build
-@@ -85,7 +85,6 @@ deps = [
-   dvdread_dep,
-   gio_unix_dep,
-   gmodule_dep,
--  libcanberra_dep,
-   libgdu_dep,
-   libhandy_dep,
-   liblzma_dep,
--- 
-2.25.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
index 6f910c4c13..08854befa8 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
@@ -2,11 +2,12 @@ SUMMARY = "GNOME disk utility"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
 
-SECTION = "x11/gnome"
+SECTION = "gnome"
 
 DEPENDS = " \
     desktop-file-utils-native \
     gtk+3 \
+    libcanberra \
     libdvdread \
     libnotify \
     libsecret \
@@ -22,13 +23,11 @@ inherit gnomebase gsettings gtk-icon-cache gettext features_check mime-xdg
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd x11', d)}"
+PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd', d)}"
 
 # As soon as elogind is of interest this needs rework: meson option is combo
 PACKAGECONFIG[systemd] = "-Dlogind=libsystemd,-Dlogind=none,systemd"
-PACKAGECONFIG[x11] = ",,libcanberra"
 
-SRC_URI:append = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland', '<a href="file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch',">file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch',</a> '', d)}"
 SRC_URI[archive.sha256sum] = "c24e9439a04d70bcfae349ca134c7005435fe2b6f452114df878bff0b89bbffe"
 
 EXTRA_OEMESON = "-Dman=false"
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#123296): <a href="https://lists.openembedded.org/g/openembedded-devel/message/123296">https://lists.openembedded.org/g/openembedded-devel/message/123296</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117173371/3618223">https://lists.openembedded.org/mt/117173371/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-oPGoPeBKmCeClBYbMmDT--


