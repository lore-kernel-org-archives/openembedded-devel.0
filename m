Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F357CD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 10:16:25 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42205.1781172983950113250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 03:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=oSSMjCKH;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd93.aul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout03.t-online.de (Postfix) with SMTP id 3E168EE86
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:16:22 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.168.237]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXcSR-0wwVyi0; Thu, 11 Jun 2026 12:16:19 +0200
Date: Thu, 11 Jun 2026 12:16:14 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] webkitgtk3: add PACKAGECONFIG for librice
To: openembedded-devel@lists.openembedded.org
Message-Id: <2VPGGT.H25UU00XMDKO@t-online.de>
In-Reply-To: <18B7FF506F314618.267903@lists.openembedded.org>
References: <18B7FF506F314618.267903@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-d+nQqCzfDEjeLYLsgQbR"
X-TOI-EXPURGATEID: 150726::1781172979-BDFF95B6-2C1D4870/0/0 CLEAN NORMAL
X-TOI-MSGID: e2a8a4c6-d042-41b9-89ff-adcc625ba0f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781172982; i=f_l_k@t-online.de;
	bh=DSyReA7nKENnhy+/kMaF+7P9t1z8DsDnFr0IEH5yMIM=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=oSSMjCKHmu5cxGCKFbq7Ls4pEkY8lrpy10BqwNDxef6OUa+jv0PVNXPxPSO/UKdSx
	 A3Z0N1bCKLo4A1Q2CiHAzClIMcxl3+8TaSxTkz9gR7b9wAjbaO8KHTulXN1nLWyL5j
	 Ms1vrEio6Wwte6FngOtycRS7iOfmWpZ3GmTCGpPPJeU8yU/IYmFyxVCpJphVVvavkD
	 e1sotYTDXxWVtacEr59FCWy7IlkQWcqBIWoYro4AeFQHsUVxAidolgchH1Dmg/lvmk
	 qLZY3IBjLijBfEmtuPL/vJgUWS5Lwminv5gjXpvE2MFq0Lbrk6R/ToTJvXw+9Zaiq7
	 EB0+jkiwA/gbQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127527

--=-d+nQqCzfDEjeLYLsgQbR
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: cleanup

flite was missing because I accidentially removed the speech 
packageconfig :)

Am Do, 11. Jun 2026 um 12:14:43 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> webkitgtk3 enables librice support by default, thus build fails.
> Add a PACKAGECONFIG for librice to handle this but disable by
> default to not change our dependencies. librice requires clang-native
> to build bindgen.
> 
> todo: enable this PACKAGECONFIG by default?
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
> index 4486450595..c0836d283d 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
> @@ -88,6 +88,7 @@ PACKAGECONFIG[bubblewrap] = 
> "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=$
>  PACKAGECONFIG[backtrace] = 
> "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
>  PACKAGECONFIG[sysprof-capture] = 
> "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
>  PACKAGECONFIG[speech] = 
> "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
> +PACKAGECONFIG[librice] = "-DUSE_LIBRICE=YES,-DUSE_LIBRICE=NO,librice"
> 
>  EXTRA_OECMAKE = " \
>  	-DPORT=GTK \
> --
> 2.54.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127526): 
> <https://lists.openembedded.org/g/openembedded-devel/message/127526>
> Mute This Topic: <https://lists.openembedded.org/mt/119754156/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-d+nQqCzfDEjeLYLsgQbR
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: cleanup</div><div><br></div><div>flite was missing because I accidentially removed the speech packageconfig :)</div></div><div id="geary-quote" dir="auto"><br>Am Do, 11. Jun 2026 um 12:14:43 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">webkitgtk3 enables librice support by default, thus build fails.
Add a PACKAGECONFIG for librice to handle this but disable by
default to not change our dependencies. librice requires clang-native
to build bindgen.

todo: enable this PACKAGECONFIG by default?

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
index 4486450595..c0836d283d 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
@@ -88,6 +88,7 @@ PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=$
 PACKAGECONFIG[backtrace] = "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
 PACKAGECONFIG[sysprof-capture] = "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
 PACKAGECONFIG[speech] = "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
+PACKAGECONFIG[librice] = "-DUSE_LIBRICE=YES,-DUSE_LIBRICE=NO,librice"
 
 EXTRA_OECMAKE = " \
 	-DPORT=GTK \
<div>-- 
</div>2.54.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#127526): <a href="https://lists.openembedded.org/g/openembedded-devel/message/127526">https://lists.openembedded.org/g/openembedded-devel/message/127526</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/119754156/3618223">https://lists.openembedded.org/mt/119754156/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-d+nQqCzfDEjeLYLsgQbR--


