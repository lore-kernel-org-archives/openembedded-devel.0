Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 68E226C735
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 20:46:55 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so2099180eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RpVr1Yi1oZ+9xHS4IcmgMxJ4TaVVEdJHyiVv0Sdl1uE=;
	b=EBDH2jld+XLQ6N3Rl/GtMKanSVxSQW3ann559w5WzPMH5G85e7amUuLBPt5zGCwXVV
	lndsbS1/509BB+Hldxga/bSfdIBHqs+y3xA8h+TAJdMGHIl48zdwDrxpVzz8TIqLmIfh
	ucexek7Dd59f4RJjw7MIOE1kY5FW6Eg2WCdWmzo7hYedTNJieLW3c+KSIC2av2tssMwA
	A2woCWtrsFgyGIpu95X7MjOLoNK4Z8JlkH5XqnE42JRMl5k49/AgH1SfJYCSI2KKBaVW
	TB9MSEL/XPCuxz/uQ6jW/Fr5i4tRxYITyPla9my2OyvQG23s5sZwRkg3H0Eu2mdT9+wp
	Zaxw==
X-Received: by 10.14.182.68 with SMTP id n44mr19725381eem.6.1395866816765;
	Wed, 26 Mar 2014 13:46:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm49491517eee.2.2014.03.26.13.46.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 13:46:55 -0700 (PDT)
Date: Wed, 26 Mar 2014 21:46:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140326204655.GK3709@jama>
References: <1395326878-6726-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1395326878-6726-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] open-vcdiff: add new recipe for version 0.8.3
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
X-List-Received-Date: Wed, 26 Mar 2014 20:46:59 -0000
X-Groupsio-MsgNum: 48843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7Ke/meiCZutM6I/"
Content-Disposition: inline

--C7Ke/meiCZutM6I/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2014 at 03:47:58PM +0100, Matthieu Crapet wrote:
> This is Google's implementation of VCDIFF (RFC 3284) delta compression.
> It's more flexible than Xdelta3 (as a developer point of view).

Fails to build in world:

ERROR: Function failed: do_configure (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/open=
-vcdiff/0.8.3-r0/temp/log.do_configure.21351)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/open-vcdiff/0.8.3-r0/temp/lo=
g.do_configure.21351
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.14
| Copyright (C) 2013 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2=
=2E0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|=20
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| NOTE: Executing ACLOCAL=3D"aclocal --system-acdir=3D/home/jenkins/oe/shr-=
core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/open-vcdiff=
/0.8.3-r0/open-vcdiff-0.8.3/aclocal-copy/" autoreconf --verbose --install -=
-force --exclude=3Dautopoint -I /home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/open-vcdiff/0.8.3-r0/open-vcdiff-=
0.8.3/gflags/m4 -I /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/w=
ork/armv5te-oe-linux-gnueabi/open-vcdiff/0.8.3-r0/open-vcdiff-0.8.3/m4/
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=3D/home/jenkins/oe/shr-core-b=
ranches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/open-vcdiff/0.8.3=
-r0/open-vcdiff-0.8.3/aclocal-copy/ -I /home/jenkins/oe/shr-core-branches/s=
hr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/open-vcdiff/0.8.3-r0/open-=
vcdiff-0.8.3/gflags/m4 -I /home/jenkins/oe/shr-core-branches/shr-core/tmp-e=
glibc/work/armv5te-oe-linux-gnueabi/open-vcdiff/0.8.3-r0/open-vcdiff-0.8.3/=
m4/ -I /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-=
oe-linux-gnueabi/open-vcdiff/0.8.3-r0/open-vcdiff-0.8.3/gflags/m4 -I /home/=
jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnue=
abi/open-vcdiff/0.8.3-r0/open-vcdiff-0.8.3/m4/ --force -I m4 \
| aclocal: error: non-option arguments are not accepted: '\'.
| aclocal: Try '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysr=
oots/x86_64-linux/usr/bin/aclocal --help' for more information.
| autoreconf: aclocal failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/op=
en-vcdiff/0.8.3-r0/temp/log.do_configure.21351)
ERROR: Task 5 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedde=
d/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb, do_configure) f=
ailed with exit code '1'
NOTE: Tasks Summary: Attempted 519 tasks of which 514 didn't need to be rer=
un and 1 failed.


>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  .../recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3=
=2Ebb
>=20
> diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb b/m=
eta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
> new file mode 100644
> index 0000000..ee08102
> --- /dev/null
> +++ b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "An encoder/decoder for the VCDIFF (RFC3284) format"
> +DESCRIPTION =3D "A library with a simple API is included, as well as a \
> +               command-line executable that can apply the encoder and \
> +               decoder to source, target, and delta files. \
> +               A slight variation from the draft standard is defined \
> +               to allow chunk-by-chunk decoding when only a partial \
> +               delta file window is available."
> +HOMEPAGE =3D "http://code.google.com/p/open-vcdiff/"
> +SECTION =3D "console/utils"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db2c8309843bc5297cfb4dc84f43f3=
ccc"
> +
> +SRC_URI =3D "http://open-vcdiff.googlecode.com/files/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "5f848e4916b407879f55e0ca74c3f6af"
> +SRC_URI[sha256sum] =3D "b7e47db78866082e9e8b5782f5491092c8414f0acc0440ae=
a03b14c7d1d3c371"
> +
> +inherit autotools
> +
> +EXTRA_AUTORECONF +=3D " -I ${S}/gflags/m4"
> --=20
> 1.8.5.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7Ke/meiCZutM6I/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzPL8ACgkQN1Ujt2V2gBw9VACdFhEjBhIEyHd8BRzNPS5eNdv+
CQQAni0j59GBkfVw/ixRkMebjMdbtklV
=QE//
-----END PGP SIGNATURE-----

--C7Ke/meiCZutM6I/--
