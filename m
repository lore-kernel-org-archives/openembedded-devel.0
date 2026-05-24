Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46343CD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 13:07:59 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7803.1779628075529795320
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 06:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=fWyVR4He;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout02.t-online.de (Postfix) with SMTP id 3CD42E2F3
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 15:07:53 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.161.166]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wR8YZ-4O3y4m0; Sun, 24 May 2026 15:07:51 +0200
Date: Sun, 24 May 2026 15:07:46 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] playerctl: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <YSLJFT.TES3FS5UE3P42@t-online.de>
In-Reply-To: <18B2823AC1FF4984.3209974@lists.openembedded.org>
References: <18B2823AC1FF4984.3209974@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-iRdCn1FCwBb1XeeiSqoS"
X-TOI-EXPURGATEID: 150726::1779628071-C1FF88CF-688AE2E7/0/0 CLEAN NORMAL
X-TOI-MSGID: 1be4872e-c0ea-4e59-af60-02b4dcbd75db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779628073; i=f_l_k@t-online.de;
	bh=T8Lnk+X2WLP74smpfCFQd8IGroyXg9VA0gd1kroZfo8=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=fWyVR4Hemxeew08ZJ/2F/Dkqyd/tn9/3wk74YvVYgrTqnvTVfENaEqnhcwcbRfoVh
	 xa1HJ4+hApuKlzUaIObPDaFUFd1tgIza7mcDEKK8WNCiNP5Znlf2KspmoCyojhBVTW
	 hwZGwu2o8NqJyuJPZ+tWY8zX6ljXOzxYC9MxbZJQyqja/7BXLn5Ps5OUjuocGr4WJ0
	 xzqrGOp6PQt5wmE7tZ84M6IL76hHBRfi2EqbVXUAiKrGzlv33zOoy3p9tjFNe+LVHH
	 HDvBMFaKPaeSaRNra/5Dp5QkVRHURc2VMxouureZdUlj4fARPhVyxQYhFutI0kqqej
	 k+vHmgKKRutVg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 13:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127189

--=-iRdCn1FCwBb1XeeiSqoS
Content-Type: text/plain; charset=us-ascii; format=flowed

v2:
Remove unnecessary runtime dependencies on glib-2.0

Package bash-completion into its own package

Am So, 24. Mai 2026 um 15:06:19 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> Playerctl is a command-line utility and library for controlling media 
> players that
> implement the MPRIS D-Bus Interface Specification. Playerctl makes it 
> easy to bind
> player actions, such as play and pause, to media keys. You can also 
> get metadata
> about the playing track such as the artist and title for integration 
> into statusline
> generators or other command-line tools.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../playerctl/playerctl_2.4.1.bb                 | 16 
> ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 
> meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
> 
> diff --git a/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb 
> b/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
> new file mode 100644
> index 0000000000..d4c28b8543
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "For true players only: vlc, mpv, RhythmBox, web browsers, 
> cmus, mpd, spotify and others."
> +LICENSE = "LGPL-3.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02" 
> <file://copying;md5=e6a600fd5e1d9cbde2d983680233ad02/>
> +
> +SRC_URI = 
> "git://github.com/altdesktop/playerctl.git;protocol=https;branch=master"
> +
> +DEPENDS = "glib-2.0"
> +
> +inherit meson pkgconfig gobject-introspection bash-completion
> +
> +EXTRA_OEMESON += "--buildtype=release -Dbash-completions=true 
> -Dgtk-doc=false"
> +
> +SRCREV = "e5304e9dc9a0c0c32b3689c3f141cf266d27f59c"
> +
> +FILES:${PN} += "${datadir}"
> +
> --
> 2.54.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127188): 
> <https://lists.openembedded.org/g/openembedded-devel/message/127188>
> Mute This Topic: <https://lists.openembedded.org/mt/119466300/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-iRdCn1FCwBb1XeeiSqoS
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2:</div><div><div>Remove unnecessary runtime dependencies on glib-2.0</div><div><br></div><div>Package bash-completion into its own package</div></div></div><div id="geary-quote" dir="auto"><br>Am So, 24. Mai 2026 um 15:06:19 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Playerctl is a command-line utility and library for controlling media players that
implement the MPRIS D-Bus Interface Specification. Playerctl makes it easy to bind
player actions, such as play and pause, to media keys. You can also get metadata
about the playing track such as the artist and title for integration into statusline
generators or other command-line tools.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../playerctl/playerctl_2.4.1.bb                 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb

diff --git a/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb b/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
new file mode 100644
index 0000000000..d4c28b8543
--- /dev/null
+++ b/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "For true players only: vlc, mpv, RhythmBox, web browsers, cmus, mpd, spotify and others."
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02" "="">file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"</a>
+
+SRC_URI = "git://github.com/altdesktop/playerctl.git;protocol=https;branch=master"
+
+DEPENDS = "glib-2.0"
+
+inherit meson pkgconfig gobject-introspection bash-completion
+
+EXTRA_OEMESON += "--buildtype=release -Dbash-completions=true -Dgtk-doc=false"
+
+SRCREV = "e5304e9dc9a0c0c32b3689c3f141cf266d27f59c"
+
+FILES:${PN} += "${datadir}"
+
<div>-- 
</div>2.54.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#127188): <a href="https://lists.openembedded.org/g/openembedded-devel/message/127188">https://lists.openembedded.org/g/openembedded-devel/message/127188</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/119466300/3618223">https://lists.openembedded.org/mt/119466300/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-iRdCn1FCwBb1XeeiSqoS--


