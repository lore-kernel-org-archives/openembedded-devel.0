Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id BDE4260B05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:02:42 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id pn19so1278098lab.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5bqZHVpDglUpEjLQZZK2PV2ybY5NVoklsZQfEADpdRo=;
	b=fWURXC8Q3iXh8lLTH7U928hlupYWl5kT7z2nxJlZD0aOys0v3cM5DAWhb+HzU5ZmNM
	E0wYdLIz3JDMsx+hLCsvLO6iwqdshHJsI5KGURjfZEpL0QqwbGqitR8f+OK+r49WY9pP
	ULccFmI/JhCrChncYTYJ1H3h4rqr5viQu/ThbQdQXHu5OjqKGh8lJS7gXpoJVUH9zaSH
	/RKdWq2ITJuF6gwR6Xhg4+R37XGH8uItA2qXQPDyPgZkHq3S2qi6TBHGSA6e1k39vWlN
	NPfQuBfiEFIvQrZBfDvFNdjZJxp81gof3psctNA/jqyxJUHwHnmOWRkH3TX7JZjoNcp9
	A/Kg==
MIME-Version: 1.0
X-Received: by 10.112.219.234 with SMTP id pr10mr5359706lbc.59.1408028563244; 
	Thu, 14 Aug 2014 08:02:43 -0700 (PDT)
Received: by 10.114.161.116 with HTTP; Thu, 14 Aug 2014 08:02:43 -0700 (PDT)
In-Reply-To: <CADyYWLmyyhyXvctZKXPLmf1gDn5RS9XcJ-8capNXsZXRDAy8iw@mail.gmail.com>
References: <1407852110-26705-1-git-send-email-sujith.h@gmail.com>
	<CANx9H-BU8vM-EAOPZgfmbSZtxze9t=fiywO4n=BtLb+oqut_wQ@mail.gmail.com>
	<CADyYWLmyyhyXvctZKXPLmf1gDn5RS9XcJ-8capNXsZXRDAy8iw@mail.gmail.com>
Date: Thu, 14 Aug 2014 08:02:43 -0700
Message-ID: <CANx9H-CVviXCnHa4W7Fm_W6W9DXBrtC+S=BwvKDVc8LCmspzHQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-python][PATCH] pyparted: Add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 15:02:47 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 14, 2014 at 2:46 AM, sujith h <sujith.h@gmail.com> wrote:

> Hi Tim,
>
>
> On Wed, Aug 13, 2014 at 11:18 AM, Tim Orling <ticotimo@gmail.com> wrote:
>
> > On Tue, Aug 12, 2014 at 7:01 AM, Sujith H <sujith.h@gmail.com> wrote:
> >
> > > From: Sujith H <Sujith_Haridasan@mentor.com>
> > >
> > > This recipe will provide a set of Python modules that
> > > provide Python programmers an interface to libparted,
> > > the GNU parted library for disk partitioning and filesystem
> > > manipulation.
> > >
> > > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> > > ---
> > >  meta-python/recipes-extended/pyparted/pyparted_3.9.bb | 19
> > > +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >  create mode 100644 meta-python/recipes-extended/pyparted/
> > pyparted_3.9.bb
> > >
> >
> > You should be following Debian naming policy (see
> >
> >
> http://www.debian.org/doc/packaging-manuals/python-policy/ch-module_packages.html
> > section 3.3), which means the name should be python-pyparted_3.9.bb ...
> > the
> > ONLY recipe that breaks this naming scheme in oe-core or meta-oe is
> > pyrtm...and that is only because of legacy. I came >< this close to
> > changing it during the layer creation.
> >
>
> Ok. I will change it.
>
> >
> > >
> > > diff --git a/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> > > b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> > > new file mode 100644
> > > index 0000000..79ebe02
> > > --- /dev/null
> > > +++ b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> > > @@ -0,0 +1,19 @@
> > > +DESCRIPTION = "pyparted is a set of Python modules that provide Python
> > > programmers \
> > > +an interface to libparted, the GNU parted library for disk
> partitioning
> > > and \
> > > +filesystem manipulation."
> > > +SUMMARY = "Python bindings for libparted"
> > > +HOMEPAGE = "https://fedorahosted.org/pyparted/"
> > > +LICENSE = "GPL-2.0+"
> > > +LIC_FILES_CHKSUM = "\
> > > +    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> > > +
> > >
> >
>  file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46
> > > \
> > > +"
> > > +DEPENDS += "parted"
> > >
> > During testing on qemuarm with core-image-sato, import fails for
> "string" ,
> > "locale", "math"... You need:
> > RDEPENDS_${PN} += " python-stringold python-codecs python-math"
> >
> > I stopped testing at that point and went to bed :)
> >
> >
> When I tried to build core-image-sato with meta-python layer included in
> the bblayers, I had to add:
> S="${WORKDIR}/pyparted-${PV}" ( as the name I changed to python-pyarted).
> And the build went fine for me.
> I was testing on qemuarm. I can add the RDEPENDS_${PN} += in the recipe.
> Because of curiosity let me know
> how you got import failure. I am building on the master branch.
>
> I am also using master branch (for both openembedded-core and
meta-openembedded). I am building "distroless", with nothing added to
core-image-sato except the following added to conf/local.conf:
IMAGE_INSTALL_append = " python-pyparted"

After the build completes, "runqemu core-image-sato". Launch the terminal
application. At the prompt, "python"
>>>import parted

This reports, for instance, cannot import "string". Then an iterative
process of adding packages to RDEPENDS_${PN} as it only checks for the
first missing python module...

I would have done a capture of the output, but qemu doesn't copy/paste?

Regards,
Tim

>
> > > +
> > > +SRC_URI = "
> > > https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
> > > +SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
> > > +SRC_URI[sha256sum] =
> > > "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
> > > +
> > > +inherit distutils
> > > +
> > > +BBCLASSEXTEND += "native"
> > > --
> > > 1.8.4
> > >
> >
> >
> > Regards,
> >
> > --Tim
> >
> > >
> > >
>
>

