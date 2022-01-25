Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75032C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 06:33:45 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.3876.1643092420418882617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 22:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 230BD649A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:33:38 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.159]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCFOZ-2qG4cz0; Tue, 25 Jan 2022 07:33:35 +0100
Subject: Re: [oe] [meta-gnome][PATCH] folks: disable tests; fix dependencies
To: openembedded-devel@lists.openembedded.org
References: <16CD6F6602DACBAF.4064@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <1c5b0ffb-9160-4300-da01-7c678fe0012c@t-online.de>
Date: Tue, 25 Jan 2022 07:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16CD6F6602DACBAF.4064@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------AA01E8B6D57FF91E08FA2A83"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1643092415-00014AB5-C1353F28/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e30c6b1-9992-47f2-9c2f-18a96086b410
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 06:33:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95050

This is a multi-part message in MIME format.
--------------AA01E8B6D57FF91E08FA2A83
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

oops. I forgot to remove telepathy PACKAGECONFIG i added for testing. 
Will send a v2

Am 25.01.22 um 07:25 schrieb Markus Volk:
> disable tests and remove the now unneeded python3 dbusmock module
> add libebook dependency to all backends that need it
> ---
>   meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> index 7dc72f822..1144ea8fc 100644
> --- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> @@ -7,7 +7,6 @@ DEPENDS = " \
>       glib-2.0 \
>       libgee \
>       libxml2 \
> -    python3-dbusmock-native \
>   "
>   
>   GNOMEBASEBUILDCLASS = "meson"
> @@ -16,14 +15,16 @@ GNOMEBASEBUILDCLASS = "meson"
>   REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>   GIR_MESON_OPTION = ""
>   
> +EXTRA_OEMESON += "-Dtests=false"
> +
>   PACKAGECONFIG[eds] = "-Deds_backend=true,-Deds_backend=false,evolution-data-server"
> -PACKAGECONFIG[bluez] = "-Dbluez_backend=true,-Dbluez_backend=false"
> -PACKAGECONFIG[ofono] = "-Dofono_backend=true,-Dofono_backend=false"
> +PACKAGECONFIG[bluez] = "-Dbluez_backend=true,-Dbluez_backend=false,evolution-data-server"
> +PACKAGECONFIG[ofono] = "-Dofono_backend=true,-Dofono_backend=false,evolution-data-server"
>   PACKAGECONFIG[telepathy] = "-Dtelepathy_backend=true,-Dtelepathy_backend=false,telepathy-glib"
>   PACKAGECONFIG[import_tool] = "-Dimport_tool=true,-Dimport_tool=false"
>   PACKAGECONFIG[inspect_tool] = "-Dinspect_tool=true,-Dinspect_tool=false"
>   
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "telepathy"
>   
>   inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95049): https://lists.openembedded.org/g/openembedded-devel/message/95049
> Mute This Topic: https://lists.openembedded.org/mt/88666737/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------AA01E8B6D57FF91E08FA2A83
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>oops. I forgot to remove telepathy PACKAGECONFIG i added for
      testing. Will send a v2<br>
    </p>
    <div class="moz-cite-prefix">Am 25.01.22 um 07:25 schrieb Markus
      Volk:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16CD6F6602DACBAF.4064@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">disable tests and remove the now unneeded python3 dbusmock module
add libebook dependency to all backends that need it
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
index 7dc72f822..1144ea8fc 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
@@ -7,7 +7,6 @@ DEPENDS = " \
     glib-2.0 \
     libgee \
     libxml2 \
-    python3-dbusmock-native \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
@@ -16,14 +15,16 @@ GNOMEBASEBUILDCLASS = "meson"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
+EXTRA_OEMESON += "-Dtests=false"
+
 PACKAGECONFIG[eds] = "-Deds_backend=true,-Deds_backend=false,evolution-data-server"
-PACKAGECONFIG[bluez] = "-Dbluez_backend=true,-Dbluez_backend=false"
-PACKAGECONFIG[ofono] = "-Dofono_backend=true,-Dofono_backend=false"
+PACKAGECONFIG[bluez] = "-Dbluez_backend=true,-Dbluez_backend=false,evolution-data-server"
+PACKAGECONFIG[ofono] = "-Dofono_backend=true,-Dofono_backend=false,evolution-data-server"
 PACKAGECONFIG[telepathy] = "-Dtelepathy_backend=true,-Dtelepathy_backend=false,telepathy-glib"
 PACKAGECONFIG[import_tool] = "-Dimport_tool=true,-Dimport_tool=false"
 PACKAGECONFIG[inspect_tool] = "-Dinspect_tool=true,-Dinspect_tool=false"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "telepathy"
 
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#95049): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/95049">https://lists.openembedded.org/g/openembedded-devel/message/95049</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88666737/3618223">https://lists.openembedded.org/mt/88666737/3618223</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------AA01E8B6D57FF91E08FA2A83--

