Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C02C4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:30:22 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.5370.1699342220538378790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id 393A0F0B8
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:30:18 +0100 (CET)
Received: from [192.168.178.62] ([84.154.173.54]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0GXR-0kHRLc0; Tue, 7 Nov 2023 08:30:17 +0100
Date: Tue, 07 Nov 2023 08:30:45 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] rest: Add packageconfigs for examples
 and tests
To: openembedded-devel@lists.openembedded.org
Message-Id: <9VSQ3S.ZW5ZJ7UCEI2K@t-online.de>
In-Reply-To: <179546AC1A81774D.25348@lists.openembedded.org>
References: <179546AC1A81774D.25348@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LPgN5RJFLn6MX4ySEtr3"
X-TOI-EXPURGATEID: 150726::1699342217-A0FF6ED1-660CFFE2/0/0 CLEAN NORMAL
X-TOI-MSGID: d1d4d2f8-c182-4040-8a76-661b7a317385
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106440

--=-LPgN5RJFLn6MX4ySEtr3
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 cleans up dependencies for doc

On Tue, Nov 7 2023 at 08:28:43 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Motivation is to not install rest-demos by default.
> 
> Allow to build doc and vapi according to DISTRO_FEATURES
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-gnome/recipes-gnome/rest/rest_0.9.1.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb 
> b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> index 375417d5f..3a81a58f6 100644
> --- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> +++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> @@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
> -    gi-docgen \
> -    gi-docgen-native \
>      glib-2.0 \
>      glib-2.0-native \
>      gtksourceview5 \
> @@ -17,6 +15,12 @@ DEPENDS = " \
>      libxml2-native \
>  "
> 
> -inherit gnomebase gobject-introspection vala pkgconfig
> +inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
> +
> +EXTRA_OEMESON = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> '-Dvapi=true', '-Dvapi=false', d)}"
> +
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
> 
>  SRC_URI[archive.sha256sum] = 
> "9266a5c10ece383e193dfb7ffb07b509cc1f51521ab8dad76af96ed14212c2e3"
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106439): 
> <https://lists.openembedded.org/g/openembedded-devel/message/106439>
> Mute This Topic: <https://lists.openembedded.org/mt/102438849/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-LPgN5RJFLn6MX4ySEtr3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 cleans up dependencies for doc</div></div><div id="geary-quote" dir="auto"><br>On Tue, Nov 7 2023 at 08:28:43 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Motivation is to not install rest-demos by default.

Allow to build doc and vapi according to DISTRO_FEATURES

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
index 375417d5f..3a81a58f6 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
-    gi-docgen \
-    gi-docgen-native \
     glib-2.0 \
     glib-2.0-native \
     gtksourceview5 \
@@ -17,6 +15,12 @@ DEPENDS = " \
     libxml2-native \
 "
 
-inherit gnomebase gobject-introspection vala pkgconfig
+inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
+
+EXTRA_OEMESON = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
 
 SRC_URI[archive.sha256sum] = "9266a5c10ece383e193dfb7ffb07b509cc1f51521ab8dad76af96ed14212c2e3"
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#106439): <a href="https://lists.openembedded.org/g/openembedded-devel/message/106439">https://lists.openembedded.org/g/openembedded-devel/message/106439</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102438849/3618223">https://lists.openembedded.org/mt/102438849/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-LPgN5RJFLn6MX4ySEtr3--


