Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5B771634
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 13:13:56 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hi2so20443267wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 05:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dC1YVt49DA/HDMMd8j4wKUn29TJigd8gzMaMGAShYs0=;
	b=jlZVMSQHqxCGumS1me98UVHxjPC5LIHaLxmke5EFBQBRftuDDlGzDpMSBxv8qgdB6/
	w1mrb+/XDnTlCwbT8tmR+3BhHewsXTqyeYHsan9kdwy9HZG+kiujEmZ2j4ghL6V6ICCD
	TNs5yT2n3w0IXP0l3KvSn7zyh+KaIXMM3F5mDLpiCoW6muJlHnHDpqoEpZz/j9u+kSyI
	wjYX4ls98ItNy57uColBAQhf2fEX1zRyU9JoFzs0tyRHmMgWfji7NP3dK/fg65qHpLGH
	xFkEU3X4KJ4Ie/KQHTZslI4r+xSbD4SRZ7vDab4CHxD+ZM0WH7wzt3x6V/st90DgBIIC
	BYLA==
X-Received: by 10.194.60.15 with SMTP id d15mr40387112wjr.72.1424006037567;
	Sun, 15 Feb 2015 05:13:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ka1sm18291599wjc.2.2015.02.15.05.13.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Feb 2015 05:13:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 15 Feb 2015 14:14:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150215131404.GB2297@jama>
References: <1423649212-5156-1-git-send-email-pau.espin@aweurope.be>
MIME-Version: 1.0
In-Reply-To: <1423649212-5156-1-git-send-email-pau.espin@aweurope.be>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Pau Espin Pedrol <pau.espin@essensium.com>
Subject: Re: [meta-qt5][PATCH] qtmultimedia: Enable building of package qtmultimedia-examples
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
X-List-Received-Date: Sun, 15 Feb 2015 13:14:02 -0000
X-Groupsio-MsgNum: 54308
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline

--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2015 at 11:06:52AM +0100, Pau Espin Pedrol wrote:
> From: Pau Espin Pedrol <pau.espin@essensium.com>
>=20
> Signed-off-by: Pau Espin Pedrol <pau.espin@essensium.com>
> ---
>  recipes-qt/qt5/qtmultimedia.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedi=
a.inc
> index 427f688..de1839f 100644
> --- a/recipes-qt/qt5/qtmultimedia.inc
> +++ b/recipes-qt/qt5/qtmultimedia.inc
> @@ -14,6 +14,9 @@ EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONF=
IG', 'pulseaudio', '', 'CON
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'openal', 'C=
ONFIG+=3DOE_OPENAL_ENABLED', '', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'gstreamer01=
0', 'CONFIG+=3DOE_GSTREAMER010_ENABLED', '', d)}"
> =20
> +QT_MULTIMEDIA_BUILD_PARTS ?=3D "examples"
> +EXTRA_QMAKEVARS_PRE +=3D "QT_BUILD_PARTS+=3D${QT_MULTIMEDIA_BUILD_PARTS}"
> +
>  SRC_URI +=3D "\
>      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
>      file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.pat=
ch \

With this applied I've seen new QA error:
ERROR: QA Issue: qtmultimedia-examples-dbg: found library in wrong location=
: /usr/share/qt5/examples/multimedia/spectrum/.debug/libfftreal.so.1.0.0
qtmultimedia-examples: found library in wrong location: /usr/share/qt5/exam=
ples/multimedia/spectrum/libfftreal.so.1.0
qtmultimedia-examples: found library in wrong location: /usr/share/qt5/exam=
ples/multimedia/spectrum/libfftreal.so.1
qtmultimedia-examples: found library in wrong location: /usr/share/qt5/exam=
ples/multimedia/spectrum/libfftreal.so.1.0.0
qtmultimedia-examples-dev: found library in wrong location: /usr/share/qt5/=
examples/multimedia/spectrum/libfftreal.so [libdir]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

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

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTgm5wACgkQN1Ujt2V2gBygCwCgqUBHzjUXeRau50llJbk54S9H
Y5UAoKq3lO5go4uansgMS3QDqKwt9L7W
=dMbP
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
