Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD67C10F1A
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 17:29:15 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.2613.1714584548523026266
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 10:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id 8A8711ACEB;
	Wed,  1 May 2024 19:29:06 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.42.233]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s2DlQ-1E6QCW0; Wed, 1 May 2024 19:29:05 +0200
Date: Wed, 01 May 2024 19:29:05 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] nautilus: update 45.1 -> 46.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <HWHTCS.LLXBF0M5JJGS1@t-online.de>
In-Reply-To: <CAMKF1spRQiNy9MQ1CLXJpifBHW_7Ctk1Z9-zO_W9tevm0qNZcQ@mail.gmail.com>
References: <17CB013F8E1A4961.26557@lists.openembedded.org>
	<A4ETCS.BYOOAI4M6HFR1@t-online.de>
	<CAMKF1spRQiNy9MQ1CLXJpifBHW_7Ctk1Z9-zO_W9tevm0qNZcQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-rYSQ7hvy4VXmrnJsBJBr"
X-TOI-EXPURGATEID: 150726::1714584545-02FFA89A-61787F95/0/0 CLEAN NORMAL
X-TOI-MSGID: 770d8c66-0430-4ade-b81c-d602bb582efb
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 17:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110209

--=-rYSQ7hvy4VXmrnJsBJBr
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, May 1 2024 at 10:08:05 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> yes, there are a bunch of other 46.1 gnome recipe updates as well, are
> they interdependent in some ways that we will need to revert them too.

As far as I can see its only nautilus that will require glib-2.80. The 
other ones should be fine.

But I'm not sure about the changes that are needed in networkmanager 
for glib-2.80. I haven't gotten around to checking if they would work 
with glib-2.78.

Another problem I have is with hyprland and the chore update.
Hyprland is still broken with sdbus-c++ 2.0, but I guess a fix for this 
can be backported , once the issue was adressed



--=-rYSQ7hvy4VXmrnJsBJBr
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, May 1 2024 at 10:08:05 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">yes, there are a bunch of other 46.1 gnome recipe updates as well, are
they interdependent in some ways that we will need to revert them too.</div></blockquote><div><br></div><div>As far as I can see its only nautilus that will require glib-2.80. The other ones should be fine.</div><div><br></div><div><div>But I'm not sure about the changes that are needed in networkmanager for glib-2.80. I haven't gotten around to checking if they would work with glib-2.78.</div><div><br></div><div>Another problem I have is with hyprland and the chore update.</div><div>Hyprland is still broken with sdbus-c++ 2.0, but I guess a fix for this can be backported , once the issue was adressed</div></div><div><br></div></div>
--=-rYSQ7hvy4VXmrnJsBJBr--


