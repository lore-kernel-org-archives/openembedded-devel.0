Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B10CA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 23:24:30 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.8761.1756337061929148152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Aug 2025 16:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id E89181CB2F;
	Thu, 28 Aug 2025 01:24:19 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.165.112]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1urPV4-3K4VNo0; Thu, 28 Aug 2025 01:24:19 +0200
Date: Thu, 28 Aug 2025 01:24:13 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] packagegroup-gnome-desktop is not a desktop
To: mike.looijmans@topic.nl
Cc: openembedded-devel@lists.openembedded.org,
	"Mike Looijmans via lists.openembedded.org"
	<mike.looijmans=topic.nl@lists.openembedded.org>
Message-Id: <DCEO1T.WIMW7AB6YK7K3@t-online.de>
In-Reply-To: <AM8PR04MB777917B82BD9D98FD50CF2E1ED38A@AM8PR04MB7779.eurprd04.prod.outlook.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.13b3af35-2da3-4280-b2c7-1a64bf69f8ab@emailsignatures365.codetwo.com>
	<AM8PR04MB777917B82BD9D98FD50CF2E1ED38A@AM8PR04MB7779.eurprd04.prod.outlook.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-G22QGe1h0exYl8ITo7Lu"
X-TOI-EXPURGATEID: 150726::1756337059-0268990B-33018E5A/0/0 CLEAN NORMAL
X-TOI-MSGID: 679c4a43-eebe-440c-b393-3270a002c6cf
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 23:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119124

--=-G22QGe1h0exYl8ITo7Lu
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi,
packagegroup-gnome-desktop should install enough to eventually run 
'gnome-shell' from a login-shell (if using systemd and wayland)
I've seen that gdm is not installed in packagegroup-gnome-desktop, so 
that might be the part of the puzzle that you're missing.

On Wed, Aug 27 2025 at 05:54:54 +00:00:00, Mike Looijmans via 
lists.openembedded.org <mike.looijmans=topic.nl@lists.openembedded.org> 
wrote:
> As an alternative to XFCE, I wanted to try and create a Gnome desktop 
> environment. I ignorantly assumed that "packagegroup-gnome-desktop" 
> (what's in a name) would create some basic desktop, much like 
> packagegroup-xfce-extended does.
> 
> However, adding that to my image results in all screens remaining 
> black, even though it creates a 700MB image, it doesn't appear to 
> have a display manager.
> 
> What am I missing?
> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>
> W: www.topic.nl <http://www.topic.nl/>
> 
> Please consider the environment before printing this e-mail
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119123): 
> <https://lists.openembedded.org/g/openembedded-devel/message/119123>
> Mute This Topic: <https://lists.openembedded.org/mt/114913437/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-G22QGe1h0exYl8ITo7Lu
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Hi,</div><div><span style="white-space: break-spaces;">packagegroup-gnome-desktop should</span>&nbsp;install enough to eventually run 'gnome-shell' from a login-shell (if using systemd and wayland)</div><div>I've seen that gdm is not installed in&nbsp;<span style="white-space: break-spaces;">packagegroup-gnome-desktop, so that might be the part of the puzzle that you're missing.</span></div></div><div id="geary-quote" dir="auto"><br>On Wed, Aug 27 2025 at 05:54:54 +00:00:00, Mike Looijmans via lists.openembedded.org &lt;mike.looijmans=topic.nl@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">As an alternative to XFCE, I wanted to try and create a Gnome desktop environment. I ignorantly assumed that "packagegroup-gnome-desktop" (what's in a name) would create some basic desktop, much like packagegroup-xfce-extended does.

However, adding that to my image results in all screens remaining black, even though it creates a 700MB image, it doesn't appear to have a display manager.

What am I missing?
Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: <a href="mailto:mike.looijmans@topic.nl">mike.looijmans@topic.nl</a>
W: <a href="http://www.topic.nl">www.topic.nl</a>

Please consider the environment before printing this e-mail
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#119123): <a href="https://lists.openembedded.org/g/openembedded-devel/message/119123">https://lists.openembedded.org/g/openembedded-devel/message/119123</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/114913437/3618223">https://lists.openembedded.org/mt/114913437/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-G22QGe1h0exYl8ITo7Lu--


