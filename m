Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B12CA5FA8
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:22:37 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10278.1768926151813499438
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 08:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id C717A38B07;
	Tue, 20 Jan 2026 17:22:13 +0100 (CET)
Received: from [192.168.178.36] ([84.163.42.42]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viEUd-1pWzvk0; Tue, 20 Jan 2026 17:22:11 +0100
Date: Tue, 20 Jan 2026 17:22:05 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv3] gnome-settings-daemon: update 48.0 ->
 49.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <T4869T.9WY7XA7835Y21@t-online.de>
In-Reply-To: <188C7CE2BD7B324F.3496637@lists.openembedded.org>
References: <188C7CE2BD7B324F.3496637@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BTyqG94T6KUNZP0kpEKL"
X-TOI-EXPURGATEID: 150726::1768926131-D4FF6BB2-42E88416/0/0 CLEAN NORMAL
X-TOI-MSGID: d554b36d-eb21-4bcc-9904-84f381dff3db
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 16:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123674

--=-BTyqG94T6KUNZP0kpEKL
Content-Type: text/plain; charset=us-ascii; format=flowed

v3: add Upstream-Status: Submitted

On Tue, Jan 20 2026 at 17:20:44 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> PACKAGECONFIG for wayland,nm have been removed upstream
> PACKAGECONFIG for x11,xwayland have been added upstream
> 
> Add a patch to fix reproducibility in gnome-settings-daemon-src
> 
> ============
> Version 49.1
> ============
> - Translation updates
> 
> Power:
> - Avoid xext dependency
> 
> Xsettings:
> - Build only if X11 or Xwayland are enabled
> 
> ============
> Version 49.0
> ============
> - Translation updates
> 
> Power:
> - Avoid polling light sensor if ambient light setting is disabled
> 
> =============
> Version 49.rc
> =============
> - Translation updates
> - Update to GNOME Session changes
> 
> Power:
> - Fix check for shell-managed brightness
> - Refactor light sensor enablement
> 
> A11y-settings:
> - Manage Orca lifetime
> 
> ===============
> Version 49.beta
> ===============
> - Translation updates
> - Drop dependency on GTK4
> - Add xwayland/x11 build options
> 
> Power:
> - Do not treat all notifications as critical
> - Let backlight auto-dimming in control of GNOME Shell
> 
> Housekeeping:
> - Add new donation reminder notification
> 
> ==================
> Version 49.alpha.1
> ==================
> 
> Keyboard:
> - Drop keyboard bell GSettings schema leftovers
> 
> ================
> Version 49.alpha
> ================
> - Translation updates
> - Update to GTK4
> 
> Power:
> - Use new Mutter backlight D-Bus interface
> 
> Wacom:
> - Drop support to update per-button OLED screens in Wacom
>   Intuos 4 model with descriptive actions. This tablet model
>     will still be functional, but the tiny screens besides the
>       pad buttons will remain blank.
> 
>       ============
>       Version 48.1
>       ============
>       - Translation updates
>       - Cleanups and fixes
> 
>       Power:
>       - Ensure the backlight interface signal gets emitted on startup
>       - Avoid using uninitialized value when restoring brightness
> 
>       Sharing:
>       - Fixes to shutdown of sharing services
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...um-types.c.in-fix-reproducibility-is.patch | 42 
> +++++++++++++++++++
>  ..._48.0.bb => gnome-settings-daemon_49.1.bb} | 19 +++++----
>  2 files changed, 52 insertions(+), 9 deletions(-)
>  create mode 100644 
> meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
>  rename 
> meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-daemon_48.0.bb 
> => gnome-settings-daemon_49.1.bb} (67%)
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch 
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
> new file mode 100644
> index 0000000000..1aeb566609
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
> @@ -0,0 +1,42 @@
> +From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Thu, 15 Jan 2026 14:33:58 +0100
> +Subject: [PATCH] gsd-smartcard-enum-types.c.in:fix reproducibility 
> issue
> +
> +Upstream-Status: Submitted 
> [<https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests/467>]
> +---
> + plugins/smartcard/gsd-smartcard-enum-types.c.in | 4 ++--
> + plugins/smartcard/gsd-smartcard-enum-types.h.in | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/plugins/smartcard/gsd-smartcard-enum-types.c.in 
> b/plugins/smartcard/gsd-smartcard-enum-types.c.in
> +index f281cf4e..0a970105 100644
> +--- a/plugins/smartcard/gsd-smartcard-enum-types.c.in
> ++++ b/plugins/smartcard/gsd-smartcard-enum-types.c.in
> +@@ -5,8 +5,8 @@
> + /*** END file-header ***/
> +
> + /*** BEGIN file-production ***/
> +-#include "@filename@"
> +-/* enumerations from "@filename@" */
> ++#include "@basename@"
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> +
> + /*** BEGIN value-header ***/
> +diff --git a/plugins/smartcard/gsd-smartcard-enum-types.h.in 
> b/plugins/smartcard/gsd-smartcard-enum-types.h.in
> +index 79dcc3d8..3906ba4c 100644
> +--- a/plugins/smartcard/gsd-smartcard-enum-types.h.in
> ++++ b/plugins/smartcard/gsd-smartcard-enum-types.h.in
> +@@ -9,7 +9,7 @@ G_BEGIN_DECLS
> +
> + /*** BEGIN file-production ***/
> +
> +-/* enumerations from "@filename@" */
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> +
> + /*** BEGIN value-header ***/
> +--
> +2.52.0
> +
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb 
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
> similarity index 67%
> rename from 
> meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb
> rename to 
> meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
> index 9a2948d432..2125bd91fe 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
> @@ -17,33 +17,34 @@ DEPENDS = " \
>      libnotify \
>      upower \
>      libwacom \
> -    virtual/libx11 \
> +    networkmanager \
>  "
> 
>  # all these are mandatory
>  REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd 
> gobject-introspection-data"
>  GIR_MESON_OPTION = ""
> 
> -SRC_URI[archive.sha256sum] = 
> "f3da20ab4a2ba56fd3e97b991f2bc267973d5619bd58bfa516410aa036305e45"
> +SRC_URI += 
> "file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch" 
> <file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch/>
> +SRC_URI[archive.sha256sum] = 
> "2a9957fc4f91c3b9127b49484179bef485120d9c1c208e44d44e6a746e6cc1c1"
> 
>  PACKAGECONFIG ??= " \
> -    cups nm \
> -    alsa gudev \
> +    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd x11 alsa', 
> d)} \
> +    gudev \
>      smartcard \
> -    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland', d)} \
> +    xwayland \
> +    cups \
>  "
>  PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib"
>  PACKAGECONFIG[cups] = "-Dcups=true,-Dcups=false,cups"
>  PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
> -PACKAGECONFIG[nm] = 
> "-Dnetwork_manager=true,-Dnetwork_manager=false,networkmanager"
>  PACKAGECONFIG[smartcard] = "-Dsmartcard=true,-Dsmartcard=false,nss"
> -PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland"
> +PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> +PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=true"
> +PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,libx11 libxfixes"
> 
>  def gnome_verdir(v):
>     return oe.utils.trim_version(v, 1)
> 
> -PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
> -
>  FILES:${PN} += " \
>      ${systemd_user_unitdir} \
>      
> ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so \
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123673): 
> <https://lists.openembedded.org/g/openembedded-devel/message/123673>
> Mute This Topic: <https://lists.openembedded.org/mt/117365589/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-BTyqG94T6KUNZP0kpEKL
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v3: add Upstream-Status: Submitted</div></div><div id="geary-quote" dir="auto"><br>On Tue, Jan 20 2026 at 17:20:44 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">PACKAGECONFIG for wayland,nm have been removed upstream
PACKAGECONFIG for x11,xwayland have been added upstream

