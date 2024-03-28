Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668EEC54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 12:15:28 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.14158.1711628117909013536
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 05:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id B207E1EA80;
	Thu, 28 Mar 2024 13:14:33 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.230]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rpoeN-2YKJtY0; Thu, 28 Mar 2024 13:14:31 +0100
Date: Thu, 28 Mar 2024 13:14:56 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv5] gnome-user-share: add recipe
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <WO42BS.L6HVVWZVJH2C1@t-online.de>
In-Reply-To: <17C0EC9874D49642.24962@lists.openembedded.org>
References: <17C0EC9874D49642.24962@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-RPmY0rZVaL6m145WUqYP"
X-TOI-EXPURGATEID: 150726::1711628071-2350189A-9BA3535C/0/0 CLEAN NORMAL
X-TOI-MSGID: f48fcd87-90de-408c-ad80-564c9b6dc5a7
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 12:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109664

--=-RPmY0rZVaL6m145WUqYP
Content-Type: text/plain; charset=us-ascii; format=flowed

After some runtime tests I have here the hopefully final version. The 
file paths have been adjusted to work by default in openembedded. 
mod_dnssd for apache2 has been added as it is a runtime dependency of 
gnome-user-share.
Apache is expected to run with 'mpm prefork'. Currently this is decided 
by apache2 at build time depending on the machine, but prefork is the 
most conservative setting anyway, so you might as well use that as 
default. I am sending this as an extra patch because it would change 
the apache2 default settings

On Thu, Mar 28 2024 at 01:13:37 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add it as runtime dependency to gnome-control-center because 
> without it,
>   the file sharing options are hidden.
> - configure the paths to fit to openembedded env
> - add mod_dnssd runtime dependency for apache2 as this is a 
> requirement
> 
> To enable the feature, PACKAGECONFIG httpd needs to be added.
> This is not done by default to avoid apache2 runtime dependency just 
> by
> including this recipe.
> NOTE: Apache2 httpd doesn't need to be running on boot time. It'll get
>       started and stopped on demand by systemd.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gnome-control-center_46.0.bb              |  2 +-
>  .../gnome-user-share/gnome-user-share_43.0.bb | 24 
> +++++++++++++++++++
>  .../mod-dnssd/mod-dnssd_git.bb                | 21 ++++++++++++++++
>  3 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 
> meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
>  create mode 100644 
> meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
> index a691b8d3f..fe9f1efbc 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
> @@ -69,4 +69,4 @@ FILES:${PN} += " \
> 
>  FILES:${PN}-dev += "${datadir}/gettext"
> 
> -RDEPENDS:${PN} += "gsettings-desktop-schemas tecla 
> system-config-printer cups-pk-helper"
> +RDEPENDS:${PN} += "gsettings-desktop-schemas tecla 
> system-config-printer cups-pk-helper ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 
> 'gnome-user-share', '' , d)}"
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb 
> b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
> new file mode 100644
> index 000000000..3ff8f938a
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "This is gnome-user-share 43.0, a system for easy sharing 
> of user files."
> +LICENSE="GPL-2.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" 
> <file://copying;md5=94d55d512a9ba36caa9b7df079bae19f/>
> +
> +
> +DEPENDS = " \
> +    glib-2.0-native \
> +    glib-2.0 \
> +    systemd \
> +"
> +
> +inherit gnomebase gsettings features_check
> +
> +REQUIRED_DISTRO_FEATURES = "systemd"
> +
> +SRC_URI = 
> "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=https;branch=master"
> +SRCREV = "a0e790aa9494db9d1b1f48b4fc0d2f78e112044d"
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??= "modules"
> +PACKAGECONFIG[httpd] = "-Dhttpd=/usr/sbin/httpd,,,apache2 mod-dnssd"
> +PACKAGECONFIG[modules] = 
> "-Dmodules_path=/usr/libexec/apache2/modules"
> +
> +FILES:${PN} += "${systemd_user_unitdir}"
> diff --git 
> a/meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb 
> b/meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb
> new file mode 100644
> index 000000000..25bd5f201
> --- /dev/null
> +++ b/meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Avahi Module for Apache2."
> +HOMEPAGE = "https://0pointer.de/lennart/projects/mod_dnssd/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57" 
> <file://license;md5=3b83ef96387f14655fc854ddc3c6bd57/>
> +
> +DEPENDS = "apache2 avahi"
> +
> +SRC_URI = 
> "git://git.0pointer.de/mod_dnssd;protocol=git;branch=master"
> +SRCREV = "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
> +PV = "0.6"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF = "--disable-lynx"
> +
> +inherit autotools pkgconfig
> +
> +do_install() {
> +	install -Dm755 ${S}/src/.libs/mod_dnssd.so 
> ${D}${libexecdir}/apache2/modules/mod_dnssd.so
> +}
> +
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109662): 
> <https://lists.openembedded.org/g/openembedded-devel/message/109662>
> Mute This Topic: <https://lists.openembedded.org/mt/105195144/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-RPmY0rZVaL6m145WUqYP
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>After some runtime tests I have here the hopefully final version. The file paths have been adjusted to work by default in openembedded. mod_dnssd for apache2 has been added as it is a runtime dependency of gnome-user-share.</div><div>Apache is expected to run with 'mpm prefork'. Currently this is decided by apache2 at build time depending on the machine, but prefork is the most conservative setting anyway, so you might as well use that as default. I am sending this as an extra patch because it would change the apache2 default settings</div></div><div id="geary-quote" dir="auto"><br>On Thu, Mar 28 2024 at 01:13:37 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add it as runtime dependency to gnome-control-center because without it,
  the file sharing options are hidden.
