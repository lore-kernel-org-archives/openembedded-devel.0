Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D516C25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:13:29 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.3163.1716315203626722661
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id 8C5141DB23;
	Tue, 21 May 2024 20:13:20 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.175.137]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9TzD-2tAjlA0; Tue, 21 May 2024 20:13:20 +0200
Date: Tue, 21 May 2024 20:13:58 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-control-center: add
 PACKAGECONFIG knob for malcontent
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <ABLUDS.YFB34V0ZIK2U1@t-online.de>
In-Reply-To: <17D193737019FCE3.27972@lists.openembedded.org>
References: <17D193737019FCE3.27972@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zZHsezQGLYS4WUcEKHgj"
X-TOI-EXPURGATEID: 150726::1716315200-4EF73D42-95486808/0/0 CLEAN NORMAL
X-TOI-MSGID: 272ac7de-205f-45f9-88e7-ede2402bdaa6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110473

--=-zZHsezQGLYS4WUcEKHgj
Content-Type: text/plain; charset=us-ascii; format=flowed

avoid autoselect

On Tue, May 21 2024 at 08:11:23 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gnome-control-center/gnome-control-center_46.1.bb            | 1 
> +
>  1 file changed, 1 insertion(+)
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
> index 9b54a00e6..d88c42531 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
> @@ -46,6 +46,7 @@ PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, 
> ibus"
>  PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
>  PACKAGECONFIG[file-share] = ",,,gnome-user-share"
>  PACKAGECONFIG[media-share] = ",,,rygel-meta tumbler"
> +PACKAGECONFIG[malcontent] = 
> "-Dmalcontent=true,-Dmalcontent=false,malcontent,malcontent-ui"
> 
>  EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
> 
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110472): 
> <https://lists.openembedded.org/g/openembedded-devel/message/110472>
> Mute This Topic: <https://lists.openembedded.org/mt/106228511/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-zZHsezQGLYS4WUcEKHgj
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>avoid autoselect</div></div><div id="geary-quote" dir="auto"><br>On Tue, May 21 2024 at 08:11:23 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gnome-control-center/gnome-control-center_46.1.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
index 9b54a00e6..d88c42531 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.1.bb
@@ -46,6 +46,7 @@ PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
 PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
 PACKAGECONFIG[file-share] = ",,,gnome-user-share"
 PACKAGECONFIG[media-share] = ",,,rygel-meta tumbler"
+PACKAGECONFIG[malcontent] = "-Dmalcontent=true,-Dmalcontent=false,malcontent,malcontent-ui"
 
 EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
 
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110472): <a href="https://lists.openembedded.org/g/openembedded-devel/message/110472">https://lists.openembedded.org/g/openembedded-devel/message/110472</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/106228511/3618223">https://lists.openembedded.org/mt/106228511/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-zZHsezQGLYS4WUcEKHgj--


