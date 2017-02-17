Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BFE6271B27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 16:19:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 17 Feb 2017 08:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,172,1484035200"; 
	d="scan'208,217";a="824497508"
Received: from guptarav-mobl.amr.corp.intel.com ([10.254.77.251])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2017 08:19:29 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Date: Fri, 17 Feb 2017 08:19:30 -0800
References: <alpine.LFD.2.20.1702170515100.11041@uk63952.mitel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.20.1702170515100.11041@uk63952.mitel.com>
Message-Id: <FF18C4F5-59F1-4164-B656-1FCEB7349D4D@linux.intel.com>
X-Mailer: Apple Mail (2.3259)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: DEPENDS += "module-build-perl-native" versus "libmodule-build-perl-native"?
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
X-List-Received-Date: Fri, 17 Feb 2017 16:19:30 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 17, 2017, at 2:39 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:

> and, predictably, the meta-cpan layer provides that very recipe:
>=20
>  module-build-perl_0.4216.bb
>=20

The meta-perl layer follows Debian naming of perl modules:
=
https://www.debian.org/doc/packaging-manuals/perl-policy/ch-module_package=
s.html =
<https://www.debian.org/doc/packaging-manuals/perl-policy/ch-module_packag=
es.html>

>=20
>  thoughts? should some names be cleaned up to prevent this?
>=20

There are many other places in the wild where the metadata is not =
consistent. The meta-openembedded/meta-perl layer-- being moderated on a =
mailing list =E2=80=94 has some consistency. The meta-cpan layer =E2=80=94=
 being authored by a NetBSD contributor and perl module author, on his =
own =E2=80=94 does not follow the same guidelines. This by no means =
diminishes the value of the work Jens has done. But it is still Jen=E2=80=99=
s layer, not an officially supported OpenEmbedded layer.

IMHO, the best solution is to add perl module support to the recipetool =
so that we have an easier way to generate consistent metadata. And then =
try to convince everyone else to use the tool and follow the guidelines. =
We should also take a look at the existing metadata and clean it up.

Another option would be to have the OE community get involved in support =
of the meta-cpan layer and change the module generation code there =
appropriately to be in sync with the Debian naming guidelines.

The challenge for me personally is the same one I always have: TIME.

=E2=80=94Tim


> rday
>=20
> --=20
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


