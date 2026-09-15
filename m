Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85408C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:24:30 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19867.1789467864898022131
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=eMAskgXj;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd97.aul.t-online.de (fwd97.aul.t-online.de [10.223.144.123])
	by mailout04.t-online.de (Postfix) with SMTP id A9558AF7
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 12:23:39 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.162.202]) by fwd97.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6QKA-0FARGK0; Tue, 15 Sep 2026 12:23:38 +0200
Date: Tue, 15 Sep 2026 12:23:33 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [RFC][meta-gnome][PATCH 5/5] nautilus: upgrade 50.3 ->
 51.0.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <97IELT.KF9GU6J4LLC12@t-online.de>
In-Reply-To: <18D5776361C972D6.582625@lists.openembedded.org>
References: <20260915102123.5530-1-f_l_k@t-online.de>
	<18D5776361C972D6.582625@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Gvep0LAKTbKrW8TpiDf4"
X-TOI-EXPURGATEID: 150726::1789467818-D8FF69A9-29A397CE/0/0 CLEAN NORMAL
X-TOI-MSGID: 22e5ee1f-7750-4386-bed8-11db879be19e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789467819; i=f_l_k@t-online.de;
	bh=lxOjrR/Jl/q0an/C42d+sJ3ajh87j/VOodn12oVSMK0=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=eMAskgXj7hVpjvFF3UzGZABbzD5Glwq6qYUqqzSFCGuE57nWtkIHqYiu9LvryqvMq
	 iiG2CKfRbjOLhZ05mKrDWoZWvjkcaJuodtzuxnxcwU/nsehV7aSnFEzKO60m4A6YF7
	 7d6T5EX5VNbgS0o9gxLbQNiV/UaMbHUhdAf+fqIzexmRDSXuvqbz+6UX8viZLuwdm5
	 u11xNc5FNQTlS3H6iwm6PukmQo24Q69ibt5dRvl/4pJ3FtS4SsbAq/uRLOy+KWMtdV
	 kuHksrSFQ6N8mZ0QMYpSAVdm8TanZMnW2xE99FhwQFmcIz6hBcJmK2wU8aq95zqsaC
	 vVOKWbeSqg22A==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 10:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130075

--=-Gvep0LAKTbKrW8TpiDf4
Content-Type: text/plain; charset=us-ascii; format=flowed

These are the ones that are required after the glib/gtk/libadwaita bump 
in oe-core but will break things if applied before

On Tue, Sep 15 2026 at 12:21:23 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Depends on the glib-2.0 2.90.0 upgrade in oe-core; 51.0.1 requires
> gio-2.0 >= 2.89.0.
> 
> gnome_verdir() turns the three component version into "51.0", while 
> the
> tarball lives in the "51" directory, so set SRC_URI accordingly.
> 
> AI-Generated: Uses Claude Code (Claude Opus 5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../nautilus/{nautilus_50.3.bb => nautilus_51.0.1.bb}         | 4 
> +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/nautilus/{nautilus_50.3.bb => 
> nautilus_51.0.1.bb} (87%)
> 
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb 
> b/meta-gnome/recipes-gnome/nautilus/nautilus_51.0.1.bb
> similarity index 87%
> rename from meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
> rename to meta-gnome/recipes-gnome/nautilus/nautilus_51.0.1.bb
> index e3a825b0a1..19a850089b 100644
> --- a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus_51.0.1.bb
> @@ -24,7 +24,9 @@ DEPENDS = " \
> 
>  inherit gnomebase gsettings gobject-introspection gi-docgen gettext 
> features_check mime-xdg gtk-icon-cache
> 
> -SRC_URI[archive.sha256sum] = 
> "63773baf0ddec7b4875fc2c22040378562ea1e6812fe0a2e29c9c8d5c72807f8"
> +SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim 
> <mailto:${@oe.utils.trim>_version('${PV}', 
> 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
> +
> +SRC_URI[archive.sha256sum] = 
> "a00db908fd65026cbd5dc634e12d189de8eba2b03f105d2425341768a5ee92fb"
> 
>  REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130073): 
> <https://lists.openembedded.org/g/openembedded-devel/message/130073>
> Mute This Topic: <https://lists.openembedded.org/mt/121258435/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Gvep0LAKTbKrW8TpiDf4
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>These are the ones that are required after the glib/gtk/libadwaita bump in oe-core but will break things if applied before</div></div><div id="geary-quote" dir="auto"><br>On Tue, Sep 15 2026 at 12:21:23 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Depends on the glib-2.0 2.90.0 upgrade in oe-core; 51.0.1 requires
gio-2.0 &gt;= 2.89.0.

gnome_verdir() turns the three component version into "51.0", while the
tarball lives in the "51" directory, so set SRC_URI accordingly.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../nautilus/{nautilus_50.3.bb =&gt; nautilus_51.0.1.bb}         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_50.3.bb =&gt; nautilus_51.0.1.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_51.0.1.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_51.0.1.bb
index e3a825b0a1..19a850089b 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_51.0.1.bb
@@ -24,7 +24,9 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "63773baf0ddec7b4875fc2c22040378562ea1e6812fe0a2e29c9c8d5c72807f8"
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/<a href="mailto:${@oe.utils.trim">${@oe.utils.trim</a>_version('${PV}', 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
+
+SRC_URI[archive.sha256sum] = "a00db908fd65026cbd5dc634e12d189de8eba2b03f105d2425341768a5ee92fb"
 
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#130073): <a href="https://lists.openembedded.org/g/openembedded-devel/message/130073">https://lists.openembedded.org/g/openembedded-devel/message/130073</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121258435/3618223">https://lists.openembedded.org/mt/121258435/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Gvep0LAKTbKrW8TpiDf4--


