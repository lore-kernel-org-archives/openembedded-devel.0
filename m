Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkZGH-0006wd-Qu
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 12:53:34 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3447434pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 03:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ifmD6L8CwHCzb1CjtfivfyB+GC6NOJvOMv/kJMsyfzo=;
	b=XdACSSpwEwp4w2yP/qqlniaHol07WBtdPWfnFz+TJn3FumAzhxz2KBoVdgCIjmhsL+
	rtgoXPB/jSJCGPOwJVVwrbwPKtEWLfYCt/2G1XKaYzH/zmf5l2dMDArIQlonyt4QrxC2
	Bi1sdEZ3rX3aXZR4I4jRbVbdthZPGztptZcn7D6ndt+dSsO8jaKcosG2R1WEph9tm9K9
	zbX+HDJj1a5PkY0BP1wnRBccwT7LPsYr/nfGF19+hjZ969kAgkO6ae0cbVxT/2R+Ub1a
	x3/gXQiX6inxdvt13kTsDPYamAfSqmJSCJWtJOL/5qHG6ftc5u+lARMCXu6BglnS/HA0
	hXKw==
Received: by 10.68.197.71 with SMTP id is7mr42524822pbc.79.1355744332662;
	Mon, 17 Dec 2012 03:38:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t1sm8452252paw.11.2012.12.17.03.38.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 03:38:51 -0800 (PST)
Date: Mon, 17 Dec 2012 12:38:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121217113848.GH3448@jama>
References: <1355741439-13106-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1355741439-13106-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia PATCH] gst123: add package
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
X-List-Received-Date: Mon, 17 Dec 2012 11:53:34 -0000
X-Groupsio-MsgNum: 42220
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l06SQqiZYCi8rTKz"
Content-Disposition: inline

--l06SQqiZYCi8rTKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2012 at 10:50:39AM +0000, Ross Burton wrote:
> gst123 is useful for testing as it simply uses PlayBin, but can display t=
he
> pipeline being used for QA purposes.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../recipes-multimedia/gstreamer/gst123_0.3.1.bb     |   18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst123_0=
=2E3.1.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb=
 b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
> new file mode 100644
> index 0000000..ce7d669
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Flexible CLI player in the spirit of mpg123, based on GStre=
amer"
> +HOMEPAGE =3D "http://space.twc.de/~stefan/gst123.php"
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2 \
> +                    file://src/gst123.cc;beginline=3D1;endline=3D19;md5=
=3D05d2f5d54b985b986c26af931d2084f8"
> +
> +DEPENDS =3D "libx11 gstreamer gtk+ ncurses"
> +
> +PR =3D "r0"
> +
> +# This is actually the commit after 0.3.1 which fixes a display bug
> +SRCREV =3D "3e46d2e501da68d929bb5f26900a292a5fc04a1f"

Why not show it in PV and name recipe gst123_git.bb?

Cheers,

> +SRC_URI =3D "git://space.twc.de/public/git/gst123.git;protocol=3Dhttp"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l06SQqiZYCi8rTKz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDPBEgACgkQN1Ujt2V2gBzNDwCgpk9jtv/X5HUDZ+krrFzosGc7
hGAAnjGuZcuN6jU673rmo/xG6S4xotfJ
=RyF8
-----END PGP SIGNATURE-----

--l06SQqiZYCi8rTKz--
