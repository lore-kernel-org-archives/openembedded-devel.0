Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C0BEB64CF
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 18:22:29 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.13539.1725733343281226239
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 11:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id 5B77C2CB19;
	Sat,  7 Sep 2024 20:22:21 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.32.86]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sn04i-0vq2ng0; Sat, 7 Sep 2024 20:22:20 +0200
Date: Sat, 07 Sep 2024 20:23:51 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] iwd: use internal ell
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Message-Id: <RFGGJS.TVMQIX4IAUA23@t-online.de>
In-Reply-To: <CA+chaQdHMh6W920EHbHvE4UfrfDAacWS6C_4X8gsU=mahrkFAQ@mail.gmail.com>
References: <20240907083446.80928-1-f_l_k@t-online.de>
	<CAMKF1sqt1BZt_frP-rbPVFzKz4QCo9LrTFVxHsRR9Kp1MjE+qA@mail.gmail.com>
	<CA+chaQdHMh6W920EHbHvE4UfrfDAacWS6C_4X8gsU=mahrkFAQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-106a6wLmpjz5vcWNHBzX"
X-TOI-EXPURGATEID: 150726::1725733340-717F85C5-F25FC9A2/0/0 CLEAN NORMAL
X-TOI-MSGID: e3af3bdc-7499-472e-9785-cbe18bb78fa6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 18:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112117

--=-106a6wLmpjz5vcWNHBzX
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Sep 7 2024 at 05:44:19 PM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> explicitly the external on (from oe-core) since
> <https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/ofono?id=3683f524dc60325b3f3b1bc3a32e70a41064ae03>

Understand. I also know that bluez5 uses ell when PACKAGECONFIG is 
enabled for either mesh or btpclient. But that's not the default. So 
for consistency, maybe it would be good to keep it external for all 
three?

I'm not sure about this change either, but wanted to bring it up for 
discussion because it always feels a bit like groundhog day with 
iwd/ell.

I'm not that familiar with investigating sstate cache reuse issues. I'm 
willing to learn more about it, but right now I don't know what exact 
files I would need to compare, or is there something like a tool that 
can be used for this purpose?


--=-106a6wLmpjz5vcWNHBzX
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Sep 7 2024 at 05:44:19 PM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">explicitly the external on (from oe-core) since
<a href="https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/ofono?id=3683f524dc60325b3f3b1bc3a32e70a41064ae03">https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/ofono?id=3683f524dc60325b3f3b1bc3a32e70a41064ae03</a></div></blockquote><div><br></div><div><div>Understand. I also know that bluez5 uses ell when PACKAGECONFIG is enabled for either mesh or btpclient. But that's not the default. So for consistency, maybe it would be good to keep it external for all three?</div><div><br></div><div>I'm not sure about this change either, but wanted to bring it up for discussion because it always feels a bit like groundhog day with iwd/ell.</div><div><br></div><div>I'm not that familiar with investigating sstate cache reuse issues. I'm willing to learn more about it, but right now I don't know what exact files I would need to compare, or is there something like a tool that can be used for this purpose?</div></div></div>
--=-106a6wLmpjz5vcWNHBzX--


