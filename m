Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id AC81A6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 10:08:35 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x13so3445776wgg.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 03:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rt7OFtIk7d7NFoto7Qk756IoK6VMNbc5K38aOnWt6b4=;
	b=lJFgdRo67fcN99XdLtbTf5UDowIAmkOTW5GRsaaafh7dzB1kZfLWFbhwq+ZXDD+oqF
	y6PbuFIbnfAOpFAcYXogbMKALaXvgJuWorgiYxj2p020ESHho4tGKTYJtZCeirQ/Wg9A
	ii0G0XRnZFpa9VeSwORSWFGTWqakCEPt50dfJFx8T6IJfimssMXFzRN+3esSkUe+EjF5
	hQP+c3j0zg3EvjLk11zKJSPC+bp2+52kx3jf+sy+n19wsTLcw7F+8RPw+oq10whowgQR
	oATyUcFHjKturCq+blt+cKRYAFebkESH4Mpf+pPfCLuxgLS0Vlw1v/F7F8IR0NiQVaOP
	8/yg==
X-Received: by 10.180.206.230 with SMTP id lr6mr3713279wic.82.1412935714406;
	Fri, 10 Oct 2014 03:08:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	yr10sm6455654wjc.38.2014.10.10.03.08.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 03:08:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Oct 2014 12:09:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141010100938.GH12322@jama>
References: <1412690904-15774-1-git-send-email-guy.morand@netmodule.com>
MIME-Version: 1.0
In-Reply-To: <1412690904-15774-1-git-send-email-guy.morand@netmodule.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Guy Morand <guy.morand@netmodule.com>
Subject: Re: [meta-oe][PATCH] iperf3: Adds git and 3.0.8 version
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
X-List-Received-Date: Fri, 10 Oct 2014 10:08:38 -0000
X-Groupsio-MsgNum: 52422
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pfTAc8Cvt8L6I27a"
Content-Disposition: inline

--pfTAc8Cvt8L6I27a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 04:08:24PM +0200, Guy Morand wrote:
> iperf3 is the new successor of iperf. The project is now mature enough as=
 it
> started in 2009 and has stable releases. It supports reporting results in=
 the
> portable JSON format, provides more information than iperf does and also =
adds
> some features from other tools such as nuttcp and netperf but were missin=
g from
> the original iperf.

Have you tested this with oe-core master?

It probably needs patch to pass -foreign to automake:

| NOTE: Executing ACLOCAL=3D"aclocal --system-acdir=3D/home/jenkins/oe/worl=
d/shr-core/tmp-glibc/work/core2-64-oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038d=
d93-r0/build/aclocal-copy/ --automake-acdir=3D/home/jenkins/oe/world/shr-co=
re/tmp-glibc/sysroots/x86_64-linux/usr/share/aclocal-1.14" autoreconf --ver=
bose --install --force --exclude=3Dautopoint -I /home/jenkins/oe/world/shr-=
core/tmp-glibc/work/core2-64-oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0=
/git/config/
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=3D/home/jenkins/oe/world/shr-=
core/tmp-glibc/work/core2-64-oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0=
/build/aclocal-copy/ --automake-acdir=3D/home/jenkins/oe/world/shr-core/tmp=
-glibc/sysroots/x86_64-linux/usr/share/aclocal-1.14 -I /home/jenkins/oe/wor=
ld/shr-core/tmp-glibc/work/core2-64-oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038=
dd93-r0/git/config/ -I /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2=
-64-oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0/git/config/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `config'.
| libtoolize: copying file `config/ltmain.sh'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac a=
nd
| libtoolize: rerunning libtoolize, to keep the correct libtool macros in-t=
ree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| libtoolize: `AC_PROG_RANLIB' is rendered obsolete by `LT_INIT'
| autoreconf: running: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x=
86_64-linux/usr/bin/autoconf --include=3D/home/jenkins/oe/world/shr-core/tm=
p-glibc/work/core2-64-oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0/git/co=
nfig/ --force
| autoreconf: running: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x=
86_64-linux/usr/bin/autoheader --include=3D/home/jenkins/oe/world/shr-core/=
tmp-glibc/work/core2-64-oe-linux/iperf3/3.0.8+gitAUTOINC+bcd038dd93-r0/git/=
config/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| Makefile.am: error: required file './NEWS' not found
| Makefile.am: error: required file './README' not found
| Makefile.am: error: required file './AUTHORS' not found
| Makefile.am: error: required file './ChangeLog' not found
| Makefile.am: installing './COPYING' using GNU General Public License v3 f=
ile
| Makefile.am:     Consider adding the COPYING file to the version control =
system
| Makefile.am:     for your code, to avoid questions about which license yo=
ur project uses
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/iperf3/3.0.8+gitAUTOIN=
C+bcd038dd93-r0/temp/log.do_configure.16696)
NOTE: recipe iperf3-3.0.8+gitAUTOINC+bcd038dd93-r0: task do_configure: Fail=
ed

>=20
> Signed-off-by: Guy Morand <guy.morand@netmodule.com>
> ---
>  meta-oe/recipes-benchmark/iperf3/iperf3.inc      |   20 ++++++++++++++++=
++++
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb |    6 ++++++
>  meta-oe/recipes-benchmark/iperf3/iperf3_git.bb   |    7 +++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3.inc
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3.inc b/meta-oe/recipe=
s-benchmark/iperf3/iperf3.inc
> new file mode 100644
> index 0000000..029a144
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3.inc
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Network benchmark tool"
> +DESCRIPTION =3D \
> +"iperf is a tool for active measurements of the maximum achievable bandw=
idth \
> +on IP networks. It supports tuning of various parameters related to timi=
ng, \
> +protocols, and buffers. For each test it reports the bandwidth, loss, an=
d \
> +other parameters."
> +HOMEPAGE =3D "http://software.es.net/iperf/"
> +SECTION =3D "console/network"
> +BUGTRACKER =3D "https://github.com/esnet/iperf/issues"
> +AUTHOR =3D "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <=
websupport@lbl.gov>"
> +LICENSE =3D "BSD"
> +
> +BRANCH =3D "master"
> +SRC_URI =3D "\
> +           git://github.com/esnet/iperf.git;branch=3D${BRANCH} \
> +           "
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb b/meta-oe/r=
ecipes-benchmark/iperf3/iperf3_3.0.8.bb
> new file mode 100644
> index 0000000..a39deff
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
> @@ -0,0 +1,6 @@
> +require iperf3.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab59a0c3a4bc3954d1ece68ea19d7=
7a4"
> +
> +BRANCH =3D "3.0-STABLE"
> +SRCREV =3D "24d5cdec3731bc589f6cb7c359d8311dcaa41854"
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/rec=
ipes-benchmark/iperf3/iperf3_git.bb
> new file mode 100644
> index 0000000..77ebe15
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
> @@ -0,0 +1,7 @@
> +require iperf3.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D062ab1bc33fae1926387ac1274cb0=
873"
> +
> +PV =3D "3.0.8+git${SRCPV}"
> +SRCREV =3D "${AUTOREV}"
> +
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pfTAc8Cvt8L6I27a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ3sGIACgkQN1Ujt2V2gBy0vwCgg9imR/A6eo6TIbE6HAdef6yh
PYsAoK7See9zHnfnvrxoC72tNDwftIhU
=fLdH
-----END PGP SIGNATURE-----

--pfTAc8Cvt8L6I27a--
