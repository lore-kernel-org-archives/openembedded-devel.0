Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3EAD767F5
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 17:43:59 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.18676.1730396630767227739
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 10:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id AE699184;
	Thu, 31 Oct 2024 18:43:48 +0100 (CET)
Received: from [192.168.178.67] ([84.163.35.203]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t6ZCz-09SXJo0; Thu, 31 Oct 2024 18:43:45 +0100
Date: Thu, 31 Oct 2024 18:45:55 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH v3] snapper: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org, Markus Volk
	<f_l_k@t-online.de>
Message-Id: <JOE8MS.4DEF6FX7L6873@t-online.de>
In-Reply-To: <CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
References: <20241020150843.1068181-1-raj.khem@gmail.com>
	<CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Hc6PNEVidBzPdj7Bbw28"
X-TOI-EXPURGATEID: 150726::1730396625-70FF740D-ED9A0E88/0/0 CLEAN NORMAL
X-TOI-MSGID: e83d388f-002b-49af-9f72-a49c44b2ebdc
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 17:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113375

--=-Hc6PNEVidBzPdj7Bbw28
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Oct 24 2024 at 12:47:46 PM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> should the packaging be changed to use nonarch_libdir and let
> lib32-snapper and snapper conflict with each other? Or is there some
> better way to resolve this?

Using systemd_system_unitdir will also basically just use 
nonarch_libdir. But I wouldn't have a problem with them conflicting 
each other.
I only need snapper for some experiments. Thanks for looking into this


--=-Hc6PNEVidBzPdj7Bbw28
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Oct 24 2024 at 12:47:46 PM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">should the packaging be changed to use nonarch_libdir and let
lib32-snapper and snapper conflict with each other? Or is there some
better way to resolve this?
</div></blockquote><div><br></div><div><span style="white-space-collapse: break-spaces;">Using systemd_system_unitdir will also basically just use nonarch_libdir. But I wouldn't have a problem with them conflicting each other.
I only need snapper for some experiments. Thanks for looking into this</span></div></div>
--=-Hc6PNEVidBzPdj7Bbw28--


