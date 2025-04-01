Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D807C36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 06:48:30 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.13162.1743490103799583271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 23:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 35D57BA8;
	Tue,  1 Apr 2025 08:48:21 +0200 (CEST)
Received: from [192.168.178.20] ([79.219.237.183]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tzVQ2-0wJBz60; Tue, 1 Apr 2025 08:48:18 +0200
Date: Tue, 01 Apr 2025 08:49:06 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] celluloid: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <UL11US.ZXT356OHWYEV1@t-online.de>
In-Reply-To: <18321D3DB7F3B367.19875@lists.openembedded.org>
References: <20250331062237.8115-1-f_l_k@t-online.de>
	<20250331062237.8115-2-f_l_k@t-online.de>
	<CAMKF1srs8KfdY+9tZn33x00bUKSRvbA=YNBMPqBHEskiBV3Qqw@mail.gmail.com>
	<18321D3DB7F3B367.19875@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oBOhn30uOPilMUYtIZiA"
X-TOI-EXPURGATEID: 150726::1743490098-E2FFA9CE-FB16F720/0/0 CLEAN NORMAL
X-TOI-MSGID: cef99b9d-e3cc-4f83-bbe4-30d9c025ff2a
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 06:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116463

--=-oBOhn30uOPilMUYtIZiA
Content-Type: text/plain; charset=us-ascii; format=flowed

I think I have found the issue

Luajit fails for arm with:
/usr/include/bits/long-double.h:23:10: fatal error: 
bits/long-double-32.h: No such file or directory

On Tue, Apr 1 2025 at 08:16:40 +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> On Mon, Mar 31 2025 at 14:39:53 -07:00:00, Khem Raj 
> <raj.khem@gmail.com> wrote:
>> I think due to mpv dependency  here amd mpv needing ffmpeg this needs
>> something like below
>> 
>> EXCLUDE_FROM_WORLD = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>("LICENSE_FLAGS_ACCEPTED",
>> "commercial", "0", "1", d)}"
> 
> Did you add celluloid to packagegroup-gnome-apps.bb to include it to 
> world build?
> 
> If so, it might eventually help to add it as follows:
> RDEPENDS:${PN} = " \
>     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", 
> "celluloid", "", d)} \
> 
> instead of using EXCLUDE_FROM_WORLD within the celluloid recipe


--=-oBOhn30uOPilMUYtIZiA
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I think I have found the issue</div><div><br></div><div>Luajit fails for arm with:</div><div>/usr/include/bits/long-double.h:23:10: fatal error: bits/long-double-32.h: No such file or directory</div></div><div id="geary-quote" dir="auto"><br>On Tue, Apr 1 2025 at 08:16:40 +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div id="geary-body" dir="auto">On Mon, Mar 31 2025 at 14:39:53 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I think due to mpv dependency  here amd mpv needing ffmpeg this needs
something like below

EXCLUDE_FROM_WORLD = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("LICENSE_FLAGS_ACCEPTED",
"commercial", "0", "1", d)}"</div></blockquote><div><br></div><div>Did you add celluloid to packagegroup-gnome-apps.bb to include it to world build?</div><div><br></div><div>If so, it might eventually help to add it as follows:</div><div>RDEPENDS:${PN} = " \</div><div>&nbsp; &nbsp; ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "celluloid", "", d)} \</div><div><br></div><div>instead of using EXCLUDE_FROM_WORLD within the celluloid recipe</div></div>
</blockquote></div>
--=-oBOhn30uOPilMUYtIZiA--


