Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04BAC32789
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 08:12:23 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.15376.1661155936797767692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 01:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout04.t-online.de (Postfix) with SMTP id EE9D21821;
	Mon, 22 Aug 2022 10:12:14 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.174.226]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQ2Xe-3sDJs80; Mon, 22 Aug 2022 10:12:14 +0200
Date: Mon, 22 Aug 2022 10:12:08 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv8] pipewire: update to v0.3.56
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <84C0HR.3IS15UZ7DR5U@t-online.de>
In-Reply-To: <3BB0HR.7K7PWKWAUTT3@t-online.de>
References: <20220821140240.123638-1-f_l_k@t-online.de>
	<CAMKF1so_YYOK4KXdfJH=F6G7rOV9a8_9wRr5CkdDVCr6eOJDew@mail.gmail.com>
	<CAMKF1sq63W60kH_cOy+3oWQKKbc9nUw=F5eMu=uZjQr0YcCoRA@mail.gmail.com>
	<3BB0HR.7K7PWKWAUTT3@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-QGOUCeQCYujWp5y2DAWM"
X-TOI-EXPURGATEID: 150726::1661155934-0144E3C8-68FBFFA0/0/0 CLEAN NORMAL
X-TOI-MSGID: 658a4bcd-d448-4f42-897b-b47038aa6ba1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 08:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98358

--=-QGOUCeQCYujWp5y2DAWM
Content-Type: text/plain; charset=us-ascii; format=flowed

also added a missing libdrm dependency to libcamera PACKAGECONFIG to 
fix:
| Run-time dependency libdrm found: NO (tried pkgconfig)
|
| ../git/spa/plugins/libcamera/meson.build:8:0: ERROR: Dependency 
"libdrm" not found, tried pkgconfig

Am Mo, 22. Aug 2022 um 09:54:39 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Am So, 21. Aug 2022 um 22:51:28 -0700 schrieb Khem Raj 
> <raj.khem@gmail.com>:
>> I still see a compile error on mips with latest version of this 
>> patch see
> 
> I found some time to build Pipewire for qemumips. There were 3 
> patches that fixed the big endian problem uppstream. I have combined 
> them into one patch. The compilation now succeeds on my machine.


--=-QGOUCeQCYujWp5y2DAWM
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">also added a missing libdrm dependency to libcamera PACKAGECONFIG to fix:<div>| Run-time dependency libdrm found: NO (tried pkgconfig)</div><div>|&nbsp;</div><div>| ../git/spa/plugins/libcamera/meson.build:8:0: ERROR: Dependency "libdrm" not found, tried pkgconfig</div></div><div id="geary-quote" dir="auto"><br>Am Mo, 22. Aug 2022 um 09:54:39 +0200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div id="geary-body" dir="auto">Am So, 21. Aug 2022 um 22:51:28 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I still see a compile error on mips with latest version of this patch see
</div></blockquote><div><br></div><div>I found some time to build Pipewire for qemumips. There were 3 patches that fixed the big endian problem uppstream. I have combined them into one patch. The compilation now succeeds on my machine.</div></div></blockquote></div>
--=-QGOUCeQCYujWp5y2DAWM--


