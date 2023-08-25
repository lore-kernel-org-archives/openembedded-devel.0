Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D90AEE49A6
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 21:30:03 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.1453.1692999001483902167
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 14:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout12.t-online.de (Postfix) with SMTP id 80E95517D;
	Fri, 25 Aug 2023 23:29:59 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.164.212]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZeNR-1YEZBw0; Fri, 25 Aug 2023 23:29:57 +0200
Date: Fri, 25 Aug 2023 23:29:51 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/2] xdg-desktop-portal: upgrade 1.16.0 ->
 1.17.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <RDUYZR.9BXK6ZONMLA4@t-online.de>
In-Reply-To: <177EBBA9EC613640.26341@lists.openembedded.org>
References: <20230825205355.220438-1-f_l_k@t-online.de>
	<177EBBA9EC613640.26341@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-AVqOGC3mIK3tdt+ozjlO"
X-TOI-EXPURGATEID: 150726::1692998997-427FA2B7-54690C19/0/0 CLEAN NORMAL
X-TOI-MSGID: b9cd9509-d84b-42f5-9fbb-10f37b25d9b5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 21:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104614

--=-AVqOGC3mIK3tdt+ozjlO
Content-Type: text/plain; charset=us-ascii; format=flowed

mmmh. I can build without issues on my selfmade host because I have the 
flatpak dbus service files installed on it, I guess.
Probably it will still break on ubuntu (where I created that hack back 
then).
Best solution would be to provide flatpak-native to avoid the need to 
have flatpak installed on the host system but that might
to get bloaty. I'll have a look

