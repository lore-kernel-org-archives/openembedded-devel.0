Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C00D49C76
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 08:37:58 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6477.1769762277499142998
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 00:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id CCA16E7FC
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:37:55 +0100 (CET)
Received: from [192.168.178.36] ([84.154.165.56]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vlk0n-43z7fk0; Fri, 30 Jan 2026 09:37:53 +0100
Date: Fri, 30 Jan 2026 09:37:47 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/2] pangomm: remove x11 from
 REQUIRED_DISTRO_FEATURES
To: openembedded-devel@lists.openembedded.org
Message-Id: <ZA5O9T.M44VOAJQR7CG@t-online.de>
In-Reply-To: <188F754E46F54CD8.3474591@lists.openembedded.org>
References: <20260130083543.272427-1-f_l_k@t-online.de>
	<188F754E46F54CD8.3474591@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-qIiN3TbRZjB4XlgLe9TA"
X-TOI-EXPURGATEID: 150726::1769762273-A0FF6939-4A51BD89/0/0 CLEAN NORMAL
X-TOI-MSGID: 42eba547-62fa-403a-bc9f-21d474405a94
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124009

--=-qIiN3TbRZjB4XlgLe9TA
Content-Type: text/plain; charset=us-ascii; format=flowed

This is required to build pavucontrol without x11

On Fri, Jan 30 2026 at 09:35:43 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb 
> b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
> index d99c6ceac0..6afcf08a16 100644
> --- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
> +++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
> @@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
>  DEPENDS = "mm-common cairomm-1.16 glibmm-2.68 pango"
> 
>  GNOMEBN = "pangomm"
> -inherit gnomebase features_check
> +inherit gnomebase
> 
>  SRC_URI[archive.sha256sum] = 
> "539f5aa60e9bdc6b955bb448e2a62cc14562744df690258040fbb74bf885755d"
> -REQUIRED_DISTRO_FEATURES = "x11"
> 
>  S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
> 
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124008): 
> <https://lists.openembedded.org/g/openembedded-devel/message/124008>
> Mute This Topic: <https://lists.openembedded.org/mt/117541461/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-qIiN3TbRZjB4XlgLe9TA
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This is required to build pavucontrol without x11</div></div><div id="geary-quote" dir="auto"><br>On Fri, Jan 30 2026 at 09:35:43 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
index d99c6ceac0..6afcf08a16 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 DEPENDS = "mm-common cairomm-1.16 glibmm-2.68 pango"
 
 GNOMEBN = "pangomm"
-inherit gnomebase features_check
+inherit gnomebase
 
 SRC_URI[archive.sha256sum] = "539f5aa60e9bdc6b955bb448e2a62cc14562744df690258040fbb74bf885755d"
-REQUIRED_DISTRO_FEATURES = "x11"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#124008): <a href="https://lists.openembedded.org/g/openembedded-devel/message/124008">https://lists.openembedded.org/g/openembedded-devel/message/124008</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117541461/3618223">https://lists.openembedded.org/mt/117541461/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-qIiN3TbRZjB4XlgLe9TA--


