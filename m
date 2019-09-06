Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 23EFE7F440
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:39:29 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id e17so7263366ljf.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iNSs+rEiH3QF9DMTqAzz1pKZmrkd2EMmhEXo9RTeUUM=;
	b=rAmDoCgT619k7HmSMkgZ8gSAyS0WItHsvMhcE8UEdS83Ln6aZq9cKt283hYUZQjQdI
	0zED9//7MMPJi1I4ApD93bXPfDCARg71qcUSLBn2HmF49A0TsJJa6xUJLO22V/iHEL04
	he0AzxIjj78ET7xXkMkuf8Y47sQtMp3nTXPgyT41J3DOz+XjzaPNwBOpO1zYSKY+MS7k
	Qhq1N2kWWdC4fT6dwNPnb0P6cXZSMwTfG3hLec5q6xBO/MEdhs4cWAbhmw0m8XFzRnE+
	Gkg9LOyLQJPS+bxjaTYVr3Sj4LkSK+nffjFYJCe7u5Zg9JjB/OVCQeb8ZsNTsIUOE5X3
	R4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iNSs+rEiH3QF9DMTqAzz1pKZmrkd2EMmhEXo9RTeUUM=;
	b=A0MWuujpbYSCOE9AKkcxQC5CrADOIA9x/IlZXOpSBLDDWJl/4Sj1P7Eb0vdNbaUGx4
	d0+LqyzR9CD76AMnxkYfNJypLrB+Y3bKp4loYngiH5kL8camV+bpkxSTX3NOuUuJeDYQ
	arekQ8zMScUe3hXxu/E68kQIB+o7j6/RpzrkNJpOIn544tKjuPS7H+NAV9rKEY8fvq0h
	TcJnZmVBJG0IFuYYdrn1Itl8hgRaXEGlUGD10BZPz+A0seO/R+6JRsc/w4zG+rk+NYc6
	tmRNq1nqhL8rEGgF/9cZgn6C3UIrdjX312twjaR0ZZAj56abZ9loqJ0Z+4wXM0MchR6F
	p6tw==
X-Gm-Message-State: APjAAAVxgJjGcbR7vWTeYrGTM+mm1CkiiWxwB5Oy8Yko6MRyjEJwXa5Y
	+Pe4tIXCDVYqL4bfOAS6N6j8PN/r58fRCfV8ML8=
X-Google-Smtp-Source: APXvYqzquo3XQrm5LEFyfZ+8g6yQ9VgcazxlPCJxsHLydOeuCj1fzTpsJKxVoUrM8ts38oQLugmelAwJV+a4RRpoWKc=
X-Received: by 2002:a05:651c:1035:: with SMTP id
	w21mr7202882ljm.119.1567805968891; 
	Fri, 06 Sep 2019 14:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190906205120.19040-1-alistair.francis@wdc.com>
	<20190906205120.19040-2-alistair.francis@wdc.com>
	<CAMKF1so6GXyLz03+6Tn7PYU_6Qn9_BWk3ngxG0-4MJ5CkceeZg@mail.gmail.com>
In-Reply-To: <CAMKF1so6GXyLz03+6Tn7PYU_6Qn9_BWk3ngxG0-4MJ5CkceeZg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 6 Sep 2019 14:35:10 -0700
Message-ID: <CAKmqyKMs-n-hFBo30ntWgfRRbKm-szFAVDKcxy9V7vFhRJeNDw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/3] python3-six: Initial commit of 1.12.0
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
X-List-Received-Date: Fri, 06 Sep 2019 21:39:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019 at 2:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> this package is already in oe-core

Whoops, I missed that. This patch isn't required then.

Alistair

>
> On Fri, Sep 6, 2019 at 2:02 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta-python/recipes-devtools/python/python-six.inc       | 9 +++++++++
> >  .../recipes-devtools/python/python3-six_1.12.0.bb        | 2 ++
> >  2 files changed, 11 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python-six.inc
> >  create mode 100644 meta-python/recipes-devtools/python/python3-six_1.12.0.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
> > new file mode 100644
> > index 000000000..92df2b486
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-six.inc
> > @@ -0,0 +1,9 @@
> > +DESCRIPTION = "Six is a Python 2 and 3 compatibility library"
> > +HOMEPAGE = "https://github.com/benjaminp/six"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://README.rst;md5=f9a0f1a5bcc65f1b7de7339906282610"
> > +
> > +SRC_URI[md5sum] = "9ae5d1feed8c0215f4ae4adcd9207fcb"
> > +SRC_URI[sha256sum] = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
> > +
> > +inherit pypi
> > diff --git a/meta-python/recipes-devtools/python/python3-six_1.12.0.bb b/meta-python/recipes-devtools/python/python3-six_1.12.0.bb
> > new file mode 100644
> > index 000000000..8795313be
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-six_1.12.0.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools3
> > +require python-six.inc
> > --
> > 2.23.0
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

