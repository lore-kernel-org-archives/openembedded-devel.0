Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E80E374586
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 21:34:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a13-v6so31320912wrt.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 14:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dTH+1l9DwoNS0EZlO7WB6kk7tF8l9DXElfgXEFMG8gA=;
	b=V/zezA4OaTjyLWoWKcVvu6rpWrpqFuoPdKL6LjZBQ2+iYWAhTPtl6SbWV4rYJ5x5iO
	Hs06EjALohwfB+6ooSts0/U0g6IMqLJDSgvhm0Am2X1rw2U1A9guatd5j6kAvZTjzzSb
	sKtSHstz0fnZnccLFm0RXoMb738L0X6M6x0a0HDifQgsUOSd87d2h8LbnnfVGThOfL0l
	JfU7x+y3R2BeO8uuQiaPmwga/i4ytS8q1/Vyfd4IZ0Osw8M+9MpVBWrfOx/egIlnt+Ju
	6TX3uBgP5PLQMPoGkEIWw2j/tzs3BL4EYH6XXT+RVG5c1LIb6CrXvN0NaYpkHdxvJOCz
	cTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dTH+1l9DwoNS0EZlO7WB6kk7tF8l9DXElfgXEFMG8gA=;
	b=WhIKSj3CKeiRWb0ndG9qxQaev3hxr1qkUt0leI3IdwupmthyC3M9jDOVPb0b8583+I
	nuUtCC6R9zt1P5Ylf/mfsOruPmYnnWKo2+HK94HfhAlHQmtjqMYMAXx67DMkb7N12iwl
	3oGr57at8vGNB66xxuH2ei2LsGNBWogtPNTS3DMsK+FHofVBm62MoZxx/jLKBL8HRYgF
	dkiiTJ53oVfj+KwO2TEGq8t3/sg1qG90OyQKrSTW3li6fDzM7qULi0Sbc0WpTUjxqreX
	lrnt/n5FRNtjIIbMJcLGblQT83oGDhUpor4RjS9b/z0Biq5QWUXL/irOk2sqt7IF9S41
	XlkA==
X-Gm-Message-State: ABuFfoheF/A3BA9VSEde4o7uqCu6bgeXme0IuO+ZCciS7obHxZKj7vdX
	RP0k9Rb7EHkOOU6PfIjmCSBxGI3J8dJgFbvQtT4=
X-Google-Smtp-Source: ACcGV63L/g5+g4WIbt04kVVryqhPPXgcoIDkZmzYFNDM0wfduk4fFvZJ3SSqbhv3G1EZXH8sbR0lKendmpBbCmKwyjk=
X-Received: by 2002:a5d:6ac5:: with SMTP id
	u5-v6mr25100545wrw.288.1539812042328; 
	Wed, 17 Oct 2018 14:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20181017205647.25447-1-yann@blade-group.com>
	<58e27c81a75d4ffdb436ec577bbb7f9b@XBOX02.axis.com>
In-Reply-To: <58e27c81a75d4ffdb436ec577bbb7f9b@XBOX02.axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Oct 2018 23:33:50 +0200
Message-ID: <CA+chaQeqKrGu3=5HYA+qm8a2iV86vDQdhMELEYkhBKfM6yWYZA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: yann@blade-group.com,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 21:34:02 -0000
Content-Type: text/plain; charset="UTF-8"

I wouldn't say that supporting bluez6 as BLUEZ value before RDEPENDS_bluez6
is defined here is really better.

Whole bluez4 support here is a bit useless considering that all bluez4
related recipes were removed more than a year ago with:

commit 007498ac72e26e9f7064de74f7fe96e91ae6c969
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Mon Jul 24 19:25:35 2017 +0200

    bluez4: remove bluez4-only recipes


On Wed, Oct 17, 2018 at 11:20 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org <
> openembedded-devel-bounces@lists.openembedded.org> On Behalf Of
> yann.dirson@blade-group.com
> > Sent: den 17 oktober 2018 22:57
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Yann Dirson <yann@blade-group.com>
> > Subject: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
> advertized on distro without bluez* support
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > Otherwise the build fails with:
> >
> >   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
> >   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
> >
> > This restores some truth in the "Otherwise install nothing" comment in
> > the recipe.
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  .../packagegroups/packagegroup-tools-bluetooth.bb            | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > index 0ede5e57b..207c7c1ae 100644
> > --- a/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > +++ b/meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
> > @@ -34,4 +34,7 @@ RDEPENDS_bluez5 = " \
> >
> >  # Install bluez4 tools or bluez5 tools depending on what is specified
> in the distro.
> >  # Otherwise install nothing.
> > -RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
> > +RDEPENDS_${PN} = " \
> > +    ${@'${RDEPENDS_bluez5}' if d.getVar('BLUEZ', True) == 'bluez5' else
> ''} \
> > +    ${@'${RDEPENDS_bluez4}' if d.getVar('BLUEZ', True) == 'bluez4' else
> ''} \
> > +"
>
> You can simplify this (and support any value of ${BLUEZ} just in
> case someone decides to add bluez6):
>
> RDEPENDS_${PN} = "${@'${RDEPENDS_${BLUEZ}}' if d.getVar('BLUEZ') else ''}"
>
> Also, the second argument to d.getVar() has defaulted to True for
> a long time, so no point in specifying it.
>
> > --
> > 2.19.1
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

