Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6DAC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 12:01:23 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web08.4612.1668168070879454236
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Nov 2022 04:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id 92B06214F5;
	Fri, 11 Nov 2022 13:01:06 +0100 (CET)
Received: from [192.168.178.83] ([79.219.225.57]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1otSiX-0zVjIO0; Fri, 11 Nov 2022 13:01:05 +0100
Date: Fri, 11 Nov 2022 13:00:59 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv12] pipewire: update to v0.3.56
To: crg7475@mailbox.org
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <NPM6LR.XOCGS5STVGRR1@t-online.de>
In-Reply-To: <8c1dd697-ddee-d297-fc92-fe59391ff7a3@mailbox.org>
References: <20220822171940.4736-1-f_l_k@t-online.de>
	<8c1dd697-ddee-d297-fc92-fe59391ff7a3@mailbox.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tnicB8x1STCjti8fQxrg"
X-TOI-EXPURGATEID: 150726::1668168065-793AD9DD-1B947C44/0/0 CLEAN NORMAL
X-TOI-MSGID: 30a1c037-d570-409c-9a4f-2278d839945d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 12:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99556

--=-tnicB8x1STCjti8fQxrg
Content-Type: text/plain; charset=us-ascii; format=flowed

media-session is not really deprecated. It's still under some 
maintanance:
<https://gitlab.freedesktop.org/pipewire/media-session/-/commits/master>

I myself also use wireplumber, but i experimented with media-session 
and it turned out to work fine for my use case.

Readme says:
"PipeWire Media Session is an example session manager for Pipewire.

Note that we recommend the use of Wireplumber instead."

And just for the sake of completeness and to have this example present, 
I also included the media session.In other words, is there any reason 
why media-session should not be selectable?

As to why wireplumber is not the default, I don't really have an 
opinion on that. I just had media-session preset because it has less 
dependencies and was working quite well.

Am Fr, 11. Nov 2022 um 12:01:03 +0100 schrieb Carlos Rafael Giani via 
lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>:
> Is there a reason for adding the wireplumber packageconfig?
> 


--=-tnicB8x1STCjti8fQxrg
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">media-session is not really deprecated. It's still under some maintanance:<div><a href="https://gitlab.freedesktop.org/pipewire/media-session/-/commits/master">https://gitlab.freedesktop.org/pipewire/media-session/-/commits/master</a></div><div><br></div><div>I myself also use wireplumber, but i experimented with media-session and it turned out to work fine for my use case.</div><div><br></div><div>Readme says:</div><div><p dir="auto" data-sourcepos="3:1-4:33">"PipeWire Media Session is an example session manager for Pipewire.</p>
<p dir="auto" data-sourcepos="6:1-7:75">Note that we recommend the use of Wireplumber&nbsp;instead."</p><p dir="auto" data-sourcepos="6:1-7:75">And just for the sake of completeness and to have this example present, I also included the media session.In other words, is there any reason why media-session should not be selectable?</p></div><div>As to why wireplumber is not the default, I don't really have an opinion on that. I just had media-session preset because it has less dependencies and was working quite well.</div></div><div id="geary-quote" dir="auto"><br>Am Fr, 11. Nov 2022 um 12:01:03 +0100 schrieb Carlos Rafael Giani via lists.openembedded.org &lt;crg7475=mailbox.org@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Is there a reason for adding the wireplumber packageconfig?

</div></blockquote></div>
--=-tnicB8x1STCjti8fQxrg--


