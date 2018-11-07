Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E6EF471CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 17:28:35 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id p17so6693266qtl.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 09:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bmm6kQ8Jnc3maoZJKWtCHTcSBBZLk6dj6ackWD7Z8wE=;
	b=syAidsW8A6rCO+W3tr5hYIC6PiDT86jJLUPqDUA5Lq9WyBNyIe2f/tYtC0W/OLLFqA
	5CuWVV8OoUphw8QeYgN3hFKtVJtQZ7X2LP+oCpd8JbAOeXmOHe5MuDdX0hlZ+Itniv+Y
	MuDrBM+W/FdtkLZcJ9Zunv+mMveNl5/8E4xS0aX8v+ZmC6ZkZWfaX0BiOA1ORbtbidFR
	R8Ix4sk7jln91HBc28tIQfxbG2gTMBqHBKZFLeq8ObByyYXs1IX/1ivBdFhC7mVucyrV
	xIdpNpSBZXoy3HBB1ejzMIG5SX98fje/VgghDuNMbfLthX3nDBUcE2Jqsm7oyzDHSuR0
	fu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bmm6kQ8Jnc3maoZJKWtCHTcSBBZLk6dj6ackWD7Z8wE=;
	b=mK3DFy6cQWk1Y8U+3YBOzvh5FsF/a5Oz5LqG48ctlbBGLF0KusS/LIyNzcAdPJQoq0
	vIZ0wxmfXzasq8KHj0k5m0Vjl0/kGDJjkCNTND7cIX+cNVFX1eXRnA4qzsr5i2moF5Si
	6SGMh0WIIDSugPXzDo18CrhnobdK5g82jJB5AfXnqQU4zUjhpDvDGLeVrNNwnzCjrpL0
	TnFA+T0/RXmeGhb2ywda7IRl/fVUqaCdYvNelSllAD/vgCX++MUbjy64F8TqMIsZRDO9
	4qwcRBHAGB1ZheXtCapgO2VkH/5oQtR383g84kWJzMihANbSj1dPosG4HbU6ZAPyMB34
	4Hug==
X-Gm-Message-State: AGRZ1gLZi+z8c6C8YFUIvS/vxTUpaDhQm/KRQqJVQbYYd9sKznuPnt1q
	iCIgdRUmKX2G/5DyA+gZjDBYxUDK+v0KQArv51g=
X-Google-Smtp-Source: AJdET5dnLmJJDDIp0jGo0AFsTRwnFdCTcorhQQcI0FU5/Ut7WtHMmXdeRamG9kqR2LLvvcD+NQZltKjN1eDLGnmSlow=
X-Received: by 2002:aed:3024:: with SMTP id 33-v6mr1109781qte.29.1541611716516;
	Wed, 07 Nov 2018 09:28:36 -0800 (PST)
MIME-Version: 1.0
References: <1541608802-6985-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1soCQASpY7U-Vd1jVsN8-6+TtgzSnyg5H+Xsf30hdF46FA@mail.gmail.com>
	<2652751.QITpfUmNdm@yow-masselst-lx1>
	<CAPuovEJUTPFRxOSWppLzHZ0szPd6up23d+dg4qy-xaDKq-S+zg@mail.gmail.com>
	<CAPuovEL1xTn-=qZYcpkuSO7-5GT0xfP+0L5Q59hnskhLME9RAg@mail.gmail.com>
In-Reply-To: <CAPuovEL1xTn-=qZYcpkuSO7-5GT0xfP+0L5Q59hnskhLME9RAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Nov 2018 09:28:24 -0800
Message-ID: <CAMKF1sqevDPR1YsrW7wBEdZ1QJ2s-CnuxJsdsqia+Q4o_OmR7w@mail.gmail.com>
To: mark.asselstine@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 07 Nov 2018 17:28:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 9:12 AM Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Wed, Nov 7, 2018 at 12:02 PM Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
> >
> > On Wed, Nov 7, 2018 at 12:00 PM Mark Asselstine
> > <mark.asselstine@windriver.com> wrote:
> > >
> > > On Wednesday, November 7, 2018 11:55:08 AM EST Khem Raj wrote:
> > > > On Wed, Nov 7, 2018 at 8:40 AM Mark Asselstine
> > > >
> > > > <mark.asselstine@windriver.com> wrote:
> > > > > Since the xfconf uprev, commit 4222cac97678 [xfconf: 4.13.5 ->
> > > > >
> > > > > 4.13.6], we are getting a QA issue:
> > > > >   ERROR: xfconf-4.13.6-r0 do_package: QA Issue: xfconf:
> Files/directories
> > > > >   were installed but not shipped in any package:
> > > > >   /usr/lib64/gio/modules/libxfconfgsettingsbackend.la
> > > > >   Please set FILES such that these items are packaged.
> Alternatively if
> > > > >   they are unneeded, avoid installing them or delete them within
> > > > >   do_install. xfconf: 1 installed and not shipped files.
> > > > >   [installed-vs-shipped]
> > > > >   ERROR: xfconf-4.13.6-r0 do_package: Fatal QA errors found,
> failing task.
> > > > >   ERROR: xfconf-4.13.6-r0 do_package: Function failed: do_package
> > > > >
> > > > > We need to include the .la file in the -dev package to avoid this.
> > > >
> > > > can we just delete it.
> > >
> > > I am fine with that, it is of little use. In the past I have asked
> Mark Hatle
> > > for advice on package vs. delete and I never get a clear answer one
> way or the
> > > other. I am sure if you look at my patch history 50% of the time I
> have some
> > > that delete these and the other 50% I keep them.
> > >
> > > In this case there are already other .la files in the -dev package so
> I just
> > > went along with the keep approach.
> >
> > Sorry, I wasn't clear on what I will do. I will send a V2 and make use
> > of remove-libtool to take care of the cleanup.
> >
>
> Actually, Khem, if we go back to our discussion back in June
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-June/118896.html
>
> we ended up packaging the .la files. If the distro were to use
> remove-libtool then they would be cleaned up. So based on that I stand
> by my V1.
>
> Thoughts?


Yeah I think as long as packaging works ok in both cases I am fine

>
>
> MarkA
>
> > MarkA
> >
> > >
> > > MarkA
> > >
> > > >
> > > > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > > > ---
> > > > >
> > > > >  meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > > b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb index
> 191d0fd..2667ff9
> > > > > 100644
> > > > > --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > > +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > > @@ -14,3 +14,5 @@ SRC_URI[sha256sum] =
> > > > > "d1a3d442dae188b5a7380b5815377e5488578cdafb03ae363e9426e3b0>
> > > > >  FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
> > > > >
> > > > >
> ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
> > > > >
> ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
> > > > >
> > > > > +
> > > > > +FILES_${PN}-dev += "${libdir}/gio/modules/
> libxfconfgsettingsbackend.la"
> > > > > --
> > > > > 2.7.4
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

