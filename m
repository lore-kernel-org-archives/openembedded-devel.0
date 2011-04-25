Received: from mx02.stofanet.dk ([212.10.10.12])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1QER3k-0004Vm-MF for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 21:03:00 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx04.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1QEQty-0006KP-0r
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 20:52:54 +0200
Received: from phoenix.localnet (unknown [192.168.0.226])
	by asrock (Postfix) with ESMTPS id CABD981468
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 20:52:53 +0200 (CEST)
From: =?iso-8859-15?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 20:52:53 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <201104251704.03324.sgh@sgh.dk>
	<1303745160.15311.36.camel@mattotaupa>
In-Reply-To: <1303745160.15311.36.camel@mattotaupa>
MIME-Version: 1.0
X-UID: 1
Message-Id: <201104252052.53197.sgh@sgh.dk>
Subject: Re: [PATCH] python-scons_1.3.0: add `python-native` to `DEPENDS_virtclass-native`
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
X-List-Received-Date: Mon, 25 Apr 2011 19:03:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: S=F8ren Holm <sgh@sgh.dk>

Works like a charm. What does DEPENDS_virtclass do ?

Mandag den 25. april 2011 17:26:00 skrev Paul Menzel:
> Date: Mon, 25 Apr 2011 17:18:07 +0200
>=20
> A clean build fails with the following error [1].
>=20
> ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc16/=
tmp/work/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.2659=
6 for further information)
> ERROR: Logfile of failure stored in: /home/sgh/oe-new-oe/build-vmc16/tmp/=
work/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.26596
> Log data follows:
> | ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc1=
6/tmp/work/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.26=
596 for further information)
> | + cd /home/sgh/oe-new-oe/build-vmc16/tmp/work/x86_64-linux/python-scons=
=2Dnative-1.3.0-r1/scons-1.3.0
> | + do_compile
> | + distutils_do_compile
> | + STAGING_INCDIR=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-=
linux/usr/include
> | + STAGING_LIBDIR=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-=
linux/usr/lib
> | + BUILD_SYS=3Dx86_64-linux
> | + HOST_SYS=3Dx86_64-linux
> | + /home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-linux/usr/bin/pyt=
hon setup.py build
> | /home/sgh/oe-new-oe/build-vmc16/tmp/work/x86_64-linux/python-scons-nati=
ve-1.3.0-r1/temp/run.do_compile.26596: line 94: /home/sgh/oe-new-oe/build-v=
mc16/tmp/sysroots/x86_64-linux/usr/bin/python: No such file or directory
> | + oefatal 'python setup.py build_ext execution failed.'
> | + echo FATAL: 'python setup.py build_ext execution failed.'
>=20
> Adding `python-native` to `DEPENDS_virtclass-native` as suggested in [1] =
and done for `python-scons-native_1.2.0` fixes the issue.
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/03=
2180.html
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> S=F8ren, please test this patch. By default 1.2.0 is not used for the nat=
ive recipe.
> ---
>  recipes/python/python-scons_1.3.0.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/python/python-scons_1.3.0.bb b/recipes/python/python=
=2Dscons_1.3.0.bb
> index 82231f2..5a412cb 100644
> --- a/recipes/python/python-scons_1.3.0.bb
> +++ b/recipes/python/python-scons_1.3.0.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "A Software Construction Tool"
>  SECTION =3D "devel/python"
>  PRIORITY =3D "optional"
>  LICENSE =3D "MIT"
> +DEPENDS_virtclass-native =3D "python-native"
>  SRCNAME =3D "scons"
>  PR =3D "r1"
> =20
>=20


