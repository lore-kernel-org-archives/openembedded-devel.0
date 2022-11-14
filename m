Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED280C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 16:44:00 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web12.8086.1668444230972599532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Nov 2022 08:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout06.t-online.de (Postfix) with SMTP id E50801B884;
	Mon, 14 Nov 2022 17:43:48 +0100 (CET)
Received: from [192.168.178.83] ([84.154.161.52]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oucYm-07tT3Q0; Mon, 14 Nov 2022 17:43:48 +0100
Date: Mon, 14 Nov 2022 17:43:43 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv12] pipewire: update to v0.3.56
To: crg7475@mailbox.org
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <VSJCLR.ZAF187FG7SZ53@t-online.de>
In-Reply-To: <ef125b71-594a-c235-bf16-097c292d38f0@mailbox.org>
References: <20220822171940.4736-1-f_l_k@t-online.de>
	<8c1dd697-ddee-d297-fc92-fe59391ff7a3@mailbox.org>
	<17268605DB982F0F.19634@lists.openembedded.org>
	<PU17LR.6HATELSCM57B@t-online.de>
	<ef125b71-594a-c235-bf16-097c292d38f0@mailbox.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3oJCrnDuwWy+CD73l0RM"
X-TOI-EXPURGATEID: 150726::1668444228-2DFFA535-B818271E/0/0 CLEAN NORMAL
X-TOI-MSGID: 09c0d366-077b-4afa-b864-300fd73e9286
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 16:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99587

--=-3oJCrnDuwWy+CD73l0RM
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 14. Nov 2022 um 14:36:18 +0100 schrieb Carlos Rafael Giani via 
lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>:
> I'm upgrading the recipe right now, and I am skeptical about the 
> media-session and wireplumber packageconfigs. Sure, they make sure 
> that these two can't be in the same image, but this creates circular 
> dependencies, because pipewire now depends on wireplumber, which 
> depends on pipewire. And the same thing applies to media-session.

pipewire-media-session and wireplumber only set RRECOMMENDS on 
pipewire, not RDEPENDS. This avoids circular dependencies for my 
builds. Personally, I am not a fan of virual/xyz packages and try to 
avoid them as long as possible. I have had some issues with them in the 
past. If you are still having problems with circular dependencies, I 
would vote to remove "pipewire" completely from the RECCOMENDS_$[PN} 
lines in the session-manager recipes. I think it's more important to 
install a session manager together with pipwire than the other way 
around.

But I'm just a user, the openembedded developers should be able to 
judge this better.


--=-3oJCrnDuwWy+CD73l0RM
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 14. Nov 2022 um 14:36:18 +0100 schrieb Carlos Rafael Giani via lists.openembedded.org &lt;crg7475=mailbox.org@lists.openembedded.org&gt;:<br><blockquote type="cite">I'm upgrading the
        recipe right now, and I am skeptical about the media-session and
        wireplumber packageconfigs. Sure, they make sure that these two
        can't be in the same image, but this creates circular
        dependencies, because pipewire now depends on wireplumber, which
        depends on pipewire. And the same thing applies to
        media-session.</blockquote><div><br></div><div><div>pipewire-media-session and wireplumber only set RRECOMMENDS on pipewire, not RDEPENDS. This avoids circular dependencies for my builds. Personally, I am not a fan of virual/xyz packages and try to avoid them as long as possible. I have had some issues with them in the past. If you are still having problems with circular dependencies, I would vote to remove "pipewire" completely from the RECCOMENDS_$[PN} lines in the session-manager recipes. I think it's more important to install a session manager together with pipwire than the other way around.</div><div><br></div><div>But I'm just a user, the openembedded developers should be able to judge this better.</div></div></div>
--=-3oJCrnDuwWy+CD73l0RM--


