Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B16C4332F
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 16:45:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9757.1643129107987372272
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1nCOwK-0000pC-L7; Tue, 25 Jan 2022 17:45:04 +0100
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1nCOwJ-000317-3K; Tue, 25 Jan 2022 17:45:03 +0100
Message-ID: <1e2357fc2900c4eaef91943265baa293e0bfe76c.camel@pengutronix.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] geary: initial add recipe
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Markus Volk <f_l_k@t-online.de>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jan 2022 17:45:02 +0100
In-Reply-To: <622bf2f8-fd27-63ed-da25-89c6536a4f25@t-online.de>
References: <20220120202643.3827177-1-f_l_k@t-online.de>
	 <fc07f2df1f07b73a902be4377c65b70952db4500.camel@pengutronix.de>
	 <622bf2f8-fd27-63ed-da25-89c6536a4f25@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (flatpak git) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 16:45:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95072

Hi Markus,

On Tue, 2022-01-25 at 14:28 +0100, Markus Volk wrote:
> Hi Jan,
> 
> it is also allowed to use tags here.
> 
> SRCREV= "gnome-40.0" fetches the same code as
> 
> SRCREV = "e561775c1580a9f60a726355b2b897bfc9cb3382"

That's only true as long as nobody modifies that tag in the upstream repository
and isn't cryptographically secure. As far as I can see, no existing recipe in
meta-oe or oe-core uses a tag as SRCREV.

Additionally, https://docs.yoctoproject.org/singleindex.html#term-SRCREV warns:
"Note that if you want to build a fixed revision and you want to avoid
performing a query on the remote repository every time BitBake parses your
recipe, you should specify a SRCREV that is a full revision identifier and not
just a tag."

Regards,
Jan

