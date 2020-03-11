Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id E207261B8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:48:38 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q9so1408077lfc.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 04:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pb43IAA7IPFocDN0WhznoKia+sZsyRGVe7iaUw8UFiQ=;
	b=uA1zrPOPqcwonCd+434az0Z8mHs1noRpmeAOE+tRHNstG/fz8GM48vywVHnJ/6hfpN
	qnamVg76l/mtncWboJbqBM+TCzKfGwu4NFLN44qZHakwLvMoKEujdLxK9oBaMBCa/5gx
	/jQsWrA+0iKHNdTBcvf4JsJErlkckFmqy0gn3bugNxQj3olfDVY1FCuatJBIDQxeSSUW
	WaezvdzRAy/1SE7dbCmIfsGn/N3duGSNWu+dPWLXUstsomkZdwJGnaASBVbVY+KMC0Cg
	ILUymUDgin8dUusw3XXGjENVkCVhjRD3qh5H0z9+RSgyUSzmJQ5mXMMmuXy2DtkZhJpO
	rxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pb43IAA7IPFocDN0WhznoKia+sZsyRGVe7iaUw8UFiQ=;
	b=Ro5DflbcML0RSpaOyVUsGX9uhmZshFgTknD5riPpV8+wt17cWMELky15M98hI81B+1
	6a15+fDZzzv0b/9anLrE/5LHYJ5ze271F44hQl5ePc7/iTKekWQioH1pQCthmEX4DSMZ
	Q1IkKQb7BkerMcW9FxIjMajxWtqgxALyf+PlYcqrrCUsuPE2kle9wBmkNWY1hqlKlv+J
	8zbmWiwemgqPCRRNgecfx4/QbKKAnvjJI8cUheKU34Bs9Lf5h8zYRXj/a2iCeyN2tdkq
	zgv5Z/o3McgLAjOq/KvAh3ps9GN5t6JkAKw4jrO7L5vZ/BYRkZrYYx1CEOD3NrRzWdp0
	IsNQ==
X-Gm-Message-State: ANhLgQ14HeMZXVTUcYkWSJsI+rS14ST97UVh35UPsufqpN2c1bU7gRiP
	T6EX1gvIEko3YS2kDz1HCy/b/Z6MgyIBaICHPcY=
X-Google-Smtp-Source: ADFU+vusW+Y4x3uZpy0gXs2lnn+9gyAyCLYKiHkqeH5KERFLRJ5u698MrYzBLNgyJ9G8Jh4wTwLVnfWTOEGJmpDFGZo=
X-Received: by 2002:ac2:4848:: with SMTP id 8mr1937587lfy.203.1583927319277;
	Wed, 11 Mar 2020 04:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200311075513.9491-1-nick83ola@gmail.com>
	<e50174e3f36143c1dc43f41cedc6232c34035578.camel@andred.net>
	<44513925f8e11e8f2c6afedce2558da0a9e608f0.camel@andred.net>
In-Reply-To: <44513925f8e11e8f2c6afedce2558da0a9e608f0.camel@andred.net>
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 11 Mar 2020 11:48:27 +0000
Message-ID: <CABPh3UP2nKhoJ8PCysTc=datmBa=Cgb6kCbiyAk4=yjDV1X2Ow@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] smem: matplotlib is an optional depencency
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
X-List-Received-Date: Wed, 11 Mar 2020 11:48:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,
the problem is that if you put the package in RRECOMMENDS, yocto will
still build
python3-numpy and python3-matplotlib even if you add it to BAD_RECOMMENDATI=
ONS

from https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html=
#var-RRECOMMENDS
  The package manager will automatically install the RRECOMMENDS list
of packages when installing the built package.
  However, you can prevent listed packages from being installed by using th=
e
  BAD_RECOMMENDATIONS, NO_RECOMMENDATIONS, and PACKAGE_EXCLUDE variables.

Note the "from being installed"

And on my particular machine (armv5) with musl the numpy build is broken
(no fpu, not supported for now, working on a fix for that but it
require more time)

Also I don't think is a good idea to build python-numpy (that is huge)
if the user is not using it...
on the smem web page it clearly states (https://www.selenic.com/smem)

 ->  the matplotlib library for chart generation (optional, auto-detected)

and in the code is doing exactly that

  def showbar(l, columns, sort):
      try:
          import pylab, numpy
      except ImportError:
          sys.stderr.write("bar chart requires matplotlib\n")
          sys.exit(-1)

so numpy and matplotlib are needed only if you want to use the

parser.add_option("", "--pie", type=3D'str', help=3D"show pie graph")
parser.add_option("", "--bar", type=3D'str', help=3D"show bar graph")

function

Another thing: there's a way to declare that a recipe needs a floating
point unit?

Cheers
Nick


On Wed, 11 Mar 2020 at 10:06, Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> On Wed, 2020-03-11 at 09:43 +0000, Andr=C3=A9 Draszik wrote:
> > On Wed, 2020-03-11 at 07:55 +0000, Nicola Lunghi wrote:
> > > smem doesn't need matplotlib and numpy to run, is an optional depende=
ncy only
> > > needed to produce graphs.
> >
> > Right, that's why it's an RRECOMMENDS. If you don't want it in the imag=
e, just do
> > BAD_RECOMMENDATIONS as per usual practice :-)
>
> Also, smem really wants those to produce graphs. If you want something si=
mple on
> the target to just capture the data, there is smemcap as a separate utili=
ty
> (and package).
>
> A.
>
> >
> > Cheers,
> > Andre'
> >
> > > This is needed to avoid to include and build matplotlib and numpy by =
default
> > >
> > > Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > > ---
> > >  meta-oe/recipes-support/smem/smem_1.5.bb | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-support/smem/smem_1.5.bb b/meta-oe/recip=
es-support/smem/smem_1.5.bb
> > > index 90db9c3f3..446325e93 100644
> > > --- a/meta-oe/recipes-support/smem/smem_1.5.bb
> > > +++ b/meta-oe/recipes-support/smem/smem_1.5.bb
> > > @@ -20,6 +20,9 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
> > >
> > >  S =3D "${WORKDIR}/${BPN}-${HG_CHANGESET}"
> > >
> > > +#PACKAGECONFIG ?=3D "graph"
> > > +PACKAGECONFIG[graph] =3D ",,,python3-matplotlib python3-numpy"
> > > +
> > >  do_compile() {
> > >          ${CC} ${CFLAGS} ${LDFLAGS} smemcap.c -o smemcap
> > >  }
> > > @@ -34,7 +37,6 @@ do_install() {
> > >  }
> > >
> > >  RDEPENDS_${PN} =3D "python3-core python3-compression"
> > > -RRECOMMENDS_${PN} =3D "python3-matplotlib python3-numpy"
> > >
> > >  PACKAGE_BEFORE_PN =3D "smemcap"
> > >
> > > --
> > > 2.20.1
> > >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