On Fri, Aug 25 2023 at 10:53:55 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> This is a pre-release version. I'm not sure if it's a blocker, but it 
> has
> some nice features and as my tests have shown, it doesn't seem to 
> require
> patching the .pc file anymore. I'm not sure if this was fixed 
> externally
> and by now it would work with 1.16.0 without the patch.
> 
> In any case, being able to omit this is an improvement.
> 
> Remove the dbus-native dependency as it is needed only for tests and 
> for that
> we also would need to provide python3-dbusmock-native
> 
> Explicitly set the target directories for dbus-service-dir and 
> flatpak-interfaces-dir
> to avoid this issue shown in log.do_configure:
> Flatpak interfaces dir      : 
> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xdg-desktop-portal/1.17.0/recipe-sysroot/usr/share/dbus-1/interfaces/
> 
> Changes in 1.17.0
> =================
> Released: 2023-08-04
> 
> - Drop the Autotools build. Meson is now the only supported build 
> system.
> - Rework how portal implementations are loaded. This new, more robust 
> system
>   allows selecting specific backends for specific portals, and 
> layering them
>   when necessary. Platforms that provide portals implementation are 
> encouraged
>   to provide a suitable configuration file.
> - Introduce a new Clipboard portal. This portal extends the Remote 
> Desktop
>   portal by adding support for sharing clipboard between remote 
> machines.
> - Introduce a new Input Capture portal. This portal adds mechanisms 
> for taking
>   control of input devices. The primary usage model is centered 
> around the
>   InputLeap and Synergy use cases, where local devices are used to 
> control
>   remote displays.
> - Stop using the deprecated GTimeVal struct
> - Bump GLib dependency to 2.66
> - Add an "accept-label" option the the Print portal. This lets apps 
> suggest a
>   proper label to the print operation.
> - Various fixes to the Global Shortcuts portal
> - Support restoring remote desktop sessions
> - Improve robustness of the OpenURI portal by validating more URIs
> - The PipeWire dependency is now mandatory
> - Various improvements for the test suite
> - Translation updates
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 27 
> -------------------
>  ...1.16.0.bb => xdg-desktop-portal_1.17.0.bb} | 10 ++++---
>  2 files changed, 6 insertions(+), 31 deletions(-)
>  delete mode 100644 
> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
>  rename 
> meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.16.0.bb 
> => xdg-desktop-portal_1.17.0.bb} (82%)
> 
> diff --git 
> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
> deleted file mode 100644
> index 1997d0ffe..000000000
> --- 
> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 7727dbfef4dd7ced3958ae9ada59a8899976b12d Mon Sep 17 00:00:00 
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Mon, 12 Dec 2022 18:40:31 +0100
> -Subject: [PATCH] xdg-desktop-portal.pc.in: add pc_sysrootdir dir
> -
> ----
> -Upstream-Status: Pending
> -
> - xdg-desktop-portal.pc.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/xdg-desktop-portal.pc.in b/xdg-desktop-portal.pc.in
> -index 585c0c8..15b5817 100644
> ---- a/xdg-desktop-portal.pc.in
> -+++ b/xdg-desktop-portal.pc.in
> -@@ -2,7 +2,7 @@ prefix=@prefix@
> - datarootdir=@datarootdir@
> - datadir=@datadir@
> -
> --interfaces_dir=${datadir}/dbus-1/interfaces/
> -+interfaces_dir=${pc_sysrootdir}${datadir}/dbus-1/interfaces
> -
> - Name: xdg-desktop-portal
> - Description: Desktop integration portal
> ---
> -2.34.1
> -
> diff --git 
> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.0.bb
> similarity index 82%
> rename from 
> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
> rename to 
> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.0.bb
> index 0b3a93ab3..125ab23ee 100644
> --- 
> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
> +++ 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.0.bb
> @@ -11,7 +11,6 @@ DEPENDS = " \
>      libportal \
>      geoclue \
>      pipewire \
> -    dbus-native \
>      fuse3 \
>      xmlto-native \
>      flatpak \
> @@ -29,15 +28,18 @@ inherit meson pkgconfig python3native 
> features_check
> 
>  SRC_URI = " \
>  
> 	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=main 
> \
> -	file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch 
> <file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch/> \
>  "
> 
>  S = "${WORKDIR}/git"
> -SRCREV = "88af6c8ca4106fcf70925355350a669848e9fd5a"
> +SRCREV = "e31960ab3d3ecd3efeef1c97d1d40d94b866f4b7"
> 
>  FILES:${PN} += "${libdir}/systemd ${datadir}/dbus-1"
> 
> -EXTRA_OEMESON += "--cross-file=${WORKDIR}/meson-${PN}.cross"
> +EXTRA_OEMESON += " \
> +	--cross-file=${WORKDIR}/meson-${PN}.cross \
> +	-Dflatpak-interfaces-dir=${datadir}/dbus-1/interfaces \
> +	-Ddbus-service-dir=${datadir}/dbus-1/services \
> +"
> 
>  do_write_config:append() {
>      cat >${WORKDIR}/meson-${PN}.cross <<EOF
> --
> 2.41.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104613): 
> <https://lists.openembedded.org/g/openembedded-devel/message/104613>
> Mute This Topic: <https://lists.openembedded.org/mt/100964145/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-AVqOGC3mIK3tdt+ozjlO
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>mmmh. I can build without issues on my selfmade host because I have the flatpak dbus service files installed on it, I guess.</div><div>Probably it will still break on ubuntu (where I created that hack back then).</div><div>Best solution would be to provide flatpak-native to avoid the need to have flatpak installed on the host system but that might</div><div>to get bloaty. I'll have a look</div></div><div id="geary-quote" dir="auto"><br>On Fri, Aug 25 2023 at 10:53:55 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This is a pre-release version. I'm not sure if it's a blocker, but it has
some nice features and as my tests have shown, it doesn't seem to require
patching the .pc file anymore. I'm not sure if this was fixed externally
and by now it would work with 1.16.0 without the patch.

In any case, being able to omit this is an improvement.

Remove the dbus-native dependency as it is needed only for tests and for that
we also would need to provide python3-dbusmock-native

Explicitly set the target directories for dbus-service-dir and flatpak-interfaces-dir
to avoid this issue shown in log.do_configure:
Flatpak interfaces dir      : /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xdg-desktop-portal/1.17.0/recipe-sysroot/usr/share/dbus-1/interfaces/

