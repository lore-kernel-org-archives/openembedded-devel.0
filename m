Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FD1FD5F8D
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 07:06:32 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100594.1775631991199829895
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 00:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=lRMtsdHt;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd95.mgt.mul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout01.t-online.de (Postfix) with SMTP id 02F431D01C
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 09:06:13 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.170.104]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wAMzJ-1awr7g0; Wed, 8 Apr 2026 09:06:09 +0200
Date: Wed, 08 Apr 2026 09:06:04 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libcanberra: disable gtk-doc
To: openembedded-devel@lists.openembedded.org
Message-Id: <4EY5DT.6CVQIBQ424RM2@t-online.de>
In-Reply-To: <18A44FBF917DF0BD.777565@lists.openembedded.org>
References: <18A44FBF917DF0BD.777565@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6EAiGoj7nN65GInIF+Ps"
X-TOI-EXPURGATEID: 150726::1775631969-AE7FA520-BC2B8485/0/0 CLEAN NORMAL
X-TOI-MSGID: fc7b5cad-9f51-455e-aceb-23b158c96ff3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775631972; i=f_l_k@t-online.de;
	bh=hYR+hRF/0pr+OuTLPMLUg/j35GYsVQF8Bf4dtIRNwYs=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=lRMtsdHtPVkIPgUOwBaqD9ynMO8tIAI/4qThAf9QbUYABYG6Uel+DqeUVTYsW8obW
	 ndl0e1+Dr3Uy3iVycII4Q5UWCh+gc8CoeO0dMaStT0Sa3rJZtPQE1pdGlxZlACHXY9
	 VW4q9yF180q5U1d1aQJHUb0UYTys0gVbeDPam2yaYaPxJbtsi/Wi5ZY94FWvXNL5wG
	 wxL0pG8gX8OLL7FYekqVdpk2+FEI72UYbT4jWlNVOxBXR7o24v6UWwO1jnHmeRsS7B
	 gNppW4nFABwsgD9b8Osc5tZgBf3dul7l+4t4KuGBtCCG4pbCSc4zIYkAVrquAbcQ0L
	 wneIoMkgseYZg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 07:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126101

--=-6EAiGoj7nN65GInIF+Ps
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: keep inherit gtk-doc

Even with gtk-doc disabled it is still a required dependency:
| autoreconf: running: gtkdocize --copy
| Can't exec "gtkdocize": No such file or directory

Am Mi, 8. Apr 2026 um 09:03:43 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> gkt-doc build uses the deprecated gtkdoc-mktmpl tool, which was 
> dropped by upstream
> in version 1.26 of gtk-doc and fails if 'api-documentation' is in 
> DISTRO_FEATURES.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git 
> a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb 
> b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
> index 2c063fd995..1f1c23d041 100644
> --- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
> +++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
> @@ -19,6 +19,7 @@ EXTRA_OECONF = "\
>      --disable-oss \
>      --disable-tdb \
>      --disable-lynx \
> +    --disable-gtk-doc \
>  "
> 
>  PACKAGECONFIG ??= " \
> --
> 2.53.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126100): 
> <https://lists.openembedded.org/g/openembedded-devel/message/126100>
> Mute This Topic: <https://lists.openembedded.org/mt/118721363/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-6EAiGoj7nN65GInIF+Ps
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: keep inherit gtk-doc</div><div><br></div><div>Even with gtk-doc disabled it is still a required dependency:</div><div><div>| autoreconf: running: gtkdocize --copy</div><div>| Can't exec "gtkdocize": No such file or directory</div></div></div><div id="geary-quote" dir="auto"><br>Am Mi, 8. Apr 2026 um 09:03:43 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">gkt-doc build uses the deprecated gtkdoc-mktmpl tool, which was dropped by upstream
in version 1.26 of gtk-doc and fails if 'api-documentation' is in DISTRO_FEATURES.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
index 2c063fd995..1f1c23d041 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
@@ -19,6 +19,7 @@ EXTRA_OECONF = "\
     --disable-oss \
     --disable-tdb \
     --disable-lynx \
+    --disable-gtk-doc \
 "
 
 PACKAGECONFIG ??= " \
<div>-- 
</div>2.53.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#126100): <a href="https://lists.openembedded.org/g/openembedded-devel/message/126100">https://lists.openembedded.org/g/openembedded-devel/message/126100</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/118721363/3618223">https://lists.openembedded.org/mt/118721363/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-6EAiGoj7nN65GInIF+Ps--


