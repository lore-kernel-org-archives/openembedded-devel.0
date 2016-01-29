Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6F57720F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 13:47:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 128so7778014wmz.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 05:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ExozBHeeEcLEjcpksw9pcA7XwRnM0P1dz5XvA8CjJE0=;
	b=ImZUNq3dk02K9a5kbBp0+J7iPIg963ap+geAsL6zSkbHlCD5ZO2ZCinmOsDIANSikw
	QDA4KziD/ReJO9UMH5hwTIA9DAimsPrm6DSmc76zZa3dSY8d9hPKUA0Pjvtwuj7pIsXg
	C5GuixRV44b5mTw2jEGVvOAfq8ftSeL8FMkludI9WUITA3DkyILKgT5CFVJrV63gH8oH
	UNxVnHNIRjadr0vvOzJ+tAOmgokoDYKE6gPiief3iEata+mnw1FnS67EjbH4Y4RZ1rWq
	gAk49NgDbNYBIAeY6t+Fp/F+GPuvcUiq0B8FtdEL8FWZ4qCkSMLCiRU87N6/tvU/X1Y6
	GVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ExozBHeeEcLEjcpksw9pcA7XwRnM0P1dz5XvA8CjJE0=;
	b=NrKWAXlhAAx4unrg65XEFfC1GQICww7mTaDURqJAy209UPjUnNRCx7Ywv/qdLkHRrI
	rVV6AmP/7YSylt5OFec7BQ4ZDH7zv+bdDv9fPYW6vBv9Oi4bQ6rj6smaqNaTQtpllz2o
	tlJsW7wN1Wyn17jR1mcC61YXbU0SeRVNlwxSymC7TZdeaLHh2iXuAk4TxC3HUW0+7JK+
	chOkrMUbqgwDAavMgTElW1AvrAWedJuvJt7EX0UgEmH4hyfH4WOA9yHnrXbmS5rsv3mV
	mWGM7+qD57jtgBMKxLFyIIbFFgJVahfDdumr0YNkEfPVsiCFFNwEpk9R0aVTbjTLQN2X
	ssOQ==
X-Gm-Message-State: AG10YORbQ2ojG7fLBskTR7Kfk3T7PsIaUgSD8EmmGpgVJBRiwC50xIqQctD+qKdXW9u2mQ==
X-Received: by 10.194.117.134 with SMTP id ke6mr10194052wjb.94.1454075230365; 
	Fri, 29 Jan 2016 05:47:10 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b1sm15808053wjy.0.2016.01.29.05.47.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jan 2016 05:47:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 29 Jan 2016 14:49:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160129134934.GA2574@jama>
References: <397caaab4cdf263cb23cb988bbc100ee5e264261.1454072848.git.adrian.ratiu@ni.com>
	<97ec018d13981913df887195ca467ba75f2eb3b9.1454072848.git.adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <97ec018d13981913df887195ca467ba75f2eb3b9.1454072848.git.adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH 2/2] apache2: enable openldap support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jan 2016 13:47:11 -0000
X-Groupsio-MsgNum: 59756
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2016 at 03:08:34PM +0200, Ioan-Adrian Ratiu wrote:
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> index 8ca6d00..d20ac09 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The Apache HTTP Server is a powerful, ef=
ficient, and \
>  extensible web server."
>  SUMMARY =3D "Apache HTTP Server"
>  HOMEPAGE =3D "http://httpd.apache.org/"
> -DEPENDS =3D "libtool-native apache2-native openssl expat pcre apr apr-ut=
il"
> +DEPENDS =3D "libtool-native apache2-native openssl expat pcre apr apr-ut=
il openldap"
>  SECTION =3D "net"
>  LICENSE =3D "Apache-2.0"
> =20
> @@ -44,6 +44,8 @@ EXTRA_OECONF =3D "--enable-ssl \
>      --with-apr-util=3D${STAGING_BINDIR_CROSS}/apu-1-config \
>      --enable-info \
>      --enable-rewrite \
> +    --enable-ldap \
> +    --enable-authnz-ldap \

Can we use PACKAGECONFIG for this, not everybody with apache will want
openldap support.

>      --with-dbm=3Dsdbm \
>      --with-berkeley-db=3Dno \
>      --localstatedir=3D/var/${BPN} \
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlarbe0ACgkQN1Ujt2V2gBzrgQCfT30xz2ZH8DC0U27oL3HzBzKP
RiwAni8MWN2nBEwaVkUTS28J4bNASL1x
=mdjH
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
