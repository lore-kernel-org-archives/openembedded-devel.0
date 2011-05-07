Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QIikK-00053y-6J
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 16:44:40 +0200
Received: by fxm19 with SMTP id 19so3230054fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=oMu45BAVBvrTbnFqiRR29oUCWFD57nqrKA9nl2cbqaU=;
	b=dppM3gLjTD5CL7dugKSR3utR5Ww7BaYCOQ8jszN0+9AUFJUOJqMmAw38zZ1CTTpoub
	lizCPdY4qbGOOlluVI51y/m/RB5qvQLiwBr+htTn1uyBjPZ0PVwJSp1X8C9gh6WHgh7m
	+7kvUspsVLcC2Jeko0C6PMtOPj0q8Zq0JJu+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ED34tHLUWRrYc9ge3heXB7G1YkIPScpXBk2lG9UirwV4ELREZYP4YjpczoJsXmS7RE
	N1bjOQqenqiQ0FPLSMS/N12ht+RUO5vPiEVORXTdXUhmjrK4boTDzGBVKR/Y8fx9qbV9
	I7FhW0wgl+rh1znamkzORer+HGpxTNcePJY/o=
Received: by 10.223.29.132 with SMTP id q4mr668832fac.17.1304779317405;
	Sat, 07 May 2011 07:41:57 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id r26sm1402983fam.10.2011.05.07.07.41.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 07:41:56 -0700 (PDT)
Date: Sat, 7 May 2011 16:41:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110507144149.GE17773@jama.jama.net>
References: <1304771252-27933-1-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1304771252-27933-1-git-send-email-koen@openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH] Connman: add dnsmasq-dbus to RRECOMMENDS to fix DNS proxy
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
X-List-Received-Date: Sat, 07 May 2011 14:44:40 -0000
X-Groupsio-MsgNum: 31684
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Content-Disposition: inline

--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 07, 2011 at 02:27:32PM +0200, Koen Kooi wrote:
> Connman writes '127.0.0.1' to resolv.conf by default expecting dnsmasq to=
 be there

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/connman/connman.inc     |    2 ++
>  recipes/connman/connman_0.73.bb |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/connman/connman.inc b/recipes/connman/connman.inc
> index abe8c64..673d509 100644
> --- a/recipes/connman/connman.inc
> +++ b/recipes/connman/connman.inc
> @@ -62,6 +62,8 @@ FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}=
/* ${libdir}/lib*.so.* \
> =20
>  # Package up systemd files
>  FILES_${PN} +=3D "${base_libdir}/systemd"
> +# Needed when using DNS proxy feature
> +RRECOMMENDS_${PN} +=3D "dnsmasq-dbus"
> =20
>  FILES_${PN}-test-utils +=3D "${libdir}/connman/test/*"
> =20
> diff --git a/recipes/connman/connman_0.73.bb b/recipes/connman/connman_0.=
73.bb
> index 3d0815f..a0c21b6 100644
> --- a/recipes/connman/connman_0.73.bb
> +++ b/recipes/connman/connman_0.73.bb
> @@ -1,7 +1,7 @@
>  require connman.inc
>  # connman requires libXtables now
>  DEPENDS +=3D "iptables"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  EXTRA_OECONF +=3D "\
>    --disable-gtk-doc \
> --=20
> 1.6.6.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3FWi0ACgkQN1Ujt2V2gBx6bACfVqUBuA7eLXw6sUPpe1Jk1E9L
Fu4An1VLie21eDPsA82ZzYD8RIMRh0D0
=Wx3W
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--
