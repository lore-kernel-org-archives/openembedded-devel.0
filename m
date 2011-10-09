Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RD1gd-00053d-1g for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 00:17:35 +0200
Received: from f053042145.adsl.alicedsl.de ([78.53.42.145]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RD1bF-0006fg-Pe for openembedded-devel@lists.openembedded.org;
	Sun, 09 Oct 2011 22:12:02 +0000
Message-ID: <1318198305.3653.36.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Oct 2011 00:11:45 +0200
In-Reply-To: <1318009164-6677-1-git-send-email-raj.khem@gmail.com>
References: <1318009164-6677-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] ldconfig-native: Change the license field
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
X-List-Received-Date: Sun, 09 Oct 2011 22:17:35 -0000
X-Groupsio-MsgNum: 34620
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-XeTaV7g+HIhDTNhUjOT7"

--=-XeTaV7g+HIhDTNhUjOT7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 07.10.2011, 10:39 -0700 schrieb Khem Raj:
> The license should be GPLv2+

Koen has already committed this in 2f04e069 [1].

I have to remarks.

1. Combining your commit summary and message to

    ldconfig-native Correct license field to GPLv2+

would be better next time. Especially if looking at the commit log with
`--format=3Doneline` or on the Web.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-core/eglibc/ldconfig-native_2.12.1.bb  |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta=
-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> index 00edb6e..2a93913 100644
> --- a/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> +++ b/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "A standalone native ldconfig build"
> =20
> -LICENSE =3D "GPLv2.1"
> +LICENSE =3D "GPLv2+"

[=E2=80=A6]

2. Looking at the source headers of for example `cache.c`

           /* Copyright (C) 1999-2003,2005,2006,2007 Free Software Foundati=
on, Inc.
           This file is part of the GNU C Library.
           Contributed by Andreas Jaeger <aj@suse.de>, 1999.
       =20
           This program is free software; you can redistribute it and/or mo=
dify
           it under the terms of the GNU General Public License as publishe=
d
           by the Free Software Foundation; version 2 of the License, or
           (at your option) any later version.
       =20
           This program is distributed in the hope that it will be useful,
           but WITHOUT ANY WARRANTY; without even the implied warranty of
           MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
           GNU General Public License for more details.
       =20
           You should have received a copy of the GNU General Public Licens=
e
           along with this program; if not, write to the Free Software Foun=
dation,
           Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  =
*/
       =20
the license is GPLv2+ as you changed it to. But in `readelflib.c` we have

           /* Copyright (C) 1999, 2000, 2001, 2002, 2007 Free Software Foun=
dation, Inc.
           This file is part of the GNU C Library.
           Contributed by Andreas Jaeger <aj@suse.de>, 1999 and
        		  Jakub Jelinek <jakub@redhat.com>, 1999.
       =20
           The GNU C Library is free software; you can redistribute it and/=
or
           modify it under the terms of the GNU Lesser General Public
           License as published by the Free Software Foundation; either
           version 2.1 of the License, or (at your option) any later versio=
n.
       =20
           The GNU C Library is distributed in the hope that it will be use=
ful,
           but WITHOUT ANY WARRANTY; without even the implied warranty of
           MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GN=
U
           Lesser General Public License for more details.
       =20
           You should have received a copy of the GNU Lesser General Public
           License along with the GNU C Library; if not, write to the Free
           Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, M=
A
           02111-1307 USA.  */
       =20
which is LGPLv2.1+. Also `dl-cache.c` has the `LGPLv2.1+` license header.

So should the field be changed to `LICENSE =3D "GPLv2+ LGPL"`?


Thanks,

Paul

--=-XeTaV7g+HIhDTNhUjOT7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6SHCEACgkQPX1aK2wOHVhs6wCffQxSmrnNlL3sUfDqfuY9SRfR
5rYAn2o1SnwW5F+isCG49Zge4z+fIxjP
=wheG
-----END PGP SIGNATURE-----

--=-XeTaV7g+HIhDTNhUjOT7--
