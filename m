Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2DCC38A02
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 15:51:19 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.4537.1667058674203778807
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 08:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout02.t-online.de (Postfix) with SMTP id 50B8335FC
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 17:51:00 +0200 (CEST)
Received: from [192.168.178.122] ([79.219.224.130]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ooo6t-2Wv9OK0; Sat, 29 Oct 2022 17:50:59 +0200
Date: Sat, 29 Oct 2022 17:50:54 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-openembedded][PATCH 3/3] spice: build with opus and
 opengl
To: openembedded-devel@lists.openembedded.org
Message-Id: <UOUIKR.08FHIXZBOK4A2@t-online.de>
In-Reply-To: <172294851D2ECF2D.19890@lists.openembedded.org>
References: <20221029154116.3128371-1-f_l_k@t-online.de>
	<172294851D2ECF2D.19890@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-MTizZpd/Jx/6+IX77lcW"
X-TOI-EXPURGATEID: 150726::1667058659-3EFE8B8C-987DA43D/0/0 CLEAN NORMAL
X-TOI-MSGID: 27bd2bfe-1d53-42cd-91b2-95751f313cbd
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 15:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99344

--=-MTizZpd/Jx/6+IX77lcW
Content-Type: text/plain; charset=us-ascii; format=flowed

These recipes are needed to compile virt-viewer, for which I have also 
created a recipe. I would send it as a proposal to meta-virtualization, 
but I'm not sure which mailing list would be the right one?

I have done compilation tests for x86_64, aarch64 and mipsqemu with 
gcc. Fingers crossed for clang.

Runtime tested with proxmox on x86_64

Am Sa, 29. Okt 2022 um 17:41:16 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
>   - remove COMPATIBLE_HOSTS whitelist because I was able to compile 
> this for qemumips also
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb 
> b/meta-networking/recipes-support/spice/spice_git.bb
> index b3e687476..69e220050 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -47,7 +47,7 @@ CFLAGS:append = " -Wno-error"
> 
>  PACKAGECONFIG:class-native = ""
>  PACKAGECONFIG:class-nativesdk = ""
> -PACKAGECONFIG ?= "sasl"
> +PACKAGECONFIG ?= "sasl ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'opengl', d)} opus"
> 
>  PACKAGECONFIG[celt051] = "--enable-celt051,--disable-celt051,celt051"
>  PACKAGECONFIG[smartcard] = 
> "--enable-smartcard,--disable-smartcard,libcacard,"
> @@ -58,8 +58,6 @@ PACKAGECONFIG[opus] = 
> "--enable-opus,--disable-opus,libopus,"
>  PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
>  PACKAGECONFIG[xinerama] = 
> "--enable-xinerama,--disable-xinerama,libxinerama,"
> 
> -COMPATIBLE_HOST = '(x86_64|i.86|aarch64).*-linux'
> -
>  BBCLASSEXTEND = "native nativesdk"
> 
>  EXTRA_OECONF:append:toolchain-clang = " --disable-werror"
> --
> 2.34.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99343): 
> <https://lists.openembedded.org/g/openembedded-devel/message/99343>
> Mute This Topic: <https://lists.openembedded.org/mt/94649076/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-MTizZpd/Jx/6+IX77lcW
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>These recipes are needed to compile virt-viewer, for which I have also created a recipe. I would send it as a proposal to meta-virtualization, but I'm not sure which mailing list would be the right one?</div><div><br></div><div>I have done compilation tests for x86_64, aarch64 and mipsqemu with gcc. Fingers crossed for clang.</div><div><br></div><div>Runtime tested with proxmox on x86_64</div></div><div id="geary-quote" dir="auto"><br>Am Sa, 29. Okt 2022 um 17:41:16 +0200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">  - remove COMPATIBLE_HOSTS whitelist because I was able to compile this for qemumips also

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-networking/recipes-support/spice/spice_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index b3e687476..69e220050 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -47,7 +47,7 @@ CFLAGS:append = " -Wno-error"
 
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
-PACKAGECONFIG ?= "sasl"
+PACKAGECONFIG ?= "sasl <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'opengl', d)} opus"
 
 PACKAGECONFIG[celt051] = "--enable-celt051,--disable-celt051,celt051"
 PACKAGECONFIG[smartcard] = "--enable-smartcard,--disable-smartcard,libcacard,"
@@ -58,8 +58,6 @@ PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus,"
 PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 
-COMPATIBLE_HOST = '(x86_64|i.86|aarch64).*-linux'
-
 BBCLASSEXTEND = "native nativesdk"
 
 EXTRA_OECONF:append:toolchain-clang = " --disable-werror"
<div>-- 
</div>2.34.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#99343): <a href="https://lists.openembedded.org/g/openembedded-devel/message/99343">https://lists.openembedded.org/g/openembedded-devel/message/99343</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/94649076/3618223">https://lists.openembedded.org/mt/94649076/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-MTizZpd/Jx/6+IX77lcW--


