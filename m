Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3660C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 18:06:33 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.3726.1713981992971074319
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 11:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id 8B6C41A543
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 20:06:31 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.39.163]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzh0o-3Jj3ZI0; Wed, 24 Apr 2024 20:06:31 +0200
Date: Wed, 24 Apr 2024 20:06:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] rygel: update 0.42.4 -> 0.42.5
To: openembedded-devel@lists.openembedded.org
Message-Id: <KZKGCS.CIOVLRX0DSKG1@t-online.de>
In-Reply-To: <17C949671B32FDDB.31749@lists.openembedded.org>
References: <17C949671B32FDDB.31749@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-stEVI9ysJIYr5FZ7flFP"
X-TOI-EXPURGATEID: 150726::1713981991-03FFC89A-48E65BF6/0/0 CLEAN NORMAL
X-TOI-MSGID: a7580e40-4a83-431f-af62-4abd86cbada1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 18:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110140

--=-stEVI9ysJIYr5FZ7flFP
Content-Type: text/plain; charset=us-ascii; format=flowed

Resent this without changes because it looks like the first one got 
lost in nirvana

On Wed, Apr 24 2024 at 08:02:33 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - dont convert to systemd system service. rygel should be started as
>   a user service. This is also a requirement  to get it working in
>   gnome-control-center
> 
> - build with PACKAGECONFIG media-export to make rygel work out of the 
> box
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../rygel/{rygel_0.42.4.bb => rygel_0.42.5.bb}    | 15 
> +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>  rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.42.4.bb 
> => rygel_0.42.5.bb} (83%)
> 
> diff --git 
> a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb 
> b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
> similarity index 83%
> rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
> rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
> index 4fbdce086..e79bd77a5 100644
> --- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
> @@ -20,7 +20,7 @@ inherit gnomebase features_check vala 
> gobject-introspection gettext systemd
>  # gobject-introspection is mandatory for libmediaart-2.0 and cannot 
> be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
> 
> -SRC_URI[archive.sha256sum] = 
> "6310dfaa2d332b66119b9b020fad6a4bd27d9bc61faf780ca5ca0b62813303f7"
> +SRC_URI[archive.sha256sum] = 
> "1133602d2e6710aade6b22aa98d93384c8d56396f344763413e96e0110b7d89f"
> 
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
> @@ -28,7 +28,7 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
>  EXTRA_OEMESON = "-Dengines=gstreamer 
> -Dplugins=${@strip_comma('${RYGEL_PLUGINS}')}"
>  PACKAGECONFIG:append = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("DISTRO_FEATURES", "x11", " gtk+3", "", 
> d)}"
> 
> -PACKAGECONFIG ?= "external mpris ruih gst-launch"
> +PACKAGECONFIG ?= "external mpris ruih gst-launch media-export"
> 
>  PACKAGECONFIG[external] = ""
>  PACKAGECONFIG[mpris] = ""
> @@ -60,16 +60,9 @@ do_install:append() {
>         # Remove .la files for loadable modules
>         rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
>         rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
> -       if [ -e ${D}${nonarch_libdir}/systemd/user/rygel.service ]; 
> then
> -               mkdir -p ${D}${systemd_unitdir}/system
> -               mv ${D}${nonarch_libdir}/systemd/user/rygel.service 
> ${D}${systemd_unitdir}/system
> -               rmdir --ignore-fail-on-non-empty 
> ${D}${nonarch_libdir}/systemd/user \
> -               ${D}${nonarch_libdir}/systemd \
> -               ${D}${nonarch_libdir}
> -       fi
>  }
> 
> -FILES:${PN} += "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 
> ${datadir}/icons"
> +FILES:${PN} += "${libdir}/rygel-${LIBV}/engines 
> ${systemd_user_unitdir} ${datadir}/dbus-1 ${datadir}/icons"
>  FILES:${PN}-dbg += "${libdir}/rygel-${LIBV}/engines/.debug 
> ${libdir}/rygel-${LIBV}/plugins/.debug"
> 
>  PACKAGES += "${PN}-meta"
> @@ -77,8 +70,6 @@ ALLOW_EMPTY:${PN}-meta = "1"
> 
>  PACKAGES_DYNAMIC = "${PN}-plugin-*"
> 
> -SYSTEMD_SERVICE:${PN} = "rygel.service"
> -
>  python populate_packages:prepend () {
>      rygel_libdir = d.expand('${libdir}/rygel-${LIBV}')
>      postinst = d.getVar('plugin_postinst')
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110139): 
> <https://lists.openembedded.org/g/openembedded-devel/message/110139>
> Mute This Topic: <https://lists.openembedded.org/mt/105715439/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-stEVI9ysJIYr5FZ7flFP
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Resent this without changes because it looks like the first one got lost in nirvana</div></div><div id="geary-quote" dir="auto"><br>On Wed, Apr 24 2024 at 08:02:33 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- dont convert to systemd system service. rygel should be started as
  a user service. This is also a requirement  to get it working in
  gnome-control-center

