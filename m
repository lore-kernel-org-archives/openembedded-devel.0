Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id B343F6EC7B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 15:01:53 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id o10so2587172eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 07:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dZA+rEZ7SpLVjZ/upV9GqgftE7zRqJs5zIsvMwxaLK0=;
	b=d3MaF8C/qwVheipxGpV0HOAZuy5olwJv/y+OFHkOjbOyNlksWTmS6BL6FbRG/kIlc8
	J4m6TmqsaK1r/9CKBZPCJFZpWg/YMofzqS00tI7bdem1OmDqsdLnOUiTN77PwTfVoAz2
	X445AO6Lcfth70aYdpes7r2WSKOY+xlHSC6YaUfms5Xrh8pCAjHWqsidPoRyGFfKsnG7
	JVSYD25ZcC7iqOBBuTWF9vkrkAQhkK3xFDnP+p0kYCzc+MiQG5Ux0ajSmPfpmXh3BzwE
	0m3LKPujkobiF+iCb22vAV6Os6q1TJZvOchGuu8q/O2ALt5Lsu/t0Gcv2MBuHAqGQ2XR
	+x1w==
X-Received: by 10.14.176.66 with SMTP id a42mr19363405eem.101.1393167713982;
	Sun, 23 Feb 2014 07:01:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm50250074eeh.13.2014.02.23.07.01.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Feb 2014 07:01:49 -0800 (PST)
Date: Sun, 23 Feb 2014 16:02:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140223150227.GT3854@jama>
References: <1393163414-9494-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1393163414-9494-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH v2 1/4] qmake5_base.bbclass: Use Qt version path for headers
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
X-List-Received-Date: Sun, 23 Feb 2014 15:01:56 -0000
X-Groupsio-MsgNum: 48282
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nDmTXYS4kVhtHHfR"
Content-Disposition: inline

--nDmTXYS4kVhtHHfR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2014 at 10:50:11AM -0300, Otavio Salvador wrote:
> When looking for Qt5 headers we ought to use the Qt5 specific path. In
> case the distribution wants to have a flat tree it can set QT_DIR_NAME
> and it will still works as expected.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  classes/qmake5_base.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 3861cd0..db6834f 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -57,7 +57,7 @@ do_generate_qt_config_file() {
>      cat > ${QT_CONF_PATH} <<EOF
>  [Paths]
>  Prefix =3D ${OE_QMAKE_PATH_PREFIX}
> -Headers =3D ${OE_QMAKE_PATH_HEADERS}
> +Headers =3D ${OE_QMAKE_PATH_HEADERS}/${QT_DIR_NAME}

classes/qmake5_paths.bbclass:OE_QMAKE_PATH_HEADERS =3D "${includedir}"

is the right place

>  Libraries =3D ${OE_QMAKE_PATH_LIBS}
>  ArchData =3D ${OE_QMAKE_PATH_ARCHDATA}
>  Data =3D ${OE_QMAKE_PATH_DATA}
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nDmTXYS4kVhtHHfR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMKDYMACgkQN1Ujt2V2gBxckwCeO75xgCAv7F3nI3EnsmMBjjcf
9tQAn0gSQ/gt5EyAHVNeNy8kn1yPsLwv
=4nYw
-----END PGP SIGNATURE-----

--nDmTXYS4kVhtHHfR--
