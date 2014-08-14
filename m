Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 401BB60DF7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:46:48 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so792505qgf.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 02:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yVygCqRXRBL8+3yf+KsynhLrPy1mt7RdgvWj0TTKM0A=;
	b=AABFkAZDFaRnQdS4sa7BCRvirO7EeIkhMb//+z7M/zsMmenzrYCjE3UNcX5owh7+7j
	vCAt7nBLw5x/xs+vSj/AsCX+48v0b2GH7grt+fZa8/yBrKEOLBwRC7A+f/ayEawxLG16
	c8Ws9f9NO4x/PVkUlk6djy5gRq0DPe2YEztmQC8aH7N5JK2SO3yoD5o46UMjJ3sl+Grp
	tGgAbGVGVTBAwTzO5/9TZmo7AznLf0axpDG0kUsStDzGeF2S7MuxJG2R8o4iFj21A5Ss
	+53MO0SbmBPuNwrzRml6uqQNWCvdfhcZueXazuoo0GVT5abaFWWcb0E8zCptVexA54zO
	90KQ==
X-Received: by 10.224.79.13 with SMTP id n13mr14893141qak.79.1408009609496;
	Thu, 14 Aug 2014 02:46:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Thu, 14 Aug 2014 02:46:29 -0700 (PDT)
In-Reply-To: <CANx9H-BU8vM-EAOPZgfmbSZtxze9t=fiywO4n=BtLb+oqut_wQ@mail.gmail.com>
References: <1407852110-26705-1-git-send-email-sujith.h@gmail.com>
	<CANx9H-BU8vM-EAOPZgfmbSZtxze9t=fiywO4n=BtLb+oqut_wQ@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Thu, 14 Aug 2014 15:16:29 +0530
Message-ID: <CADyYWLmyyhyXvctZKXPLmf1gDn5RS9XcJ-8capNXsZXRDAy8iw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 14 Aug 2014 09:46:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Tim,


On Wed, Aug 13, 2014 at 11:18 AM, Tim Orling <ticotimo@gmail.com> wrote:

> On Tue, Aug 12, 2014 at 7:01 AM, Sujith H <sujith.h@gmail.com> wrote:
>
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
> >  meta-python/recipes-extended/pyparted/pyparted_3.9.bb | 19
> > +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta-python/recipes-extended/pyparted/
> pyparted_3.9.bb
> >
>
> You should be following Debian naming policy (see
>
> http://www.debian.org/doc/packaging-manuals/python-policy/ch-module_packa=
ges.html
> section 3.3), which means the name should be python-pyparted_3.9.bb ...
> the
> ONLY recipe that breaks this naming scheme in oe-core or meta-oe is
> pyrtm...and that is only because of legacy. I came >< this close to
> changing it during the layer creation.
>

Ok. I will change it.

>
> >
> > diff --git a/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> > b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> > new file mode 100644
> > index 0000000..79ebe02
> > --- /dev/null
> > +++ b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> > @@ -0,0 +1,19 @@
> > +DESCRIPTION =3D "pyparted is a set of Python modules that provide Pyth=
on
> > programmers \
> > +an interface to libparted, the GNU parted library for disk partitionin=
g
> > and \
> > +filesystem manipulation."
> > +SUMMARY =3D "Python bindings for libparted"
> > +HOMEPAGE =3D "https://fedorahosted.org/pyparted/"
> > +LICENSE =3D "GPL-2.0+"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> > +
> >
>  file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3D70c62bd73782a0=
3f56a0571a9f08ea46
> > \
> > +"
> > +DEPENDS +=3D "parted"
> >
> During testing on qemuarm with core-image-sato, import fails for "string"=
 ,
> "locale", "math"... You need:
> RDEPENDS_${PN} +=3D " python-stringold python-codecs python-math"
>
> I stopped testing at that point and went to bed :)
>
>
When I tried to build core-image-sato with meta-python layer included in
the bblayers, I had to add:
S=3D"${WORKDIR}/pyparted-${PV}" ( as the name I changed to python-pyarted).
And the build went fine for me.
I was testing on qemuarm. I can add the RDEPENDS_${PN} +=3D in the recipe.
Because of curiosity let me know
how you got import failure. I am building on the master branch.

>
> > +
> > +SRC_URI =3D "
> > https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
> > +SRC_URI[md5sum] =3D "f16c7ef7f5fa4a43fcb2a4654b487e39"
> > +SRC_URI[sha256sum] =3D
> > "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
> > +
> > +inherit distutils
> > +
> > +BBCLASSEXTEND +=3D "native"
> > --
> > 1.8.4
> >
>
>
> Regards,
>
> --Tim
>
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

