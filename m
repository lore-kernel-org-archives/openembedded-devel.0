Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3305C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:32:47 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.10531.1653503562492741534
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k4FFcjBS;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id h18so4239427qvj.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xUARNA9CUnTQsrsoiFzsXXrfF4TtNRSHKuo3BCMTHHc=;
        b=k4FFcjBSbQFsjdWOAp/b7Pxbbtbq8HZxAT364Azw9bTQFfzQcig8PkbAcHejP8AnL+
         1j2rwWkZbnZb+Z880oqvJ8WgPcrCqkZ+lLT0ARP1q0Y0pQHfl814vIdaI49BAOBaeW5L
         YiNIL6QjH0oDwnSUelLsq4mKarJE8zePMbrBx9WP6PkmnBN1+Dcn8EOdaVVt7QhxhMqn
         0M/OSRcpppOc/p6DUslSS/GM3NfPw+cT9pzHdMJBYTzWMe6U1JnGmebZ/J/di0kTldPl
         fZxeR2M6jfS7heV+4HEJPa7etLvff8ehdB9mRnjI9/3iN4Kl1wtzrqp0WltgzoAQHUy3
         eqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xUARNA9CUnTQsrsoiFzsXXrfF4TtNRSHKuo3BCMTHHc=;
        b=ZnuUsR2CJSmcXGCkgbkoxrYaI10bfSOM3VEKEAN4YSQene3OZOfCHpXAGExBSFYzJj
         RN73yfigfbnX1kZWvmfaaGIZW2cmw3Mj5Teju2h5C4o0SR4p0Sa6uGGEKZCmWqq9XCir
         zCL4co2eM8x5qcpO4AysTNmmmHBbQXhRWFVn8NfJKNuZF6/G9t8KVOZrvwPD6wDFJNZn
         ptSrFUwXRQ4xOaZBGDT3iBfdjQxGXBth279O+hlxc6p3XEtpGIdb3cnOR0TIE0B1vkMC
         k5krCelShLEXu7v6iCkXrvs1o0haOSTJ6DGi5WbQFe8pA9eRZ+y+WiJnOJ0/qrlZkzwK
         m1DQ==
X-Gm-Message-State: AOAM530xuancuX3umqrqJHU9pPP3UyDOqT8nj6DWunqFYfgpRRQ5ZWLx
	Eg50TCgS6C9BrEWT3oYYACYV1grVlzbQTGXwc5xI/U7dKHE=
X-Google-Smtp-Source: 
 ABdhPJy6PyX4t7L15WHUE/xj8O5JjxdzCVe1MZc92LzL5EL4DPsDq6t2VqBtNYcT+bGouxt2x31BZy7uo2v4lrkMy+E=
X-Received: by 2002:ad4:5de6:0:b0:462:180d:7038 with SMTP id
 jn6-20020ad45de6000000b00462180d7038mr20769325qvb.16.1653503561532; Wed, 25
 May 2022 11:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220512234307.1189721-1-denis@denix.org>
 <20220512234307.1189721-3-denis@denix.org>
 <CA+chaQfKJDOyRQ=Y3GwK5X_XVrSdNoNe5VpBLMdyncooMeHOPA@mail.gmail.com>
 <20220525180846.GU9834@denix.org>
In-Reply-To: <20220525180846.GU9834@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2022 11:32:15 -0700
Message-ID: 
 <CAMKF1soMGKgTn5b2uusc=uR_T0==_L-bPrHrysdq=cGFvRDU-Q@mail.gmail.com>
Subject: Re: [oe] [kirkstone][PATCH 3/3] devmem2: update SRC_URI according to
 redirect
To: Denys Dmytriyenko <denis@denix.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 18:32:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97273

On Wed, May 25, 2022 at 11:08 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Sure, I can do that and put it in the repo, since I've made few patches on top
> of it... Before I do that, are there any objections? Bootlin?

I would suggest to cross post with buildroot and see if there is
interest in using it from
a separate repository.

>
>
> On Wed, May 25, 2022 at 08:03:58PM +0200, Martin Jansa wrote:
> > Anyone willing to create a repo for this on github instead of patching this
> > in metadata?
> >
> > This is another reproducer for do_patch issue described here
> > https://lists.yoctoproject.org/g/yocto/message/56602
> >
> > On Fri, May 13, 2022 at 1:43 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > >
> > > http://www.free-electrons.com now redirects to https://bootlin.com
> > >
> > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > ---
> > >  meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> > > b/meta-oe/recipes-support/devmem2/devmem2.bb
> > > index ba7aad8ab..70d413521 100644
> > > --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> > > +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> > > @@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-or-later"
> > >  LIC_FILES_CHKSUM =
> > > "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
> > >  PR = "r7"
> > >
> > > -SRC_URI = "
> > > http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c
> > > \
> > > +SRC_URI = "
> > > https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
> > >             file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
> > >
> > > file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
> > >
> > > file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
> > > --
> > > 2.25.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97271): https://lists.openembedded.org/g/openembedded-devel/message/97271
> Mute This Topic: https://lists.openembedded.org/mt/91070560/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

