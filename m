Return-Path: <asselsm@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id CDF4F79CB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 17:12:48 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id i78-v6so7146950ybg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 09:12:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=Fv5YvLmjTJzA3LcTVvQzkc8oYefeWanhEuW7VgsFUAM=;
	b=WwdoA4Z4Ceg1OPxNPihneqNk1bACvD3gC9w5XqROSwcYhpQs1Awhy8mpOXnWg4hcpI
	vXudG1CPkNY7sxfz33BVo9Yyp7mV9KiBN37kZkMGCV8iPk1nj0K1RM7PhPDeQaEtcNiZ
	DJs0GyEDoLCCLThijsXHIoSeuyOAwnEa5iYTPpUH0RuR2gt3hClXhVQAW4SHB2iDNnLz
	tLPEfewUpURG8/tzWpVvYO48CoTze/BVjoJnyohhmL/Ixq6mvN0c28ULrHVt9Uq6LJJ9
	+KNWgGBR5PIJ3ghxbjQkwFybAXXYVX0PbrCtGWRPFoQOYeMLKGcwOB2w5CTp2FZqXG9E
	LCPQ==
X-Gm-Message-State: AGRZ1gLKN335foeS2vVABxfEh1Fr0TNS629qsgpvTrU9J5p/FNCNfI4M
	efTwWzqCDfsEoHQhrQFDGtOB7fUaEMW7X0I+Hvc=
X-Google-Smtp-Source: AJdET5eSzUdd3sP4nMRnTS1dSSd/ktei8dH4GvAU20Yn3IxePZjPHIaj3XOLjQ1fzTup/jIYX0iT8nTCd61kqbpkcbw=
X-Received: by 2002:a5b:58f:: with SMTP id l15-v6mr1126146ybp.76.1541610769429;
	Wed, 07 Nov 2018 09:12:49 -0800 (PST)
MIME-Version: 1.0
References: <1541608802-6985-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1soCQASpY7U-Vd1jVsN8-6+TtgzSnyg5H+Xsf30hdF46FA@mail.gmail.com>
	<2652751.QITpfUmNdm@yow-masselst-lx1>
	<CAPuovEJUTPFRxOSWppLzHZ0szPd6up23d+dg4qy-xaDKq-S+zg@mail.gmail.com>
In-Reply-To: <CAPuovEJUTPFRxOSWppLzHZ0szPd6up23d+dg4qy-xaDKq-S+zg@mail.gmail.com>
Reply-To: mark.asselstine@windriver.com
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 7 Nov 2018 12:12:38 -0500
Message-ID: <CAPuovEL1xTn-=qZYcpkuSO7-5GT0xfP+0L5Q59hnskhLME9RAg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] meta-xfce: xfconf: fixup installed-vs-shipped QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2018 17:12:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 12:02 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Wed, Nov 7, 2018 at 12:00 PM Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
> >
> > On Wednesday, November 7, 2018 11:55:08 AM EST Khem Raj wrote:
> > > On Wed, Nov 7, 2018 at 8:40 AM Mark Asselstine
> > >
> > > <mark.asselstine@windriver.com> wrote:
> > > > Since the xfconf uprev, commit 4222cac97678 [xfconf: 4.13.5 ->
> > > >
> > > > 4.13.6], we are getting a QA issue:
> > > >   ERROR: xfconf-4.13.6-r0 do_package: QA Issue: xfconf: Files/directories
> > > >   were installed but not shipped in any package:
> > > >   /usr/lib64/gio/modules/libxfconfgsettingsbackend.la
> > > >   Please set FILES such that these items are packaged. Alternatively if
> > > >   they are unneeded, avoid installing them or delete them within
> > > >   do_install. xfconf: 1 installed and not shipped files.
> > > >   [installed-vs-shipped]
> > > >   ERROR: xfconf-4.13.6-r0 do_package: Fatal QA errors found, failing task.
> > > >   ERROR: xfconf-4.13.6-r0 do_package: Function failed: do_package
> > > >
> > > > We need to include the .la file in the -dev package to avoid this.
> > >
> > > can we just delete it.
> >
> > I am fine with that, it is of little use. In the past I have asked Mark Hatle
> > for advice on package vs. delete and I never get a clear answer one way or the
> > other. I am sure if you look at my patch history 50% of the time I have some
> > that delete these and the other 50% I keep them.
> >
> > In this case there are already other .la files in the -dev package so I just
> > went along with the keep approach.
>
> Sorry, I wasn't clear on what I will do. I will send a V2 and make use
> of remove-libtool to take care of the cleanup.
>

Actually, Khem, if we go back to our discussion back in June
http://lists.openembedded.org/pipermail/openembedded-devel/2018-June/118896.html

we ended up packaging the .la files. If the distro were to use
remove-libtool then they would be cleaned up. So based on that I stand
by my V1.

Thoughts?

MarkA

> MarkA
>
> >
> > MarkA
> >
> > >
> > > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > > ---
> > > >
> > > >  meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb index 191d0fd..2667ff9
> > > > 100644
> > > > --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > @@ -14,3 +14,5 @@ SRC_URI[sha256sum] =
> > > > "d1a3d442dae188b5a7380b5815377e5488578cdafb03ae363e9426e3b0>
> > > >  FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
> > > >
> > > >                  ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
> > > >                  ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
> > > >
> > > > +
> > > > +FILES_${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

