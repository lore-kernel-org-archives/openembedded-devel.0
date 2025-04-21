Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2066C369C2
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 11:13:56 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.12891.1745234028829100558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 04:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id 906C62F3
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 13:13:39 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.37.191]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6p5m-0wgqBs0; Mon, 21 Apr 2025 13:13:38 +0200
Date: Mon, 21 Apr 2025 13:13:33 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libxmp: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <L6F2VS.N31U5SFWBN7A1@t-online.de>
In-Reply-To: <183850994EF46D4A.21966@lists.openembedded.org>
References: <183850994EF46D4A.21966@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-1KgP+c44Ax7/KgxFEqCq"
X-TOI-EXPURGATEID: 150726::1745234018-A9FF8A64-1097CD9B/10/3626336762 SUSPECT URL
X-TOI-MSGID: 9d3ccd89-735f-4e73-ad96-761cdd4cd345
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117006

--=-1KgP+c44Ax7/KgxFEqCq
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: fix license

On Mon, Apr 21 2025 at 13:04:21 +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> libxmp is a requirement for libsdl2-mixer
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
> 
> diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb 
> b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
> new file mode 100644
> index 0000000000..e4cc5c93b9
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Extended Module Player Library"
> +HOMEPAGE = "<http://xmp.sourceforge.net/>"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = 
> "file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8" 
> <file://readme;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8/>
> +
> +inherit cmake pkgconfig
> +
> +SRC_URI = 
> "git://github.com/libxmp/libxmp.git;protocol=https;branch=master"
> +SRCREV = "828ef357943e1fbb13910e7a6fca21987c5c5827"
> +
> +S = "${WORKDIR}/git"
> --
> 2.49.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117005): 
> <https://lists.openembedded.org/g/openembedded-devel/message/117005>
> Mute This Topic: <https://lists.openembedded.org/mt/112373119/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-1KgP+c44Ax7/KgxFEqCq
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: fix license&nbsp;</div></div><div id="geary-quote" dir="auto"><br>On Mon, Apr 21 2025 at 13:04:21 +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">libxmp is a requirement for libsdl2-mixer

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
new file mode 100644
index 0000000000..e4cc5c93b9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Extended Module Player Library"
+HOMEPAGE = "<a href="http://xmp.sourceforge.net/">http://xmp.sourceforge.net/</a>"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "<a href="file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8" "="">file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8"</a>
+
+inherit cmake pkgconfig
+
+SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master"
+SRCREV = "828ef357943e1fbb13910e7a6fca21987c5c5827"
+
+S = "${WORKDIR}/git"
<div>-- 
</div>2.49.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#117005): <a href="https://lists.openembedded.org/g/openembedded-devel/message/117005">https://lists.openembedded.org/g/openembedded-devel/message/117005</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/112373119/3618223">https://lists.openembedded.org/mt/112373119/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-1KgP+c44Ax7/KgxFEqCq--


