Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcZRT-0001LV-PU for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 10:51:15 +0200
Received: from g225141094.adsl.alicedsl.de ([92.225.141.94]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcZNz-00085M-OH for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 08:47:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
References: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 01 Jul 2011 10:47:29 +0200
Message-ID: <1309510049.4418.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH] systemd_git.bb: Alias mkostemp() to mkstemp() for uclibc targets
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
X-List-Received-Date: Fri, 01 Jul 2011 08:51:16 -0000
X-Groupsio-MsgNum: 32929
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-OB5ySqQv8M9njjBOAJvN"

--=-OB5ySqQv8M9njjBOAJvN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.06.2011, 22:38 -0700 schrieb Khem Raj:

As far as I know the `bb` extension should be omitted in the commit
summary?

> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Does systemd build for you with this patch and uClibc?

> ---
>  .../systemd/systemd/paper-over-mkostemp.patch      |   19 ++++++++++++++=
+++++
>  meta-oe/recipes-core/systemd/systemd_git.bb        |    3 ++-
>  2 files changed, 21 insertions(+), 1 deletions(-)
>  create mode 100644 meta-oe/recipes-core/systemd/systemd/paper-over-mkost=
emp.patch
>=20
> diff --git a/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.pat=
ch b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
> new file mode 100644
> index 0000000..ca10440
> --- /dev/null
> +++ b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
> @@ -0,0 +1,19 @@
> +uclibc does not have mkostemp() so we redefine it to use mkstemp()
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

Is that patch for upstream inclusion?

[=E2=80=A6]


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines

--=-OB5ySqQv8M9njjBOAJvN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4NiaAACgkQPX1aK2wOHVjMtgCggZQIyKtg67OGzDWPmO1qVqLJ
fO8AnAjPjI8FM8ZaEOacvlVTbjFDWjSY
=7b8g
-----END PGP SIGNATURE-----

--=-OB5ySqQv8M9njjBOAJvN--
