Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF047289F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:26:10 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id k14so11792059wgh.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 08:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F1amEX/DnC78m95J15EDHGHkMD7Xfa4drt4Mly40yQQ=;
	b=xS2PDFou8TnSNdREqm7kaFt3ycOeq4x20Oji098wmHH8PZmfSNrd+5MhwdiK1ZR3/2
	5V88XKRr9hGT6A1XUm1ripVFGChWvchjY7wxUw+sVUfTPc/VOUVAhbKdmYLSxMwWz0yC
	74wMjhHPHcp0FhU7pjoouM0nYVRrgrrdPjzjfWQqJJN7krZ5KAgKeNJIQ91NRVb5OqXh
	CIxnWPlQmtcj0qzWvCw9W1fsVFCUwFHpCstONNx15U0005IB5m7EpmRQIAX2o15A9hrj
	03flcJM85X2+7+L0EKHpAX39FrICG3QL7TjgVmHQPwjscIrG+H/qg4IPzgdbsQIW91DT
	C02g==
X-Received: by 10.194.60.243 with SMTP id k19mr90807341wjr.88.1420561569471;
	Tue, 06 Jan 2015 08:26:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fp2sm14532505wib.8.2015.01.06.08.26.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 08:26:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 17:26:10 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150106162610.GA12498@jama>
References: <1420559960-8518-1-git-send-email-akuster808@gmail.com>
	<1420559960-8518-2-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1420559960-8518-2-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 1/2] proftpd: fix rdepends issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2015 16:26:16 -0000
X-Groupsio-MsgNum: 53697
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 07:59:19AM -0800, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/m=
eta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> index cba39e8..7d285a0 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> @@ -99,4 +99,4 @@ USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} --home=
-dir /var/lib/${FTPUSER} --
> =20
>  FILES_${PN} +=3D "/home/${FTPUSER}"
> =20
> -RDEPENDS_${PN} +=3D "perl"
> +RDEPENDS_${PN} +=3D "perl initscripts-functions"

It's not that simple.

The initscripts-functions is added to RDEPENDS conditionally based on
"sysvinit" in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS.

Adding it explicitly here will pull it to image even for people who
care only about systemd services (and don't want any iniscripts to
pollute their startup sequence).

See meta/classes/update-rc.d.bbclass

I know we already have one recipe like this:
meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb:RDEPENDS_${PN} +=3D "inits=
cripts-functions"

but honestly silencing this warning like this does more harm then
the warning. I think it should be fixed in bbclass, because all
recipes which inherit it, suffer from this. Maybe by adding another
VIRTUAL_RUNTIME which can be set to empty when sysv isn't enabled.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSsDKIACgkQN1Ujt2V2gBz7ngCfUTp6vnE85xGniH30NFvSs0rD
E5kAoJg2yHJln2CjaE+nQeRrBD7ev7FV
=N3d7
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
