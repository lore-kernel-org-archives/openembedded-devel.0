Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E50C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 16:31:43 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.1223.1713976293720750678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 09:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 80E99240D6;
	Wed, 24 Apr 2024 18:31:31 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.39.163]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzfWp-3yxIDA0; Wed, 24 Apr 2024 18:31:28 +0200
Date: Wed, 24 Apr 2024 18:31:51 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
To: Markus Volk <f_l_k@t-online.de>
Cc: Ross Burton <Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <3LGGCS.ZNNW2XQJHNC8@t-online.de>
In-Reply-To: <17C942CD035C6224.31749@lists.openembedded.org>
References: <20240424132329.2706-1-f_l_k@t-online.de>
	<CAMKF1so6r93QEzxrMV_j5EieO_vvbLkC0PgfBSmrh2K2SqqoQA@mail.gmail.com>
	<GZCGCS.7L0JATLUHBTN3@t-online.de>
	<CD0238CE-938F-4B4D-B0A0-E795F6B0A587@arm.com>
	<17C942CD035C6224.31749@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5q8d5s/ACn9iZ5ojr3Cl"
X-TOI-EXPURGATEID: 150726::1713976288-41BC1C65-475D4B13/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e73ac30-7d3b-4db8-8d79-7ae1f9ac5532
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 16:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110135

--=-5q8d5s/ACn9iZ5ojr3Cl
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Apr 24 2024 at 06:03:18 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> I guess build will break

No it doesn't, using @basename@ fixes the issue.

Now it looks like:
/* enumerations from "gupnp-error.h" */
#include "gupnp-error.h"

I'll send this to upstream first. Lets see if this would work for all


--=-5q8d5s/ACn9iZ5ojr3Cl
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Apr 24 2024 at 06:03:18 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite">I guess build will break</blockquote><div><br></div><div>No it doesn't, using @basename@ fixes the issue.</div><div><br></div><div>Now it looks like:</div><div>/* enumerations from "gupnp-error.h" */</div><div>#include "gupnp-error.h"</div><div><br></div><div>I'll send this to upstream first. Lets see if this would work for all</div></div>
--=-5q8d5s/ACn9iZ5ojr3Cl--


