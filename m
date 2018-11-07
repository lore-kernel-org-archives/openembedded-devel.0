Return-Path: <asselsm@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 37FBC79D69
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 17:02:17 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id g192-v6so7051822ybf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 09:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=dmmRja/gm39305nnQrkXNKwXoBTT48Lo3odUPu0dpnE=;
	b=G6kqyh8koTttEyrqZXKNO/GCvZ+YPr27wIgdFehFTxRw/PhUYOVBSiSNthgXCjywDi
	jep861mgG1ZcWUv8H2i2QFhYRYXKuSfVnoinMcTcM7TrEJparYQJEtprPFjRkgFwqUFX
	5c1r5wlDsmpFgB3jPcdqmGLOTsKibB7aBKie5plJt1OkezzM7RV6bbd2+LOaLPatraak
	kFOd86PuPJkm6ernfvJj5gHfIe0W+ODfrIvA0oXFKpXJcJJwMSl/yxv6KraB08BM0AaG
	V5Iw+fbhqNKVKTGmvck6LCjwjOHAUAykaEGmamq0L0ary2FAZS2AcmH8gnWQPxl882O3
	o+QQ==
X-Gm-Message-State: AGRZ1gJAKBtuzZclZv54HAVnHQzyoZBKbZOJVbJ7wVxyb/BrpThPz950
	BERTTSlfUpOMSOOh0bmZKzxCkQVzSwq3kGxNMtA=
X-Google-Smtp-Source: AJdET5f+T7w0M13MpzkopWbpnFFOeHNpvKp7Ognz5gswQ9z7aKy6K6vWqnHiL0jEqguTEN50aIyc5Rev9mt+RQloOkI=
X-Received: by 2002:a25:8507:: with SMTP id
	w7-v6mr1083824ybk.390.1541610138765; 
	Wed, 07 Nov 2018 09:02:18 -0800 (PST)
MIME-Version: 1.0
References: <1541608802-6985-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1soCQASpY7U-Vd1jVsN8-6+TtgzSnyg5H+Xsf30hdF46FA@mail.gmail.com>
	<2652751.QITpfUmNdm@yow-masselst-lx1>
In-Reply-To: <2652751.QITpfUmNdm@yow-masselst-lx1>
Reply-To: mark.asselstine@windriver.com
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 7 Nov 2018 12:02:07 -0500
Message-ID: <CAPuovEJUTPFRxOSWppLzHZ0szPd6up23d+dg4qy-xaDKq-S+zg@mail.gmail.com>
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
X-List-Received-Date: Wed, 07 Nov 2018 17:02:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 12:00 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Wednesday, November 7, 2018 11:55:08 AM EST Khem Raj wrote:
> > On Wed, Nov 7, 2018 at 8:40 AM Mark Asselstine
> >
> > <mark.asselstine@windriver.com> wrote:
> > > Since the xfconf uprev, commit 4222cac97678 [xfconf: 4.13.5 ->
> > >
> > > 4.13.6], we are getting a QA issue:
> > >   ERROR: xfconf-4.13.6-r0 do_package: QA Issue: xfconf: Files/directories
> > >   were installed but not shipped in any package:
> > >   /usr/lib64/gio/modules/libxfconfgsettingsbackend.la
> > >   Please set FILES such that these items are packaged. Alternatively if
> > >   they are unneeded, avoid installing them or delete them within
> > >   do_install. xfconf: 1 installed and not shipped files.
> > >   [installed-vs-shipped]
> > >   ERROR: xfconf-4.13.6-r0 do_package: Fatal QA errors found, failing task.
> > >   ERROR: xfconf-4.13.6-r0 do_package: Function failed: do_package
> > >
> > > We need to include the .la file in the -dev package to avoid this.
> >
> > can we just delete it.
>
> I am fine with that, it is of little use. In the past I have asked Mark Hatle
> for advice on package vs. delete and I never get a clear answer one way or the
> other. I am sure if you look at my patch history 50% of the time I have some
> that delete these and the other 50% I keep them.
>
> In this case there are already other .la files in the -dev package so I just
> went along with the keep approach.

Sorry, I wasn't clear on what I will do. I will send a V2 and make use
of remove-libtool to take care of the cleanup.

MarkA

>
> MarkA
>
> >
> > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > ---
> > >
> > >  meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb index 191d0fd..2667ff9
> > > 100644
> > > --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > @@ -14,3 +14,5 @@ SRC_URI[sha256sum] =
> > > "d1a3d442dae188b5a7380b5815377e5488578cdafb03ae363e9426e3b0>
> > >  FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
> > >
> > >                  ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
> > >                  ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
> > >
> > > +
> > > +FILES_${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

