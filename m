Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B000CC38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 05:41:17 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.8916.1674538876131441022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jan 2023 21:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id C8B3E3476
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 06:41:13 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.201]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pKC3V-1oycoi0; Tue, 24 Jan 2023 06:41:13 +0100
Date: Tue, 24 Jan 2023 06:41:07 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCHv2] cups-pk-helper: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <JG6ZOR.0LAQ97J67W9F2@t-online.de>
In-Reply-To: <20230124054024.11634-1-f_l_k@t-online.de>
References: <20230124054024.11634-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dZ/lY70MCsdWzTsFAxoJ"
X-TOI-EXPURGATEID: 150726::1674538873-177FB778-CCF4B2BC/0/0 CLEAN NORMAL
X-TOI-MSGID: 3bf39cc2-d63a-43ed-8faf-de3226cd96ee
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100713

--=-dZ/lY70MCsdWzTsFAxoJ
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 adds polkit to REQUIRED_DISTRO_FEATURES

Am Di, 24. Jan 2023 um 06:40:24 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> cups-pk-helper is a runtime dependency for gnome-control-center
> or system-config-printer.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-printing/cups/cups-pk-helper_0.2.7.bb | 15 
> +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 
> meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
> 
> diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb 
> b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
> new file mode 100644
> index 000000000..9639a123d
> --- /dev/null
> +++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "CUPS polkit helper"
> +HOMEPAGE = 
> "<https://www.freedesktop.org/software/cups-pk-helper/releases/>"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> +
> +DEPENDS = "cups polkit glib-2.0 xz intltool-native"
> +
> +inherit meson pkgconfig gettext features_check
> +
> +REQUIRED_DISTRO_FEATURES = "polkit"
> +
> +SRC_URI = 
> "https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-${PV}.tar.xz 
> <https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-$%7BPV%7D.tar.xz>"
> +SRC_URI[sha256sum] = 
> "66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd59d2bfd79fbe2e831"
> +
> +FILES:${PN} += "${datadir}"
> --
> 2.34.1
> 


--=-dZ/lY70MCsdWzTsFAxoJ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 adds polkit to REQUIRED_DISTRO_FEATURES</div></div><div id="geary-quote" dir="auto"><br>Am Di, 24. Jan 2023 um 06:40:24 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">cups-pk-helper is a runtime dependency for gnome-control-center
or system-config-printer.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-printing/cups/cups-pk-helper_0.2.7.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb

diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
new file mode 100644
index 000000000..9639a123d
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "CUPS polkit helper"
+HOMEPAGE = "<a href="https://www.freedesktop.org/software/cups-pk-helper/releases/">https://www.freedesktop.org/software/cups-pk-helper/releases/</a>"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
+
+DEPENDS = "cups polkit glib-2.0 xz intltool-native"
+
+inherit meson pkgconfig gettext features_check
+
+REQUIRED_DISTRO_FEATURES = "polkit"
+
+SRC_URI = "<a href="https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-${PV}.tar.xz">https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-${PV}.tar.xz</a>"
+SRC_URI[sha256sum] = "66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd59d2bfd79fbe2e831"
+
+FILES:${PN} += "${datadir}"
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-dZ/lY70MCsdWzTsFAxoJ--


