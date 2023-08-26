Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878FAC83F0C
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 00:10:22 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.111.1693008619319371394
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 17:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id 97E1A59596;
	Sat, 26 Aug 2023 02:10:17 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.172.109]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZgsX-0dyPnk0; Sat, 26 Aug 2023 02:10:13 +0200
Date: Sat, 26 Aug 2023 02:10:07 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/2] xdg-desktop-portal: upgrade 1.16.0 ->
 1.17.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <VS1ZZR.41PFFCNFDNQO1@t-online.de>
In-Reply-To: <177EBD9F7303250B.26341@lists.openembedded.org>
References: <20230825205355.220438-1-f_l_k@t-online.de>
	<177EBBA9EC613640.26341@lists.openembedded.org>
	<177EBD9F7303250B.26341@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-fwwLiEX9eh/uNJKlya71"
X-TOI-EXPURGATEID: 150726::1693008613-7C9A9E98-8DA74B4B/0/0 CLEAN NORMAL
X-TOI-MSGID: bc972810-e7cc-4363-825f-d1c4ba8fa8b6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 00:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104618

--=-fwwLiEX9eh/uNJKlya71
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Aug 25 2023 at 11:29:51 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> mmmh. I can build without issues on my selfmade host because I have 
> the flatpak dbus service files installed on it, I guess.
> Probably it will still break on ubuntu (where I created that hack 
> back then).
> Best solution would be to provide flatpak-native to avoid the need to 
> have flatpak installed on the host system but that might
> to get bloaty. I'll have a look

I did some rework on this. Now it is possible to build flatpak-native 
and we can take the needed files from STAGING_DATADIR_NATIVE.
In my opinion this is preferred because we can avoid to pollute the 
flatpak.pc and xdg-desktop-portal.pc files
But I'm not quite sure about that, so I marked the new patches for the 
xdg-desktop-portal update RFC


--=-fwwLiEX9eh/uNJKlya71
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Aug 25 2023 at 11:29:51 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div>mmmh. I can build without issues on my selfmade host because I have the flatpak dbus service files installed on it, I guess.</div><div>Probably it will still break on ubuntu (where I created that hack back then).</div><div>Best solution would be to provide flatpak-native to avoid the need to have flatpak installed on the host system but that might</div><div>to get bloaty. I'll have a look</div></blockquote><div><br></div><div>I did some rework on this. Now it is possible to build flatpak-native and we can take the needed files from STAGING_DATADIR_NATIVE.</div><div>In my opinion this is preferred because we can avoid to pollute the flatpak.pc and xdg-desktop-portal.pc files</div><div>But I'm not quite sure about that, so I marked the new patches for the xdg-desktop-portal update RFC</div></div>
--=-fwwLiEX9eh/uNJKlya71--


