Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1PxhlK-0002GY-Mx for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 16:26:50 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 60FDFCDF87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 16:25:09 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 16:25:10 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <1299768051.3853.21.camel@mattotaupa>
In-Reply-To: <1299768051.3853.21.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201103101625.11388.pgsellmann@portner-elektronik.at>
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
X-List-Received-Date: Thu, 10 Mar 2011 15:26:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, 10. M=E4rz 2011, 15:40:51 schrieb Paul Menzel:
> Dear OE folks,
>=20
>=20
> some recent commit indirectly seems to have broken `help2man-native` and
> task configure fails.
>=20
>     checking whether gcc accepts -g... yes
>     checking for gcc option to accept ISO C89... none needed
>     checking for library containing dlsym... -ldl
>     checking for library containing bindtextdomain... none required
>     configure: error: perl module Locale::gettext required
>=20
> Adding `liblocale-gettext-perl-native` to `DEPENDS_virtclass-native`
> does not fix the problem but causes a dependency loop.
>=20
> I do not understand the dependency for the native package anyway.
>=20
>         DEPENDS =3D "gettext-native perl-native liblocale-gettext-perl-na=
tive"
>         DEPENDS_virtclass-native =3D "perl-native autoconf-native automak=
e-native"
>         RDEPENDS_${PN} =3D "gettext perl liblocale-gettext-perl"
>         RDEPENDS_${PN}_virtclass-native =3D ""
>=20
> I though that `DEPENDS_virtclass-native` has `DEPENDS` as a subset
> automatically.
>=20
> Any ideas?
>=20
After removing perl-native from ASSUME_PROVIDED and adding help2man-native =
it worked for me.
But this is only work-around, no solution.

Peter


