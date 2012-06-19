Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SgtqC-0005SK-6V
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 10:31:12 +0200
Received: by bkcjm2 with SMTP id jm2so4632230bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2012 01:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aVLNJDFe2ZyWc/F1CykZghNjYRHJ1P2J2wXSJ0MgZh8=;
	b=BhBLwkGOV5Q5Xjml8CEsj2ZykKh77+mxa3Hbf60Ku2l7hlAPJCc7S9MVWAkupwOwga
	n0OeQhkhZyYQESeY5DTVp4ZzR8zkcXZjPUgiZHvLtH1kKGPjmDOPrWOLtSU/wSRFfERU
	X5s3WAUeRd7cs/RsJKjFRuqAdEgm4FDit0lIqT2zodZVHF3nBxmuWQwhsXdEB6rItV9d
	BuhuotdJbo0oAvj28yR0vzYqGxFYn5aZh+YGKYk1PyAXun6iMKuemuq7og/ORpdAQiyn
	CLlTMO+ZfD4j7Rvm6pgJb9DeJ0ehytBVSSmJq0RqEaojCLen5227EEiCauri3gAXeTSb
	p86Q==
Received: by 10.205.121.130 with SMTP id gc2mr7555054bkc.10.1340094029180;
	Tue, 19 Jun 2012 01:20:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e20sm21929381bkv.10.2012.06.19.01.20.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 01:20:27 -0700 (PDT)
Date: Tue, 19 Jun 2012 10:20:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120619082029.GR3178@jama.jama.net>
References: <1340047163-24689-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1340047163-24689-1-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] rfkill: use update-alternatives
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
X-List-Received-Date: Tue, 19 Jun 2012 08:31:12 -0000
X-Groupsio-MsgNum: 39294
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YttKMwf6abDJOSyE"
Content-Disposition: inline

--YttKMwf6abDJOSyE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2012 at 12:19:23PM -0700, Saul Wold wrote:
> Since oe-core added rfkill to busybox, this recipe needs to use u-a
> also.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/=
recipes-connectivity/rfkill/rfkill_0.4.bb
> index 561fdc7..548990c 100644
> --- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
> +++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "http://linuxwireless.org/en/users/Documenta=
tion/rfkill"
>  SECTION =3D "base"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc6036d0eb7edbfced28c4160e5d3f=
a94"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://wireless.kernel.org/download/${PN}/${P}.tar.bz2 \
>             file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrappe=
r-d.patch"
> @@ -16,3 +17,9 @@ do_compile() {
>  do_install() {
>          oe_runmake DESTDIR=3D${D} install
>  }
> +
> +inherit update-alternatives
> +
> +ALTERNATIVE_${PN} =3D "rfkill"
> +ALTERNATIVE_PRIORITY =3D "50"

Thanks for quick reaction, but something is wrong:

WARNING: rfkill: alternative target (/usr/bin/rfkill or /usr/bin/rfkill.rfk=
ill) does not exist, skipping...
WARNING: rfkill: NOT adding alternative provide /usr/bin/rfkill: /usr/bin/r=
fkill.rfkill does not exist
WARNING: alt_link =3D=3D alt_target: /usr/bin/rfkill =3D=3D /usr/bin/rfkill

(it's in /usr/sbin... )

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YttKMwf6abDJOSyE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/gNk0ACgkQN1Ujt2V2gByILgCgufPvOwcqxNKDnx/Lt8Zto2W0
TrcAn0EFENUsoJPkanmeK+r/DC2jqswU
=Wi82
-----END PGP SIGNATURE-----

--YttKMwf6abDJOSyE--
