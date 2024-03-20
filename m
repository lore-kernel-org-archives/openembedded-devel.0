Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5FEC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 17:49:34 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.52415.1710956972861420822
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 10:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 478F029910;
	Wed, 20 Mar 2024 18:49:31 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.101]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rn04A-3HWwMK0; Wed, 20 Mar 2024 18:49:30 +0100
Date: Wed, 20 Mar 2024 18:49:43 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-Id: <VUQNAS.T3X7YS0GHJP53@t-online.de>
In-Reply-To: <CAMKF1srGvQ3d-L=PR4r3H_tMvbb9jwcgMz6kx6FD1LuVebY-TA@mail.gmail.com>
References: <17BE205582F63951.29196@lists.openembedded.org>
	<P19LAS.XNJ0HDKLN7IM@t-online.de>
	<CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
	<CAMKF1sqhYPiFY3AfwDzydNJaJuF8ye_ng2OuynGH6y+uyenKiA@mail.gmail.com>
	<VVPNAS.FCPMXAAPQ9Y82@t-online.de>
	<CAMKF1srGvQ3d-L=PR4r3H_tMvbb9jwcgMz6kx6FD1LuVebY-TA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-jKl61kcUpoDSOSKsXyxD"
X-TOI-EXPURGATEID: 150726::1710956970-D9F64DC7-456C9218/0/0 CLEAN NORMAL
X-TOI-MSGID: eab69144-f9a6-4695-bd00-58cd4b668077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 17:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109496

--=-jKl61kcUpoDSOSKsXyxD
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 20 2024 at 10:31:48 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Alright, take a look at master-next and I would like to know what
> their dependencies are which are not yet in master branch of the core
> layer.

I had another look at freerdp3 buildsystem and swscale can be 
configured separately from ffmpeg.
That makes the fix easy. I'll send a v3 for the freerdp3 patch that 
should address both issues you have



--=-jKl61kcUpoDSOSKsXyxD
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 20 2024 at 10:31:48 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Alright, take a look at master-next and I would like to know what
their dependencies are which are not yet in master branch of the core
layer.</div></blockquote><div><br></div><div>I had another look at freerdp3 buildsystem and swscale can be configured separately from ffmpeg.</div><div>That makes the fix easy. I'll send a v3 for the freerdp3 patch that should address both issues you have&nbsp;</div><div><br></div></div>
--=-jKl61kcUpoDSOSKsXyxD--