Changes in 1.17.0
=================
Released: 2023-08-04

- Drop the Autotools build. Meson is now the only supported build system.
- Rework how portal implementations are loaded. This new, more robust system
  allows selecting specific backends for specific portals, and layering them
  when necessary. Platforms that provide portals implementation are encouraged
  to provide a suitable configuration file.
- Introduce a new Clipboard portal. This portal extends the Remote Desktop
  portal by adding support for sharing clipboard between remote machines.
- Introduce a new Input Capture portal. This portal adds mechanisms for taking
  control of input devices. The primary usage model is centered around the
  InputLeap and Synergy use cases, where local devices are used to control
  remote displays.
- Stop using the deprecated GTimeVal struct
- Bump GLib dependency to 2.66
- Add an "accept-label" option the the Print portal. This lets apps suggest a
  proper label to the print operation.
- Various fixes to the Global Shortcuts portal
- Support restoring remote desktop sessions
- Improve robustness of the OpenURI portal by validating more URIs
- The PipeWire dependency is now mandatory
- Various improvements for the test suite
- Translation updates

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 27 -------------------
 ...1.16.0.bb =&gt; xdg-desktop-portal_1.17.0.bb} | 10 ++++---
 2 files changed, 6 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.16.0.bb =&gt; xdg-desktop-portal_1.17.0.bb} (82%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
deleted file mode 100644
index 1997d0ffe..000000000
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7727dbfef4dd7ced3958ae9ada59a8899976b12d Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-Date: Mon, 12 Dec 2022 18:40:31 +0100
-Subject: [PATCH] xdg-desktop-portal.pc.in: add pc_sysrootdir dir
-
----
-Upstream-Status: Pending
-
- xdg-desktop-portal.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xdg-desktop-portal.pc.in b/xdg-desktop-portal.pc.in
-index 585c0c8..15b5817 100644
---- a/xdg-desktop-portal.pc.in
-+++ b/xdg-desktop-portal.pc.in
-@@ -2,7 +2,7 @@ prefix=@prefix@
- datarootdir=@datarootdir@
- datadir=@datadir@
- 
--interfaces_dir=${datadir}/dbus-1/interfaces/
-+interfaces_dir=${pc_sysrootdir}${datadir}/dbus-1/interfaces
- 
- Name: xdg-desktop-portal
- Description: Desktop integration portal
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.0.bb
similarity index 82%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.0.bb
index 0b3a93ab3..125ab23ee 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.17.0.bb
@@ -11,7 +11,6 @@ DEPENDS = " \
     libportal \
     geoclue \
     pipewire \
-    dbus-native \
     fuse3 \
     xmlto-native \
     flatpak \
@@ -29,15 +28,18 @@ inherit meson pkgconfig python3native features_check
 
 SRC_URI = " \
 	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=main \
-	<a href="file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch">file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch</a> \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "88af6c8ca4106fcf70925355350a669848e9fd5a"
+SRCREV = "e31960ab3d3ecd3efeef1c97d1d40d94b866f4b7"
 
 FILES:${PN} += "${libdir}/systemd ${datadir}/dbus-1"
 
-EXTRA_OEMESON += "--cross-file=${WORKDIR}/meson-${PN}.cross"
+EXTRA_OEMESON += " \
+	--cross-file=${WORKDIR}/meson-${PN}.cross \
+	-Dflatpak-interfaces-dir=${datadir}/dbus-1/interfaces \
+	-Ddbus-service-dir=${datadir}/dbus-1/services \
+"
 
 do_write_config:append() {
     cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF
<div>-- 
</div>2.41.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#104613): <a href="https://lists.openembedded.org/g/openembedded-devel/message/104613">https://lists.openembedded.org/g/openembedded-devel/message/104613</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/100964145/3618223">https://lists.openembedded.org/mt/100964145/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-AVqOGC3mIK3tdt+ozjlO--


