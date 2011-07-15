Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QhnUt-0001r6-Iz for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 20:52:23 +0200
Received: from f053039174.adsl.alicedsl.de ([78.53.39.174]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QhnRf-0003bf-1g; Fri, 15 Jul 2011 18:49:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org, Raymond Danks
	<ray.danks@se-eng.com>
In-Reply-To: <4E20710B.6060906@se-eng.com>
References: <4E20710B.6060906@se-eng.com>
Date: Fri, 15 Jul 2011 20:48:22 +0200
Message-ID: <1310755702.3995.17.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: coreboot@coreboot.org
Subject: Re: [PATCH 1/2] Add mkelfimage and support for generating kernel+initrd ELF payloads to OpenEmbedded
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
X-List-Received-Date: Fri, 15 Jul 2011 18:52:23 -0000
X-Groupsio-MsgNum: 33180
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LwX8Z5biJbrSg1Zpa5+y"

--=-LwX8Z5biJbrSg1Zpa5+y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Raymond,


I am putting you in CC not knowing if you read the lists.


Am Freitag, den 15.07.2011, 10:55 -0600 schrieb Raymond Danks:

The correct commit summary is

	mkelfimage: Add version c045b4cc from Git (initial recipe)

> On x86, and ELF image file may be stored as a coreboot payload.  This=20

s/and/an/

> image file may be a kernel or a kernel+initrd.
>=20
> Documentation on this has been started on the coreboot wiki:
> http://www.coreboot.org/Mkelfimage
>=20
> We have seen success using the mkelfimage utility to construct a=20
> kernel+initrd image using the micro-image OpenEmbedded image as an initrd=
.
> http://www.se-eng.com/wiki/index.php/Open_Embedded_Setup

What is your build configuration for testing this recipe?

> The first patch contains the meta files for the mkelfimage utility in=20
> OpenEmbedded.

Please remove that line above. The commit message should be describing
the commit only.

Unfortunately we cannot commit your patch, especially because your
Signed-off-by line is missing =E2=80=93 you can add `-s` to the Git command=
s
`git commit` or `git format-patch` and your mailer mangled the patch by
automatic line breaks.

Please follow the commit policy [1] and it would be great if you could
send us a corrected patch [2].

> ---
>   recipes/mkelfimage/files/no-stack-protector.patch |   11 +++++++++++
>   recipes/mkelfimage/mkelfimage-native_git.bb       |   11 +++++++++++
>   recipes/mkelfimage/mkelfimage.inc                 |    3 +++
>   recipes/mkelfimage/mkelfimage_git.bb              |   17 ++++++++++++++=
+++
>   4 files changed, 42 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/mkelfimage/files/no-stack-protector.patch
>   create mode 100644 recipes/mkelfimage/mkelfimage-native_git.bb
>   create mode 100644 recipes/mkelfimage/mkelfimage.inc
>   create mode 100644 recipes/mkelfimage/mkelfimage_git.bb
>=20
> diff --git a/recipes/mkelfimage/files/no-stack-protector.patch=20
> b/recipes/mkelfimage/files/no-stack-protector.patch
> new file mode 100644
> index 0000000..135de8d
> --- /dev/null
> +++ b/recipes/mkelfimage/files/no-stack-protector.patch
> @@ -0,0 +1,11 @@
> +--- mkelfImage/Makefile.orig    2011-06-17 15:20:46.816870941 -0600
> ++++ mkelfImage/Makefile    2011-06-17 15:20:59.619382362 -0600

Please add a header describing this patch [3].

> +@@ -14,7 +14,7 @@
> + pkglibdir =3D $(libdir)/$(PACKAGE)
> + pkgincludedir =3D $(includedir)/$(PACKAGE)
> +
> +-CPPFLAGS=3D-DVERSION=3D'"$(VERSION)"' -DRELEASE_DATE=3D'"$(RELEASE_DATE=
)"'=20
> -I include

