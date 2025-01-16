Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA250C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 10:02:19 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.44840.1737021730152493189
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 02:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 5F9AFF51
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 11:02:08 +0100 (CET)
Received: from [192.168.178.67] ([79.219.226.124]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tYMhT-1Gtw3s0; Thu, 16 Jan 2025 11:02:07 +0100
Date: Thu, 16 Jan 2025 11:02:30 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv2] libde265: switch to cmake
 buildsystem
To: openembedded-devel@lists.openembedded.org
Message-Id: <6KE6QS.VYKZOFPXAQAB2@t-online.de>
In-Reply-To: <181B23DFF0193EF1.28670@lists.openembedded.org>
References: <181B23DFF0193EF1.28670@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-+MLJl5pW/i3raf86+vq3"
X-TOI-EXPURGATEID: 150726::1737021727-79FF89DC-24E481DE/0/0 CLEAN NORMAL
X-TOI-MSGID: 34d627e6-059e-450a-b9c8-72ee23194bae
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 10:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114910

--=-+MLJl5pW/i3raf86+vq3
Content-Type: text/plain; charset=us-ascii; format=flowed

dec265 is now build by default, with or without libsdl

Change the PACKAGECONFIG accordingly

On Thu, Jan 16 2025 at 10:58:59 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> This fixes build issues with clang/qemuarm
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-multimedia/libde265/libde265_1.0.15.bb   | 12 
> +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb 
> b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> index 818654bdb0..12bdb23354 100644
> --- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> @@ -13,12 +13,10 @@ SRCREV = 
> "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
> 
>  S = "${WORKDIR}/git"
> 
> -EXTRA_OECONF = "--disable-sherlock265"
> +inherit cmake pkgconfig
> 
> -inherit autotools pkgconfig
> +PACKAGECONFIG ?= "libsdl"
> +PACKAGECONFIG[libsdl] = "-DENABLE_SDL=ON,-DENABLE_SDL=OFF,libsdl2"
> 
> -PACKAGECONFIG ?= "dec265"
> -PACKAGECONFIG[dec265] = "--enable-dec265,--disable-dec265,libsdl2"
> -
> -PACKAGES =+ "${PN}-tools"
> -FILES:${PN}-tools = "${bindir}/*"
> +FILES:${PN} += "${libdir}/libde265.so"
> +FILES:${PN}-dev = "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
> --
> 2.47.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114909): 
> <https://lists.openembedded.org/g/openembedded-devel/message/114909>
> Mute This Topic: <https://lists.openembedded.org/mt/110644740/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-+MLJl5pW/i3raf86+vq3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>dec265 is now build by default, with or without libsdl</div><div><br></div><div>Change the PACKAGECONFIG accordingly</div></div><div id="geary-quote" dir="auto"><br>On Thu, Jan 16 2025 at 10:58:59 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This fixes build issues with clang/qemuarm

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-multimedia/libde265/libde265_1.0.15.bb   | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
index 818654bdb0..12bdb23354 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
@@ -13,12 +13,10 @@ SRCREV = "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "--disable-sherlock265"
+inherit cmake pkgconfig
 
-inherit autotools pkgconfig
+PACKAGECONFIG ?= "libsdl"
+PACKAGECONFIG[libsdl] = "-DENABLE_SDL=ON,-DENABLE_SDL=OFF,libsdl2"
 
-PACKAGECONFIG ?= "dec265"
-PACKAGECONFIG[dec265] = "--enable-dec265,--disable-dec265,libsdl2"
-
-PACKAGES =+ "${PN}-tools"
-FILES:${PN}-tools = "${bindir}/*"
+FILES:${PN} += "${libdir}/libde265.so"
+FILES:${PN}-dev = "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
<div>-- 
</div>2.47.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#114909): <a href="https://lists.openembedded.org/g/openembedded-devel/message/114909">https://lists.openembedded.org/g/openembedded-devel/message/114909</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110644740/3618223">https://lists.openembedded.org/mt/110644740/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-+MLJl5pW/i3raf86+vq3--


