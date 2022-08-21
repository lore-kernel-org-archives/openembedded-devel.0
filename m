Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8A2C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 10:15:47 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.5360.1661076944692030868
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 03:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 195051B7E4
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 12:15:23 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.36.214]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oPhzF-0x20xM0; Sun, 21 Aug 2022 12:15:21 +0200
Date: Sun, 21 Aug 2022 12:15:15 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCH] pipewire: install as configured
To: openembedded-devel@lists.openembedded.org
Message-Id: <F5NYGR.3TGT3T8H4J9M1@t-online.de>
In-Reply-To: <20220821101303.4155-1-f_l_k@t-online.de>
References: <20220821101303.4155-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Nn8t9LFu3XQW8n6oB+oW"
X-TOI-EXPURGATEID: 150726::1661076921-01452C5E-F31659D9/0/0 CLEAN NORMAL
X-TOI-MSGID: bab1f9b4-b6cb-49a3-95e1-4266625cb7e0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Aug 2022 10:15:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98344

--=-Nn8t9LFu3XQW8n6oB+oW
Content-Type: text/plain; charset=us-ascii; format=flowed

I've sent this as a follow up since i'm unsure if you want that much 
configuration inside meta-openembedded

Am So, 21. Aug 2022 um 12:13:03 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> This is to make sure that all configured parts of pipewire are 
> installed on the target.
> For the systemd case, it would then just be a matter of starting the 
> pipewire user services,
> to get it running.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../pipewire/pipewire-media-session_0.4.1.bb          |  1 +
>  .../recipes-multimedia/pipewire/pipewire_0.3.56.bb    | 11 
> +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> index 5dd1eb160..2facf8529 100644
> --- 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> +++ 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> @@ -11,6 +11,7 @@ DEPENDS = " \
>  "
> 
>  RRECOMMENDS:${PN} += "pipewire"
> +RPROVIDES:${PN} = "media-session"
> 
>  SRC_URI = 
> "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> index eb8c9d01a..4dca6cc97 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> @@ -319,6 +319,17 @@ FILES:${PN}-jack = "\
>      ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
>  "
> 
> +RRECOMMENDS:${PN}:class-target = " \
> +	pipewire-alsa-card-profile \
> +	pipewire-modules-meta \
> +	pipewire-spa-plugins-meta \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'alsa', 
> 'pipewire-alsa', '', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'gstreamer', 
> 'gstreamer1.0-pipewire', '', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'jack', 
> 'pipewire-jack', '', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'pulseaudio', 
> 'pipewire-pulse', '', d)} \
> +	${PIPEWIRE_SESSION_MANAGER} \
> +"
> +
>  # Dynamic SPA plugin packages (see set_dynamic_metapkg_rdepends).
>  FILES:${PN}-spa-plugins = ""
>  RRECOMMENDS:${PN}-spa-plugins += "${PN}-spa-plugins-meta"
> --
> 2.34.1
> 


--=-Nn8t9LFu3XQW8n6oB+oW
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I've sent this as a follow up since i'm unsure if you want that much configuration inside meta-openembedded</div></div><div id="geary-quote" dir="auto"><br>Am So, 21. Aug 2022 um 12:13:03 +0200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This is to make sure that all configured parts of pipewire are installed on the target.
For the systemd case, it would then just be a matter of starting the pipewire user services,
to get it running.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../pipewire/pipewire-media-session_0.4.1.bb          |  1 +
 .../recipes-multimedia/pipewire/pipewire_0.3.56.bb    | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
index 5dd1eb160..2facf8529 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
@@ -11,6 +11,7 @@ DEPENDS = " \
 "
 
 RRECOMMENDS:${PN} += "pipewire"
+RPROVIDES:${PN} = "media-session"
 
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
 
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
index eb8c9d01a..4dca6cc97 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
@@ -319,6 +319,17 @@ FILES:${PN}-jack = "\
     ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
 "
 
+RRECOMMENDS:${PN}:class-target = " \
+	pipewire-alsa-card-profile \
+	pipewire-modules-meta \
+	pipewire-spa-plugins-meta \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'alsa', 'pipewire-alsa', '', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'gstreamer', 'gstreamer1.0-pipewire', '', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'jack', 'pipewire-jack', '', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'pulseaudio', 'pipewire-pulse', '', d)} \
+	${PIPEWIRE_SESSION_MANAGER} \
+"
+
 # Dynamic SPA plugin packages (see set_dynamic_metapkg_rdepends).
 FILES:${PN}-spa-plugins = ""
 RRECOMMENDS:${PN}-spa-plugins += "${PN}-spa-plugins-meta"
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-Nn8t9LFu3XQW8n6oB+oW--