- configure the paths to fit to openembedded env
- add mod_dnssd runtime dependency for apache2 as this is a requirement

To enable the feature, PACKAGECONFIG httpd needs to be added.
This is not done by default to avoid apache2 runtime dependency just by
including this recipe.
NOTE: Apache2 httpd doesn't need to be running on boot time. It'll get
      started and stopped on demand by systemd.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gnome-control-center_46.0.bb              |  2 +-
 .../gnome-user-share/gnome-user-share_43.0.bb | 24 +++++++++++++++++++
 .../mod-dnssd/mod-dnssd_git.bb                | 21 ++++++++++++++++
 3 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
 create mode 100644 meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
index a691b8d3f..fe9f1efbc 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
@@ -69,4 +69,4 @@ FILES:${PN} += " \
 
 FILES:${PN}-dev += "${datadir}/gettext"
 
-RDEPENDS:${PN} += "gsettings-desktop-schemas tecla system-config-printer cups-pk-helper"
+RDEPENDS:${PN} += "gsettings-desktop-schemas tecla system-config-printer cups-pk-helper <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'gnome-user-share', '' , d)}"
diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
new file mode 100644
index 000000000..3ff8f938a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "This is gnome-user-share 43.0, a system for easy sharing of user files."
+LICENSE="GPL-2.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" "="">file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"</a>
+
+
+DEPENDS = " \
+    glib-2.0-native \
+    glib-2.0 \
+    systemd \
+"
+
+inherit gnomebase gsettings features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=https;branch=master"
+SRCREV = "a0e790aa9494db9d1b1f48b4fc0d2f78e112044d"
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= "modules"
+PACKAGECONFIG[httpd] = "-Dhttpd=/usr/sbin/httpd,,,apache2 mod-dnssd"
+PACKAGECONFIG[modules] = "-Dmodules_path=/usr/libexec/apache2/modules"
+
+FILES:${PN} += "${systemd_user_unitdir}"
diff --git a/meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb b/meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb
new file mode 100644
index 000000000..25bd5f201
--- /dev/null
+++ b/meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Avahi Module for Apache2."
+HOMEPAGE = "https://0pointer.de/lennart/projects/mod_dnssd/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57" "="">file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"</a>
+
+DEPENDS = "apache2 avahi"
+
+SRC_URI = "git://git.0pointer.de/mod_dnssd;protocol=git;branch=master"
+SRCREV = "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
+PV = "0.6"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "--disable-lynx"
+
+inherit autotools pkgconfig
+
+do_install() {
+	install -Dm755 ${S}/src/.libs/mod_dnssd.so ${D}${libexecdir}/apache2/modules/mod_dnssd.so
+}
+
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#109662): <a href="https://lists.openembedded.org/g/openembedded-devel/message/109662">https://lists.openembedded.org/g/openembedded-devel/message/109662</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105195144/3618223">https://lists.openembedded.org/mt/105195144/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-RPmY0rZVaL6m145WUqYP--


