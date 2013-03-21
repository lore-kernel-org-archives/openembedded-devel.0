Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UImaE-0006Dl-Of
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 21:59:36 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so2505929pbc.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qVjagpQ5bRiOvZ8fKwlyfuucPyo84sFG7IV+bjt2v8U=;
	b=zxyypPEXG7vcJJShp8X1811idDBVSXSrkq5JNSPLpHnSlZOmxsj6VRy8Ro7XztbsfK
	g1V6upqiR+1mdoBcP/APercctokq43rXHr7l/0q3IWLUJNw0tw0aBxnh5jvDZV4+VooA
	kJxLc8IJIHYeFoKvHQ8aGnXY9qxuWz80lvthmKyLMBRRYmo+XCaokFTNBUULx40mqBlW
	LmKUhVMvG4D6pJ4sepH83vOoXgaN1p8ZpbGaCFZibvL4vROZWXKQs2dAFlzqdp0N10p2
	kTvRdqi7aGxeHrDDN3pbnJhoj1Oeuj6grjmWq/ZrqXYrFR+HLrxC7QErDvaIbnwGQZaf
	BZAg==
X-Received: by 10.66.191.105 with SMTP id gx9mr17095157pac.15.1363898561344;
	Thu, 21 Mar 2013 13:42:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y1sm7262335pbg.10.2013.03.21.13.42.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 21 Mar 2013 13:42:40 -0700 (PDT)
Date: Thu, 21 Mar 2013 21:42:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130321204237.GA3219@jama>
References: <1363897098-26498-1-git-send-email-joe.macdonald@windriver.com>
	<1363897098-26498-2-git-send-email-joe.macdonald@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1363897098-26498-2-git-send-email-joe.macdonald@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] cyrus-sasl2: clean up rpath QA errors
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
X-List-Received-Date: Thu, 21 Mar 2013 20:59:43 -0000
X-Groupsio-MsgNum: 43641
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2013 at 04:18:18PM -0400, Joe MacDonald wrote:
> Cleaning QA errors from commit 770b14191143fd89fa18daa4048af1f618debdee
>=20
> Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
> ---
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26=
=2Ebb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index 44336f0..7b3e674 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -11,7 +11,8 @@ inherit autotools pkgconfig
>  EXTRA_OECONF +=3D "--with-dblib=3Dberkeley \
>                   --with-bdb-libdir=3D${STAGING_LIBDIR} \
>                   --with-bdb-incdir=3D${STAGING_INCDIR} \
> -                 --without-pam --without-opie --without-des"
> +                 --without-pam --without-opie --without-des \
> +		 andrew_cv_runpath_switch=3Dnone"

Please don't mix tabs and spaces for indentation.

> =20
>  do_configure_prepend () {
>      rm -f acinclude.m4 config/libtool.m4
> --=20
> 1.8.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFLcL0ACgkQN1Ujt2V2gBxF6QCfSZMHNtW3QLmnNi1b2nqC+0J9
GvwAnRimpc3f6JhXzeQcExvXHCI/pGvQ
=DA3L
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
