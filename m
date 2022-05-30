Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F301C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 16:31:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.38820.1653928281482508616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 09:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0FBB140C3E;
	Mon, 30 May 2022 16:31:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pnJU29TgXUK; Mon, 30 May 2022 16:31:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E50AA40C2A;
	Mon, 30 May 2022 16:31:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B022C174959; Mon, 30 May 2022 12:31:16 -0400 (EDT)
Date: Mon, 30 May 2022 12:31:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Philip Balister <philip@balister.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [kirkstone][PATCH 3/3] devmem2: update SRC_URI according
 to redirect
Message-ID: <20220530163116.GA9834@denix.org>
References: <20220512234307.1189721-1-denis@denix.org>
 <20220512234307.1189721-3-denis@denix.org>
 <CA+chaQfKJDOyRQ=Y3GwK5X_XVrSdNoNe5VpBLMdyncooMeHOPA@mail.gmail.com>
 <20220525180846.GU9834@denix.org>
 <CAMKF1soMGKgTn5b2uusc=uR_T0==_L-bPrHrysdq=cGFvRDU-Q@mail.gmail.com>
 <CA+chaQeazL-3oxh43jcBiqq_B9_7Ha-n=oOEsXAPCc233Lb1PA@mail.gmail.com>
 <31fc320b-03a4-9fc8-99a8-a6c8f17baeff@balister.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31fc320b-03a4-9fc8-99a8-a6c8f17baeff@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 16:31:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97340

https://lists.openembedded.org/g/openembedded-devel/message/97339


On Mon, May 30, 2022 at 10:07:07AM -0400, Philip Balister wrote:
> On 5/25/22 14:41, Martin Jansa wrote:
> >buildroot removed it in 2019 and recommends to use busybox version instead:
> >https://github.com/buildroot/buildroot/commit/2b2579afebfc7a9b8a458af1f2d206101fbfa19c
> >
> >"Use the the Busybox devmem utility, instead, which provides the
> >same functionality."
> 
> I want to say there is an issue with the busybox devmem. As I recall
> (and this is an ancient memory), if you use busybox devmem to write,
> it does a readback. This is a bad thing if the address you write to
> is a hardware device that uses the read to reset state.
> 
> Philip
> 
> >
> >On Wed, May 25, 2022 at 8:32 PM Khem Raj <raj.khem@gmail.com
> ><mailto:raj.khem@gmail.com>> wrote:
> >
> >    On Wed, May 25, 2022 at 11:08 AM Denys Dmytriyenko <denis@denix.org
> >    <mailto:denis@denix.org>> wrote:
> >     >
> >     > Sure, I can do that and put it in the repo, since I've made few
> >    patches on top
> >     > of it... Before I do that, are there any objections? Bootlin?
> >
> >    I would suggest to cross post with buildroot and see if there is
> >    interest in using it from
> >    a separate repository.
> >
> >     >
> >     >
> >     > On Wed, May 25, 2022 at 08:03:58PM +0200, Martin Jansa wrote:
> >     > > Anyone willing to create a repo for this on github instead of
> >    patching this
> >     > > in metadata?
> >     > >
> >     > > This is another reproducer for do_patch issue described here
> >     > > https://lists.yoctoproject.org/g/yocto/message/56602