Add a patch to fix reproducibility in gnome-settings-daemon-src

============
Version 49.1
============
- Translation updates

Power:
- Avoid xext dependency

Xsettings:
- Build only if X11 or Xwayland are enabled

============
Version 49.0
============
- Translation updates

Power:
- Avoid polling light sensor if ambient light setting is disabled

=============
Version 49.rc
=============
- Translation updates
- Update to GNOME Session changes

Power:
- Fix check for shell-managed brightness
- Refactor light sensor enablement

A11y-settings:
- Manage Orca lifetime

===============
Version 49.beta
===============
- Translation updates
- Drop dependency on GTK4
- Add xwayland/x11 build options

Power:
- Do not treat all notifications as critical
- Let backlight auto-dimming in control of GNOME Shell

Housekeeping:
- Add new donation reminder notification

==================
Version 49.alpha.1
==================

Keyboard:
- Drop keyboard bell GSettings schema leftovers

================
Version 49.alpha
================
- Translation updates
- Update to GTK4

Power:
- Use new Mutter backlight D-Bus interface

Wacom:
- Drop support to update per-button OLED screens in Wacom
  Intuos 4 model with descriptive actions. This tablet model
    will still be functional, but the tiny screens besides the
      pad buttons will remain blank.

      ============
      Version 48.1
      ============
      - Translation updates
      - Cleanups and fixes

      Power:
      - Ensure the backlight interface signal gets emitted on startup
      - Avoid using uninitialized value when restoring brightness

      Sharing:
      - Fixes to shutdown of sharing services

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...um-types.c.in-fix-reproducibility-is.patch | 42 +++++++++++++++++++
 ..._48.0.bb =&gt; gnome-settings-daemon_49.1.bb} | 19 +++++----
 2 files changed, 52 insertions(+), 9 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-daemon_48.0.bb =&gt; gnome-settings-daemon_49.1.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
