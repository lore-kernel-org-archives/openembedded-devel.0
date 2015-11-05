Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id F412C75A31
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 19:46:06 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so16443957wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 11:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bt1B1XskqR16GFOjRfBXBjn8HsaN5dmjz+wGwoVVLPs=;
	b=Sxx8tswz1eLHbwh83vU6fpbHuXtDUh4P4JBnCIn74oQPYUqx1waY7Hfmct4jGfZ2hb
	dtTVDSR7EMUSNfk38ht2oCG0YpFVBH7EwTkYOaL4TrItcaxZIJ2BHfChkucjHiqji2GZ
	1cSpP710DZ/nPmanhe8hB1sY9QgdmpxUxRetPDEyac+UoXW+X2zZGMgGfJv6EIAwHmMA
	PzDppZm4LrzUe8tKCDidGcvgmLNVmYVjPpxGojX/+kaiOtujITnlkqLEPZrDWlOU4lg2
	Hq/rpnDBatLa+4aBCPyjKATvZQQVkrP6Woqh4ECAm7k0T+MCeSqm8BG8t1qlAC7oY4XG
	cfJQ==
X-Received: by 10.194.58.84 with SMTP id o20mr12465568wjq.73.1446752766395;
	Thu, 05 Nov 2015 11:46:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n17sm9962275wmg.17.2015.11.05.11.46.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 11:46:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Nov 2015 20:46:17 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151105194617.GF2556@jama>
References: <1446473021-20957-1-git-send-email-samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <1446473021-20957-1-git-send-email-samuli.piippo@theqtcompany.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] qtbase: include oe-device-extra.pri unconditionally
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
X-List-Received-Date: Thu, 05 Nov 2015 19:46:07 -0000
X-Groupsio-MsgNum: 58362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Content-Disposition: inline

--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2015 at 04:03:41PM +0200, Samuli Piippo wrote:
> configure parses through the mkspec, but does not handle conditions
> at all, so oe-device-extra.pri was not included at configure phase.
> For example QT_QPA_DEFAULT_PLATFORM had no effect for configure.
> include() is conditional and won't break build even when
> oe-device-extra.pri does not exist.

And now every log.do_configure shows:
DEBUG: Executing shell function do_configure
Cannot read /OE/build/owpb/webos-ports/tmp-glibc/sysroots/qemux86/usr/lib/q=
t5/mkspecs/oe-device-extra.pri: No such file or directory

Which can confuse some people.. :/

>=20
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
> ---
>  recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/r=
ecipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> index a9c448d..d377921 100644
> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> @@ -240,7 +240,7 @@ index 0000000..d0a4166
>  +# for the SDK
>  +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
>  +
> -+exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
> ++include(../oe-device-extra.pri)
>  +
>  +load(qt_config)
>  diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++=
/qplatformdefs.h
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

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY7sggACgkQN1Ujt2V2gBwCygCgpCFishFSdq6413kyPX9zMiCi
KB8AoIecM+vSRi2s+rMA7cZ38pFDbaph
=S3Xo
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--