- build with PACKAGECONFIG media-export to make rygel work out of the box

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../rygel/{rygel_0.42.4.bb =&gt; rygel_0.42.5.bb}    | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.42.4.bb =&gt; rygel_0.42.5.bb} (83%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
similarity index 83%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
index 4fbdce086..e79bd77a5 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
@@ -20,7 +20,7 @@ inherit gnomebase features_check vala gobject-introspection gettext systemd
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
 
-SRC_URI[archive.sha256sum] = "6310dfaa2d332b66119b9b020fad6a4bd27d9bc61faf780ca5ca0b62813303f7"
+SRC_URI[archive.sha256sum] = "1133602d2e6710aade6b22aa98d93384c8d56396f344763413e96e0110b7d89f"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
@@ -28,7 +28,7 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 EXTRA_OEMESON = "-Dengines=gstreamer -Dplugins=${@strip_comma('${RYGEL_PLUGINS}')}"
 PACKAGECONFIG:append = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("DISTRO_FEATURES", "x11", " gtk+3", "", d)}"
 
-PACKAGECONFIG ?= "external mpris ruih gst-launch"
+PACKAGECONFIG ?= "external mpris ruih gst-launch media-export"
 
 PACKAGECONFIG[external] = ""
 PACKAGECONFIG[mpris] = ""
@@ -60,16 +60,9 @@ do_install:append() {
        # Remove .la files for loadable modules
        rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
        rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
-       if [ -e ${D}${nonarch_libdir}/systemd/user/rygel.service ]; then
-               mkdir -p ${D}${systemd_unitdir}/system
-               mv ${D}${nonarch_libdir}/systemd/user/rygel.service ${D}${systemd_unitdir}/system
-               rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd/user \
-               ${D}${nonarch_libdir}/systemd \
-               ${D}${nonarch_libdir}
-       fi
 }
 
-FILES:${PN} += "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 ${datadir}/icons"
+FILES:${PN} += "${libdir}/rygel-${LIBV}/engines ${systemd_user_unitdir} ${datadir}/dbus-1 ${datadir}/icons"
 FILES:${PN}-dbg += "${libdir}/rygel-${LIBV}/engines/.debug ${libdir}/rygel-${LIBV}/plugins/.debug"
 
 PACKAGES += "${PN}-meta"
@@ -77,8 +70,6 @@ ALLOW_EMPTY:${PN}-meta = "1"
 
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
-SYSTEMD_SERVICE:${PN} = "rygel.service"
-
 python populate_packages:prepend () {
     rygel_libdir = d.expand('${libdir}/rygel-${LIBV}')
     postinst = d.getVar('plugin_postinst')
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110139): <a href="https://lists.openembedded.org/g/openembedded-devel/message/110139">https://lists.openembedded.org/g/openembedded-devel/message/110139</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105715439/3618223">https://lists.openembedded.org/mt/105715439/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-stEVI9ysJIYr5FZ7flFP--


