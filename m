Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id ABE646FDA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 08:12:56 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so621437wiv.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a70tCAtLn/nu+iA51n4sL1GyYKnCqzq38VeRRFqepXM=;
	b=p4KiEWBtivrJkw5t2sSed1/gKkvXF3lsDdi5EleNpYeLbxCEHIohJzSLBXqCK05Qun
	DKHn5E9FRN8ohqgyh2vigyhBgpCsJD94jpwoSpJQABEEX3J3r3GpMHeHsvAmfhXfg9dt
	TJCIc1cUITHV4imO6s5chGRDKbOpKAoqg0Haza0Or+MgBOzHMINj8lHb2FBOBa/x9V+W
	/7wg5JTA2LL1r3a8K6liRR0ZTjXX4kAAlBM4BKj0vK7J2gsoJgR5MKuW8XMWs7m3FWKE
	/A3JyToPaBCNaUYDGBK5synRtMXIjwXxe/cWsLBgHVUZj/0wg2n8nvq6fTp2xKS+FTm0
	vi6Q==
X-Received: by 10.180.13.47 with SMTP id e15mr3055634wic.28.1403079176959;
	Wed, 18 Jun 2014 01:12:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id 8sm3798581eea.10.2014.06.18.01.12.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jun 2014 01:12:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Jun 2014 10:12:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140618081256.GH2117@jama>
References: <1403042333-15020-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
In-Reply-To: <1403042333-15020-1-git-send-email-eduardo@monkey.io>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] monkey: new v1.5.1 release (v2).
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
X-List-Received-Date: Wed, 18 Jun 2014 08:13:02 -0000
X-Groupsio-MsgNum: 50387
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X+8siUETKMkW99st"
Content-Disposition: inline

--X+8siUETKMkW99st
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2014 at 03:58:53PM -0600, Eduardo Silva wrote:
> This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fix=
es
> some problems when switching user when started as root.

(v2) belongs to subject tag (so it's stripped in "git am") , subject should=
 be

[PATCHv2][meta-webserver] monkey: upgrade to 1.5.1

> monkey/yocto: 7a702d00c5e48d1e03d8bbd2c7bd93a0d26f701e

^ what's this?

> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-httpd/monkey/{monkey_1.5.0.bb =3D> monkey_1.5.1.bb}         =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.0.bb =3D> monkey_=
1.5.1.bb} (88%)
>=20
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.5.1.bb
> similarity index 88%
> rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> index 6fa1b77..172d4f7 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7=
014dce33e26468ba93"
>  SECTION =3D "net"
> =20
>  SRC_URI =3D "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "9123fc371334621fde1c060ab17adcd3"
> -SRC_URI[sha256sum] =3D "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b363=
7bd8bab5b1d098a7"
> +SRC_URI[md5sum] =3D "2fe04135728f5c3a86c3a412059e0da3"
> +SRC_URI[sha256sum] =3D "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757=
bfeb72edddf457e7"
> =20
>  EXTRA_OECONF =3D " \
>               --plugdir=3D${libdir}/monkey/ \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X+8siUETKMkW99st
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOhSggACgkQN1Ujt2V2gBy82gCePwujh9dNlymDqaxtvW6Co5Wg
bMAAniRjz3Wde5oORkEnfpYjBuiX+hTw
=C0C3
-----END PGP SIGNATURE-----

--X+8siUETKMkW99st--
