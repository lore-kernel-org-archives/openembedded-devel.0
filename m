Return-Path: <lchristina26@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6E71865DB3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 16:03:30 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id h18so7161548igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=tZ0eZV8BQabZU1yc8BqxHf9eO6H7zEXAQWSYiIF99qs=;
	b=vDbL7lQV0pJQ73jVKAgKoPcFyCGUqjxYcoZuK1NWxa8qQJfYq8NQOlUZ8ERFm41b0T
	TjzzApUCxGxaKyE0jTdG+tw6oRHDU8pVha9DCKSyxZDWLPT5ClkX1UCDw/EJse2DyLyS
	50b39liCusjle5iYam4fHNyzwVCXoAfdylisL10yo1L312AFFi6Q2WiFEQ4SpKwOHa1u
	/4eSAUlGfw/OUgAt6D9Lp7H8PLeB18+7jBkebH5GI8GyRma1VBXH8lmoUPAerDq1JjJ+
	UDDnbVxyNf5poT9HDKB9lZhTl23Uxp21gOBTHPtGlCjQB8KjJtMk8jRuB/BYNqZLP1J2
	Gghg==
MIME-Version: 1.0
X-Received: by 10.42.247.137 with SMTP id mc9mr41824398icb.13.1407859411952;
	Tue, 12 Aug 2014 09:03:31 -0700 (PDT)
Sender: lchristina26@gmail.com
Received: by 10.64.11.102 with HTTP; Tue, 12 Aug 2014 09:03:31 -0700 (PDT)
In-Reply-To: <20140812111432.GC14848@jama>
References: <BLU436-SMTP782D203C1A9AF2454095C9D6ED0@phx.gbl>
	<20140812111432.GC14848@jama>
Date: Tue, 12 Aug 2014 10:03:31 -0600
X-Google-Sender-Auth: Y8oehPMbIzZpdLh-JaUw1Eb0SJw
Message-ID: <CAL0pqZ0MCfiH4wHuCDsVTab9vVJa2fQ0DFb2PB06s40YW7aevQ@mail.gmail.com>
From: Leah <leah@wolfssl.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] 'Update cyassl bb file'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Aug 2014 16:03:31 -0000
Content-Type: text/plain; charset=UTF-8

I submitted a recipe to be considered for adding to meta-oe and was told to
make changes. I made the changes and resubmitted and was told "you cannot
break upgrade path (make version going backwards) just to remove 2
comments." I am not sure how else to go about getting my recipe added. Any
assistance would be greatly appreciated.

~Leah


On Tue, Aug 12, 2014 at 5:14 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Mon, Aug 11, 2014 at 11:32:36AM -0600, lchristina26 wrote:
> > Signed-off-by: lchristina26 <lchristina26@hotmail.com>
> > ---
> >  meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > index accc144..441d321 100644
> > --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > @@ -9,8 +9,6 @@ SECTION = "libs/network"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> > -PR = "r1"
> > -
>
> NAK ^ you cannot break upgrade path (make version going backwards) just to
> remove 2 comments.
>
> >  SRC_URI = "http://www.yassl.com/cyassl-${PV}.zip"
> >
> >
> > @@ -21,6 +19,3 @@ S = "${WORKDIR}/${PN}-${PV}"
> >
> >  inherit autotools
> >
> > -# Detect and build with correct endianness
> > -# CFLAGS += "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '',
> '-DBIG_ENDIAN_ORDER', d)}"
> > -
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 

Leah Thompson
www.wolfssl.com
leah@wolfssl.com
406-570-1389
Skype: lchristina26

