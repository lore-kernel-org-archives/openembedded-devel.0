Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBNAK-0002nY-I4
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 11:26:12 +0100
Received: by mail-da0-f51.google.com with SMTP id z17so1325912dal.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2013 02:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ldTFyrUiCsxUKW5nSwze4aduutNtbkrF0eKAY09KFBo=;
	b=gpg0ffxroYELQKYYc8cgLqMrG8H54kUkOvUoKUgH/aUxWeEXP13QHYtBIVcGueBo+V
	sIQ5lbhJlOBiK1nNz7LJ9cEHL4tnR9vXvIJO0BT7rHJ6mfF7Dd6CvU5iaXs/5D7Wfdrc
	j3hZH+8xBeMCMw1ua8n4MKE8QMpXvVlQSrjAg+0pitq7ogGMSuxI07uIdoIVAvIavXqf
	7KV1vWYh9VsNNz7aqKgCwaYf8wdP56NDRzHr287aZYnkXe2CUGph4NrRZ/kKgQ3WSqQK
	WEh0uRzjsa5qbpY5KCKagd//xiax1/0gvDmcKnhsuDNaDXq6bYjunOEBF8fS3lTvXAq6
	J9QQ==
X-Received: by 10.66.102.73 with SMTP id fm9mr17412212pab.195.1362132588552;
	Fri, 01 Mar 2013 02:09:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d8sm12585118pax.23.2013.03.01.02.09.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 02:09:46 -0800 (PST)
Date: Fri, 1 Mar 2013 11:09:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130301100938.GI3279@jama>
References: <1362129599-19779-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1362129599-19779-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jackie.Huang@windriver.com, Zhenfeng.Zhao@windriver.com
Subject: Re: [meta-webserver][PATCH] modphp5: use ${baselib} instead of hardcoded "lib"
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
X-List-Received-Date: Fri, 01 Mar 2013 10:26:13 -0000
X-Groupsio-MsgNum: 43347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="va4/JQ6j8/8uipEp"
Content-Disposition: inline

--va4/JQ6j8/8uipEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 05:19:59PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> [ CQID: WIND00405358 ]

Drop this ^

>=20
> The hardcoded lib path will cause apache2 fail to start on
> the target with other baselib like lib64.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-webserver/recipes-php/modphp/modphp5.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserv=
er/recipes-php/modphp/modphp5.inc
> index 3302936..c359ff9 100644
> --- a/meta-webserver/recipes-php/modphp/modphp5.inc
> +++ b/meta-webserver/recipes-php/modphp/modphp5.inc
> @@ -67,6 +67,7 @@ do_install  () {
>  	install -d ${D}${sysconfdir}/apache2/modules.d
>  	install -d ${D}${sysconfdir}/php/apache2-php5
>  	install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
> +	sed -i s,lib/,${baselib}/, ${WORKDIR}/70_mod_php5.conf
>  	install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/m=
odules.d
>  	cat ${S}/php.ini-production | \
>  		sed -e 's,extension_dir =3D \"\./\",extension_dir =3D \"/usr/lib/exten=
sions\",' \
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--va4/JQ6j8/8uipEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEwfmIACgkQN1Ujt2V2gBzItwCgpYK2XWgceiCUdoppP2yLGK3Q
ccAAoKwrqhkjRkwUlo23d0ml1kpDevci
=sanN
-----END PGP SIGNATURE-----

--va4/JQ6j8/8uipEp--
