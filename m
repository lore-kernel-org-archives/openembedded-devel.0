Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OE6Vq-00054z-8E
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 22:02:12 +0200
Received: by vws20 with SMTP id 20so1362074vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 12:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Gne0NlG38cUL4wxhoBkxBzv4Cb+SCRPLL57CpCR1aSY=;
	b=VtfJCDrkYOjMMArd0unUO78PZFyOtXazjq80VqiWat2McRmpoziYzipzpLHO7XCsD7
	eBRNaeI+Wohz7ysh4dc+tv8pORamEzgo135Th7x5inZMChgy3eOyYyV1QdpSIzgLrjPI
	yxv1rAABtrETmzDK0IVsCaXz+IinLpQPNEHMg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=iiqLumkqUo4hDfghiDSRx5ltYHYjHzqtU2z2TWqeUxVV6Q9EVHbS2fzoEVqTspw5x/
	xhXpqeSkk1VL3uIT2PLtJjPSwutfCnRoPuJcd5XktdPh4O505pgz5YxOmqzi52W+kBcQ
	/MhKbRlC+3eTp/VqX3PNlywbV/VWsMgg4r/tU=
MIME-Version: 1.0
Received: by 10.229.187.82 with SMTP id cv18mr1238032qcb.83.1274126279525; 
	Mon, 17 May 2010 12:57:59 -0700 (PDT)
Received: by 10.229.230.77 with HTTP; Mon, 17 May 2010 12:57:59 -0700 (PDT)
In-Reply-To: <20100517194116.GD7932@gmail.com>
References: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
	<20100517190152.GB7868@gmail.com>
	<AANLkTinsmKk2J576bTB0-Wkk48G5He9koqeQiU4MHhL_@mail.gmail.com>
	<20100517191837.GB7932@gmail.com>
	<AANLkTikLN9HgYy5Q6ICrDYuOBB47JdPy8vZiaf-Hv5uu@mail.gmail.com>
	<20100517194116.GD7932@gmail.com>
Date: Mon, 17 May 2010 14:57:59 -0500
Message-ID: <AANLkTimIyO_fMaHX_tsssDwFNTLBBl3aFSaMmeBQHk_C@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Microblaze gcc 4.5.0 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 May 2010 20:02:27 -0000
X-List-Received-Date: Mon, 17 May 2010 20:02:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

libgcc config.log http://pastebin.com/3mLhBMNP

<http://pastebin.com/3mLhBMNP>I see the error
conftest.c:1:0: error: 'microblaze' is an invalid argument to -mcpu=

I guess that this is causing the compile failure...

On Mon, May 17, 2010 at 2:41 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On (17/05/10 14:29), Adrian Alonso wrote:
> > config.log http://pastebin.com/HjkNWXJP
>
> ok one more time post config.log from libgcc build directory
>
> >
> > On Mon, May 17, 2010 at 2:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > > On (17/05/10 14:14), Adrian Alonso wrote:
> > > > Hi Khem,
> > > >
> > > > log.do_configure at http://pastebin.com/AjAtfnpu
> > > > log.do_compile at http://pastebin.com/bqAmHvuu
> > >
> > > post config.log from inside the gcc build tree.
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >
> >
> >
> >
> > --
> > Saludos
> > Adrian Alonso
> > http://aalonso.wordpress.com
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

