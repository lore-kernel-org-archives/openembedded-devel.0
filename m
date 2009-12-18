Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NLdWG-00022J-GC for openembedded-devel@lists.openembedded.org;
	Fri, 18 Dec 2009 15:09:27 +0100
Received: from g229061059.adsl.alicedsl.de ([92.229.61.59]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NLdUX-0006F0-N1 for openembedded-devel@lists.openembedded.org;
	Fri, 18 Dec 2009 14:07:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
References: <>  <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 18 Dec 2009 15:07:51 +0100
Message-ID: <1261145271.3191.12.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Fri, 18 Dec 2009 14:09:27 -0000
X-Groupsio-MsgNum: 15128
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-u8eC6OzV6AE9d1hRHoy/"

--=-u8eC6OzV6AE9d1hRHoy/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 17.12.2009, 12:07 -0800 schrieb Khem Raj:
> * This is not supporting multilib
> * Only 64-bit userspace can be built.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/machine/include/tune-x86_64.inc |    4 ++++
>  conf/machine/x86_64-generic.conf     |   31 ++++++++++++++++++++++++++++=
+++
>  recipes/gcc/gcc-common.inc           |    4 ++++
>  3 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/include/tune-x86_64.inc
>  create mode 100644 conf/machine/x86_64-generic.conf

I do not know how OE handles it, but is there a list of available
machines where this new machine has to be added? That means keep
documentation up to date. I guess I can add this new machine to
local.conf (MACHINE =3D "x86_64-generic")?

[=E2=80=A6]

> diff --git a/conf/machine/x86_64-generic.conf b/conf/machine/x86_64-gener=
ic.conf
> new file mode 100644
> index 0000000..0dad0ff
> --- /dev/null
> +++ b/conf/machine/x86_64-generic.conf
> @@ -0,0 +1,31 @@
> +# Copyright (C) 2007,2009 Stelios Koroneos - Digital OPSiS, All Rights R=
eserved

Since this is a new file, is this copyright correct?

[=E2=80=A6]


Thanks and sorry if my question are nonsense,

Paul

--=-u8eC6OzV6AE9d1hRHoy/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksrjLYACgkQPX1aK2wOHVgcHgCdGQCUz7Gg32GbCp1FV69a4HLI
HwwAoIwN62TlAHp44P4RvSQJYfCvXDjS
=mcGA
-----END PGP SIGNATURE-----

--=-u8eC6OzV6AE9d1hRHoy/--
