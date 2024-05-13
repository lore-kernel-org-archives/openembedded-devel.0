Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB95C25B4F
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 00:06:16 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.49088.1715558773968120831
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 17:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout07.t-online.de (Postfix) with SMTP id 7E8B13DE03
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 02:06:12 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.44.250]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s6JCk-2DxsMS0; Mon, 13 May 2024 02:06:10 +0200
Date: Mon, 13 May 2024 02:06:41 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] glib-testing: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <5NDEDS.19VM0T6KBEMV1@t-online.de>
In-Reply-To: <17CEE386B8CAAB21.21609@lists.openembedded.org>
References: <17CEE386B8CAAB21.21609@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-cInlq/fcUV7NFZfhDdls"
X-TOI-EXPURGATEID: 150726::1715558770-FEFFB352-BD7B8A92/0/0 CLEAN NORMAL
X-TOI-MSGID: 560e402c-636c-4812-a52c-3b5878808860
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 00:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110329

--=-cInlq/fcUV7NFZfhDdls
Content-Type: text/plain; charset=us-ascii; format=flowed

add missing dependencies for building documentation

On Mon, May 13 2024 at 02:05:01 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> glib-testing is a build dependency for malcontent, where building the 
> tests cant be disabled.
> We can only disable the run of installed tests in malcontent.
> 
> Normally glib-testing gets included as a subproject wrap which is 
> inappropriate for
> yocto/oe. Thus we need to provide a recipe for it.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-core/glib-2.0/glib-testing_0.1.1.bb    | 14 
> ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 
> meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
> 
> diff --git a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb 
> b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
> new file mode 100644
> index 000000000..ebcc2b267
> --- /dev/null
> +++ b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "libglib-testing provides test harnesses and mock classes 
> to complement GLib classes"
> +HOMEPAGE = "<https://gitlab.gnome.org/pwithnall/libglib-testing>"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" 
> <file://copying;md5=4fbd65380cdd255951079008b364516c/>
> +
> +SRC_URI = 
> "git://gitlab.gnome.org/pwithnall/libglib-testing.git;protocol=https;branch=main"
> +
> +PV = "0.1.1"
> +S = "${WORKDIR}/git"
> +SRCREV = "e326f73a7139c5e54fcf926896ae6e4cc899a1a7"
> +
> +inherit  meson pkgconfig
> +
> +DEPENDS = "glib-2.0 gtk-doc-native libxslt-native 
> docbook-xsl-stylesheets-native python3-pygments-native"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110328): 
> <https://lists.openembedded.org/g/openembedded-devel/message/110328>
> Mute This Topic: <https://lists.openembedded.org/mt/106063831/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-cInlq/fcUV7NFZfhDdls
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>add missing dependencies for building documentation</div></div><div id="geary-quote" dir="auto"><br>On Mon, May 13 2024 at 02:05:01 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">glib-testing is a build dependency for malcontent, where building the tests cant be disabled.
We can only disable the run of installed tests in malcontent.

Normally glib-testing gets included as a subproject wrap which is inappropriate for
yocto/oe. Thus we need to provide a recipe for it.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-core/glib-2.0/glib-testing_0.1.1.bb    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb

diff --git a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
new file mode 100644
index 000000000..ebcc2b267
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "libglib-testing provides test harnesses and mock classes to complement GLib classes"
+HOMEPAGE = "<a href="https://gitlab.gnome.org/pwithnall/libglib-testing">https://gitlab.gnome.org/pwithnall/libglib-testing</a>"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4fbd65380cdd255951079008b364516c" "="">file://COPYING;md5=4fbd65380cdd255951079008b364516c"</a>
+
+SRC_URI = "git://gitlab.gnome.org/pwithnall/libglib-testing.git;protocol=https;branch=main"
+
+PV = "0.1.1"
+S = "${WORKDIR}/git"
+SRCREV = "e326f73a7139c5e54fcf926896ae6e4cc899a1a7"
+
+inherit  meson pkgconfig
+
+DEPENDS = "glib-2.0 gtk-doc-native libxslt-native docbook-xsl-stylesheets-native python3-pygments-native"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110328): <a href="https://lists.openembedded.org/g/openembedded-devel/message/110328">https://lists.openembedded.org/g/openembedded-devel/message/110328</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/106063831/3618223">https://lists.openembedded.org/mt/106063831/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-cInlq/fcUV7NFZfhDdls--


