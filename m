Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id B856F766DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 10:53:35 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so83904520wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 03:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y8XMfzbgKRH4W8cUp2mWKyycthDke20rLr7pBTRXI+A=;
	b=Xd7PvgFtTWgMKjS/doeJCMcEzaaJDA5zfW2izRSFllVclxKyAqEE03plfqMT1w7f9f
	InnNo2KJyW+cq2mNM9Fvj4xle4zO7EAB2Uboqp71zb45zsE+bGdk9k7vWfjEQfVf1ZFG
	n61fMmUeND4GX9r+V+x5UbiyKB29p43YN0xSxr0sz5YcCWYtr9c3asZ66k4qdostQGKg
	f/dh5czrLgi5S4r+1vSN8kRTC2A/duYO0RMiLKHOoVENVHqOVUySuuPma2oCPGZiDNDD
	89JZ1EtZvkHjWvLlhmvVLuI1eKVqR2D7zkDVM97ov97rEAP8lnXvYrP6qeAwi6v8vHQM
	mQMA==
X-Received: by 10.194.76.237 with SMTP id n13mr39040541wjw.128.1444733614933; 
	Tue, 13 Oct 2015 03:53:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jt3sm2915961wjc.12.2015.10.13.03.53.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 03:53:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Oct 2015 12:53:39 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151013105339.GC2396@jama>
References: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
	<1444373887-24315-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1444373887-24315-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH v2] meta-oe: recipes-graphics: add libvncserver recipe
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
X-List-Received-Date: Tue, 13 Oct 2015 10:53:38 -0000
X-Groupsio-MsgNum: 57793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2015 at 09:58:07AM +0300, Ioan-Adrian Ratiu wrote:
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../libvncserver/libvncserver_0.9.10.bb               | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.=
9.10.bb
>=20
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb=
 b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> new file mode 100644
> index 0000000..afa303c
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "library for easy implementation of a RDP/VNC server"
> +HOMEPAGE =3D "https://libvnc.github.io"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26c6900a926b62aad=
a5f"
> +
> +DEPENDS +=3D "zlib jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> +RDEPENDS_${PN} +=3D "libpng gtk+ libgcrypt"
> +
> +RCONFLICTS_${PN} =3D "x11vnc"

This isn't enough to resolve conflicts with x11vnc in sysroot, this only
prevent installing both packages in the same image.

> +
> +inherit autotools pkgconfig
> +
> +SRC_URI  =3D "git://github.com/LibVNC/libvncserver.git;tag=3DLibVNCServe=
r-0.9.10"

Set SRCREV matching with this tag, otherwise bitbake will always use git
ls-remote to convert tag name to git SHA, which won't work for builds
=66rom premirror (possibly without access to network)

> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE_append=3D" SUBDIRS=3D'libvncserver' "
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYc4rIACgkQN1Ujt2V2gByhMwCgheVh4+Z7GLhu90lR2PRWagiG
RS0AoJpBYrNVyZ4z53b/TfCDfYdlbEUN
=tTJb
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
