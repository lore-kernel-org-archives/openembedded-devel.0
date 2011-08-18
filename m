Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qu5iL-0000AD-Qt for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 18:45:05 +0200
Received: from f053044176.adsl.alicedsl.de ([78.53.44.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qu5dz-00005m-Q0 for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 16:40:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAJb9USWOKap6nFh8TxogvQtO8=5cZ9x8AaAEUQto=EjvShW8QA@mail.gmail.com>
References: <CAJb9USWOKap6nFh8TxogvQtO8=5cZ9x8AaAEUQto=EjvShW8QA@mail.gmail.com>
Date: Thu, 18 Aug 2011 18:40:26 +0200
Message-ID: <1313685626.3949.41.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] Add a new recipe: libroxml
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
X-List-Received-Date: Thu, 18 Aug 2011 16:45:05 -0000
X-Groupsio-MsgNum: 33701
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-S/ergkQD6iNkpAURpomN"

--=-S/ergkQD6iNkpAURpomN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tristan,


thank you for your patch. There are some style problems and I hit some
build issues, I will all mentioning inline.

First of all I just noticed during this reply that you also attached
this patch. That is the right thing to do since Google Mail auto wraps
lines and therefore patches get broken. I recommend you to use `git
send-email` or a mail program though.


Am Donnerstag, den 18.08.2011, 17:48 +0200 schrieb Tristan Lelong:

> Add a new recipe: libroxml

Please follow the commit policy [1][2][3] on how to format the commit
summary and message.

	libroxml: Add version 2.1.0

Also in your pasted message you copied the header twice.

> libroxml is a small fast and powerfull xml parsing library.

s/powerfull/powerful/

> It handles parsing, creating, modifying xml documents

Full stop at the end.

Please add the build configuration you used for building and run
testing.

> Signed-off-by: Tristan Lelong <tristan.lelong@libroxml.net>
> ---
>  recipes/libroxml/libroxml.inc      |   23 +++++++++++++++++++++++
>  recipes/libroxml/libroxml_2.1.0.bb |    8 ++++++++
>  2 files changed, 31 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libroxml/libroxml.inc
>  create mode 100644 recipes/libroxml/libroxml_2.1.0.bb
>=20
> diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.in=
c
> new file mode 100644
> index 0000000..5ade6e7
> --- /dev/null
> +++ b/recipes/libroxml/libroxml.inc
> @@ -0,0 +1,23 @@
> +

Please no empty line at the beginning.

> +DESCRIPTION =3D "small, fast and powerfull xml library"

Typo as above. Please start with a capital letter.

> +LICENSE =3D "LGPL"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +MAINTAINER =3D "Tristan Lelong <tristan.lelong@libroxml.net>"

There is no maintainer field. Use `AUTHOR` instead.

> +HOMEPAGE =3D "http://www.libroxml.net"

Please order these fields according to the style guide [4].

> +
> +PROVIDES =3D "libroxml"
> +RPROVIDES =3D "libroxml"

Not needed as far as I know.

> +
> +SRC_URI =3D "http://libroxml.googlecode.com/files/libroxml-2.1.0.tar.gz"
> +
> +S =3D ${WORKDIR}/${PN}-${PV}

That is the default and can be left out.

I see a pc (pkgconfig) file is shipped. `inherit pkgconfig` should be
added then I think.

> +
> +do_install() {
> +        oe_runmake install DESTDIR=3D${D}
> +}
> +
> +PACKAGES =3D ${PN}

Also not needed.

> +
> +FILES_${PN} =3D ${libdir}/libroxml.so.0 ${bindir}/roxml

Should `roxml` be installed with the library?

> +

No empty line at the end please.

> diff --git a/recipes/libroxml/libroxml_2.1.0.bb
> b/recipes/libroxml/libroxml_2.1.0.bb
> new file mode 100644
> index 0000000..22fff51
> --- /dev/null
> +++ b/recipes/libroxml/libroxml_2.1.0.bb
> @@ -0,0 +1,8 @@
> +
> +PR =3D "r0"

Please use `INC_PR` (also adapt the `*.inc`) and move it below the
require line.

> +
> +require libroxml.inc
> +
> +SRC_URI[md5sum] =3D "eb69737ba6dc345399531dfa5975a53d"
> +SRC_URI[sha256sum] =3D "823d9d495bc07618355e3137e289dfcc792b8a513f12452a=
2aba9c88b48f2e2d"
> +

No empty line at the end please. `git diff --check` should warn you
about this.

I tried to build your recipe with my modifications above using
`angstrom-2010.x` for `MACHINE =3D "beagleboard". It fails with the
following error.

        NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Started
        arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format =
of the input file `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstro=
m-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
        arm-angstrom-linux-gnueabi-strip: Unable to recognise the format of=
 the input file `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
        arm-angstrom-linux-gnueabi-objcopy: Unable to recognise the format =
of the input file `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstro=
m-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'
        ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-secti=
on=3D.comment --remove-section=3D.note '/oe/build-angstrom-next/angstrom-de=
v/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxm=
l'' strip command failed
        NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Succeeded
        ERROR: QA Issue with libroxml: Architecture did not match (40 to 3)=
 on /work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/packages-split/li=
broxml/usr/lib/libroxml.so.0
        ERROR: QA Issue with libroxml: Architecture did not match (40 to 3)=
 on /work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/packages-split/li=
broxml/usr/bin/roxml
        ERROR: QA run found fatal errors. Please consider fixing them.
        NOTE: package libroxml-2.1.0-r0: task do_package_qa: Failed
        ERROR: Function 'do_package_qa' failed

`minimal` and `minimal-uclibc` fail too.

        NOTE: package libroxml-2.1.0-r0: task do_populate_sysroot: Succeede=
d
        ERROR: runstrip: ''arm-oe-linux-gnueabi-strip' --remove-section=3D.=
comment --remove-section=3D.note '/oe/build-minimal-eglibc/minimal-dev/work=
/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/package/usr/bin/roxml'' strip co=
mmand failed
        NOTE: Running task 770 of 777 (ID: 4, /oe/openembedded/recipes/libr=
oxml/libroxml_2.1.0.bb, do_qa_staging)
        NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Started
        NOTE: package libroxml-2.1.0-r0: task do_qa_staging: Succeeded
        ERROR: QA Issue with libroxml: Architecture did not match (40 to 3)=
 on /work/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/packages-split/libroxml=
/usr/lib/libroxml.so.0
        ERROR: QA Issue with libroxml: Architecture did not match (40 to 3)=
 on /work/armv7a-oe-linux-gnueabi/libroxml-2.1.0-r0/packages-split/libroxml=
/usr/bin/roxml
        ERROR: QA run found fatal errors. Please consider fixing them.
        NOTE: package libroxml-2.1.0-r0: task do_package_qa: Failed
        ERROR: Function 'do_package_qa' failed

Are you sure `Makefile` can deal with cross compilation?


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy
[2] http://wiki.openembedded.org/index.php/Commit_log_example
[3] http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
[4] http://wiki.openembedded.org/index.php/Styleguide
[5] http://wiki.openembedded.org/index.php/Styleguide#PR_variables_with_rec=
ipes_that_use_INC_files

--=-S/ergkQD6iNkpAURpomN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5NQHoACgkQPX1aK2wOHViw4QCghPK+9MgQJugJ3tSq39WLhv8q
88YAnjea4/ikoCZwcGf2PHRSLCYIiRAC
=q6zy
-----END PGP SIGNATURE-----

--=-S/ergkQD6iNkpAURpomN--
