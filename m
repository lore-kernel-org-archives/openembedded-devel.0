Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C47C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 12:11:48 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.14203.1711627901624295694
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 05:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout07.t-online.de (Postfix) with SMTP id 02E852ACC3
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:11:38 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.230]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rpobZ-42n9W40; Thu, 28 Mar 2024 13:11:37 +0100
Date: Thu, 28 Mar 2024 09:44:31 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv4] gnome-user-share: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <7YU1BS.5SX6P7AAVGQP2@t-online.de>
In-Reply-To: <17C0E11CB4FEFB3F.24962@lists.openembedded.org>
References: <17C0E11CB4FEFB3F.24962@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-9kGu3OFs2mRc/+Anjy7E"
X-TOI-EXPURGATEID: 150726::1711627897-E8C27D1B-7ECDC8F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 420b8928-0b51-4968-9c3c-e88457a642c4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 12:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109661

--=-9kGu3OFs2mRc/+Anjy7E
Content-Type: text/plain; charset=us-ascii; format=flowed

v4 fixes a typo

On Thu, Mar 28 2024 at 09:43:11 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add it as runtime dependency to gnome-control-center because 
> without it,
>   the file sharing options are hidden.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gnome-control-center_46.0.bb              |  2 +-
>  .../gnome-user-share/gnome-user-share_43.0.bb | 25 
> +++++++++++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 
> meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
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
> index 000000000..7c4e85dae
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
> @@ -0,0 +1,25 @@
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
> +PACKAGECONFIG ??= ""
> +# default path is /usr/sbin/httpd
> +PACKAGECONFIG[httpd2] = "-Dhttpd=httpd2,,,apache2"
> +PACKAGECONFIG[apache2] = "-Dhttpd=apache2,,,apache2"
> +
> +FILES:${PN} += "${systemd_user_unitdir}"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109657): 
> <https://lists.openembedded.org/g/openembedded-devel/message/109657>
> Mute This Topic: <https://lists.openembedded.org/mt/105193246/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-9kGu3OFs2mRc/+Anjy7E
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v4 fixes a typo</div></div><div id="geary-quote" dir="auto"><br>On Thu, Mar 28 2024 at 09:43:11 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add it as runtime dependency to gnome-control-center because without it,
  the file sharing options are hidden.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gnome-control-center_46.0.bb              |  2 +-
 .../gnome-user-share/gnome-user-share_43.0.bb | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb

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
index 000000000..7c4e85dae
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
@@ -0,0 +1,25 @@
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
+PACKAGECONFIG ??= ""
+# default path is /usr/sbin/httpd
+PACKAGECONFIG[httpd2] = "-Dhttpd=httpd2,,,apache2"
+PACKAGECONFIG[apache2] = "-Dhttpd=apache2,,,apache2"
+
+FILES:${PN} += "${systemd_user_unitdir}"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#109657): <a href="https://lists.openembedded.org/g/openembedded-devel/message/109657">https://lists.openembedded.org/g/openembedded-devel/message/109657</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105193246/3618223">https://lists.openembedded.org/mt/105193246/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-9kGu3OFs2mRc/+Anjy7E--


