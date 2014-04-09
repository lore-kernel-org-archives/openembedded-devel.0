Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id BC35E65E1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 15:49:14 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rd18so2618208iec.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=z+eWB0VBNt8oZVVTqxDyNM8Wh9CGWdx3MFyu9X7KZqA=;
	b=a/hKmkeZtI75tEjSUKJMsXtNYiDdz9vt8O5ZmRqVE/ES3l3BAJ8QERq6CtpcD7if65
	RxHirJ3Bwxjt48J7Gqc0/42BBl9kCYz27/QqwSMHnjlskustajmXooaHl4BNfZgbX/j+
	XEynIZ+HgRHuxtrJ0jgpkWzEXK18HuHs8bB8icxiqsqcmtxvtYD2/BEf1C/nm1KwoCfs
	m2qs8FQNQEUvOYXM0zLZgyArlcRVDFOnULi9ve+mFusYUZWeUs5+sRMOCi2NkfJj1W5e
	p8ZBx6bQFkWSI6SGny26UO1oc0HrkeVP97McBBNdeCoba2F4BtCRy2m+jW+L+bjzLItA
	LN0Q==
MIME-Version: 1.0
X-Received: by 10.42.20.6 with SMTP id e6mr8213693icb.29.1397058555005; Wed,
	09 Apr 2014 08:49:15 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 9 Apr 2014 08:49:14 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 9 Apr 2014 08:49:14 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAB5BDF86B@ALA-MBA.corp.ad.wrs.com>
References: <cover.1397024315.git.jackie.huang@windriver.com>
	<d548095ff29cf093d3e6df22594476873a34a67c.1397024315.git.jackie.huang@windriver.com>
	<CAMKF1srp7jUDqxShC9TWzocrpytAeG1uTamOcZ+n3KXsOJ33ig@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAB5BDF86B@ALA-MBA.corp.ad.wrs.com>
Date: Wed, 9 Apr 2014 08:49:14 -0700
Message-ID: <CAMKF1spu1T+fGY6AW0gcBHo=_fCSTPxMEq9pjgoD8i3s=QDy3A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] eject: Fix wrong return value
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
X-List-Received-Date: Wed, 09 Apr 2014 15:49:14 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 8, 2014 10:36 PM, "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
wrote:
>
>
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
openembedded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Khem Raj
> > Sent: Wednesday, April 09, 2014 4:13 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH 2/2] eject: Fix wrong return value
> >
> > On Apr 8, 2014 8:27 PM, <jackie.huang@windriver.com> wrote:
> > >
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >
> > > Remove the unnecessary return(1) from function usage(), so that eject
> > > -h can return the right value.
> >
> > this is an API change i wonder if other programs rely on the value
being >0
>
> I think the answer should be no, I don't see any reason to return 1 for
the "-h" or
> "--help", almost all programs return 0 for that, right?
>

mostly yes and change is ok too just discuss it with package community and
see if this is ok.
> Thanks,
> Jackie
>
> > >
> > > Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
> > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > ---
> > >  .../eject/eject/eject-2.1.5-error-return.patch     |   10 ++++++++++
> > >  meta-oe/recipes-support/eject/eject_2.1.5.bb       |    4 +++-
> > >  2 files changed, 13 insertions(+), 1 deletion(-)  create mode 100644
> > meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> > >
> > > diff --git
> > a/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> > b/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> > > new file mode 100644
> > > index 0000000..2cce3c3
> > > --- /dev/null
> > > +++
b/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> > > @@ -0,0 +1,10 @@
> > > +Upstream-Status: Pending
> > > +
> > > +--- eject/eject.c.orig 2013-09-11 18:08:36.000000000 +0800
> > > ++++ eject/eject.c      2013-09-11 18:09:05.000000000 +0800
> > > +@@ -207,7 +207,6 @@
> > > + "If omitted, name defaults to `%s'.\n"
> > > + "By default tries -r, -s, -f, and -q in order until success.\n"),
> > > +                       DEFAULTDEVICE);
> > > +-  exit(1);
> > > + }
> > > diff --git
a/meta-oe/recipes-support/eject/eject_2.1.5.bbb/meta-oe/recipes-support/eject/
> > eject_2.1.5.bb
> > > index 98319a3..c47c653 100644
> > > --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > > +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > > @@ -5,7 +5,9 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> > >
> > >  inherit autotools gettext update-alternatives
> > >
> > > -SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz"
> > > +SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
> > > +           file://eject-2.1.5-error-return.patch \
> > > +"
> > >
> > >  SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
> > >  SRC_URI[sha256sum] =
> > "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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

