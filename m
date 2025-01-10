Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6A1E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 21:30:42 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.2521.1736544635470093011
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 13:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id DE229A2D
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 22:30:33 +0100 (CET)
Received: from [192.168.178.67] ([84.154.171.8]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tWMaM-2KZbEW0; Fri, 10 Jan 2025 22:30:30 +0100
Date: Fri, 10 Jan 2025 22:30:46 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv2] libde265: update 1.0.12 -> 1.0.15
To: openembedded-devel@lists.openembedded.org
Message-Id: <AF6WPS.ZM3W8CQN081@t-online.de>
In-Reply-To: <18197210EE6D13BF.7995@lists.openembedded.org>
References: <18197210EE6D13BF.7995@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uBIfMOnvwY6MY4I29ciP"
X-TOI-EXPURGATEID: 150726::1736544630-AEFFA9CD-A3EF501F/10/3626336762 SUSPECT URL
X-TOI-MSGID: b3552a4c-1ff9-4750-b69d-47be1136af91
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 21:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114809

--=-uBIfMOnvwY6MY4I29ciP
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: remove --disable-dec265 from EXTRA_OECONF. It is now controlled by 
PACKAGECONFIG

On Fri, Jan 10 2025 at 22:29:17 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - dont use autotools-brokensep
> - add PACKAGECONFIG for dec265
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ---
>  .../libde265/{libde265_1.0.12.bb => libde265_1.0.15.bb}  | 9 
> ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename 
> meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.12.bb => 
> libde265_1.0.15.bb} (72%)
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb 
> b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> similarity index 72%
> rename from 
> meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
> rename to 
> meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> index 3c9f899491..818654bdb0 100644
> --- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> @@ -9,13 +9,16 @@ LICENSE_FLAGS = "commercial"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=695b556799abb2435c97a113cdca512f" 
> <file://copying;md5=695b556799abb2435c97a113cdca512f/>
> 
>  SRC_URI = 
> "git://github.com/strukturag/libde265.git;branch=master;protocol=https"
> -SRCREV = "a267c84707ab264928fa9b86de2ee749c48c318c"
> +SRCREV = "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
> 
>  S = "${WORKDIR}/git"
> 
> -EXTRA_OECONF = "--disable-sherlock265 --disable-dec265"
> +EXTRA_OECONF = "--disable-sherlock265"
> 
> -inherit autotools-brokensep pkgconfig
> +inherit autotools pkgconfig
> +
> +PACKAGECONFIG ?= "dec265"
> +PACKAGECONFIG[dec265] = "--enable-dec265,--disable-dec265,libsdl2"
> 
>  PACKAGES =+ "${PN}-tools"
>  FILES:${PN}-tools = "${bindir}/*"
> --
> 2.47.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114808): 
> <https://lists.openembedded.org/g/openembedded-devel/message/114808>
> Mute This Topic: <https://lists.openembedded.org/mt/110543729/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-uBIfMOnvwY6MY4I29ciP
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: remove --disable-dec265 from EXTRA_OECONF. It is now controlled by PACKAGECONFIG</div></div><div id="geary-quote" dir="auto"><br>On Fri, Jan 10 2025 at 22:29:17 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- dont use autotools-brokensep
- add PACKAGECONFIG for dec265

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
---
 .../libde265/{libde265_1.0.12.bb =&gt; libde265_1.0.15.bb}  | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.12.bb =&gt; libde265_1.0.15.bb} (72%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
similarity index 72%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
index 3c9f899491..818654bdb0 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
@@ -9,13 +9,16 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=695b556799abb2435c97a113cdca512f" "="">file://COPYING;md5=695b556799abb2435c97a113cdca512f"</a>
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https"
-SRCREV = "a267c84707ab264928fa9b86de2ee749c48c318c"
+SRCREV = "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "--disable-sherlock265 --disable-dec265"
+EXTRA_OECONF = "--disable-sherlock265"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools pkgconfig
+
+PACKAGECONFIG ?= "dec265"
+PACKAGECONFIG[dec265] = "--enable-dec265,--disable-dec265,libsdl2"
 
 PACKAGES =+ "${PN}-tools"
 FILES:${PN}-tools = "${bindir}/*"
<div>-- 
</div>2.47.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#114808): <a href="https://lists.openembedded.org/g/openembedded-devel/message/114808">https://lists.openembedded.org/g/openembedded-devel/message/114808</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110543729/3618223">https://lists.openembedded.org/mt/110543729/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-uBIfMOnvwY6MY4I29ciP--


