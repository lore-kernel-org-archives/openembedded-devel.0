Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 08B3878212
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 23:17:19 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 105so842396uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HQE0q027z4wEV21fkRLkar2trlKgz/jv/Pmypbu8KbQ=;
	b=hlDa2A1iwZfFw6uLxsf+Tdsa5uECpcHYfQ6BsrGRA8ADC5yLZfl2pptNoaK7CIpdHX
	gNzz26C7GEaDcD5s7X6+X7T3MbXZsINS95nqx4VNyNkafMbbpz36lf0yiDKP8tSm2L8O
	owl3aYdnhQQ2r8WXkt54cfnFCUps6WCSwIrs0KmwLCT3g3IA978ONVOvY/kZKlsY2oQA
	R6Cbv/pCiMTkoDEMNjc65kT4KugQhsdACVxyM3hRuJkQnhKo7z9cxg6fX5I5r43tBxKo
	ZxsrMfI/Yd3lcKdDF5oBNMLX2gA/4as/63nwIQo+u23Wd8o40f7+qoGcb0Hvkbxwygbw
	gF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HQE0q027z4wEV21fkRLkar2trlKgz/jv/Pmypbu8KbQ=;
	b=dAQKCGBWWj1M/Zp2TUXFxxk4VyZnAOdlN03L3iaBj0AFsDK5bIapyI3y7dn1m7Tcxx
	Ld57nYcaY5zfxJXMbhY4GWjCkq2KuNo7wDOfvXZPazlKKNV8Rxw2rpb4Ten/nm6d6NX+
	2reVWqO8qm2X1S/8T0uUMYcukiz3gpNEP7a6DtDN8ImLksFn6B0vX7CficxzCB4OfmP2
	RlSyW7SW+9HxyuBtWishmwR4JxGU6mU62BBmMOcEd3kQTdQBkwPHChpcTZBHI1XQPI9V
	qGA9dGKmfjGHKcvPYZA73dvIeJyuojlyQVYHvj71ob0S4jlMZ6I6G54vGFQQd9itwgBy
	qSRg==
X-Gm-Message-State: AHYfb5gGTgKYScsiwNzCCg1wPiZZOB2+aTO5e5PDUHL/DVkrkmvPma1n
	SAicsfJM14vZOJsQc0fGK5jHAoyIBQ==
X-Received: by 10.159.32.163 with SMTP id 32mr1590436uaa.127.1503962240804;
	Mon, 28 Aug 2017 16:17:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Mon, 28 Aug 2017 16:17:20 -0700 (PDT)
In-Reply-To: <CAMKF1sq9CpL3V9SU9C5GSLCdQ+TZLObFJO=0djB2+8Mn9ZeS=Q@mail.gmail.com>
References: <20170828060531.13717-1-jackie.huang@windriver.com>
	<CAMKF1sq9CpL3V9SU9C5GSLCdQ+TZLObFJO=0djB2+8Mn9ZeS=Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Aug 2017 01:17:20 +0200
Message-ID: <CA+chaQfG3sQW6mncedu36aeuWuckbmADjgVeCraU1dsXRAxWqg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] enscript: set the correct path for perl
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
X-List-Received-Date: Mon, 28 Aug 2017 23:17:20 -0000
Content-Type: text/plain; charset="UTF-8"

And also by:
https://patchwork.openembedded.org/patch/143340/

On Mon, Aug 28, 2017 at 5:26 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Aug 27, 2017 at 11:05 PM,  <jackie.huang@windriver.com> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Set the correct path for perl and avoid
> > searching the one in hosttools that cause
> > QA issue:
> >
> > | ERROR: enscript-1.6.6-r0 do_package_qa: QA Issue: /usr/bin/diffpp
> >   contained in package enscript requires
> >   /builddir/tmp/hosttools/perl, but no providers found in
> RDEPENDS_enscript? [file-rdeps]
> >
>
> already fixed with https://patchwork.openembedded.org/patch/143281/
>
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta-oe/recipes-extended/enscript/enscript_1.6.6.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> > index 96129880a..65f1ccfa0 100644
> > --- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> > +++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> > @@ -19,4 +19,6 @@ inherit autotools gettext
> >  SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
> >  SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa8
> 5975e66457ac5bf513427ae7fc77f5c0bb"
> >
> > +CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${bindir}/perl"
> > +
> >  RDEPENDS_${PN} = "perl"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

