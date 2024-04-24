Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DB6C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:29:56 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.16347.1713965396351712213
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 06:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout01.t-online.de (Postfix) with SMTP id ED400248
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 15:29:54 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.39.163]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzch8-1YE15s0; Wed, 24 Apr 2024 15:29:54 +0200
Date: Wed, 24 Apr 2024 15:30:19 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-control-center: update 46.0.1 ->
 46.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <J68GCS.FMGNEGJBY4CX@t-online.de>
In-Reply-To: <17C93A56EE770962.14591@lists.openembedded.org>
References: <17C93A56EE770962.14591@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-VF1MQWRUaBzUW4KVaj1g"
X-TOI-EXPURGATEID: 150726::1713965394-20FD5350-1314026D/0/0 CLEAN NORMAL
X-TOI-MSGID: dd6bbe46-24e6-494b-832a-97196c3f2bbd
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 13:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110128

--=-VF1MQWRUaBzUW4KVaj1g
Content-Type: text/plain; charset=us-ascii; format=flowed

sorry, there is a  a rebase problem with this patch. I'll send v2

On Wed, Apr 24 2024 at 03:28:16 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add PACKAGECONFIGS for file-share and media-share
> 
> 46.1
> * Accessibility
>  - Improve accessibility of "Typing" settings sliders
> 
> * Display
>  - Fix crash when pressing Escape in the display settings
> 
> * Network
>  - Add stable-ssid support for cloned-mac
> 
> * Privacy
>  - Add build option to enable Location services
>  - Fix opening of Help pages while viewing Privacy settings
> 
> * Sharing
>  - Auto hide Sharing panel when Rygel AND gnome-user-share are not 
> available
> 
> * System
>  - Don't show auto-timezone setting when Location services unavailable
>  - Avoid unnecessary time-change requests
>  - Fix issue with sensitivity of "Add" and "Enroll" Enterprise Login 
> buttons
>  - Improve generated passwords capacity in Remote Desktop settings
> 
> * Wacom
>  - Check for the right output connector name
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gnome-control-center/gnome-control-center_46.1.bb         | 4 
> +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
> index 838d041e0..87daec0c2 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
> @@ -44,6 +44,8 @@ PACKAGECONFIG ??= "ibus 
> ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
>  PACKAGECONFIG[cups] = ",,cups,cups"
>  PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
>  PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
> +PACKAGECONFIG[file-share] = ",,,gnome-user-share"
> +PACKAGECONFIG[media-share] = ",,,rygel-meta tumbler"
> 
>  EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
> 
> @@ -69,4 +71,4 @@ FILES:${PN} += " \
> 
>  FILES:${PN}-dev += "${datadir}/gettext"
> 
> -RDEPENDS:${PN} += "gsettings-desktop-schemas tecla 
> system-config-printer cups-pk-helper ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 
> 'gnome-user-share', '' , d)}"
> +RDEPENDS:${PN} += "gsettings-desktop-schemas tecla 
> system-config-printer cups-pk-helper"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110127): 
> <https://lists.openembedded.org/g/openembedded-devel/message/110127>
> Mute This Topic: <https://lists.openembedded.org/mt/105709807/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-VF1MQWRUaBzUW4KVaj1g
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">sorry, there is a &nbsp;a rebase problem with this patch. I'll send v2</div><div id="geary-quote" dir="auto"><br>On Wed, Apr 24 2024 at 03:28:16 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add PACKAGECONFIGS for file-share and media-share

46.1
* Accessibility
 - Improve accessibility of "Typing" settings sliders

* Display
 - Fix crash when pressing Escape in the display settings

* Network
 - Add stable-ssid support for cloned-mac

* Privacy
 - Add build option to enable Location services
 - Fix opening of Help pages while viewing Privacy settings

* Sharing
 - Auto hide Sharing panel when Rygel AND gnome-user-share are not available

* System
 - Don't show auto-timezone setting when Location services unavailable
 - Avoid unnecessary time-change requests
 - Fix issue with sensitivity of "Add" and "Enroll" Enterprise Login buttons
 - Improve generated passwords capacity in Remote Desktop settings

* Wacom
 - Check for the right output connector name

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gnome-control-center/gnome-control-center_46.1.bb         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
index 838d041e0..87daec0c2 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
@@ -44,6 +44,8 @@ PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
 PACKAGECONFIG[cups] = ",,cups,cups"
 PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
 PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
+PACKAGECONFIG[file-share] = ",,,gnome-user-share"
+PACKAGECONFIG[media-share] = ",,,rygel-meta tumbler"
 
 EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
 
@@ -69,4 +71,4 @@ FILES:${PN} += " \
 
 FILES:${PN}-dev += "${datadir}/gettext"
 
-RDEPENDS:${PN} += "gsettings-desktop-schemas tecla system-config-printer cups-pk-helper <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'gnome-user-share', '' , d)}"
+RDEPENDS:${PN} += "gsettings-desktop-schemas tecla system-config-printer cups-pk-helper"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110127): <a href="https://lists.openembedded.org/g/openembedded-devel/message/110127">https://lists.openembedded.org/g/openembedded-devel/message/110127</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105709807/3618223">https://lists.openembedded.org/mt/105709807/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-VF1MQWRUaBzUW4KVaj1g--


