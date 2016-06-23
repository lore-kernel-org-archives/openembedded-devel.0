Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 744A0601B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 03:45:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 22 Jun 2016 20:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="1003500639"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2016 20:45:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ulf Samuelsson <openembedded@emagii.com>
Date: Thu, 23 Jun 2016 15:45:50 +1200
Message-ID: <8016846.8dGgvebKxB@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <16a6d5ea-a179-f36b-6a64-2a8c790e662f@emagii.com>
References: <7fb5e28e-d153-a396-58ae-c4d656835524@emagii.com>
	<8646f486-90f9-738d-9daf-6ba1644c83ba@smile.fr>
	<16a6d5ea-a179-f36b-6a64-2a8c790e662f@emagii.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Using EXTERNALSRC in practice
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
X-List-Received-Date: Thu, 23 Jun 2016 03:45:54 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Ulf,

On Tue, 21 Jun 2016 00:02:12 Ulf Samuelsson wrote:
> Den 2016-06-20 kl. 15:58, skrev J=E9r=E9my Rosen:
> > On 20/06/2016 15:48, Ulf Samuelsson wrote:
> >> Den 2016-06-20 kl. 14:37, skrev J=E9r=E9my Rosen:
> >>> On 20/06/2016 14:08, Ulf Samuelsson wrote:
> >>>> We have a meta-layer which builds the kernel.
> >>>>=20
> >>>> This contains among other things:
> >>>>=20
> >>>> FILESEXTRAPATHS_prepend_<machine> =3D "${THIS_DIR}/<machine>"
> >>>>=20
> >>>> SRC_URI =3D "git://<server>/<repo.git>;protocol=3Dssh;branch=3D<=
branch>"
> >>>> SRC_URI +=3D "file://defconfig"
> >>>>=20
> >>>> PV =3D "...+git${SRCPV}"
> >>>> SRCREV =3D "<shaid>"
> >>>> ...
> >>>>=20
> >>>> Would like to have an option to build the kernel with external s=
ource.
> >>>> That option should be easy to enable/disable
> >>>=20
> >>> [skip the rest]
> >>>=20
> >>> What you are describing here is very close to how the devtool wor=
ks.
> >>> I think it can deal with kernel packages in its latest iteration
> >>>=20
> >>> did you have a look at that tool ? does it satisfy your need ? if=

> >>> not, what would it need to do what you want...
> >>=20
> >> No, where can I find more information?
> >=20
> > The yocto manual has quite a section on that tool
> >=20
> >> The customer does not use the latest version of Yocto right now, s=
o
> >> that might be a problem,
> >=20
> > depends on how old "not the latest" is... but if you can do a sandb=
ox
> > with the latest version, you can probably see how devtool works and=

> > manually do the same thing...
>=20
> They use Yocto Layers, but not poky, so devtool is not present.

No part of devtool is in poky alone - where did you get this idea?
devtool is part of OE-Core, so unless you have a version of OE-Core tha=
t's=20
older than fido then you should have it.

> Anyway, devtool will generate an absolute path, and I am looking for
> a recipe which uses a relative path to allow multiple yocto instances=
.

Right, this isn't what devtool is intended to be used for. externalsrc =
alone=20
should allow it however - provided you could either use ${THISDIR} or=20=

${COREBASE} as paths if you wanted something relative to where all the=20=

metadata is checked out. Note you'll need to use :=3D if you use ${THIS=
DIR} so=20
that it is evaluated when the bbappend is parsed and not at any other t=
ime=20
(where the file context might be different).

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

