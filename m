Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q1boi-00082Q-2N
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 10:54:28 +0100
Received: by bwz10 with SMTP id 10so4603423bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WjDEQImTbtXCIPr0MUc3cKjQHKHc7QYffp1qE4eZFAw=;
	b=i/oLDHavKyagF70N/bjODlPDcdbpKSkqCrJfyhWZq8a7ZQvoGEV31pq6d0bpzkRTkb
	KRpV5OalQMJtM0pqE2AE0ryIGpANz4VU5tlMlsIGAoJZUWCoatrK3fG7Ozgv+B1QOxZ6
	HfiYUiAztAxj2UJjJnke4tXe8Qb8lw+cU5ISo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KAP6EqrTDZPQlPtoFUEstkPsWC7C1S7iclRq4hQSrALAl3SEnEvW4slCjdBNSCx6gd
	1ecxUezAt7R/yHgLqNDrnEzByiFLykDQlOlW7IF1njPxBPqpWU8tmK/2C+F8fHZbTu9/
	6RA5s9HgRFV0pwyREN3kl+nBuKutnpic8wViI=
Received: by 10.204.153.20 with SMTP id i20mr3409177bkw.208.1300701159119;
	Mon, 21 Mar 2011 02:52:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x6sm321776bkv.12.2011.03.21.02.52.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 02:52:37 -0700 (PDT)
Date: Mon, 21 Mar 2011 10:52:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110321095235.GD3798@jama.jama.net>
References: <1298561156-21514-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1298561156-21514-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: define shared PERSISTENT_DIR
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
X-List-Received-Date: Mon, 21 Mar 2011 09:54:28 -0000
X-Groupsio-MsgNum: 30462
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline

--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2011 at 04:25:56PM +0100, Martin Jansa wrote:
> * import from poky
>   commit 6a11cf7dfe930461a6660e3b783b546fa2634900
>   Author: Richard Purdie <rpurdie@linux.intel.com>
>   Date:   Sun May 31 22:23:30 2009 +0100
> * we had CACHE var pointing to machine specific dir since
>   commit caf077679022f37ce55d758101f130e4e93bd7b5
>   Author: Richard Purdie <rpurdie@rpsys.net>
>   Date:   Mon Nov 20 17:40:20 2006 +0000
>=20
> * current bitbake is looking for cache dir like this:
>   cachedir =3D (bb.data.getVar("PERSISTENT_DIR", d, True) or
>               bb.data.getVar("CACHE", d, True))
>   which without PERSISTENT_DIR defined picks machine-specific CACHE dir
>   so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE switch
>   in same builddir :/
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

ping?

2nd version which moved it outside TMPDIR
[oe] [PATCH] bitbake.conf: define shared PERSISTENT_DIR and point it outsid=
e TMPDIR
was sort of rejected:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-March/000298.ht=
ml

but this part without moving it outside TMPDIR is still valid and I'll
push it after month of review if nobody objects :).

> ---
>  conf/bitbake.conf |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index dcc5c70..53bb7b7 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -294,6 +294,8 @@ FILESDIR =3D "${@bb.which(d.getVar('FILESPATH', 1), '=
=2E')}"
> =20
>  TMPDIR =3D "${TOPDIR}/tmp"
>  CACHE =3D "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d,=
 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
> +# The persistent cache should be shared by all builds
> +PERSISTENT_DIR =3D "${TMPDIR}/cache"
>  CO_DIR =3D "${DL_DIR}"
>  CVSDIR =3D "${CO_DIR}/cvs"
>  SVNDIR =3D "${CO_DIR}/svn"
> --=20
> 1.7.4.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2HH+MACgkQN1Ujt2V2gBzB7ACghQAhPiCdOhGAxLYWtfHNkiyn
1CIAn1X3jaod5cBGJ5HI8dihu/cjfDn4
=WrYq
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
