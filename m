Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D52C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 20:09:14 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.37862.1699214949030165409
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 12:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id D408811E3C
	for <openembedded-devel@lists.openembedded.org>; Sun,  5 Nov 2023 21:09:04 +0100 (CET)
Received: from [192.168.178.62] ([84.163.36.196]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzjQb-1Ss73w0; Sun, 5 Nov 2023 21:09:01 +0100
Date: Sun, 05 Nov 2023 21:09:25 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 4/4] libgsf: Upgrade 1.14.50 -> 1.14.51
To: openembedded-devel@lists.openembedded.org
Message-Id: <PN2O3S.M72R4ECBPF783@t-online.de>
In-Reply-To: <1794D2CD1DE5B000.12603@lists.openembedded.org>
References: <20231105200542.13519-1-f_l_k@t-online.de>
	<1794D2CD1DE5B000.12603@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2iZlYNDKEqItg4RaghNf"
X-TOI-EXPURGATEID: 150726::1699214941-EEFFADD2-D8294780/0/0 CLEAN NORMAL
X-TOI-MSGID: 1591d319-7833-4da5-ae76-f644592d16e8
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 20:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106389

--=-2iZlYNDKEqItg4RaghNf
Content-Type: text/plain; charset=us-ascii; format=flowed

I sent out these patches again because I think they got lost in the 
flood of AUH messages.

On Sun, Nov 5 2023 at 09:05:42 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> License changed to LGPL-2.1-only
> <https://gitlab.gnome.org/GNOME/libgsf/-/commit/037c913eb631349c410ef45e49697bf5c46dac8a>
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../libgsf/{libgsf_1.14.50.bb => libgsf_1.14.51.bb}        | 7 
> +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.50.bb => 
> libgsf_1.14.51.bb} (60%)
> 
> diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb 
> b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
> similarity index 60%
> rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
> rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
> index d2486a035..e213f60bc 100644
> --- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
> +++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
> @@ -1,7 +1,6 @@
>  SUMMARY = "GNOME Structured File Library"
> -LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d 
> <file://copying;md5=dc7371b50816c96e145fa0f8ade8e24d/> \
> -                    
> file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63" 
> <file://copying.lib;md5=61464cfe342798eeced82efe9ae55f63/>
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=61464cfe342798eeced82efe9ae55f63" 
> <file://copying;md5=61464cfe342798eeced82efe9ae55f63/>
> 
>  SECTION = "libs"
> 
> @@ -9,7 +8,7 @@ DEPENDS= "libxml2 bzip2 glib-2.0 zlib 
> gnome-common-native"
> 
>  inherit gnomebase gobject-introspection gettext gtk-doc
> 
> -SRC_URI[archive.sha256sum] = 
> "6e6c20d0778339069d583c0d63759d297e817ea10d0d897ebbe965f16e2e8e52"
> +SRC_URI[archive.sha256sum] = 
> "f0b83251f98b0fd5592b11895910cc0e19f798110b389aba7da1cb7c474017f5"
>  SRC_URI += 
> "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch" 
> <file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch/>
> 
>  PACKAGECONFIG ??= ""
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106388): 
> <https://lists.openembedded.org/g/openembedded-devel/message/106388>
> Mute This Topic: <https://lists.openembedded.org/mt/102407396/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-2iZlYNDKEqItg4RaghNf
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I sent out these patches again because I think they got lost in the flood of AUH messages.</div></div><div id="geary-quote" dir="auto"><br>On Sun, Nov 5 2023 at 09:05:42 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">License changed to LGPL-2.1-only
<a href="https://gitlab.gnome.org/GNOME/libgsf/-/commit/037c913eb631349c410ef45e49697bf5c46dac8a">https://gitlab.gnome.org/GNOME/libgsf/-/commit/037c913eb631349c410ef45e49697bf5c46dac8a</a>

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../libgsf/{libgsf_1.14.50.bb =&gt; libgsf_1.14.51.bb}        | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.50.bb =&gt; libgsf_1.14.51.bb} (60%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
similarity index 60%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
index d2486a035..e213f60bc 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
@@ -1,7 +1,6 @@
 SUMMARY = "GNOME Structured File Library"
-LICENSE = "GPL-2.0-only &amp; LGPL-2.1-only"
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d">file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d</a> \
-                    <a href="file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63" "="">file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"</a>
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=61464cfe342798eeced82efe9ae55f63" "="">file://COPYING;md5=61464cfe342798eeced82efe9ae55f63"</a>
 
 SECTION = "libs"
 
@@ -9,7 +8,7 @@ DEPENDS= "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
 
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "6e6c20d0778339069d583c0d63759d297e817ea10d0d897ebbe965f16e2e8e52"
+SRC_URI[archive.sha256sum] = "f0b83251f98b0fd5592b11895910cc0e19f798110b389aba7da1cb7c474017f5"
 SRC_URI += "<a href="file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch" "="">file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"</a>
 
 PACKAGECONFIG ??= ""
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#106388): <a href="https://lists.openembedded.org/g/openembedded-devel/message/106388">https://lists.openembedded.org/g/openembedded-devel/message/106388</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102407396/3618223">https://lists.openembedded.org/mt/102407396/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-2iZlYNDKEqItg4RaghNf--


