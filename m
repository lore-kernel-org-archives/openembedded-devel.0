Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38EAE77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 19:03:15 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.348.1736276592157737404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 11:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout02.t-online.de (Postfix) with SMTP id F162810AE;
	Tue,  7 Jan 2025 20:03:09 +0100 (CET)
Received: from [192.168.178.67] ([84.163.46.246]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVEr7-2JT83U0; Tue, 7 Jan 2025 20:03:09 +0100
Date: Tue, 07 Jan 2025 20:03:29 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv4] libheif: add recipe
To: raj.khem@gmail.com
Cc: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <TLFQPS.KXN77KSO228N2@t-online.de>
In-Reply-To: <CAMKF1sqw4Y9ZdvZUzMtF+=zm8SpZxUGa4KiRvD3-VjvwDEV=AA@mail.gmail.com>
References: <20250107163644.2845120-1-f_l_k@t-online.de>
	<CAMKF1sqw4Y9ZdvZUzMtF+=zm8SpZxUGa4KiRvD3-VjvwDEV=AA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-aBEG78A65IsCXGjd68BI"
X-TOI-EXPURGATEID: 150726::1736276589-C57F99EF-71DA11DC/0/0 CLEAN NORMAL
X-TOI-MSGID: ae854a45-aea1-4060-85a4-e94f5292c693
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 19:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114721

--=-aBEG78A65IsCXGjd68BI
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Jan 7 2025 at 09:43:55 -08:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> You might want to limit the architecture set to what openh264 
> supports.

I updated openh264 and switched to meson buildsystem. It seems like 
ppc64 is the only unsupported platform.

Adding this line should be enough?

COMPATIBLE_MACHINE:powerpc64le = "null"


--=-aBEG78A65IsCXGjd68BI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Jan 7 2025 at 09:43:55 -08:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">You might want to limit the architecture set to what openh264 supports.
</div></blockquote><div><br></div><div>I updated openh264 and switched to meson buildsystem. It seems like ppc64 is the only unsupported platform.</div><div><br></div><div>Adding this line should be enough?</div><div><br></div><div>COMPATIBLE_MACHINE:powerpc64le = "null"</div></div>
--=-aBEG78A65IsCXGjd68BI--


