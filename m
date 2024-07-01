Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2069EC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 11:42:15 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.17421.1719834125594588090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 04:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id A38502F635;
	Mon,  1 Jul 2024 13:42:03 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.171.55]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sOFQ1-1PovPk0; Mon, 1 Jul 2024 13:42:01 +0200
Date: Mon, 01 Jul 2024 13:43:04 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 1.0.7 -> 1.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <SJ0YFS.8BMPV3P7F4SC@t-online.de>
In-Reply-To: <CAMKF1srwPHUtw3sAOtu80dx8FYGLODTwMwGzH4z-L0+-70hfyw@mail.gmail.com>
References: <20240630124721.64234-1-f_l_k@t-online.de>
	<CAMKF1srwPHUtw3sAOtu80dx8FYGLODTwMwGzH4z-L0+-70hfyw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-U8IEX5KsO7cbomoPsy23"
X-TOI-EXPURGATEID: 150726::1719834121-C77FDD1D-68761573/0/0 CLEAN NORMAL
X-TOI-MSGID: e0dfe8c5-a84f-428f-bde8-dce3a1369f4f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 11:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111198

--=-U8IEX5KsO7cbomoPsy23
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Jun 30 2024 at 04:34:47 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> perhaps we need to specify linking with -latomic on architectures
> missing 64bit atomics.

Right. I verified that
LDFLAGS += "-latomic"
fixes the issue for 32bit x86 clang

Do you know what exact platforms need this fix or should it be included 
for all?


--=-U8IEX5KsO7cbomoPsy23
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Jun 30 2024 at 04:34:47 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">perhaps we need to specify linking with -latomic on architectures
missing 64bit atomics.</div></blockquote><div><br></div><div><div>Right. I verified that</div><div>LDFLAGS += "-latomic"</div><div>fixes the issue for 32bit x86 clang</div></div><div><span style="white-space: break-spaces;"><br></span></div><div><span style="white-space: break-spaces;">Do you know what exact platforms need this fix or should it be included for all?</span></div></div>
--=-U8IEX5KsO7cbomoPsy23--


