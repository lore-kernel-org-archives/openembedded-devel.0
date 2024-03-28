Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711F2CD1288
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 23:34:33 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.5883.1711668868601657298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 16:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout11.t-online.de (Postfix) with SMTP id A272E209FE;
	Fri, 29 Mar 2024 00:34:26 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.230]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rpzGM-04GG000; Fri, 29 Mar 2024 00:34:26 +0100
Date: Fri, 29 Mar 2024 00:34:45 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH] gnome-control-center: update 46.0 ->
 46.0.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <X503BS.CX5H6LUE55HM1@t-online.de>
In-Reply-To: <17C10EA23D8426A5.32709@lists.openembedded.org>
References: <17C10EA23D8426A5.32709@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-PlTpNx23RmMNVjWXZXyr"
X-TOI-EXPURGATEID: 150726::1711668866-EFFFC9B6-728C71D2/0/0 CLEAN NORMAL
X-TOI-MSGID: 075df677-c4d1-48d4-9f06-60b0ee028bf8
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 23:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109679

--=-PlTpNx23RmMNVjWXZXyr
Content-Type: text/plain; charset=us-ascii; format=flowed

This was the last missing puzzle part. gnome-46 is running great for me 
now

On Thu, Mar 28 2024 at 11:37:18 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> This is an important update, because it fixes a segfault in a new
> settings tab 'system' that segfaulted, if it was selected.
> 
> This was horrible in two ways. A lot of important options were 
> unaccessable
> and also quite annoying ... if selected, gnome-control-center 
> constantly
> crashed on execution, unless started from shell with a working tab 
> like
> 'gnome-control-center wifi'
> 
> 46.0.1 confuses the gnomebase class. Workaround this by using git 
> fetcher,
> at least until they go back to normal xx.x scheme
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...control-center_46.0.bb => gnome-control-center_46.0.1.bb} | 5 
> ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>  rename 
> meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_46.0.bb 
> => gnome-control-center_46.0.1.bb} (92%)
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.1.bb
> similarity index 92%
> rename from 
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
> rename to 
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.1.bb
> index fe9f1efbc..de11239ed 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.1.bb
> @@ -37,8 +37,11 @@ inherit gtk-icon-cache pkgconfig gnomebase 
> gsettings gettext upstream-version-is
> 
>  REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd x11"
> 
> +SRC_URI = 
> "gitsm://gitlab.gnome.org/GNOME/gnome-control-center.git;protocol=https;nobranch=1"
>  SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch" 
> <file://0001-add-meson-option-to-pass-sysroot.patch/>
> -SRC_URI[archive.sha256sum] = 
> "25f67de05897868b2e97eaa0ecc986a408af08d4985c8a9da44f0d7bd8fea7a4"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "005f40dcfa464f113a1c95f97673bc5505fc15ad"
> 
>  PACKAGECONFIG ??= "ibus ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland', d)}"
>  PACKAGECONFIG[cups] = ",,cups,cups"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109678): 
> <https://lists.openembedded.org/g/openembedded-devel/message/109678>
> Mute This Topic: <https://lists.openembedded.org/mt/105207028/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-PlTpNx23RmMNVjWXZXyr
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This was the last missing puzzle part. gnome-46 is running great for me now</div></div><div id="geary-quote" dir="auto"><br>On Thu, Mar 28 2024 at 11:37:18 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This is an important update, because it fixes a segfault in a new
settings tab 'system' that segfaulted, if it was selected.

This was horrible in two ways. A lot of important options were unaccessable
and also quite annoying ... if selected, gnome-control-center constantly
crashed on execution, unless started from shell with a working tab like
'gnome-control-center wifi'

46.0.1 confuses the gnomebase class. Workaround this by using git fetcher,
at least until they go back to normal xx.x scheme

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...control-center_46.0.bb =&gt; gnome-control-center_46.0.1.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_46.0.bb =&gt; gnome-control-center_46.0.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.1.bb
index fe9f1efbc..de11239ed 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.0.1.bb
@@ -37,8 +37,11 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-version-is
 
 REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd x11"
 
+SRC_URI = "gitsm://gitlab.gnome.org/GNOME/gnome-control-center.git;protocol=https;nobranch=1"
 SRC_URI += "<a href="file://0001-Add-meson-option-to-pass-sysroot.patch" "="">file://0001-Add-meson-option-to-pass-sysroot.patch"</a>
-SRC_URI[archive.sha256sum] = "25f67de05897868b2e97eaa0ecc986a408af08d4985c8a9da44f0d7bd8fea7a4"
+
+S = "${WORKDIR}/git"
+SRCREV = "005f40dcfa464f113a1c95f97673bc5505fc15ad"
 
 PACKAGECONFIG ??= "ibus <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'wayland', d)}"
 PACKAGECONFIG[cups] = ",,cups,cups"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#109678): <a href="https://lists.openembedded.org/g/openembedded-devel/message/109678">https://lists.openembedded.org/g/openembedded-devel/message/109678</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105207028/3618223">https://lists.openembedded.org/mt/105207028/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-PlTpNx23RmMNVjWXZXyr--


