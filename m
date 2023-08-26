Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5676C83F0E
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 00:42:52 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.604.1693010570420758830
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 17:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id AABCF2040A;
	Sat, 26 Aug 2023 02:42:47 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.172.109]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZhO0-1RCAZk0; Sat, 26 Aug 2023 02:42:44 +0200
Date: Sat, 26 Aug 2023 02:42:39 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/2] xdg-desktop-portal: upgrade 1.16.0 ->
 1.17.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <3B3ZZR.62AHG5TQBXZP2@t-online.de>
In-Reply-To: <177EC65EAFC48B5F.4004@lists.openembedded.org>
References: <20230825205355.220438-1-f_l_k@t-online.de>
	<177EBBA9EC613640.26341@lists.openembedded.org>
	<177EBD9F7303250B.26341@lists.openembedded.org>
	<177EC65EAFC48B5F.4004@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6BrwJCbKZGyIROlXOZBH"
X-TOI-EXPURGATEID: 150726::1693010564-9A8249C6-E6ECA21A/0/0 CLEAN NORMAL
X-TOI-MSGID: 77b9c632-8d35-44b1-a0df-aefe2b421496
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 00:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104619

--=-6BrwJCbKZGyIROlXOZBH
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Aug 26 2023 at 02:10:07 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> I did some rework on this. Now it is possible to build flatpak-native 
> and we can take the needed files from STAGING_DATADIR_NATIVE.
> In my opinion this is preferred because we can avoid to pollute the 
> flatpak.pc and xdg-desktop-portal.pc files
> But I'm not quite sure about that, so I marked the new patches for 
> the xdg-desktop-portal update RFC

I will send a second patchset to solve the problem. It's probably the 
cleanest variant, but the 'monk' in my head is rebelling a bit because 
we're using files from the target that should be provided by the native 
variant. I will mark it as RFC2.


--=-6BrwJCbKZGyIROlXOZBH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Aug 26 2023 at 02:10:07 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div>I did some rework on this. Now it is possible to build flatpak-native and we can take the needed files from STAGING_DATADIR_NATIVE.</div><div>In my opinion this is preferred because we can avoid to pollute the flatpak.pc and xdg-desktop-portal.pc files</div><div>But I'm not quite sure about that, so I marked the new patches for the xdg-desktop-portal update RFC</div></blockquote><div><br></div><div>I will send a second patchset to solve the problem. It's probably the cleanest variant, but the 'monk' in my head is rebelling a bit because we're using files from the target that should be provided by the native variant. I will mark it as RFC2.</div></div>
--=-6BrwJCbKZGyIROlXOZBH--


