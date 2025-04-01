Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53825C36016
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 06:16:00 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.12812.1743488156253457817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 23:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 6964FA08;
	Tue,  1 Apr 2025 08:15:54 +0200 (CEST)
Received: from [192.168.178.20] ([79.219.237.183]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tzUud-3ySDgW0; Tue, 1 Apr 2025 08:15:51 +0200
Date: Tue, 01 Apr 2025 08:16:40 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] celluloid: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <S301US.K6JXZLZA1JX12@t-online.de>
In-Reply-To: <CAMKF1srs8KfdY+9tZn33x00bUKSRvbA=YNBMPqBHEskiBV3Qqw@mail.gmail.com>
References: <20250331062237.8115-1-f_l_k@t-online.de>
	<20250331062237.8115-2-f_l_k@t-online.de>
	<CAMKF1srs8KfdY+9tZn33x00bUKSRvbA=YNBMPqBHEskiBV3Qqw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-FNzn0F9cPrnfvJQf+7gC"
X-TOI-EXPURGATEID: 150726::1743488151-337FD910-B8F3904A/0/0 CLEAN NORMAL
X-TOI-MSGID: aa3f5913-73be-4648-9997-1d996c076bfb
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 06:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116462

--=-FNzn0F9cPrnfvJQf+7gC
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Mar 31 2025 at 14:39:53 -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> I think due to mpv dependency  here amd mpv needing ffmpeg this needs
> something like below
> 
> EXCLUDE_FROM_WORLD = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("LICENSE_FLAGS_ACCEPTED",
> "commercial", "0", "1", d)}"

Did you add celluloid to packagegroup-gnome-apps.bb to include it to 
world build?

If so, it might eventually help to add it as follows:
RDEPENDS:${PN} = " \
    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", 
"celluloid", "", d)} \

instead of using EXCLUDE_FROM_WORLD within the celluloid recipe


--=-FNzn0F9cPrnfvJQf+7gC
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Mar 31 2025 at 14:39:53 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I think due to mpv dependency  here amd mpv needing ffmpeg this needs
something like below

EXCLUDE_FROM_WORLD = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("LICENSE_FLAGS_ACCEPTED",
"commercial", "0", "1", d)}"</div></blockquote><div><br></div><div>Did you add celluloid to packagegroup-gnome-apps.bb to include it to world build?</div><div><br></div><div>If so, it might eventually help to add it as follows:</div><div>RDEPENDS:${PN} = " \</div><div>&nbsp; &nbsp; ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "celluloid", "", d)} \</div><div><br></div><div>instead of using EXCLUDE_FROM_WORLD within the celluloid recipe</div></div>
--=-FNzn0F9cPrnfvJQf+7gC--


