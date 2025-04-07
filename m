Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD97C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 12:16:21 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.45886.1744028178048801050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 05:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id F3AE0353;
	Mon,  7 Apr 2025 14:16:15 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.36.92]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u1lOd-1h8SLg0; Mon, 7 Apr 2025 14:16:11 +0200
Date: Mon, 07 Apr 2025 14:16:06 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] celluloid: add recipe
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <UQKCUS.UK2V3JNSI5EY1@t-online.de>
In-Reply-To: <CAMKF1spzWZ6G8QqUQWz30p1X6XKp8hkBYLRBSqjpptq4=84ubA@mail.gmail.com>
References: <20250331062237.8115-1-f_l_k@t-online.de>
	<20250331062237.8115-2-f_l_k@t-online.de>
	<CAMKF1srs8KfdY+9tZn33x00bUKSRvbA=YNBMPqBHEskiBV3Qqw@mail.gmail.com>
	<S301US.K6JXZLZA1JX12@t-online.de>
	<CAMKF1spzWZ6G8QqUQWz30p1X6XKp8hkBYLRBSqjpptq4=84ubA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HsUk6BAyX0k/Eu6zZ3Zf"
X-TOI-EXPURGATEID: 150726::1744028171-DFFFB9C2-63BD7594/0/0 CLEAN NORMAL
X-TOI-MSGID: 624e1672-0d00-47f1-a83e-2c65e10a4206
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116667

--=-HsUk6BAyX0k/Eu6zZ3Zf
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Apr 1 2025 at 07:17:58 -07:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> This will not work with bitbake world

I see. Unfortunately, I am not able to reproduce the issue, but 
referring to the dev manual, it might help to add LICENSE_FLAGS to the 
celluloid recipe?
<https://docs.yoctoproject.org/dev-manual/licenses.html#enabling-commercially-licensed-recipes>

LICENSE_FLAGS = "commercial"


--=-HsUk6BAyX0k/Eu6zZ3Zf
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Apr 1 2025 at 07:17:58 -07:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This will not work with bitbake world</div></blockquote><div><br></div><div>I see. Unfortunately, I am not able to reproduce the issue, but referring to the dev manual, it might help to add LICENSE_FLAGS to the celluloid recipe?</div><div><a href="https://docs.yoctoproject.org/dev-manual/licenses.html#enabling-commercially-licensed-recipes">https://docs.yoctoproject.org/dev-manual/licenses.html#enabling-commercially-licensed-recipes</a></div><div><br></div><div>LICENSE_FLAGS = "commercial"</div></div>
--=-HsUk6BAyX0k/Eu6zZ3Zf--


