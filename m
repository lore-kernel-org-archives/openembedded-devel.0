Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ual1c-0005v9-UZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 12:58:15 +0200
Received: by mail-ea0-f180.google.com with SMTP id g10so843952eak.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rPhRtrPOejUAnlllnCTV+Z8+JXNS/ebwtbxzL0IXloo=;
	b=DguM7VWoV3Z0NyK2lFXhUXX+8l6IjTF253fMm8tuQutQ6BqhOQK3/8z7iXi75iHYou
	szfMCzPGMb22GurDweFan74W8K34IL8T4acazp1rusIWh51t+FMZa/Cul/N7+OfAh/NM
	hOepOAbio5/Acw1qoiJsytXOxxV7hUysG4cUo93CiaOTmbVm2062VgMpRcLBGp9WxpWT
	QqM9ePIC1QGb9ISFjLx7QbX1VsrFrWtPci3zplPV/tUFB2uGI3HQxibSXzzuCM9Y9s37
	/II2t+MBAEMNgwNVldx47e82UnDk6f9jVxxWAA25ZrH8KkwqTXmNYPlrmXBxvAMQMogY
	FbnQ==
X-Received: by 10.14.4.199 with SMTP id 47mr12608813eej.29.1368182401793;
	Fri, 10 May 2013 03:40:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id i3sm2794056eev.1.2013.05.10.03.40.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 03:40:01 -0700 (PDT)
Date: Fri, 10 May 2013 12:40:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130510104002.GC12329@jama.dyndns-home.com>
References: <1368113145-17108-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1368113145-17108-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe PATCH] samba: Add usershare directory to the package
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
X-List-Received-Date: Fri, 10 May 2013 10:58:30 -0000
X-Groupsio-MsgNum: 44652
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2013 at 12:25:45PM -0300, Otavio Salvador wrote:
> Change-Id: I0d9ad638c62cca929cded60752dbf75fc100017f
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-connectivity/samba/samba.inc      |    3 +++
>  meta-oe/recipes-connectivity/samba/samba_3.6.8.bb |    2 +-
>  2 files changed, 4 insertions(+), 1 deletions(-)

Is this from danny? Please rebase and test your patches in master when
you're sending them for master.

I did it manually again and also removed Change-Id.

> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recip=
es-connectivity/samba/samba.inc
> index 3ee43ad..f9a54a2 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -92,6 +92,9 @@ do_install_append() {
> =20
>  	rmdir ${D}${base_sbindir}
>  	sed -i -e '1s,#!.*perl,#!${USRBINPATH}/env perl,' ${D}${bindir}/findsmb
> +
> +	# usershare mount place
> +	mkdir -p ${D}${localstatedir}/lib/samba/usershares
>  }
> =20
> =20
> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/=
recipes-connectivity/samba/samba_3.6.8.bb
> index 35d20c5..917c826 100644
> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> @@ -3,7 +3,7 @@ require samba-basic.inc
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
> =20
> -PR =3D "r7"
> +PR =3D "r8"
> =20
>  SRC_URI +=3D "\
>      file://config-h.patch \
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGMzoIACgkQN1Ujt2V2gBwAvACgon5bwC17W9nzTSClNRi99mXd
ahgAn1S3V6vOgWf+QahQVBGsdT0R+5UN
=89kf
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
