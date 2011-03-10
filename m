Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1PxifF-0003hQ-Ii for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 17:24:37 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id E61162C4008
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 17:22:56 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 17:22:54 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <1299768051.3853.21.camel@mattotaupa>
	<4D78E882.5040307@mentor.com> <4D78F0F4.9000908@gmail.com>
In-Reply-To: <4D78F0F4.9000908@gmail.com>
MIME-Version: 1.0
Message-Id: <201103101722.55323.pgsellmann@portner-elektronik.at>
Subject: Re: help2man-native: task configure fails with `configure: error: perl module Locale::gettext required`
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2011 16:24:37 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, 10. M=E4rz 2011, 16:40:36 schrieb Marco Cavallini:
> Tom Rini ha scritto, Il 10/03/2011 16:04:
>=20
> >=20
> > Is this a uclibc target perhaps?
> >=20
>=20
> Hi Tom,
>=20
> Not mine, is this
>=20
> Build Configuration:
> BB_VERSION        =3D "1.10.2"
> METADATA_BRANCH   =3D "master"
> METADATA_REVISION =3D "40a8506"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "ronetix-pm9263"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "2010.7-test-20110310"
> TARGET_FPU        =3D "soft"
>=20

here also glibc-2.9

=46ound this: reverting patch bccf626b1428d7087d261bf4ad91744b5b5d5418 help=
ed.

'inherit gettext' is not a full replacement for DEPENDS =3D "gettext-native"

Same problem and solution for packages e2fsprogs, classpath, util-linux-ng


Peter


