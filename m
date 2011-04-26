Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEqAb-0003F3-HX for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 23:51:45 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEq8y-0001qB-16 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 21:50:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303852991-28469-1-git-send-email-c-hernandez8@ti.com>
References: <1303852991-28469-1-git-send-email-c-hernandez8@ti.com>
Date: Tue, 26 Apr 2011 23:49:16 +0200
Message-ID: <1303854556.24599.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v2] ltp-ddt: New recipe to build ltp-ddt test tool.
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
X-List-Received-Date: Tue, 26 Apr 2011 21:51:45 -0000
X-Groupsio-MsgNum: 31493
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JBh5j2fmYJO4Hc1g8DEj"

--=-JBh5j2fmYJO4Hc1g8DEj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Carlos,


Am Dienstag, den 26.04.2011, 17:23 -0400 schrieb Carlos Hernandez:

I would prefer the following for a commit summary.

	ltp-ddt: add version 0.0.1 of ltp-ddt test tool

> ltp-ddt is an open source test application for embedded linux devices.
> It is based on the linux test project (ltp) but it has a smaller footprin=
t
> and it focus mainly on driver and system performance.

1. s/it focus/its focus is/
2. You could capitalize Linux and LTP.

> Design Highlights:
>  * Based on LTP http://ltp.sourceforge.net/
>  * Test cases are suitable for embedded devices w/ a limited shell.

LTP depends on Bash?

>  * Support dynamic selection/filtering of test cases based on platform.
>  * Support test parameters overrides based on platform.

Support of =E2=80=A6

> Signed-off-by: Carlos Hernandez <c-hernandez8@ti.com>

The email address differs from the From line, which will be used for the
Author field.

Please add to the commit message what distribution and machine you
tested this recipe with.

>  Changed in version 2:
>  * Install package under /opt instead of under /usr to comply with FHS pe=
r
>    Denys' recommendation.

Please update the commit message if it is important (in this case it is
not in my opinion) and separate the =E2=80=9Cpatch iteration changelog=E2=
=80=9D using
`---`. This way it is not put into the actual commit message using `git
am`.

> ---
>  recipes/ltp-ddt/ltp-ddt_0.0.1.bb |   54 ++++++++++++++++++++++++++++++++=
++++++
>  1 files changed, 54 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ltp-ddt/ltp-ddt_0.0.1.bb
>=20
> diff --git a/recipes/ltp-ddt/ltp-ddt_0.0.1.bb b/recipes/ltp-ddt/ltp-ddt_0=
.0.1.bb
> new file mode 100644
> index 0000000..2f8a1f2
> --- /dev/null
> +++ b/recipes/ltp-ddt/ltp-ddt_0.0.1.bb
> @@ -0,0 +1,54 @@
> +DESCRIPTION =3D "Embedded Linux Device Driver Tests based on Linux Test =
Project"
> +HOMEPAGE =3D "http://arago-project.org/git/projects/?p=3Dtest-automation=
/ltp-ddt.git;a=3Dsummary"
> +LICENSE =3D "GPL"
> +SECTION =3D "console/utils"

`SECTION` should be before `LICENSE` according to the style guide [1].

> +DEPENDS +=3D "zip-native virtual/kernel"

Maybe you could sort this lexicographically.

> +PR =3D "r0"
> +
> +inherit autotools
> +
> +BRANCH ?=3D "master"
> +TAG ?=3D "ltp-ddt_${PV}"
> +
> +SRC_URI =3D "\
> +git://arago-project.org/git/projects/test-automation/ltp-ddt.git;protoco=
l=3Dgit;\
> +branch=3D${BRANCH};\
> +tag=3D${TAG}\
> +"
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE_append =3D "prefix=3D/opt/ltp CROSS_COMPILE=3D${HOST_PREFIX=
} SKIP_IDCHECK=3D1 KERNEL_INC=3D${STAGING_KERNEL_DIR}/include"

Is a space after `"` needed when using `append`?

> +FILES_${PN}-dbg +=3D "\
> + /opt/ltp/.debug \
> + /opt/ltp/bin/.debug \
> + /opt/ltp/runtest/.debug \
> + /opt/ltp/testcases/bin/.debug \
> + /opt/ltp/testcases/bin/*/bin/.debug \
> + /opt/ltp/testcases/bin/*/test/.debug \
> + /opt/ltp/testcases/bin/ddt/.debug \
> + /opt/ltp/testcases/bin/ddt/*/bin/.debug \
> + /opt/ltp/testcases/bin/ddt/*/test/.debug \
> +"
> +
> +FILES_${PN} +=3D "\
> + /opt/ltp/* \
> + /opt/ltp/bin/* \
> + /opt/ltp/runtest/* \
> + /opt/ltp/testcases/bin/* \
> + /opt/ltp/testcases/bin/*/bin/* \
> + /opt/ltp/testscripts/* \
> +"

These should go after the overrides according to the style guide [1].

> +
> +do_configure(){

Please use a space in front of `{` as done in the example in the style
guide [1].

> +        cp ${S}/include/config.h.default ${S}/include/config.h
> +	cp ${S}/include/mk/config.mk.default ${S}/include/mk/config.mk

The white space seem to be different.

> +	cp ${S}/include/mk/features.mk.default ${S}/include/mk/features.mk
> +	echo "${TAG}" > ${S}/ChangeLog
> +}

That looks strange. `configure` will not be executed. Should this be
`do_configure_prepend()`?

> +
> +do_install(){

See above.

> +        oe_runmake DESTDIR=3D${D} install
> +}

Could you put this into `EXTRA_OEMAKE` you defined above and get rid of
the override?

> +
> +

The two empty lines are not needed.


Thanks,

Paul


[1] http://openembedded.org/index.php/Styleguide

--=-JBh5j2fmYJO4Hc1g8DEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk23Pc4ACgkQPX1aK2wOHVhk6ACdGS2W+8SgfHC128M7JaeOmZtc
kP4AnR7DtEGzCzO52HGqBnhgdpZyLGIu
=Nb+1
-----END PGP SIGNATURE-----

--=-JBh5j2fmYJO4Hc1g8DEj--
