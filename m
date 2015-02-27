Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A9F1772491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 16:20:11 +0000 (UTC)
Received: by wghb13 with SMTP id b13so21415878wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bEz8LvZheXwqm2A51LM305lVkpMR6XHQ67tRg61RhSs=;
	b=az4VQ5p9CfCnAZ6eZ5VzReXZOYkeNIX9W+xfujv0Yim3qFFXP2unmZJBGgTLSIPw03
	tR8HeeqYw9vZanxKgqyREnT3gxQa0NN2kLg6YkcudIr6uPseg6WJofFtc5N5nuWtg1Tn
	f80vkR4fUi/hn3xCJpoaV724Tc5e3/NG+cm5kZ9XfM1op7vVdUpRTKrK273KvEgtqS74
	k2fTXXgoLVJTY5oepAWoIjYZTKgFgZgzMrnZi28I+uY+oHD1YfH8yL7igrUkq8XvtiJ8
	wFeYY6gqWLhSApvzoDqmzjfrB6XX3OcxWjM240xYdQ5sDHbqzwkgbVsSVGXYg2FeBRP5
	Snkg==
X-Received: by 10.194.86.194 with SMTP id r2mr30034002wjz.41.1425054012917;
	Fri, 27 Feb 2015 08:20:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	uc18sm3485186wib.0.2015.02.27.08.20.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 08:20:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 17:20:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150227162031.GP2309@jama>
References: <1425053339-17979-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1425053339-17979-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Peter Urbanec <openembedded-devel@urbanec.net>
Subject: Re: [PATCH v2] mozjs: fix build failure due to failed X11 configure test
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
X-List-Received-Date: Fri, 27 Feb 2015 16:20:15 -0000
X-Groupsio-MsgNum: 54541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUrluEZVXmx7ezWQ"
Content-Disposition: inline

--CUrluEZVXmx7ezWQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 11:08:59AM -0500, Paul Gortmaker wrote:
> The failure intermittently shows up as follows:
>=20
> ERROR: This autoconf log indicates errors, it looked at host include and/=
or library paths while determining system capabilities.
> Rerun configure task after fixing this. The path was 'poky/build/tmp/work=
/core2-64-poky-linux/mozjs/17.0.0-r0/build'
> ERROR: Function failed: do_qa_configure
> ERROR: Logfile of failure stored in: poky/build/tmp/work/core2-64-poky-li=
nux/mozjs/17.0.0-r0/temp/log.do_configure.8047
> ERROR: Task 5 (poky/meta-openembedded/meta-oe/recipes-extended/mozjs/mozj=
s_17.0.0.bb, do_configure) failed with exit code '1'
>=20
> The configure log has:
>=20
> configure:5494: checking for IceConnectionNumber in -lICE
> configure:5513: x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse --sysroot=3Dpoky/build/tmp/sysroots/genericx86-64 -o=
 conftest  -O2 -pipe -g -feliminate-unused-debug-types  -Wl, -O1 -Wl,--hash=
-style=3Dgnu -Wl,--as-needed -L/usr/lib conftest.c -lICE   1>&5
> poky/build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x8=
6_64-poky-linux/4.9.1/ld: warning: library search path "/usr/lib" is unsafe=
 for cross-compilation
>=20
> Checking build/config/autoconf.mk we find:
>=20
> X_CFLAGS =3D  -I/usr/include
> X_EXTRA_LIBS =3D
> X_LIBS =3D  -L/usr/lib
>=20
> Looking at the configure script, we see these invalid values are output
> when the autoconf test for X11 fails.  That test fails in the following
> fashion:
>=20
> configure:4768:27: fatal error: X11/Intrinsic.h: No such file or directory
>=20
> This header in turn gets put in the sysroot by our build of libxt.  So we
> get build fails whenever mozjs is built before libxt.
>=20
> Aside from the configure test, it doesn't appear that mozjs really has
> a hard dependency on libxt in order to compile.  So we can avoid the
> problem by simply avoiding the configure test - and here we do that by
> looking for X11 in the distro features.
>=20
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>=20
> [apologies if anyone gets this 2x ; the mailing list is misconfigured and
>  currently operating in subscriber-only mode; someone please fix that.]
>=20
> [v2: change depends on libxt to distro features solution]
>=20
> [v1: http://patchwork.openembedded.org/patch/88625/  ]
>=20
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/rec=
ipes-extended/mozjs/mozjs_17.0.0.bb
> index 174f6fe0a89b..0a4cf6b03cc4 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> @@ -27,6 +27,8 @@ EXTRA_OECONF =3D " \
>      --libdir=3D${libdir} \
>  "
> =20
> +EXTRA_OECONF_X =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--wi=
th-x', '--without-x', d)}"

Does it need some extra dependency when enabled?

Why don't you use PACKAGECONFIG for this?

>  # mozjs requires autoreconf 2.13
>  do_configure() {
>      ${S}/configure ${EXTRA_OECONF}
> --=20
> 2.2.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CUrluEZVXmx7ezWQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwmU8ACgkQN1Ujt2V2gBwuHwCgqY8RBy/k5NPAdLXxuFrrVcZz
iBsAmwV8WWDQCPuDwAce/CTKFxvnyBHB
=U3eg
-----END PGP SIGNATURE-----

--CUrluEZVXmx7ezWQ--
