Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7C32971B27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 16:28:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2017 08:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,172,1484035200"; 
	d="scan'208,217";a="824507765"
Received: from guptarav-mobl.amr.corp.intel.com ([10.254.77.251])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2017 08:28:49 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Date: Fri, 17 Feb 2017 08:28:49 -0800
References: <alpine.LFD.2.20.1702170559480.1649@uk63952.mitel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.20.1702170559480.1649@uk63952.mitel.com>
Message-Id: <3162C416-70A3-4043-B713-A7AD57FAF9B8@linux.intel.com>
X-Mailer: Apple Mail (2.3259)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: SUMMARY/DESCRIPTION for "libmodule-build-perl_0.31.bb" refers to "tiny" version
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
X-List-Received-Date: Fri, 17 Feb 2017 16:28:50 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 17, 2017, at 3:12 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
>  just noticed that in meta-openembedded/meta-perl layer, there are
> two recipes for perl module building:
>=20
>  * libmodule-build-perl_0.31.bb
>  * libmodule-build-tiny-perl_0.036.bb
>=20
> but the SUMMARY and DESCRIPTION for the first (non-tiny) version
> clearly was copied and pasted from the second (tiny) version:
>=20
> SUMMARY =3D "Module::Build::Tiny - A tiny replacement for =
Module::Build"
> DESCRIPTION =3D "Many Perl distributions use a Build.PL file instead =
of a \
> Makefile.PL file to drive distribution configuration, build, test and =
\
> installation. Traditionally, Build.PL uses Module::Build as the =
underlying \
> build system. This module provides a simple, lightweight, drop-in =
replacement. \
> Whereas Module::Build has over 6,700 lines of code; this module has =
less than \
> 120, yet supports the features needed by most distributions.=E2=80=9D
>=20

I authored the libmodule-build-tiny-perl recipe. I can=E2=80=99t speak =
for the libmodule-build-perl recipe=E2=80=99s creation process, but it =
does seem your hypothesis is likely.

>  i'm going to let someone higher up the food chain deal with that.
>=20

Perhaps you should consider submitting a patch? Here is where the data =
should come from:
https://metacpan.org/pod/Module::Build#DESCRIPTION =
<https://metacpan.org/pod/Module::Build#DESCRIPTION>



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
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


