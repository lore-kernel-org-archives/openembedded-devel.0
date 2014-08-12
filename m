Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id E40FF65E1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 14:05:25 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j107so9590757qga.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0wRjhcmPDbcG2qaqajMNbEwXd3w+rWEfGhVYphZwRdI=;
	b=cxdk6yrxMCbSSJfZ3D8cUJBcLcvln5ye8rcZRvFH3VFTuF+xFze/WtryzTPrGOcFoF
	+HLm4JMLRY7kbMUn0MtRPVeVjWWKVGSUvfnpG/1QM+eKgc0hnE4mImw7DUI1PZNDVD8A
	/OSmYI9i+laheWzOSZbx0Nu6Kq2DafxPDxXCzTD6A9z+XJmhlj2ogIlTvwr/D7OYifKm
	BZNQBR07DtFFCNvyaQPJ6uwOh47+q1cJpNKls9Ylct3qwFYqgFzBxh1nOLOSqZBpzd/n
	1E6VQNxNF0uh2Cz6Krt5CybVw/e5gj/9H8hy3S0Lwcu+UmSw63wTp0n2DAGV8Jz/9fBF
	5Tcg==
X-Received: by 10.224.21.9 with SMTP id h9mr6797547qab.67.1407852326563; Tue,
	12 Aug 2014 07:05:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Tue, 12 Aug 2014 07:05:06 -0700 (PDT)
In-Reply-To: <1607625.zbYtdvxeAh@peggleto-mobl5.ger.corp.intel.com>
References: <1407849496-25893-1-git-send-email-sujith.h@gmail.com>
	<1607625.zbYtdvxeAh@peggleto-mobl5.ger.corp.intel.com>
From: sujith h <sujith.h@gmail.com>
Date: Tue, 12 Aug 2014 19:35:06 +0530
Message-ID: <CADyYWLmriwUJ7fChUkUouX6M4esKNgM+oy7UD9E=3AFwC=NvCg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 12 Aug 2014 14:05:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,


On Tue, Aug 12, 2014 at 7:29 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Sujith,
>
> Just some minor corrections:
>
> On Tuesday 12 August 2014 18:48:16 Sujith H wrote:
> > From: Sujith H <Sujith_Haridasan@mentor.com>
> >
> > This recipe will provide a set of Python modules that
> > provide Python programmers an interface to libparted,
> > the GNU parted library for disk partitioning and filesystem
> > manipulation.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> > ---
> >  .../recipes-extended/pyparted/pyparted_3.9.bb       | 21
> > +++++++++++++++++++++ 1 file changed, 21 insertions(+)
> >  create mode 100644 meta-python/recipes-extended/pyparted/
> pyparted_3.9.bb
> >
> > diff --git a/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> > b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb new file mode
> > 100644
> > index 0000000..7b284cc
> > --- /dev/null
> > +++ b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> > @@ -0,0 +1,21 @@
> > +DESCRIPTION =3D "pyparted is a set of Python modules that provide Pyth=
on
> programmers \
> > +an interface to libparted, the GNU parted library for disk partitionin=
g
> and \
> > +filesystem manipulation."
> > +SUMMARY =3D "Python bindings for libparted"
> > +HOMEPAGE =3D "https://fedorahosted.org/pyparted/"
> > +SCM_URI =3D "git://git.fedorahosted.org/pyparted.git"
>
> SCM_URI isn't a standard variable and doesn't seem to be used anywhere
> else in
> the recipe - is this expected to be used somewhere?
>
>
Ok I will drop SCM_URI. No its not used anywhere in the recipe.

>  > +LICENSE =3D "GPL-2.0+"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> > +
>  file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3D70c62bd73782a0=
3f56a0571a9f08ea46
> \
> > +"
> > +DEPENDS +=3D "parted"
> > +PR =3D "r0"
>
> Please drop this PR value, it's redundant.
>

Sure I will drop PR value too.

>
> > +SRC_URI =3D
> > "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
> > +SRC_URI[md5sum] =3D "f16c7ef7f5fa4a43fcb2a4654b487e39"
> > +SRC_URI[sha256sum] =3D
> > "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb" +
> > +inherit distutils
> > +
> > +BBCLASSEXTEND +=3D "native"
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

