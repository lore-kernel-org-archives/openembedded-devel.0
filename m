Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB4FD59F7C
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 07:45:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1720.1765611899345553468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 23:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id 83F001C1D5
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 08:44:57 +0100 (CET)
Received: from [192.168.178.36] ([84.154.169.98]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vUKJA-0U4Nai0; Sat, 13 Dec 2025 08:44:52 +0100
Date: Sat, 13 Dec 2025 08:44:46 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv2] dav1d: update 1.5.1 -> 1.5.2
To: openembedded-devel@lists.openembedded.org
Message-Id: <MU677T.F8I61UUD0OEQ3@t-online.de>
In-Reply-To: <1880B697B4CA0D64.1276044@lists.openembedded.org>
References: <1880B697B4CA0D64.1276044@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BAihf/TvfrA9EY/x5lDd"
X-TOI-EXPURGATEID: 150726::1765611892-03FFD4B1-DB65E076/0/0 CLEAN NORMAL
X-TOI-MSGID: cfa38eb2-82db-4578-bf06-a67d7ab1d446
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 07:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122636

--=-BAihf/TvfrA9EY/x5lDd
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: add missing Signed-off-by

On Sat, Dec 13 2025 at 08:43:29 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Changes for 1.5.2 'Sonic':
> --------------------------
> 
> 1.5.2 is a minor release of dav1d, focused on maintenance:
>  - minor speed improvement in recon
>  - improvements on loongarch symboles visibility and asm
>  - mark C globals with small code model
>  - reduce the code size of the frame header parsing (OBU)
>  - minor fixes on tools and CI
>  - fix compilation with nasm 3.00
> 
> Copyright year has been changed:
> <https://github.com/videolan/dav1d/commit/04faac69004ac951b74ac7fea331f3790ec043b8>
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../dav1d/{dav1d_1.5.1.bb => dav1d_1.5.2.bb}                 | 5 
> ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.5.1.bb => 
> dav1d_1.5.2.bb} (79%)
> 
> diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb 
> b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
> similarity index 79%
> rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
> rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
> index d600e3b5e3..e8f4126a9a 100644
> --- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
> +++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
> @@ -4,11 +4,10 @@ HOMEPAGE = 
> "https://code.videolan.org/videolan/dav1d"
>  SECTION = "multimedia"
>  LICENSE = "BSD-2-Clause"
> 
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=c8055cfe7548dfdaa3a6dc45d8793669" 
> <file://copying;md5=c8055cfe7548dfdaa3a6dc45d8793669/>
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=48d9210a87a24f62609b5a4f777d8dfe" 
> <file://copying;md5=48d9210a87a24f62609b5a4f777d8dfe/>
> 
>  SRC_URI = 
> "git://code.videolan.org/videolan/dav1d.git;protocol=https;nobranch=1"
> -SRCREV = "42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa"
> -
> +SRCREV = "c720f4d3556a01916324aea155555d3efba842e8"
> 
>  DEPENDS:append:x86 = " nasm-native"
>  DEPENDS:append:x86-64 = " nasm-native"
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122635): 
> <https://lists.openembedded.org/g/openembedded-devel/message/122635>
> Mute This Topic: <https://lists.openembedded.org/mt/116759647/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-BAihf/TvfrA9EY/x5lDd
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: add missing&nbsp;Signed-off-by</div></div><div id="geary-quote" dir="auto"><br>On Sat, Dec 13 2025 at 08:43:29 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Changes for 1.5.2 'Sonic':
--------------------------

1.5.2 is a minor release of dav1d, focused on maintenance:
 - minor speed improvement in recon
 - improvements on loongarch symboles visibility and asm
 - mark C globals with small code model
 - reduce the code size of the frame header parsing (OBU)
 - minor fixes on tools and CI
 - fix compilation with nasm 3.00

Copyright year has been changed:
<a href="https://github.com/videolan/dav1d/commit/04faac69004ac951b74ac7fea331f3790ec043b8">https://github.com/videolan/dav1d/commit/04faac69004ac951b74ac7fea331f3790ec043b8</a>

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../dav1d/{dav1d_1.5.1.bb =&gt; dav1d_1.5.2.bb}                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.5.1.bb =&gt; dav1d_1.5.2.bb} (79%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
similarity index 79%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
index d600e3b5e3..e8f4126a9a 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
@@ -4,11 +4,10 @@ HOMEPAGE = "https://code.videolan.org/videolan/dav1d"
 SECTION = "multimedia"
 LICENSE = "BSD-2-Clause"
 
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=c8055cfe7548dfdaa3a6dc45d8793669" "="">file://COPYING;md5=c8055cfe7548dfdaa3a6dc45d8793669"</a>
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=48d9210a87a24f62609b5a4f777d8dfe" "="">file://COPYING;md5=48d9210a87a24f62609b5a4f777d8dfe"</a>
 
 SRC_URI = "git://code.videolan.org/videolan/dav1d.git;protocol=https;nobranch=1"
-SRCREV = "42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa"
-
+SRCREV = "c720f4d3556a01916324aea155555d3efba842e8"
 
 DEPENDS:append:x86 = " nasm-native"
 DEPENDS:append:x86-64 = " nasm-native"
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#122635): <a href="https://lists.openembedded.org/g/openembedded-devel/message/122635">https://lists.openembedded.org/g/openembedded-devel/message/122635</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/116759647/3618223">https://lists.openembedded.org/mt/116759647/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-BAihf/TvfrA9EY/x5lDd--


