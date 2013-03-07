Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDbRV-0005d9-CK
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 15:05:12 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so392746pbc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 05:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dKEMh/FekZVHmG2yPDjcbttMHlw3yKb9dQWYNdN2cYA=;
	b=KvX6WuCH8r0+DRKL9AakzPyfYI50KgUbAU3h0tEf+qe8gdFlNQW/fc/tX9Spei60bD
	H1yGQgVjAzELLgajoHzCZqYh957fGKnoXC0NgPMNnuApuPzR6suIhBBwopykJ9cf+Qj2
	JGed8UvuAQ+NX/iDQeOKv4/aqrsqe6Ze7m+l8esaMIy+wxazDQz3Xaz45Ph9RtggZFjo
	VcsCTxkiqwOCLfErYClbD9r8d0IilFOqzBKEH2KY41zY94rBar3trB1sfmIKE+z8/itq
	5mCY99Vmcg0JF55aIyW19kDFX97n29vivyxylnyz+gdZX/VUFtTjnFQR8d09oU/aQyJJ
	4RaA==
X-Received: by 10.66.157.200 with SMTP id wo8mr2973240pab.37.1362664116610;
	Thu, 07 Mar 2013 05:48:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eh5sm1751708pbc.44.2013.03.07.05.48.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 05:48:35 -0800 (PST)
Date: Thu, 7 Mar 2013 14:48:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130307134831.GL32228@jama.dyndns-home.com>
References: <1362662097-13544-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1362662097-13544-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] samba: fix install for older samba versions
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
X-List-Received-Date: Thu, 07 Mar 2013 14:05:15 -0000
X-Groupsio-MsgNum: 43420
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wA9WyeW1yVBM2Q32"
Content-Disposition: inline

--wA9WyeW1yVBM2Q32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 02:14:56PM +0100, Andreas Oberritter wrote:
> * Samba 3.0 doesn't build libbss_*.so

libnss_*.so

> * base_sbindir may contain mount.cifs
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-oe/recipes-connectivity/samba/samba.inc |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recip=
es-connectivity/samba/samba.inc
> index 3ee43ad..a151b16 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -87,10 +87,12 @@ do_install_append() {
>  	install -d ${D}/var/spool/samba
> =20
>  	# Install other stuff not installed by "make install"
> -	install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}$=
{libdir}/libnss_winbind.so.2
> -	install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${li=
bdir}/libnss_wins.so.2
> +	if [ -d ${WORKDIR}/${PN}-${PV}/nsswitch ]; then
> +		install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}=
${libdir}/libnss_winbind.so.2
> +		install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${l=
ibdir}/libnss_wins.so.2
> +	fi

It looks weird, but ${S}/../nsswitch won't be much better I guess.

> -	rmdir ${D}${base_sbindir}
> +	rmdir ${D}${base_sbindir} || true

Maybe use
              --ignore-fail-on-non-empty

instead of || true.

>  	sed -i -e '1s,#!.*perl,#!${USRBINPATH}/env perl,' ${D}${bindir}/findsmb
>  }
> =20
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

--wA9WyeW1yVBM2Q32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4mq8ACgkQN1Ujt2V2gBxhvgCePRUAJ6z8g2c4rZbM9qjkuUpu
1L8An2p9lcG+fNdOu/n6u9iUy4NgJr5k
=tjZs
-----END PGP SIGNATURE-----

--wA9WyeW1yVBM2Q32--
