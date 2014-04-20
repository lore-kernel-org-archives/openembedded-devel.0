Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id AB15E65D96
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 10:34:37 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2881416eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 03:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F6rzcWybA5mrIbk/SEuweqtlNs1pLeJR3ggK/1Efzec=;
	b=adz6rpz2xe0aohIUMnojDqG9GoeduneCVH8eSawwoNUIxM9fO55GOAVmn3W4XX+ZTw
	dHUZmlG9KFn10/n4d8ppjFBV7owgKEw9DiJ55bS4JKc4yOlc8hcAW8e5MOj806mrWIa8
	qKtUA425qqYXpyu3mIwGFtoYPMLWHjY/2LUZEzQa3OR0tZCxgBr7cbGQwAVgZNIJ6N6C
	CS5A7DzQuF4t0QKFTCg3fEsfC64OF6t85OPAPrKQRfy1dnwih3LFo/y1d9u2iChca4pt
	jdLWXVS2oxuxMLdZJMesErUi4hqdCxpqOe6lRC/4tawY7bAbqkCOSNFf56DOV0JIbjHW
	ychQ==
X-Received: by 10.15.111.206 with SMTP id cj54mr37691352eeb.8.1397990078270;
	Sun, 20 Apr 2014 03:34:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm93450479eeg.4.2014.04.20.03.34.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 03:34:37 -0700 (PDT)
Date: Sun, 20 Apr 2014 12:34:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420103441.GL2486@jama>
References: <1397581965-24301-1-git-send-email-jacob.kroon@mikrodidakt.se>
MIME-Version: 1.0
In-Reply-To: <1397581965-24301-1-git-send-email-jacob.kroon@mikrodidakt.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] populate_sdk_qt5.bbclass: Fix PACKAGE_GROUP deprecation warning
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
X-List-Received-Date: Sun, 20 Apr 2014 10:34:41 -0000
X-Groupsio-MsgNum: 49319
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXhH8iG0/4JcYZU2"
Content-Disposition: inline

--BXhH8iG0/4JcYZU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2014 at 07:12:45PM +0200, Jacob Kroon wrote:
> Fixes the following warning:
>=20
> WARNING: PACKAGE_GROUP is deprecated, please use FEATURE_PACKAGES instead

It's correct patch, but I'm a bit tempted to take this patch after
branching daisy, because some people are using latest meta-qt5 with
older oe-core releases and this undoing this change is easy to miss
(unlike e.g. cmake .bbappends which fail when not updated for correct
oe-core releases).

What do you think?

Alternatively we can add wiki page about using latest meta-qt5 with
older oe-core and just document this there.

> Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
> ---
>  classes/populate_sdk_qt5.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.=
bbclass
> index c921983..7b31bbb 100644
> --- a/classes/populate_sdk_qt5.bbclass
> +++ b/classes/populate_sdk_qt5.bbclass
> @@ -53,4 +53,4 @@ toolchain_create_sdk_env_script_append () {
>      echo 'HostBinaries =3D ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >=
> $qtconf
>  }
> =20
> -PACKAGE_GROUP_qtcreator-debug =3D "packagegroup-qt5-qtcreator-debug"
> +FEATURE_PACKAGES_qtcreator-debug =3D "packagegroup-qt5-qtcreator-debug"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BXhH8iG0/4JcYZU2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTosEACgkQN1Ujt2V2gBx22ACeL9gIs8LyqytskUEt8vqrsV0V
uo4AnApMLc/CyPHHT4YuFrpLX/9g38Ql
=IA1U
-----END PGP SIGNATURE-----

--BXhH8iG0/4JcYZU2--
