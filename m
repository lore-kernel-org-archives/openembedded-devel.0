Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmseT-0005JC-7e
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 22:27:49 +0200
Received: by weyr6 with SMTP id r6so2563158wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2012 13:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=akraGnbfCwqdF3Utb9K4f0xBVeV89LeMMQFXH6E0aWM=;
	b=w98GhFSa1zcOH2Iep2rI8CWvY5U3J9v9Q/FHA+8F5of8RpY1yUOis6Qe93DsvYzM4n
	BjGQ8xdqTXZ3OIMvvHUdNZxvenbftXmhMmeviz7NQxmhIJWzY6N0Ptuj/xcOriHb3T52
	rZqSXseXnAMx8s7Rj7Lq00AScVyIFoh50IX8om1HtBUNaEVwRlAMwTOUvMZzVh/VZJq6
	hLzRcW8a7yURIjH0PnZ6MC5KdI0WlOjk4XQ5p8AkAtVe5xEfqEyL300Eo7Il1TwfEBZv
	zwIQfcwpqQIlK+NKkKEZErBQ7YPVaP+xJorhAdZf8IGBQ4ei33s+AsfvbMwDpoKGeNY9
	VgWA==
Received: by 10.216.92.193 with SMTP id j43mr9554926wef.114.1341519404553;
	Thu, 05 Jul 2012 13:16:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm1808845wib.8.2012.07.05.13.16.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 13:16:43 -0700 (PDT)
Date: Thu, 5 Jul 2012 22:16:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120705201635.GC3708@jama.jama.net>
References: <1341518383-20990-1-git-send-email-elvis.dowson@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1341518383-20990-1-git-send-email-elvis.dowson@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-openembedded] lighttpd: Rename to lighttpd_1.4.31.bbappend.
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
X-List-Received-Date: Thu, 05 Jul 2012 20:27:49 -0000
X-Groupsio-MsgNum: 39496
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline

--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2012 at 11:59:43PM +0400, Elvis Dowson wrote:
> This commit renames the lighttpd bbappend file to match the recipe version
> provided in poky/meta-oe/recipes-extended/lighttpd

This ^ doesn't make sense to me.

Recipes are provided by oe-core and path
poky/meta-oe/recipes-extended/lighttpd doesn't exist in poky repo AFAIK.

Cheers,

>=20
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
>  .../lighttpd/lighttpd_1.4.30.bbappend              |   10 ----------
>  .../lighttpd/lighttpd_1.4.31.bbappend              |   10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bba=
ppend
>  create mode 100644 meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bba=
ppend
>=20
> diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend b=
/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> deleted file mode 100644
> index 1341405..0000000
> --- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
> -
> -PRINC :=3D "${@int(PRINC) + 3}"
> -
> -inherit systemd
> -
> -SRC_URI +=3D "file://lighttpd.service"
> -
> -SYSTEMD_PACKAGES =3D "${PN}"
> -SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"
> diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b=
/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
> new file mode 100644
> index 0000000..1341405
> --- /dev/null
> +++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
> @@ -0,0 +1,10 @@
> +FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
> +
> +PRINC :=3D "${@int(PRINC) + 3}"
> +
> +inherit systemd
> +
> +SRC_URI +=3D "file://lighttpd.service"
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/19iMACgkQN1Ujt2V2gBwregCfR+D6r4dxlGrYLlUWg2wSgZYQ
NP0AnRYnvNImRLLLIvxcaDPRexxgGCA6
=Uem5
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
