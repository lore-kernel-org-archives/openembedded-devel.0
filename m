Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Suigr-0002D0-Ll
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jul 2012 13:26:41 +0200
Received: by wgbdr1 with SMTP id dr1so2409517wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pnXV83XTvhza4rZtdZNtOolur7ReCeAXM4PSsml5y94=;
	b=UEziwjFattCmCBwk8UdAs0VLdW9XJnSkEu0hEI9sfto/vQaBEZkZJPVTzc8Z/FVWZG
	bWXuG2y8v1vC8Yi/zNuTAuCmQbngGRvcMhASQVokltJtneOhehtFFcoa7tYjGrS5qsmU
	ehEBSZLZ+Y5LYCdci7E4Jg4kp/7Cn8RgVuVIKQkvj269aD9w35lg+3DgHAkCRvAiJ235
	DVt4NstOzLUcADq9Nms+hcmZuu3ElRXmYHYv8fe/mYnGzkaaP+dZbvbSSuTxIt8PsK49
	R+/J2wLWjVtEQJw5suZg91/4LakwDZXseRzMn5paXAYuB/W2V01IESB+qh13GaWu8WCD
	Pw0w==
Received: by 10.180.96.3 with SMTP id do3mr5335066wib.5.1343387709975;
	Fri, 27 Jul 2012 04:15:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm5729450wiz.11.2012.07.27.04.15.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:15:09 -0700 (PDT)
Date: Fri, 27 Jul 2012 13:15:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120727111515.GI3621@jama.jama.net>
References: <1343387407-18340-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1343387407-18340-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][RFC] tcpdump: bump PR to rebuild against libpcap1 instead libpcap
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
X-List-Received-Date: Fri, 27 Jul 2012 11:26:41 -0000
X-Groupsio-MsgNum: 39897
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WR+jf/RUebEcofwt"
Content-Disposition: inline

--WR+jf/RUebEcofwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2012 at 01:10:07PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

s/RFC/PATCH/g

sorry wrong bash history line..

> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb b/meta-oe/r=
ecipes-support/tcpdump/tcpdump_4.1.1.bb
> index 9fd0ac0..46b19a1 100644
> --- a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
> +++ b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d4b0366557951c84a94fabe3529f=
867"
>  SECTION =3D "console/network"
>  DEPENDS =3D "libpcap"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D " \
>  	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
> --=20
> 1.7.8.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WR+jf/RUebEcofwt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlASeEMACgkQN1Ujt2V2gBx9BwCggWYnoLGNSBS9c5QAgGqvkO1K
pmQAni0V5EJ1P7nN4NRRG6BpYoyXkLdt
=RXAN
-----END PGP SIGNATURE-----

--WR+jf/RUebEcofwt--
