Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6587C3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 17:31:43 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.3265.1719855101086952509
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 10:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 38800218E0;
	Mon,  1 Jul 2024 19:31:39 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.171.55]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sOKsL-2FC2uO0; Mon, 1 Jul 2024 19:31:37 +0200
Date: Mon, 01 Jul 2024 19:32:41 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 1.0.7 -> 1.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <HQGYFS.OCZ5W8J5KO0Q1@t-online.de>
In-Reply-To: <CAMKF1spH=h0FudqGDMfVkbVOOz3tggv5VWJMEgSAqsTL+J2MJw@mail.gmail.com>
References: <20240630124721.64234-1-f_l_k@t-online.de>
	<CAMKF1srwPHUtw3sAOtu80dx8FYGLODTwMwGzH4z-L0+-70hfyw@mail.gmail.com>
	<SJ0YFS.8BMPV3P7F4SC@t-online.de>
	<CAMKF1spH=h0FudqGDMfVkbVOOz3tggv5VWJMEgSAqsTL+J2MJw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-41dvSxlV2kl1MxIQnIQY"
X-TOI-EXPURGATEID: 150726::1719855097-C6FFAD1D-73A6B355/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a0b524e-bd9a-4964-9359-dd48005d1fd5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 17:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111203

--=-41dvSxlV2kl1MxIQnIQY
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Jul 1 2024 at 07:58:28 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> riscv32/armv5/mips/ppc32 perhaps is all we care.

# Specify linking with -latomic on architectures missing 64bit atomics.
LDFLAGS += "${@bb.utils.contains_any('TUNE_FEATURES', 'riscv32 armv5 
mips ppc32 m32', '-latomic', '', d)}"

Would that be enough for now? According to my tests, it fixes the 
problem for clang i686-poky-linux-musl.


--=-41dvSxlV2kl1MxIQnIQY
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Jul 1 2024 at 07:58:28 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">riscv32/armv5/mips/ppc32 perhaps is all we care.</div></blockquote><div><br></div><div><div># Specify linking with -latomic on architectures missing 64bit atomics.</div><div>LDFLAGS += "${@bb.utils.contains_any('TUNE_FEATURES', 'riscv32 armv5 mips ppc32 m32', '-latomic', '', d)}"</div></div><div><br></div><div>Would that be enough for now? According to my tests, it fixes the problem for clang i686-poky-linux-musl.</div></div>
--=-41dvSxlV2kl1MxIQnIQY--


