Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFA6C54E67
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:58:47 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.5480.1711184324769100450
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout08.t-online.de (Postfix) with SMTP id 02E5223DBB;
	Sat, 23 Mar 2024 09:58:43 +0100 (CET)
Received: from [192.168.178.67] ([84.154.167.162]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnxD6-0vfJtQ0; Sat, 23 Mar 2024 09:58:40 +0100
Date: Sat, 23 Mar 2024 09:59:03 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv2] msgraph: add recipe
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <FAMSAS.OL8PE8FLMPFU1@t-online.de>
In-Reply-To: <17BF58FDA7714B04.27941@lists.openembedded.org>
References: <17BF58FDA7714B04.27941@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-MxXxSa1rE1Vn1PLxpDe6"
X-TOI-EXPURGATEID: 150726::1711184320-FEB02990-DAF616FE/0/0 CLEAN NORMAL
X-TOI-MSGID: e2d3837a-f9e4-44b4-a119-20aca7f90f35
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109546

--=-MxXxSa1rE1Vn1PLxpDe6
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 updates rest dependency

On Sat, Mar 23 2024 at 09:57:27 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> libmsgraph would be required for onedrive support in gvfs
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-gnome/msgraph/msgraph_0.2.1.bb     | 18 
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
> 
> diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb 
> b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
> new file mode 100644
> index 000000000..4c11a8d13
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "libmsgraph is a GLib-based library for accessing online 
> serive APIs using MS Graph protocol."
> +LICENSE = "LGPL-3.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404" 
> <file://copying;md5=3000208d539ec061b899bce1d9ce9404/>
> +
> +inherit gnomebase gobject-introspection gi-docgen
> +
> +SRC_URI[archive.sha256sum] = 
> "e0e59eaa8ae3e0a48ec0a6c2fed0470856a709248e9212b6a1d037de5792ecbb"
> +
> +GTKDOC_MESON_OPTION = "gtk_doc"
> +
> +EXTRA_OEMESON = "-Dtests=false"
> +
> +DEPENDS = " \
> +    glib-2.0\
> +    json-glib \
> +    rest \
> +    gnome-online-accounts \
> +"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109545): 
> <https://lists.openembedded.org/g/openembedded-devel/message/109545>
> Mute This Topic: <https://lists.openembedded.org/mt/105100639/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-MxXxSa1rE1Vn1PLxpDe6
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 updates rest dependency&nbsp;</div></div><div id="geary-quote" dir="auto"><br>On Sat, Mar 23 2024 at 09:57:27 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">libmsgraph would be required for onedrive support in gvfs

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-gnome/msgraph/msgraph_0.2.1.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
new file mode 100644
index 000000000..4c11a8d13
--- /dev/null
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "libmsgraph is a GLib-based library for accessing online serive APIs using MS Graph protocol."
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=3000208d539ec061b899bce1d9ce9404" "="">file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"</a>
+
+inherit gnomebase gobject-introspection gi-docgen
+
+SRC_URI[archive.sha256sum] = "e0e59eaa8ae3e0a48ec0a6c2fed0470856a709248e9212b6a1d037de5792ecbb"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+EXTRA_OEMESON = "-Dtests=false"
+
+DEPENDS = " \
+    glib-2.0\
+    json-glib \
+    rest \
+    gnome-online-accounts \
+"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#109545): <a href="https://lists.openembedded.org/g/openembedded-devel/message/109545">https://lists.openembedded.org/g/openembedded-devel/message/109545</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105100639/3618223">https://lists.openembedded.org/mt/105100639/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-MxXxSa1rE1Vn1PLxpDe6--