new file mode 100644
index 0000000000..1aeb566609
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
@@ -0,0 +1,42 @@
+From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Thu, 15 Jan 2026 14:33:58 +0100
+Subject: [PATCH] gsd-smartcard-enum-types.c.in:fix reproducibility issue
+
+Upstream-Status: Submitted [<a href="https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests/467">https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests/467</a>] 
+---
+ plugins/smartcard/gsd-smartcard-enum-types.c.in | 4 ++--
+ plugins/smartcard/gsd-smartcard-enum-types.h.in | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/smartcard/gsd-smartcard-enum-types.c.in b/plugins/smartcard/gsd-smartcard-enum-types.c.in
+index f281cf4e..0a970105 100644
+--- a/plugins/smartcard/gsd-smartcard-enum-types.c.in
++++ b/plugins/smartcard/gsd-smartcard-enum-types.c.in
+@@ -5,8 +5,8 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-#include "@filename@"
+-/* enumerations from "@filename@" */
++#include "@basename@"
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+diff --git a/plugins/smartcard/gsd-smartcard-enum-types.h.in b/plugins/smartcard/gsd-smartcard-enum-types.h.in
+index 79dcc3d8..3906ba4c 100644
+--- a/plugins/smartcard/gsd-smartcard-enum-types.h.in
++++ b/plugins/smartcard/gsd-smartcard-enum-types.h.in
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+-- 
+2.52.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
index 9a2948d432..2125bd91fe 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
@@ -17,33 +17,34 @@ DEPENDS = " \
     libnotify \
     upower \
     libwacom \
-    virtual/libx11 \
+    networkmanager \
 "
 
 # all these are mandatory
 REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-SRC_URI[archive.sha256sum] = "f3da20ab4a2ba56fd3e97b991f2bc267973d5619bd58bfa516410aa036305e45"
+SRC_URI += "<a href="file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch" "="">file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch"</a>
+SRC_URI[archive.sha256sum] = "2a9957fc4f91c3b9127b49484179bef485120d9c1c208e44d44e6a746e6cc1c1"
 
 PACKAGECONFIG ??= " \
-    cups nm \
-    alsa gudev \
+    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd x11 alsa', d)} \
+    gudev \
     smartcard \
-    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'wayland', d)} \
+    xwayland \
+    cups \
 "
 PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib"
 PACKAGECONFIG[cups] = "-Dcups=true,-Dcups=false,cups"
 PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
-PACKAGECONFIG[nm] = "-Dnetwork_manager=true,-Dnetwork_manager=false,networkmanager"
 PACKAGECONFIG[smartcard] = "-Dsmartcard=true,-Dsmartcard=false,nss"
-PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland"
+PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=true"
+PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,libx11 libxfixes"
 
 def gnome_verdir(v):
    return oe.utils.trim_version(v, 1)
 
-PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-
 FILES:${PN} += " \
     ${systemd_user_unitdir} \
     ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so \
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#123673): <a href="https://lists.openembedded.org/g/openembedded-devel/message/123673">https://lists.openembedded.org/g/openembedded-devel/message/123673</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117365589/3618223">https://lists.openembedded.org/mt/117365589/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-BTyqG94T6KUNZP0kpEKL--


