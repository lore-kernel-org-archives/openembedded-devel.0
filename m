Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E37CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 09:37:59 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.34963.1756978670532516950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 02:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 73D3437F0D
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Sep 2025 11:37:48 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.163.17]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uu6PX-2LUFJA0; Thu, 4 Sep 2025 11:37:44 +0200
Date: Thu, 04 Sep 2025 11:37:38 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][RFC][PATCHv2] glibmm: update 2.80.0 -> 2.85.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <QE522T.UEJTRZ12736I1@t-online.de>
In-Reply-To: <18620AA9DA393CA3.28859@lists.openembedded.org>
References: <18620AA9DA393CA3.28859@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lr81jxDc3P3yL/TD+8Ma"
X-TOI-EXPURGATEID: 150726::1756978664-650CB9F4-A1F509C6/0/0 CLEAN NORMAL
X-TOI-MSGID: 7487e89f-9bdd-4f6b-8571-086ab1697637
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 09:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119276

--=-lr81jxDc3P3yL/TD+8Ma
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: fix LIC_FILES_CHECKSUM

On Thu, Sep 4 2025 at 11:35:14 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> - LIC_FILES_CHECKSUM changed but LICENSE is still valid
> 
> update is required for gtk 4.20.0
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../{glibmm-2.68_2.80.0.bb => glibmm-2.68_2.85.0.bb}        | 6 
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.80.0.bb => 
> glibmm-2.68_2.85.0.bb} (75%)
> 
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb 
> b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
> similarity index 75%
> rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
> rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
> index 48a1a2a624..325ad4d5cd 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
> @@ -2,8 +2,8 @@ SUMMARY = "C++ bindings for the glib library"
>  HOMEPAGE = "<http://www.gtkmm.org/>"
>  SECTION = "libs"
>  LICENSE = "LGPL-2.1-only & GPL-2.0-only"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 
> <file://copying;md5=42dfffebc56fec7527aac53b7a89d1d8/> \
> -                    
> file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe" 
> <file://copying.tools;md5=751419260aa954499f7abaabaa882bbe/>
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 
> <file://copying;md5=4bf661c1e3793e55c8d1051bc5e0ae21/> \
> +                    
> file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce" 
> <file://copying.tools;md5=570a9b3749dd0463a1778803b12a6dce/>
> 
>  DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
> 
> @@ -12,7 +12,7 @@ inherit gnomebase
> 
>  SHRT_VER = "${@d.getVar 
> <mailto:${@d.getVar>('PV').split('.')[0]}.${@d.getVar 
> <mailto:}.${@d.getVar>('PV').split('.')[1]}"
> 
> -SRC_URI[archive.sha256sum] = 
> "539b0a29e15a96676c4f0594541250566c5ca44da5d4d87a3732fa2d07909e4a"
> +SRC_URI[archive.sha256sum] = 
> "0771306711299fbf62e53c752d53ed581635127167a6cc79ae05f2b8421d29d7"
> 
>  S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
> 
> --
> 2.50.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119275): 
> <https://lists.openembedded.org/g/openembedded-devel/message/119275>
> Mute This Topic: <https://lists.openembedded.org/mt/115060688/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-lr81jxDc3P3yL/TD+8Ma
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: fix&nbsp;<span style="white-space: break-spaces;">LIC_FILES_CHECKSUM</span></div></div><div id="geary-quote" dir="auto"><br>On Thu, Sep 4 2025 at 11:35:14 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- LIC_FILES_CHECKSUM changed but LICENSE is still valid

update is required for gtk 4.20.0

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../{glibmm-2.68_2.80.0.bb =&gt; glibmm-2.68_2.85.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.80.0.bb =&gt; glibmm-2.68_2.85.0.bb} (75%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
similarity index 75%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
index 48a1a2a624..325ad4d5cd 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "C++ bindings for the glib library"
 HOMEPAGE = "<a href="http://www.gtkmm.org/">http://www.gtkmm.org/</a>"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only &amp; GPL-2.0-only"
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8">file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8</a> \
-                    <a href="file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe" "="">file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"</a>
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21">file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21</a> \
+                    <a href="file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce" "="">file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"</a>
 
 DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
 
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "<a href="mailto:${@d.getVar">${@d.getVar</a>('PV').split('.')[0]<a href="mailto:}.${@d.getVar">}.${@d.getVar</a>('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "539b0a29e15a96676c4f0594541250566c5ca44da5d4d87a3732fa2d07909e4a"
+SRC_URI[archive.sha256sum] = "0771306711299fbf62e53c752d53ed581635127167a6cc79ae05f2b8421d29d7"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
<div>-- 
</div>2.50.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#119275): <a href="https://lists.openembedded.org/g/openembedded-devel/message/119275">https://lists.openembedded.org/g/openembedded-devel/message/119275</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/115060688/3618223">https://lists.openembedded.org/mt/115060688/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-lr81jxDc3P3yL/TD+8Ma--


