Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3C91665D6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 11:21:19 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id cc10so1537426wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 04:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qa9H/QYb8hMp5t1IB6AtrLtCjtaXGLjP/bv13hF7+0E=;
	b=nFoKX5ZJ/YwwMS4qnGnTmmIZk6hHI6w2Uurm77Tna81BlP2o/IN2qGXXutKVQkJMCi
	8m9oi0jC9WhKi5x0owSgXswZ93Hg778JS62SqRWPBYKfM7+vhjB2F5qQEpDeXBmcsPvn
	qSkCLxtmUcWlyNPwZU/2vlaNgn6QTWP25h0+n4iNsnpEb7naIwFvaQEyfU1Dya69ixpa
	Ush5FjtC5lKkses5gZOKfi1fLWDnaNmZtQWrEZUVke6TPYwI97bRq5G6lRSLEEP6NPbF
	o2ALuHwBbGEZmYpNUY9TI2p1ECnTF+L7VwlxgU9oEJ+VohJKqZiv1p0GV6aV5V+/wvFp
	onvQ==
X-Received: by 10.14.1.130 with SMTP id 2mr13757eed.104.1402399280385;
	Tue, 10 Jun 2014 04:21:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e6sm48724342eem.44.2014.06.10.04.21.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jun 2014 04:21:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Jun 2014 13:21:39 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140610112139.GD2433@jama>
References: <1401126195-17846-1-git-send-email-ashcharles@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1401126195-17846-1-git-send-email-ashcharles@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-xfce][PATCH] xfce4-screenshooter: Ensure lib directory exists.
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
X-List-Received-Date: Tue, 10 Jun 2014 11:21:29 -0000
X-Groupsio-MsgNum: 50248
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Content-Disposition: inline

--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2014 at 10:43:15AM -0700, Ash Charles wrote:
> Screenshooter autogenerates screenshooter-marshal.[ch] in lib/ during
> compilation.  The source directory contains a lib/ but this directory
> doesn't exist in a build directory by default so we add one manually.
> Really, this should be corrected in the upstream package.
>=20
> Upstream-Status: pending

Please create it only when it doesn't exist

ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/core2-64-oe-linux/xfce4-screenshooter/1.8.1-r0/temp/l=
og.do_compile.3584
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-=
64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| mkdir: cannot create directory `lib': File exists
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/xfce4-scree=
nshooter/1.8.1-r0/temp/log.do_compile.3584)
NOTE: recipe xfce4-screenshooter-1.8.1-r0: task do_compile: Failed


>=20
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  .../recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb     | =
4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoot=
er_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoote=
r_1.8.1.bb
> index 4cda352..271f9c0 100644
> --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.=
1.bb
> +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.=
1.bb
> @@ -11,5 +11,9 @@ SRC_URI +=3D "file://0001-Fix-panel-plugin-build.patch"
>  SRC_URI[md5sum] =3D "d0ffea2052a8e70154cf13789070711f"
>  SRC_URI[sha256sum] =3D "40419892bd28989315eed053c159bba0f4264ed8c6c67388=
06024e481eab9492"
> =20
> +do_compile_prepend() {
> +	mkdir lib
> +}
> +
>  FILES_${PN} +=3D "${datadir}/xfce4/panel/plugins \
>          ${libdir}/xfce4/panel/plugins"
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOW6kMACgkQN1Ujt2V2gBz29QCfWD24osuYq31abc/QKs7YGWFb
BOAAnR0GOcaSgUW+dmJXTos7Hk03VAGG
=wkgU
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
