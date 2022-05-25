Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C41C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:08:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.10220.1653502130194560276
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C05040CD3;
	Wed, 25 May 2022 18:08:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjJdIuHNwPkI; Wed, 25 May 2022 18:08:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8439740CD2;
	Wed, 25 May 2022 18:08:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ADDCC174958; Wed, 25 May 2022 14:08:46 -0400 (EDT)
Date: Wed, 25 May 2022 14:08:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [kirkstone][PATCH 3/3] devmem2: update SRC_URI according
 to redirect
Message-ID: <20220525180846.GU9834@denix.org>
References: <20220512234307.1189721-1-denis@denix.org>
 <20220512234307.1189721-3-denis@denix.org>
 <CA+chaQfKJDOyRQ=Y3GwK5X_XVrSdNoNe5VpBLMdyncooMeHOPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CA+chaQfKJDOyRQ=Y3GwK5X_XVrSdNoNe5VpBLMdyncooMeHOPA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 18:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97271

Sure, I can do that and put it in the repo, since I've made few patches on top 
of it... Before I do that, are there any objections? Bootlin?


On Wed, May 25, 2022 at 08:03:58PM +0200, Martin Jansa wrote:
> Anyone willing to create a repo for this on github instead of patching this
> in metadata?
> 
> This is another reproducer for do_patch issue described here
> https://lists.yoctoproject.org/g/yocto/message/56602
> 
> On Fri, May 13, 2022 at 1:43 AM Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >
> > http://www.free-electrons.com now redirects to https://bootlin.com
> >
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> >  meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> > b/meta-oe/recipes-support/devmem2/devmem2.bb
> > index ba7aad8ab..70d413521 100644
> > --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> > +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> > @@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =
> > "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
> >  PR = "r7"
> >
> > -SRC_URI = "
> > http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c
> > \
> > +SRC_URI = "
> > https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
> >             file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
> >
> > file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
> >
> > file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
> > --
> > 2.25.1

