Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXueW-0006tC-Ff
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 16:38:37 +0200
Received: by mail-pb0-f52.google.com with SMTP id xa7so373401pbc.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2013 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XnLFKu/MtJB1GTXmw4PzhbhpdE13U8sT+SNMvEE1Lsw=;
	b=akMpDCXc1plmHbRhGZLkTShd/iNX88O+9dIHxcxUGmuhApR2jRwJ/uupClFpcDSTHs
	J4hC2oY8KuVgkiDNBHgmYtmnqZW5nznpZ93Dx1haS+zGTKCFXleG3bmF/dQqv+hzIxVP
	4fo4KW0AhfxilmEuxqtRtmYyN6xTs1xWZ1+6gBY+Nh0zbEUpuWw5bH5rSHynQ7Q0j+v1
	75fzYldaapJ7nZTOFxWSC4DipXhMpTru/4M689zUQfb3V132ojBgZuLDgEtWJP2qbaw/
	aAxDV1qcgBuhuVbYaDQV/BbIcRD6IR/FXj4ROpAl/VlyH+Pif+UrlskTyiILk+A6yxjf
	2MZw==
X-Received: by 10.68.226.106 with SMTP id rr10mr9091569pbc.127.1367504438199; 
	Thu, 02 May 2013 07:20:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	zo4sm5873431pbc.21.2013.05.02.07.20.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 02 May 2013 07:20:37 -0700 (PDT)
Date: Thu, 2 May 2013 16:20:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130502142054.GB3206@jama>
References: <1367309275-9232-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1367309275-9232-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] sip-native: fix SRC_URI
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
X-List-Received-Date: Thu, 02 May 2013 14:38:57 -0000
X-Groupsio-MsgNum: 44542
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2013 at 10:07:55AM +0200, Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Is this for danny?

Master and dylan have 4.14.2, which needs similar patch, but this one
does not apply.

> ---
>  meta-oe/recipes-extended/sip/sip-native_4.13.3.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb b/meta-oe/=
recipes-extended/sip/sip-native_4.13.3.bb
> index c20683f..c7be0b4 100644
> --- a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
> +++ b/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
> @@ -5,7 +5,7 @@ SECTION =3D "devel"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://sipgen.sbf;endline=3D15;md5=3D88e887a386c18=
a01240d8d055da4e441"
> =20
> -SRC_URI =3D "http://www.riverbankcomputing.co.uk/static/Downloads/sip4/s=
ip-${PV}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.=
tar.gz"
>  SRC_URI[md5sum] =3D "76192829cc42ec558db46e4f9e1d8ba9"
>  SRC_URI[sha256sum] =3D "ec295f71ef339c5b98db5650865f2c6c1200c4085b7a3f33=
f284111e1f534ac1"
>  S =3D "${WORKDIR}/sip-${PV}/sipgen"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGCdkYACgkQN1Ujt2V2gByi1ACeIdRpI1OhWa/OyWfIfOKaNCPD
ro0AoLr2CDFsutvN4c2y/Jx4LoJT+hy/
=Qh4x
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
