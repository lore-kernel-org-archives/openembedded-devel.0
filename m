Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E79CCA470
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 01:03:29 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.1868.1759367004060692445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 18:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout01.t-online.de (Postfix) with SMTP id 958D01E032
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Oct 2025 03:03:22 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.165.198]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v47j8-1zGJEW0; Thu, 2 Oct 2025 03:03:22 +0200
Date: Thu, 02 Oct 2025 03:03:17 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] telepathy-mission-control: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <H9CH3T.UL66R5XM4Z7D@t-online.de>
In-Reply-To: <186A86D876EC024C.4345@lists.openembedded.org>
References: <186A86D876EC024C.4345@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-sPo8LhUf/YrVuL4i/U0x"
X-TOI-EXPURGATEID: 150726::1759367002-B8FF695D-029F96DE/0/0 CLEAN NORMAL
X-TOI-MSGID: b6daf8a9-2669-40d9-9e29-ae3716374f9f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 01:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120153

--=-sPo8LhUf/YrVuL4i/U0x
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: add libxslt-native dependency; add glib-2.0 dependency; add 
PACKAGECONFIG for nm to allow to build without meta-networking

On Thu, Oct 2 2025 at 03:00:54 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> 'telepathy-mission-control' is an account manager as requested by the 
> 'folks' telepathy
> backend at runtime.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../telepathy-mission-control_5.16.6.bb         | 17 
> +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 
> meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.6.bb
> 
> diff --git 
> a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.6.bb 
> b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.6.bb
> new file mode 100644
> index 0000000000..e7cb55c0f5
> --- /dev/null
> +++ 
> b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.6.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Telepathy Mission Control 5 is an account manager and 
> channel dispatcher for the Telepathy framework"
> +HOMEPAGE = "<http://telepathy.freedesktop.org/wiki/>"
> +LICENSE = "LGPL-2.1-only"
> +
> +DEPENDS = "glib-2.0 telepathy-glib dbus dbus-native dbus-glib 
> libxslt-native"
> +
> +SRC_URI = 
> "http://telepathy.freedesktop.org/releases/telepathy-mission-control/${BP}.tar.gz 
> <http://telepathy.freedesktop.org/releases/telepathy-mission-control/$%7BBP%7D.tar.gz>"
> +SRC_URI[sha256sum] = 
> "2df8ae3995e919a7670e01aa3568215ef0777e34961ace1cac1c6477cb297a45"
> +
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499" 
> <file://copying;md5=d8045f3b8f929c1cb29a1e3fd737b499/>
> +
> +inherit autotools pkgconfig gtk-doc
> +
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[networkmanager] = 
> "--with-connectivity=nm,--with-connectivity=no,networkmanager"
> +
> +FILES:${PN} += "${datadir}/dbus-1 ${datadir}/glib-2.0"
> --
> 2.51.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120152): 
> <https://lists.openembedded.org/g/openembedded-devel/message/120152>
> Mute This Topic: <https://lists.openembedded.org/mt/115545169/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-sPo8LhUf/YrVuL4i/U0x
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: add libxslt-native dependency; add glib-2.0 dependency; add PACKAGECONFIG for nm to allow to build without meta-networking</div></div><div id="geary-quote" dir="auto"><br>On Thu, Oct 2 2025 at 03:00:54 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">'telepathy-mission-control' is an account manager as requested by the 'folks' telepathy
backend at runtime.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../telepathy-mission-control_5.16.6.bb         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.6.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.6.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.6.bb
new file mode 100644
index 0000000000..e7cb55c0f5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.6.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Telepathy Mission Control 5 is an account manager and channel dispatcher for the Telepathy framework"
+HOMEPAGE = "<a href="http://telepathy.freedesktop.org/wiki/">http://telepathy.freedesktop.org/wiki/</a>"
+LICENSE = "LGPL-2.1-only"
+
+DEPENDS = "glib-2.0 telepathy-glib dbus dbus-native dbus-glib libxslt-native"
+
+SRC_URI = "<a href="http://telepathy.freedesktop.org/releases/telepathy-mission-control/${BP}.tar.gz">http://telepathy.freedesktop.org/releases/telepathy-mission-control/${BP}.tar.gz</a>"
+SRC_URI[sha256sum] = "2df8ae3995e919a7670e01aa3568215ef0777e34961ace1cac1c6477cb297a45"
+
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499" "="">file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"</a>
+
+inherit autotools pkgconfig gtk-doc
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[networkmanager] = "--with-connectivity=nm,--with-connectivity=no,networkmanager"
+
+FILES:${PN} += "${datadir}/dbus-1 ${datadir}/glib-2.0"
<div>-- 
</div>2.51.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#120152): <a href="https://lists.openembedded.org/g/openembedded-devel/message/120152">https://lists.openembedded.org/g/openembedded-devel/message/120152</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/115545169/3618223">https://lists.openembedded.org/mt/115545169/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-sPo8LhUf/YrVuL4i/U0x--


