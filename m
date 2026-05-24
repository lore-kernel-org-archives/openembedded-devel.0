Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE341CD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 16:39:20 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12.1779640757483595430
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 09:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=O4f1Hi5z;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id DB491A6;
	Sun, 24 May 2026 18:39:15 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.161.166]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wRBr7-3tH2Yq0; Sun, 24 May 2026 18:39:13 +0200
Date: Sun, 24 May 2026 18:39:07 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] mpv-mpris: add recipe
To: openembedded-devel@lists.openembedded.org
Cc: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Message-Id: <8LVJFT.QYHEM208V0P72@t-online.de>
In-Reply-To: <18B28DB73AF529F3.3209974@lists.openembedded.org>
References: <18B28DB73AF529F3.3209974@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HHGYwsdGTqdF0nak/zqB"
X-TOI-EXPURGATEID: 150726::1779640753-A57F9F5F-F258FF1F/0/0 CLEAN NORMAL
X-TOI-MSGID: 58823795-fa5d-4eb2-9e0b-0410a03634c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779640755; i=f_l_k@t-online.de;
	bh=fSakjNCDKK3F66LfEaGd5JSg5eOz67VullOkBNzcrxA=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=O4f1Hi5z3jIuVieeeu6BefOKepmFbTOSErFqBGajmOkZWvH+anjGIzoptOkdCnslW
	 5H9SPJG/3C3yPesUVPYibnyvZ0Kcm0bjSPZ8zIoV0ETwqtMf8YONo3gfVKP0DYyTSX
	 +mlQDDfQTH1IBc6EcXa/eCebIleSeqAI9ErHgtrHI5uAjIdYT+Tfn2AZbSNMwtXmvR
	 +mdCTgbdioiQLiQO0xgN7bbDpYEjjJlSLQX8D49Ia6FQCSEcOOj3iFviL0XLrXghwm
	 0cKPpGs8N2ZyaTmjA1PYq6bEHYT8GuDba3KJ49/4k3HSmelSHzcJmohDwU7fF87cv0
	 NakkSogV/PhAw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 16:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127192

--=-HHGYwsdGTqdF0nak/zqB
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: Exclude from world build if 'commercial' is not in 
LICENSE_FLAGS_ACCEPTED like its done in mpv recipe (libavformat is 
required)


Am So, 24. Mai 2026 um 18:36:47 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> mpv-mpris is a plugin for mpv which allows control of the player 
> using standard media keys.
> 
> This plugin implements the MPRIS D-Bus interface and can be 
> controlled using tools such as
> playerctl or through many open source desktop environments, such as 
> GNOME and KDE.
> 
> It requires mpv to be built with --enable-cplugins (default as of mpv 
> 0.26) and to
> be built with Lua support (to enable loading scripts).
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../mplayer/mpv-mpris_1.2.bb                  | 20 
> +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 
> meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb 
> b/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
> new file mode 100644
> index 0000000000..802564193a
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "mpv-mpris is a plugin for mpv which allows control of the 
> player using standard media keys"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=6d9f933220f595813218a175adc13001" 
> <file://license;md5=6d9f933220f595813218a175adc13001/>
> +
> +SRC_URI = 
> "git://github.com/hoyon/mpv-mpris.git;protocol=https;branch=master"
> +SRCREV = "df95f07c48926d1589ee5fe36a455c1f49cbe4c8"
> +
> +DEPENDS += "ffmpeg glib-2.0 mpv"
> +
> +inherit pkgconfig
> +
> +do_install() {
> +	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> +}
> +
> +INSANE_SKIP:${PN} = "dev-so"
> +
> +EXCLUDE_FROM_WORLD = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("LICENSE_FLAGS_ACCEPTED", "commercial", 
> "0", "1", d)}"
> +
> +RDEPENDS:${PN} = "playerctl"
> --
> 2.54.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127191): 
> <https://lists.openembedded.org/g/openembedded-devel/message/127191>
> Mute This Topic: <https://lists.openembedded.org/mt/119468962/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-HHGYwsdGTqdF0nak/zqB
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: Exclude from world build if 'commercial' is not in LICENSE_FLAGS_ACCEPTED like its done in mpv recipe (libavformat is required)</div><div>&nbsp; &nbsp; &nbsp;&nbsp;</div></div><div id="geary-quote" dir="auto"><br>Am So, 24. Mai 2026 um 18:36:47 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">mpv-mpris is a plugin for mpv which allows control of the player using standard media keys.

This plugin implements the MPRIS D-Bus interface and can be controlled using tools such as
playerctl or through many open source desktop environments, such as GNOME and KDE.

It requires mpv to be built with --enable-cplugins (default as of mpv 0.26) and to
be built with Lua support (to enable loading scripts).

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../mplayer/mpv-mpris_1.2.bb                  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb b/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
new file mode 100644
index 0000000000..802564193a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "mpv-mpris is a plugin for mpv which allows control of the player using standard media keys"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=6d9f933220f595813218a175adc13001" "="">file://LICENSE;md5=6d9f933220f595813218a175adc13001"</a>
+
+SRC_URI = "git://github.com/hoyon/mpv-mpris.git;protocol=https;branch=master"
+SRCREV = "df95f07c48926d1589ee5fe36a455c1f49cbe4c8"
+
+DEPENDS += "ffmpeg glib-2.0 mpv"
+
+inherit pkgconfig
+
+do_install() {
+	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
+
+INSANE_SKIP:${PN} = "dev-so"
+
+EXCLUDE_FROM_WORLD = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
+
+RDEPENDS:${PN} = "playerctl"
<div>-- 
</div>2.54.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#127191): <a href="https://lists.openembedded.org/g/openembedded-devel/message/127191">https://lists.openembedded.org/g/openembedded-devel/message/127191</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/119468962/3618223">https://lists.openembedded.org/mt/119468962/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-HHGYwsdGTqdF0nak/zqB--


