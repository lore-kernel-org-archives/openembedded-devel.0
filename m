Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EA1C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:50:37 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.25815.1703260234823488125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id F2C1826CE;
	Fri, 22 Dec 2023 16:50:31 +0100 (CET)
Received: from [192.168.178.67] ([84.163.42.169]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rGhn5-04Psi80; Fri, 22 Dec 2023 16:50:23 +0100
Date: Fri, 22 Dec 2023 16:51:12 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [PATCH 8/9] flatpak: do not rely on executables from the
 host
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Alexander Kanavin
	<alex@linutronix.de>
Message-Id: <C1S26S.CLJ4310DALJ63@t-online.de>
In-Reply-To: <20231222151108.645675-8-alex@linutronix.de>
References: <20231222151108.645675-1-alex@linutronix.de>
	<20231222151108.645675-8-alex@linutronix.de>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-VhfrPfRbMTNp+nsuOOD1"
X-TOI-EXPURGATEID: 150726::1703260224-56FA6986-97E4F5B5/0/0 CLEAN NORMAL
X-TOI-MSGID: b349541e-8349-4874-8b42-60c0071a96bd
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107764

--=-VhfrPfRbMTNp+nsuOOD1
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Dec 22 2023 at 04:11:07 PM +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb 
> b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
> index 0ee53afb6..caa353bb8 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
> @@ -43,8 +43,6 @@ RDEPENDS:${PN} = " \
>      xdg-dbus-proxy \
>  "
> 
> -EXTRA_OEMESON += "-Dsystem_dbus_proxy=${bindir}/xdg-dbus-proxy 
> -Dsystem_bubblewrap=${bindir}/bwrap"

My understanding was that these were runtime dependencies and setting 
the paths would ensure that target flatpak can find them


--=-VhfrPfRbMTNp+nsuOOD1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Dec 22 2023 at 04:11:07 PM +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
index 0ee53afb6..caa353bb8 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
@@ -43,8 +43,6 @@ RDEPENDS:${PN} = " \
     xdg-dbus-proxy \
 "
 
-EXTRA_OEMESON += "-Dsystem_dbus_proxy=${bindir}/xdg-dbus-proxy -Dsystem_bubblewrap=${bindir}/bwrap"</div></blockquote><div><br></div><div><span style="background-color: rgb(255, 255, 255);">My understanding was that these were runtime dependencies and setting the paths would ensure that target flatpak can find them</span></div></div>
--=-VhfrPfRbMTNp+nsuOOD1--