Here you can see an automatic line break.

> ++CPPFLAGS=3D-fno-stack-protector -DVERSION=3D'"$(VERSION)"'=20
> -DRELEASE_DATE=3D'"$(RELEASE_DATE)"' -I include $(CFLAGS) $(LDFLAGS)
> + HOST_CPPFLAGS=3D$(CPPFLAGS)
> + I386_CPPFLAGS=3D$(CPPFLAGS) -I arch/i386/include
> + IA64_CPPFLAGS=3D$(CPPFLAGS) -I arch/ia64/include

Please send that patch separately to the coreboot list if it is useful
for upstream. You should be able to use Gerrit and you also need a
Signed-off-by line [4].

> diff --git a/recipes/mkelfimage/mkelfimage-native_git.bb=20
> b/recipes/mkelfimage/mkelfimage-native_git.bb
> new file mode 100644
> index 0000000..e2f251e
> --- /dev/null
> +++ b/recipes/mkelfimage/mkelfimage-native_git.bb
> @@ -0,0 +1,11 @@
> +require mkelfimage_${PV}.bb
> +inherit native
> +
> +do_stage () {

Please follow the style guide [5], i. e., no space before `()`.

> +    install -m 0755 objdir/sbin/mkelfImage ${STAGING_BINDIR}/
> +}

`do_stage ()` is deprecated [6].

> +
> +do_install () {
> +    :
> +}
> +
> diff --git a/recipes/mkelfimage/mkelfimage.inc=20
> b/recipes/mkelfimage/mkelfimage.inc
> new file mode 100644
> index 0000000..e06ed67
> --- /dev/null
> +++ b/recipes/mkelfimage/mkelfimage.inc
> @@ -0,0 +1,3 @@
> +LICENSE =3D "GPLv2"
> +DESCRIPTION =3D "A utility to create ELF boot images from Linux kernel=
=20
> images"
> +SECTION =3D "console/utils"

Please order those as in the style guide and please also add the
`HOMEPAGE` variable.

> diff --git a/recipes/mkelfimage/mkelfimage_git.bb=20
> b/recipes/mkelfimage/mkelfimage_git.bb
> new file mode 100644
> index 0000000..7855f58
> --- /dev/null
> +++ b/recipes/mkelfimage/mkelfimage_git.bb
> @@ -0,0 +1,17 @@
> +require mkelfimage.inc
> +
> +SRCREV =3D "c045b4cc458a62dbb1dd99ae6a9343e52d1fe1e0"
> +PV =3D "1.0.0+gitr${SRCPV}"
> +PR =3D "r1"

We start with `r0`.

> +
> +S =3D "${WORKDIR}/git/util/mkelfImage"
> +
> +SRC_URI =3D=20
> "git://review.coreboot.org/p/coreboot;protocol=3Dhttp;branch=3Dmaster \
> +       file://no-stack-protector.patch"
> +
> +DEFAULT_PREFERENCE =3D "1"

Not needed since this is the only recipe.

> +
> +inherit autotools
> +
> +SRC_URI[md5sum] =3D "719b22bdd34431203f9349250c67c5e3"
> +SRC_URI[sha256sum] =3D=20
> "9186e6e7302f38c1f77b763f0f14843fabc873ac7c81ede8ee094a47055668b5"

Is that needed? There is no archive as far as I know.


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy
[2] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
[3] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines
[4] http://www.coreboot.org/Development_Guidelines
[5] http://openembedded.org/index.php/Styleguide
[6] http://openembedded.org/index.php/Legacy_staging

--=-LwX8Z5biJbrSg1Zpa5+y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4gi3AACgkQPX1aK2wOHViQ+QCghpNRz89qFkCW7ZUqqBUcuCGC
oT4AnituKfob+FsTvxnmrOGz0A5KfaCT
=6wpU
-----END PGP SIGNATURE-----

--=-LwX8Z5biJbrSg1Zpa5+y--
