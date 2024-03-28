Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E35C54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 13:03:18 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.15222.1711630993038681424
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 06:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id D007011813;
	Thu, 28 Mar 2024 14:03:10 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.230]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rppPP-1YrL5U0; Thu, 28 Mar 2024 14:03:07 +0100
Date: Thu, 28 Mar 2024 14:03:32 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv6] gnome-user-share: add recipe
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <WX62BS.0Y0GW21RF67J3@t-online.de>
In-Reply-To: <17C0EF38D333F803.24962@lists.openembedded.org>
References: <17C0EF38D333F803.24962@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-932+KdIlBLotB4ksH5lA"
X-TOI-EXPURGATEID: 150726::1711630987-8152C9D7-F686F268/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f6c22f4-56b9-4c8a-bd2a-e5415071c469
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109667

--=-932+KdIlBLotB4ksH5lA
Content-Type: text/plain; charset=us-ascii; format=flowed

one more update ;)

mod-dnssd is moved to meta-webserver/recipes-httpd/apache-mod. I guess 
thats where it belongs

On Thu, Mar 28 2024 at 02:01:44 PM +01:00:00, Markus Volk 
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
> NOTE: Apache2 httpd doesn't need to be running. It'll get
>       started and stopped on demand by systemd.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gnome-control-center_46.0.bb              |  2 +-
>  .../gnome-user-share/gnome-user-share_43.0.bb | 24 
> +++++++++++++++++++
>  .../recipes-httpd/apache-mod/mod-dnssd_git.bb | 21 ++++++++++++++++
>  3 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 
> meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
>  create mode 100644 
> meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb
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
> diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb 
> b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb
> new file mode 100644
> index 000000000..25bd5f201
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb
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
> View/Reply Online (#109666): 
> <https://lists.openembedded.org/g/openembedded-devel/message/109666>
> Mute This Topic: <https://lists.openembedded.org/mt/105195949/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-932+KdIlBLotB4ksH5lA
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>one more update ;)</div><div><br></div><div>mod-dnssd is moved to meta-webserver/recipes-httpd/apache-mod. I guess thats where it belongs</div></div><div id="geary-quote" dir="auto"><br>On Thu, Mar 28 2024 at 02:01:44 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add it as runtime dependency to gnome-control-center because without it,
  the file sharing options are hidden.
- configure the paths to fit to openembedded env
- add mod_dnssd runtime dependency for apache2 as this is a requirement

To enable the feature, PACKAGECONFIG httpd needs to be added.
This is not done by default to avoid apache2 runtime dependency just by
including this recipe.
NOTE: Apache2 httpd doesn't need to be running. It'll get
      started and stopped on demand by systemd.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gnome-control-center_46.0.bb              |  2 +-
 .../gnome-user-share/gnome-user-share_43.0.bb | 24 +++++++++++++++++++
 .../recipes-httpd/apache-mod/mod-dnssd_git.bb | 21 ++++++++++++++++
 3 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
 create mode 100644 meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb

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
diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb
new file mode 100644
index 000000000..25bd5f201
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb
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
View/Reply Online (#109666): <a href="https://lists.openembedded.org/g/openembedded-devel/message/109666">https://lists.openembedded.org/g/openembedded-devel/message/109666</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105195949/3618223">https://lists.openembedded.org/mt/105195949/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-932+KdIlBLotB4ksH5lA--


