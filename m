Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TsHTY-0004YA-RQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 19:31:10 +0100
Received: by mail-pa0-f53.google.com with SMTP id hz1so10844715pad.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 10:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y62Q9huVbfXppPbHeGEc7Zrdb4QEQU0Xod7pJrrf8mA=;
	b=JscC75gudNUd/hHrTN+KUUHFHcH5tGo5SPfRjItlp/Uk8OyaZ6OHQif1ys0IJcfP6y
	joxZmYiOWeBtuBD4X+tZdiosBSseheUrSQZ3WiLywUCjAnQMEjmmRqQMSdIw8MinSDR4
	o8KlJdhAlMHc4HKArhP78X5icr61uWZKqBvd5BO0B61S8Nxsby5VK6FN4bYfThbtH059
	UZY9t4P58647GdBp///sQOVz7rFlSsyCEvqvM9HT1uTzQrvX/DCo35oHUjvpKFg9bwo+
	85tfSPvlzPVpYVU3GmB5i1zjz75WA4qWtFPy5R/In8v5AZKr93C2+UKwwDjlOhdw5O7l
	Z4dA==
X-Received: by 10.66.82.200 with SMTP id k8mr180038113pay.56.1357582558307;
	Mon, 07 Jan 2013 10:15:58 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j9sm39121363paw.2.2013.01.07.10.15.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 10:15:57 -0800 (PST)
Date: Mon, 7 Jan 2013 19:15:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130107181558.GF3285@jama>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-13-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1357463568-26241-13-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH V2 13/25] concurrencykit: Add recipe for latest from git
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
X-List-Received-Date: Mon, 07 Jan 2013 18:31:12 -0000
X-Groupsio-MsgNum: 42567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Content-Disposition: inline

--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 06, 2013 at 01:12:36AM -0800, Khem Raj wrote:
> Provides concurrency primitives
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Fails to build for qemuarm:

ERROR: Function failed: do_configure (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/concurrencykit/git-r0/t=
emp/log.do_configure.30852 for further information)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/concurrencykit/git-r0/temp/l=
og.do_configure.30852
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| Detecting operating system.......success [linux]
| failed  [unsupported]
| ERROR: Function failed: do_configure (see /home/jenkins/oe/shr-core-branc=
hes/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/concurrencykit/git-r0=
/temp/log.do_configure.30852 for further information)
NOTE: recipe concurrencykit-git-r0: task do_configure: Failed
ERROR: Task 8089 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembe=
dded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb, do_conf=
igure) failed with exit code '1'

> ---
>  .../concurrencykit/concurrencykit/cross.patch      |   69 ++++++++++++++=
++++++
>  .../concurrencykit/concurrencykit_git.bb           |   38 +++++++++++
>  2 files changed, 107 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencyki=
t/cross.patch
>  create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencyki=
t_git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross=
=2Epatch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.pat=
ch
> new file mode 100644
> index 0000000..38504fe
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
> @@ -0,0 +1,69 @@
> +Index: git/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure	2012-11-19 21:07:51.917429465 -0800
> ++++ git/configure	2012-11-19 21:13:19.337437278 -0800
> +@@ -275,8 +275,11 @@
> + assert "$SYSTEM" "$SYSTEM" "unsupported"
> +=20
> + CORES=3D${CORES:-${DCORES}}
> +-printf "Detecting machine architecture..."
> +-PLATFORM=3D`uname -m 2> /dev/null`
> ++if test -z "$PLATFORM"; then
> ++	printf "Detecting machine architecture..."
> ++	PLATFORM=3D`uname -m 2> /dev/null`
> ++fi
> ++
> + case $PLATFORM in
> + 	"macppc"|"Power Macintosh"|"powerpc")
> + 		MM=3D"${MM:-"CK_MD_RMO"}"
> +@@ -439,14 +442,18 @@
> + 	GZIP_SUFFIX=3D".gz"
> + fi
> +=20
> +-printf "Finding suitable compiler........"
> +-CC=3D`pathsearch "${CC:-cc}"`
> +-if test -z "$CC" -o ! -x "$CC"; then
> +-	CC=3D`pathsearch "${CC:-gcc}"`
> ++if test -z "$CC"; then
> ++	printf "Finding suitable compiler........"
> ++	CC=3D`pathsearch "${CC:-cc}"`
> ++	if test -z "$CC" -o ! -x "$CC"; then
> ++		CC=3D`pathsearch "${CC:-gcc}"`
> ++	fi
> + fi
> + assert "$CC" "not found"
> +=20
> +-cat << EOF > .1.c
> ++if test -z "$COMPILER"; then
> ++
> ++	cat << EOF > .1.c
> + #include <stdio.h>
> + int main(void) {
> + #if defined(__GNUC__) && (__GNUC__ >=3D 4)
> +@@ -460,16 +467,16 @@
> + #endif
> + }
> + EOF
> +-
> +-$CC -o .1 .1.c
> +-COMPILER=3D`./.1`
> +-r=3D$?
> +-rm -f .1.c .1
> +-
> +-if test "$r" -ne 0; then
> +-	assert "" "update compiler"
> +-else
> +-	echo "success [$CC]"
> ++	$CC -o .1 .1.c
> ++	COMPILER=3D`./.1`
> ++	r=3D$?
> ++	rm -f .1.c .1
> ++
> ++	if test "$r" -ne 0; then
> ++		assert "" "update compiler"
> ++	else
> ++		echo "success [$CC]"
> ++	fi
> + fi
> +=20
> + if test "$COMPILER" =3D "suncc"; then
> diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.b=
b b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> new file mode 100644
> index 0000000..463e7e4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION =3D "Concurrency Kit provides a plethora of concurrency prim=
itives, \
> +safe memory reclamation mechanisms and non-blocking data structures \
> +designed to aid in the design and implementation of high performance \
> +concurrent systems."
> +
> +LICENSE =3D "BSD & Apache-2.0"
> +HOMEPAGE =3D "http://concurrencykit.org"
> +SECTION =3D "base"
> +
> +SRCREV =3D "900d203aa9e41288545368ea40da0bee89f7907f"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df12611e65e064515ce264249b2bde=
a98"
> +SRC_URI =3D "git://git.concurrencykit.org/ck.git;protocol=3Dgit \
> +           file://cross.patch \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +PLAT_powerpc64 =3D "ppc64"
> +PLAT ?=3D "${HOST_ARCH}"
> +
> +do_configure () {
> +	export PLATFORM=3D${PLAT}
> +	export COMPILER=3D'gcc'
> +	${S}/configure \
> +	--prefix=3D${prefix} \
> +	--includedir=3D${includedir} \
> +	--libdir=3D${libdir} \
> +}
> +
> +do_compile () {
> +	oe_runmake
> +}
> +
> +do_install () {
> +	oe_runmake 'DESTDIR=3D${D}' install
> +}
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDrEN4ACgkQN1Ujt2V2gBzG5ACfe/l4Aw9v/Lux8mpndvJhipY9
YK0An2ySuhHhwufC4wqAEwgEG9H1iSpQ
=1rP9
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
