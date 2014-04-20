Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 48AF965D46
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 13:45:37 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so3010634eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3nEV+OOUJ1cYtmD8NVfxHLbQ0sSA3IUrMT26pATud3s=;
	b=sQx+zFO23+1jh98qHpe+McjMphHuBbAIoS/+u4FXldnJXrt4GFddv4SFwJDqEnNFWr
	lh59fblzfWT4xd958mTlzl4D/PL2FFbUwA0cu9aSMIq5V/t/47xrgq5GWgx+bWyl+eho
	zyzlK4y5FJvPRktQ2YVbHFcdEEx2Nf/tvQjPPak/W2j/HmgMAM1DsF/VAD1+3617wCXb
	6m43cmcekaNx9R58wnFo2bcPNRbWFChrYohFexykOga24MwDcdHV+8OA70wsyZi9JPgo
	ouB8gnrMXJiAgQBrKVB3l1vDvj0g0cxyuiUyqBMtN459trZmIIjDO4syWyA5xTMDM2Uz
	VIPg==
X-Received: by 10.14.22.69 with SMTP id s45mr38635574ees.56.1398001538732;
	Sun, 20 Apr 2014 06:45:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x46sm94161090een.17.2014.04.20.06.45.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 06:45:37 -0700 (PDT)
Date: Sun, 20 Apr 2014 15:45:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420134542.GM2486@jama>
References: <1396216372-6712-1-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396216372-6712-1-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: patches@linaro.org
Subject: Re: [meta-gnome][PATCH] libgnomecanvas: add 'intltool-native' DEPENDS
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
X-List-Received-Date: Sun, 20 Apr 2014 13:45:41 -0000
X-Groupsio-MsgNum: 49347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T2TLPR1GNug0LD4g"
Content-Disposition: inline

--T2TLPR1GNug0LD4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2014 at 05:52:52PM -0400, Trevor Woerner wrote:
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>

Resolved by identical patch I had in queue.

Thanks

> ---
>  meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b=
/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
> index 4a210a4..0f41bb6 100644
> --- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
> +++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
> @@ -5,7 +5,7 @@ SECTION =3D "x11/gnome/libs"
> =20
>  inherit gnome
> =20
> -DEPENDS =3D "gtk+ libglade libart-lgpl xineramaproto"
> +DEPENDS =3D "gtk+ libglade libart-lgpl xineramaproto intltool-native"
> =20
>  SRC_URI[archive.md5sum] =3D "ffcbb719c671ff5cd86e59aeba8d0b92"
>  SRC_URI[archive.sha256sum] =3D "859b78e08489fce4d5c15c676fec1cd79782f115=
f516e8ad8bed6abcb8dedd40"
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

--T2TLPR1GNug0LD4g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTz4YACgkQN1Ujt2V2gBxlBwCdF+mBWdCDesysxCyP1y69yggE
IDcAn1GmdtPB4hvWjOI1NINzkW4exIRA
=DxpS
-----END PGP SIGNATURE-----

--T2TLPR1GNug0LD4g--
