Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id D42547913B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 00:02:50 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s17-v6so2845024plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 17:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=2pGJ171PmFFACf3b157LNGSXPuDpvQS64RaRCKaWEZg=;
	b=uU/qklzuPPoSlxNz9vKAivBJThJZO5pXmJZ7rxADJcdRKIq+x42Vs71y4yZMalCJYQ
	qLILptqY+4hDSdgILLunKD1F/sCvfOX3/P6mvrc6qmPEXDTZUH4PN+I+TZOJnO1JfXzX
	NYEfed+0X0ar5KvU1ZfN4pksn+QGAY8It/eT0V9UeicmN0gDwRZNypec73597isSOD1T
	Ykfote14cKvWSAybY0n5NpnqLhXH+MztTrBl7jt3hPaksM7d41GT0g4QQlmQQHH3HIQu
	XZZb2pFNDkCg99QG+DjQ5KNPXOodjHU4/vAwjDNTJDkjIhD5YDF9vi458OwlPsdISh9d
	nloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=2pGJ171PmFFACf3b157LNGSXPuDpvQS64RaRCKaWEZg=;
	b=ofJ1YlLj/HdOabSVrLco1BdA+haXlc8panaNmdzNvLMNw5+ch3zW1OueBo9TpXOXz0
	if6+9pNHRGYA7PTgeJ1K1pLvdmwZpVpxsyQMad7VA7KqQQlK25kOoRyNnUzEif1tUmdz
	05KjjnRjVjo4iT7lHfEyX1aI1TJ3LsFqrscOqjCfHuR59tClJTGOAnvK4ZI+M9t4tsWd
	z7ultuuE9cvidp6f4vDhptQ31BD9e593Covw7ruGWQ6x20k0zQPLY3FKS5pXvUJRcAbs
	OiD+vn5BXgVoGWJGUBcFX+2Lr6M3jeEUQEz14+9MsvBXUiWN3imX0vr7haM13CZx7Au4
	+vog==
X-Gm-Message-State: AOUpUlHFhBZND0u6xa58pmz34mfvHxeu+4KCCmheY4aETeDbiQPEo+LO
	wb/2wqWA4N+QhZ9F33UVFWU=
X-Google-Smtp-Source: AA+uWPzIJ59rhAqZVkrdlMDhhIgWPUOlqiR8Vz7HHHX8iKAzTlGUMKfzeXgNf+PU4MrZD75ody7myw==
X-Received: by 2002:a17:902:bc49:: with SMTP id
	t9-v6mr31086051plz.116.1534464170696; 
	Thu, 16 Aug 2018 17:02:50 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:2490:104c:b925:26c4])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm438998pgr.41.2018.08.16.17.02.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 17:02:49 -0700 (PDT)
To: Joe MacDonald <joe_macdonald@mentor.com>,
	openembedded-devel@lists.openembedded.org
References: <20180816152927.4833-1-joe_macdonald@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
	Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
	miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
	/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
	4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
	ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
	jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
	6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
	PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQoAIAIbAwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
	BQJTBC0aAAoJELsFM1WRnTMUul4An282FaN7oYXM2A8JzQt1ZWeUTlJZAJ0eOgup2Eqxx6gZ
	FOQE7EkRmOb6iM7DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
	DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
	2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
	I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
	RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
	6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
	584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
	HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
	KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
	seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
	3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
	9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
	EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
	X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
	3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
	jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
	UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
	mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
	suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
	XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
	VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Organization: HIMVIS LLC
Message-ID: <20155edf-dc19-5d00-7a6f-dbadb24b66f8@gmail.com>
Date: Thu, 16 Aug 2018 17:02:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180816152927.4833-1-joe_macdonald@mentor.com>
Cc: stefan.bosak@gmail.com
Subject: Re: [meta-networking][PATCH v2] bird: initial import
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2018 00:02:51 -0000
X-Groupsio-MsgNum: 74010
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="QgXpNsEa9g8AcE9IQHzGVuEETyRwwHxm4"

--QgXpNsEa9g8AcE9IQHzGVuEETyRwwHxm4
Content-Type: multipart/mixed; boundary="vkrWasu52rLlldIdTjWkKyz1Jh4zODZ6W";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Joe MacDonald <joe_macdonald@mentor.com>,
 openembedded-devel@lists.openembedded.org
Cc: stefan.bosak@gmail.com
Message-ID: <20155edf-dc19-5d00-7a6f-dbadb24b66f8@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] bird: initial import
References: <20180816152927.4833-1-joe_macdonald@mentor.com>
In-Reply-To: <20180816152927.4833-1-joe_macdonald@mentor.com>

--vkrWasu52rLlldIdTjWkKyz1Jh4zODZ6W
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/16/18 8:29 AM, Joe MacDonald wrote:
> Initial integration of the two stable BIRD releases, 1.6.4 and 2.0.2.
>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>=20
> v2:
>    - adding upstream-status and link to upstream commit accomplishing t=
he same
>      goal.
>=20
>  .../recipes-protocols/bird/bird.inc           |   32 +
>  .../recipes-protocols/bird/bird_1.6.4.bb      |    9 +
>  .../recipes-protocols/bird/bird_2.0.2.bb      |    9 +
>  ...-extend-config.sub-to-recognize-musl.patch | 4430 +++++++++++++++++=

>  .../recipes-protocols/bird/files/bird.init    |    2 +
>  5 files changed, 4482 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/bird/bird.inc
>  create mode 100644 meta-networking/recipes-protocols/bird/bird_1.6.4.b=
b
>  create mode 100644 meta-networking/recipes-protocols/bird/bird_2.0.2.b=
b
>  create mode 100644 meta-networking/recipes-protocols/bird/files/0001-m=
usl-extend-config.sub-to-recognize-musl.patch
>  create mode 100755 meta-networking/recipes-protocols/bird/files/bird.i=
nit
>=20
> diff --git a/meta-networking/recipes-protocols/bird/bird.inc b/meta-net=
working/recipes-protocols/bird/bird.inc
> new file mode 100644
> index 000000000..33d17dcb7
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/bird/bird.inc
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "BIRD Internet Routing Daemon"
> +DESCRIPTION =3D "\
> +BIRD is dynamic routing daemon supporting IPv4 and IPv6 versions of ro=
uting \
> +protocols BGP, RIP and OSPF."
> +HOMEPAGE =3D "http://bird.network.cz"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D87;endline=3D103;md5=3D=
0efecc23f039022580d0bac9a52f6117"
> +DEPENDS =3D "flex bison ncurses readline"
> +

does it need flex and bison on target ? or just native versions

> +inherit autotools
> +
> +EXTRA_OECONF  +=3D "\
> +--enable-pthreads \
> +"
> +
> +do_configure() {
> +    oe_runconf ${EXTRA_OECONF}
> +}
> +
> +do_install_append() {
> +    install -m 0755 -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/bird.init ${D}${sysconfdir}/init.d/bird=


may be use a single line

install -D -m 0755 ${WORKDIR}/bird.init ${D}${sysconfdir}/init.d/bird

> +    rm -rf ${D}/run ${D}/var/run=20
> +}
> +
> +PACKAGES +=3D " bird-client"
> +
> +FILES_${PN} +=3D "/run /var/run"

I think we don't need this

> +FILES_${PN}-client =3D "/usr/sbin/birdc*"
> +

may be use ${sbindir} here

> +RUNIT_SERVICES =3D "bird"
> diff --git a/meta-networking/recipes-protocols/bird/bird_1.6.4.bb b/met=
a-networking/recipes-protocols/bird/bird_1.6.4.bb
> new file mode 100644
> index 000000000..27c62aeee
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/bird/bird_1.6.4.bb
> @@ -0,0 +1,9 @@
> +require bird.inc
> +
> +SRC_URI =3D "\
> +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
> +    file://bird.init \
> +    file://0001-musl-extend-config.sub-to-recognize-musl.patch \
> +    "
> +SRC_URI[md5sum] =3D "d62ec2547338e8d3dfb934b4c7b2faa4"
> +SRC_URI[sha256sum] =3D "c26b8caae988dba81a9dbbee93502463d4326d1b749d72=
8d62aa5529c605afc0"
> diff --git a/meta-networking/recipes-protocols/bird/bird_2.0.2.bb b/met=
a-networking/recipes-protocols/bird/bird_2.0.2.bb
> new file mode 100644
> index 000000000..92d858869
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/bird/bird_2.0.2.bb
> @@ -0,0 +1,9 @@
> +require bird.inc
> +
> +SRC_URI =3D "\
> +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
> +    file://bird.init \
> +    file://0001-musl-extend-config.sub-to-recognize-musl.patch \
> +    "
> +SRC_URI[md5sum] =3D "de17645b045fa13912409aea59420132"
> +SRC_URI[sha256sum] =3D "035f91d6f568f8ed438a0814235ac4c5c79147cd2acf20=
1322c307732883480f"

do we need to maintain both 1.6 and 2.x versions ?
I guess they must be incompatible with each other and 1.6 still
deployed. but I would prefer to just maintain latest version

> diff --git a/meta-networking/recipes-protocols/bird/files/0001-musl-ext=
end-config.sub-to-recognize-musl.patch b/meta-networking/recipes-protocol=
s/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
> new file mode 100644
> index 000000000..578f9b6f0
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/bird/files/0001-musl-extend-con=
fig.sub-to-recognize-musl.patch
> @@ -0,0 +1,4430 @@
> +From 21baaa6870edb68f0a417ea3b4de5c75e5cf5a0d Mon Sep 17 00:00:00 2001=

> +From: Joe MacDonald <joe_macdonald@mentor.com>
> +Date: Thu, 16 Aug 2018 01:56:05 +0000
> +Subject: [PATCH] musl: update config.guess and config.sub
> +
> +Just bringing config.guess and config.sub up to date is enough to enab=
le
> +musl to build BIRD.
> +
> +Upstream-Status: Backport [https://gitlab.labs.nic.cz/labs/bird/commit=
/822a7ee6d5cd9bf38548026e0dd52fbc4634030d]
> +
> +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> +---
> + tools/config.guess | 1193 ++++++++++++++---------------
> + tools/config.sub   | 1810 +++++++++++++++++++++++--------------------=
-
> + 2 files changed, 1520 insertions(+), 1483 deletions(-)
> +
> +diff --git a/tools/config.guess b/tools/config.guess
> +index da83314..445c406 100755
> +--- a/tools/config.guess
> ++++ b/tools/config.guess
> +@@ -1,14 +1,12 @@
> + #! /bin/sh
> + # Attempt to guess a canonical system name.
> +-#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
> +-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
> +-#   Free Software Foundation, Inc.
> ++#   Copyright 1992-2018 Free Software Foundation, Inc.
> +=20
> +-timestamp=3D'2009-04-27'
> ++timestamp=3D'2018-06-26'
> +=20
> + # This file is free software; you can redistribute it and/or modify i=
t
> + # under the terms of the GNU General Public License as published by
> +-# the Free Software Foundation; either version 2 of the License, or
> ++# the Free Software Foundation; either version 3 of the License, or
> + # (at your option) any later version.
> + #
> + # This program is distributed in the hope that it will be useful, but=

> +@@ -17,26 +15,22 @@ timestamp=3D'2009-04-27'
> + # General Public License for more details.
> + #
> + # You should have received a copy of the GNU General Public License
> +-# along with this program; if not, write to the Free Software
> +-# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
> +-# 02110-1301, USA.
> ++# along with this program; if not, see <https://www.gnu.org/licenses/=
>.
> + #
> + # As a special exception to the GNU General Public License, if you
> + # distribute this file as part of a program that contains a
> + # configuration script generated by Autoconf, you may include it unde=
r
> +-# the same distribution terms that you use for the rest of that progr=
am.
> +-
> +-
> +-# Originally written by Per Bothner <per@bothner.com>.
> +-# Please send patches to <config-patches@gnu.org>.  Submit a context
> +-# diff and a properly formatted ChangeLog entry.
> ++# the same distribution terms that you use for the rest of that
> ++# program.  This Exception is an additional permission under section =
7
> ++# of the GNU General Public License, version 3 ("GPLv3").
> + #
> +-# This script attempts to guess a canonical system name similar to
> +-# config.sub.  If it succeeds, it prints the system name on stdout, a=
nd
> +-# exits with 0.  Otherwise, it exits with 1.
> ++# Originally written by Per Bothner; maintained since 2000 by Ben Ell=
iston.
> + #
> +-# The plan is that this can be called by configure scripts if you
> +-# don't specify an explicit build system type.
> ++# You can get the latest version of this script from:
> ++# https://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=3Dblob_plain;=
f=3Dconfig.guess
> ++#
> ++# Please send patches to <config-patches@gnu.org>.
> ++
> +=20
> + me=3D`echo "$0" | sed -e 's,.*/,,'`
> +=20
> +@@ -45,7 +39,7 @@ Usage: $0 [OPTION]
> +=20
> + Output the configuration name of the system \`$me' is run on.
> +=20
> +-Operation modes:
> ++Options:
> +   -h, --help         print this help, then exit
> +   -t, --time-stamp   print date of last modification, then exit
> +   -v, --version      print version number, then exit
> +@@ -56,8 +50,7 @@ version=3D"\
> + GNU config.guess ($timestamp)
> +=20
> + Originally written by Per Bothner.
> +-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2=
001,
> +-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, In=
c.
> ++Copyright 1992-2018 Free Software Foundation, Inc.
> +=20
> + This is free software; see the source for copying conditions.  There =
is NO
> + warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PU=
RPOSE."
> +@@ -113,10 +106,10 @@ trap "rm -f \$tmpfiles 2>/dev/null; rmdir \$tmp =
2>/dev/null; exit 1" 1 2 13 15 ;
> +  { echo "$me: cannot create a temporary directory in $TMPDIR" >&2 ; e=
xit 1 ; } ;
> + dummy=3D$tmp/dummy ;
> + tmpfiles=3D"$dummy.c $dummy.o $dummy.rel $dummy" ;
> +-case $CC_FOR_BUILD,$HOST_CC,$CC in
> +- ,,)    echo "int x;" > $dummy.c ;
> ++case ${CC_FOR_BUILD-},${HOST_CC-},${CC-} in
> ++ ,,)    echo "int x;" > "$dummy.c" ;
> + 	for c in cc gcc c89 c99 ; do
> +-	  if ($c -c -o $dummy.o $dummy.c) >/dev/null 2>&1 ; then
> ++	  if ($c -c -o "$dummy.o" "$dummy.c") >/dev/null 2>&1 ; then
> + 	     CC_FOR_BUILD=3D"$c"; break ;
> + 	  fi ;
> + 	done ;
> +@@ -139,12 +132,40 @@ UNAME_RELEASE=3D`(uname -r) 2>/dev/null` || UNAM=
E_RELEASE=3Dunknown
> + UNAME_SYSTEM=3D`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=3Dunknown
> + UNAME_VERSION=3D`(uname -v) 2>/dev/null` || UNAME_VERSION=3Dunknown
> +=20
> ++case "$UNAME_SYSTEM" in
> ++Linux|GNU|GNU/*)
> ++	# If the system lacks a compiler, then just pick glibc.
> ++	# We could probably try harder.
> ++	LIBC=3Dgnu
> ++
> ++	eval "$set_cc_for_build"
> ++	cat <<-EOF > "$dummy.c"
> ++	#include <features.h>
> ++	#if defined(__UCLIBC__)
> ++	LIBC=3Duclibc
> ++	#elif defined(__dietlibc__)
> ++	LIBC=3Ddietlibc
> ++	#else
> ++	LIBC=3Dgnu
> ++	#endif
> ++	EOF
> ++	eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^LIBC' | sed =
's, ,,g'`"
> ++
> ++	# If ldd exists, use it to detect musl libc.
> ++	if command -v ldd >/dev/null && \
> ++		ldd --version 2>&1 | grep -q ^musl
> ++	then
> ++	    LIBC=3Dmusl
> ++	fi
> ++	;;
> ++esac
> ++
> + # Note: order is significant - the case branches are not exclusive.
> +=20
> +-case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSI=
ON}" in
> ++case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
> +     *:NetBSD:*:*)
> + 	# NetBSD (nbsd) targets should (where applicable) match one or
> +-	# more of the tupples: *-*-netbsdelf*, *-*-netbsdaout*,
> ++	# more of the tuples: *-*-netbsdelf*, *-*-netbsdaout*,
> + 	# *-*-netbsdecoff* and *-*-netbsd*.  For targets that recently
> + 	# switched to ELF, *-*-netbsd* would select the old
> + 	# object file format.  This provides both forward
> +@@ -154,23 +175,33 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> + 	# Note: NetBSD doesn't particularly care about the vendor
> + 	# portion of the name.  We always set it to "unknown".
> + 	sysctl=3D"sysctl -n hw.machine_arch"
> +-	UNAME_MACHINE_ARCH=3D`(/sbin/$sysctl 2>/dev/null || \
> +-	    /usr/sbin/$sysctl 2>/dev/null || echo unknown)`
> +-	case "${UNAME_MACHINE_ARCH}" in
> ++	UNAME_MACHINE_ARCH=3D`(uname -p 2>/dev/null || \
> ++	    "/sbin/$sysctl" 2>/dev/null || \
> ++	    "/usr/sbin/$sysctl" 2>/dev/null || \
> ++	    echo unknown)`
> ++	case "$UNAME_MACHINE_ARCH" in
> + 	    armeb) machine=3Darmeb-unknown ;;
> + 	    arm*) machine=3Darm-unknown ;;
> + 	    sh3el) machine=3Dshl-unknown ;;
> + 	    sh3eb) machine=3Dsh-unknown ;;
> + 	    sh5el) machine=3Dsh5le-unknown ;;
> +-	    *) machine=3D${UNAME_MACHINE_ARCH}-unknown ;;
> ++	    earmv*)
> ++		arch=3D`echo "$UNAME_MACHINE_ARCH" | sed -e 's,^e\(armv[0-9]\).*$,\=
1,'`
> ++		endian=3D`echo "$UNAME_MACHINE_ARCH" | sed -ne 's,^.*\(eb\)$,\1,p'`=

> ++		machine=3D"${arch}${endian}"-unknown
> ++		;;
> ++	    *) machine=3D"$UNAME_MACHINE_ARCH"-unknown ;;
> + 	esac
> + 	# The Operating System including object format, if it has switched
> +-	# to ELF recently, or will in the future.
> +-	case "${UNAME_MACHINE_ARCH}" in
> ++	# to ELF recently (or will in the future) and ABI.
> ++	case "$UNAME_MACHINE_ARCH" in
> ++	    earm*)
> ++		os=3Dnetbsdelf
> ++		;;
> + 	    arm*|i386|m68k|ns32k|sh3*|sparc|vax)
> +-		eval $set_cc_for_build
> ++		eval "$set_cc_for_build"
> + 		if echo __ELF__ | $CC_FOR_BUILD -E - 2>/dev/null \
> +-			| grep __ELF__ >/dev/null
> ++			| grep -q __ELF__
> + 		then
> + 		    # Once all utilities can be ECOFF (netbsdecoff) or a.out (netbs=
daout).
> + 		    # Return netbsd for either.  FIX?
> +@@ -180,7 +211,14 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RE=
LEASE}:${UNAME_VERSION}" in
> + 		fi
> + 		;;
> + 	    *)
> +-	        os=3Dnetbsd
> ++		os=3Dnetbsd
> ++		;;
> ++	esac
> ++	# Determine ABI tags.
> ++	case "$UNAME_MACHINE_ARCH" in
> ++	    earm*)
> ++		expr=3D's/^earmv[0-9]/-eabi/;s/eb$//'
> ++		abi=3D`echo "$UNAME_MACHINE_ARCH" | sed -e "$expr"`
> + 		;;
> + 	esac
> + 	# The OS release
> +@@ -188,42 +226,62 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> + 	# thus, need a distinct triplet. However, they do not need
> + 	# kernel version information, so it can be replaced with a
> + 	# suitable tag, in the style of linux-gnu.
> +-	case "${UNAME_VERSION}" in
> ++	case "$UNAME_VERSION" in
> + 	    Debian*)
> + 		release=3D'-gnu'
> + 		;;
> + 	    *)
> +-		release=3D`echo ${UNAME_RELEASE}|sed -e 's/[-_].*/\./'`
> ++		release=3D`echo "$UNAME_RELEASE" | sed -e 's/[-_].*//' | cut -d. -f=
1,2`
> + 		;;
> + 	esac
> + 	# Since CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM:
> + 	# contains redundant information, the shorter form:
> + 	# CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is used.
> +-	echo "${machine}-${os}${release}"
> ++	echo "$machine-${os}${release}${abi-}"
> ++	exit ;;
> ++    *:Bitrig:*:*)
> ++	UNAME_MACHINE_ARCH=3D`arch | sed 's/Bitrig.//'`
> ++	echo "$UNAME_MACHINE_ARCH"-unknown-bitrig"$UNAME_RELEASE"
> + 	exit ;;
> +     *:OpenBSD:*:*)
> + 	UNAME_MACHINE_ARCH=3D`arch | sed 's/OpenBSD.//'`
> +-	echo ${UNAME_MACHINE_ARCH}-unknown-openbsd${UNAME_RELEASE}
> ++	echo "$UNAME_MACHINE_ARCH"-unknown-openbsd"$UNAME_RELEASE"
> ++	exit ;;
> ++    *:LibertyBSD:*:*)
> ++	UNAME_MACHINE_ARCH=3D`arch | sed 's/^.*BSD\.//'`
> ++	echo "$UNAME_MACHINE_ARCH"-unknown-libertybsd"$UNAME_RELEASE"
> ++	exit ;;
> ++    *:MidnightBSD:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-midnightbsd"$UNAME_RELEASE"
> + 	exit ;;
> +     *:ekkoBSD:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-ekkobsd${UNAME_RELEASE}
> ++	echo "$UNAME_MACHINE"-unknown-ekkobsd"$UNAME_RELEASE"
> + 	exit ;;
> +     *:SolidBSD:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-solidbsd${UNAME_RELEASE}
> ++	echo "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_RELEASE"
> + 	exit ;;
> +     macppc:MirBSD:*:*)
> +-	echo powerpc-unknown-mirbsd${UNAME_RELEASE}
> ++	echo powerpc-unknown-mirbsd"$UNAME_RELEASE"
> + 	exit ;;
> +     *:MirBSD:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-mirbsd${UNAME_RELEASE}
> ++	echo "$UNAME_MACHINE"-unknown-mirbsd"$UNAME_RELEASE"
> + 	exit ;;
> ++    *:Sortix:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-sortix
> ++	exit ;;
> ++    *:Redox:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-redox
> ++	exit ;;
> ++    mips:OSF1:*.*)
> ++        echo mips-dec-osf1
> ++        exit ;;
> +     alpha:OSF1:*:*)
> + 	case $UNAME_RELEASE in
> + 	*4.0)
> + 		UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk '{print $3}'`
> + 		;;
> + 	*5.*)
> +-	        UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk '{print $4}'`
> ++		UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk '{print $4}'`
> + 		;;
> + 	esac
> + 	# According to Compaq, /usr/sbin/psrinfo has been available on
> +@@ -233,60 +291,54 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> + 	ALPHA_CPU_TYPE=3D`/usr/sbin/psrinfo -v | sed -n -e 's/^  The alpha \=
(.*\) processor.*$/\1/p' | head -n 1`
> + 	case "$ALPHA_CPU_TYPE" in
> + 	    "EV4 (21064)")
> +-		UNAME_MACHINE=3D"alpha" ;;
> ++		UNAME_MACHINE=3Dalpha ;;
> + 	    "EV4.5 (21064)")
> +-		UNAME_MACHINE=3D"alpha" ;;
> ++		UNAME_MACHINE=3Dalpha ;;
> + 	    "LCA4 (21066/21068)")
> +-		UNAME_MACHINE=3D"alpha" ;;
> ++		UNAME_MACHINE=3Dalpha ;;
> + 	    "EV5 (21164)")
> +-		UNAME_MACHINE=3D"alphaev5" ;;
> ++		UNAME_MACHINE=3Dalphaev5 ;;
> + 	    "EV5.6 (21164A)")
> +-		UNAME_MACHINE=3D"alphaev56" ;;
> ++		UNAME_MACHINE=3Dalphaev56 ;;
> + 	    "EV5.6 (21164PC)")
> +-		UNAME_MACHINE=3D"alphapca56" ;;
> ++		UNAME_MACHINE=3Dalphapca56 ;;
> + 	    "EV5.7 (21164PC)")
> +-		UNAME_MACHINE=3D"alphapca57" ;;
> ++		UNAME_MACHINE=3Dalphapca57 ;;
> + 	    "EV6 (21264)")
> +-		UNAME_MACHINE=3D"alphaev6" ;;
> ++		UNAME_MACHINE=3Dalphaev6 ;;
> + 	    "EV6.7 (21264A)")
> +-		UNAME_MACHINE=3D"alphaev67" ;;
> ++		UNAME_MACHINE=3Dalphaev67 ;;
> + 	    "EV6.8CB (21264C)")
> +-		UNAME_MACHINE=3D"alphaev68" ;;
> ++		UNAME_MACHINE=3Dalphaev68 ;;
> + 	    "EV6.8AL (21264B)")
> +-		UNAME_MACHINE=3D"alphaev68" ;;
> ++		UNAME_MACHINE=3Dalphaev68 ;;
> + 	    "EV6.8CX (21264D)")
> +-		UNAME_MACHINE=3D"alphaev68" ;;
> ++		UNAME_MACHINE=3Dalphaev68 ;;
> + 	    "EV6.9A (21264/EV69A)")
> +-		UNAME_MACHINE=3D"alphaev69" ;;
> ++		UNAME_MACHINE=3Dalphaev69 ;;
> + 	    "EV7 (21364)")
> +-		UNAME_MACHINE=3D"alphaev7" ;;
> ++		UNAME_MACHINE=3Dalphaev7 ;;
> + 	    "EV7.9 (21364A)")
> +-		UNAME_MACHINE=3D"alphaev79" ;;
> ++		UNAME_MACHINE=3Dalphaev79 ;;
> + 	esac
> + 	# A Pn.n version is a patched version.
> + 	# A Vn.n version is a released version.
> + 	# A Tn.n version is a released field test version.
> + 	# A Xn.n version is an unreleased experimental baselevel.
> + 	# 1.2 uses "1.2" for uname -r.
> +-	echo ${UNAME_MACHINE}-dec-osf`echo ${UNAME_RELEASE} | sed -e 's/^[PV=
TX]//' | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'`
> +-	exit ;;
> +-    Alpha\ *:Windows_NT*:*)
> +-	# How do we know it's Interix rather than the generic POSIX subsyste=
m?
> +-	# Should we change UNAME_MACHINE based on the output of uname instea=
d
> +-	# of the specific Alpha model?
> +-	echo alpha-pc-interix
> +-	exit ;;
> +-    21064:Windows_NT:50:3)
> +-	echo alpha-dec-winnt3.5
> +-	exit ;;
> ++	echo "$UNAME_MACHINE"-dec-osf"`echo "$UNAME_RELEASE" | sed -e 's/^[P=
VTX]//' | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`"
> ++	# Reset EXIT trap before exiting to avoid spurious non-zero exit cod=
e.
> ++	exitcode=3D$?
> ++	trap '' 0
> ++	exit $exitcode ;;
> +     Amiga*:UNIX_System_V:4.0:*)
> + 	echo m68k-unknown-sysv4
> + 	exit ;;
> +     *:[Aa]miga[Oo][Ss]:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-amigaos
> ++	echo "$UNAME_MACHINE"-unknown-amigaos
> + 	exit ;;
> +     *:[Mm]orph[Oo][Ss]:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-morphos
> ++	echo "$UNAME_MACHINE"-unknown-morphos
> + 	exit ;;
> +     *:OS/390:*:*)
> + 	echo i370-ibm-openedition
> +@@ -295,12 +347,12 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> + 	echo s390-ibm-zvmoe
> + 	exit ;;
> +     *:OS400:*:*)
> +-        echo powerpc-ibm-os400
> ++	echo powerpc-ibm-os400
> + 	exit ;;
> +     arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
> +-	echo arm-acorn-riscix${UNAME_RELEASE}
> ++	echo arm-acorn-riscix"$UNAME_RELEASE"
> + 	exit ;;
> +-    arm:riscos:*:*|arm:RISCOS:*:*)
> ++    arm*:riscos:*:*|arm*:RISCOS:*:*)
> + 	echo arm-unknown-riscos
> + 	exit ;;
> +     SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
> +@@ -325,35 +377,38 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> + 	    sparc) echo sparc-icl-nx7; exit ;;
> + 	esac ;;
> +     s390x:SunOS:*:*)
> +-	echo ${UNAME_MACHINE}-ibm-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[=
^.]*//'`
> ++	echo "$UNAME_MACHINE"-ibm-solaris2"`echo "$UNAME_RELEASE" | sed -e '=
s/[^.]*//'`"
> + 	exit ;;
> +     sun4H:SunOS:5.*:*)
> +-	echo sparc-hal-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++	echo sparc-hal-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
> + 	exit ;;
> +     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
> +-	echo sparc-sun-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++	echo sparc-sun-solaris2"`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`=
"
> ++	exit ;;
> ++    i86pc:AuroraUX:5.*:* | i86xen:AuroraUX:5.*:*)
> ++	echo i386-pc-auroraux"$UNAME_RELEASE"
> + 	exit ;;
> +     i86pc:SunOS:5.*:* | i86xen:SunOS:5.*:*)
> +-	eval $set_cc_for_build
> +-	SUN_ARCH=3D"i386"
> ++	eval "$set_cc_for_build"
> ++	SUN_ARCH=3Di386
> + 	# If there is a compiler, see if it is configured for 64-bit objects=
=2E
> + 	# Note that the Sun cc does not turn __LP64__ into 1 like gcc does.
> + 	# This test works for both compilers.
> +-	if [ "$CC_FOR_BUILD" !=3D 'no_compiler_found' ]; then
> ++	if [ "$CC_FOR_BUILD" !=3D no_compiler_found ]; then
> + 	    if (echo '#ifdef __amd64'; echo IS_64BIT_ARCH; echo '#endif') | =
\
> +-		(CCOPTS=3D $CC_FOR_BUILD -E - 2>/dev/null) | \
> ++		(CCOPTS=3D"" $CC_FOR_BUILD -E - 2>/dev/null) | \
> + 		grep IS_64BIT_ARCH >/dev/null
> + 	    then
> +-		SUN_ARCH=3D"x86_64"
> ++		SUN_ARCH=3Dx86_64
> + 	    fi
> + 	fi
> +-	echo ${SUN_ARCH}-pc-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//=
'`
> ++	echo "$SUN_ARCH"-pc-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*/=
/'`"
> + 	exit ;;
> +     sun4*:SunOS:6*:*)
> + 	# According to config.sub, this is the proper way to canonicalize
> + 	# SunOS6.  Hard to guess exactly what SunOS6 will be like, but
> + 	# it's likely to be more like Solaris than SunOS4.
> +-	echo sparc-sun-solaris3`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++	echo sparc-sun-solaris3"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
> + 	exit ;;
> +     sun4*:SunOS:*:*)
> + 	case "`/usr/bin/arch -k`" in
> +@@ -362,25 +417,25 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> + 		;;
> + 	esac
> + 	# Japanese Language versions have a version number like `4.1.3-JL'.
> +-	echo sparc-sun-sunos`echo ${UNAME_RELEASE}|sed -e 's/-/_/'`
> ++	echo sparc-sun-sunos"`echo "$UNAME_RELEASE"|sed -e 's/-/_/'`"
> + 	exit ;;
> +     sun3*:SunOS:*:*)
> +-	echo m68k-sun-sunos${UNAME_RELEASE}
> ++	echo m68k-sun-sunos"$UNAME_RELEASE"
> + 	exit ;;
> +     sun*:*:4.2BSD:*)
> + 	UNAME_RELEASE=3D`(sed 1q /etc/motd | awk '{print substr($5,1,3)}') 2=
>/dev/null`
> +-	test "x${UNAME_RELEASE}" =3D "x" && UNAME_RELEASE=3D3
> ++	test "x$UNAME_RELEASE" =3D x && UNAME_RELEASE=3D3
> + 	case "`/bin/arch`" in
> + 	    sun3)
> +-		echo m68k-sun-sunos${UNAME_RELEASE}
> ++		echo m68k-sun-sunos"$UNAME_RELEASE"
> + 		;;
> + 	    sun4)
> +-		echo sparc-sun-sunos${UNAME_RELEASE}
> ++		echo sparc-sun-sunos"$UNAME_RELEASE"
> + 		;;
> + 	esac
> + 	exit ;;
> +     aushp:SunOS:*:*)
> +-	echo sparc-auspex-sunos${UNAME_RELEASE}
> ++	echo sparc-auspex-sunos"$UNAME_RELEASE"
> + 	exit ;;
> +     # The situation for MiNT is a little confusing.  The machine name=

> +     # can be virtually everything (everything which is not
> +@@ -391,44 +446,44 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> +     # MiNT.  But MiNT is downward compatible to TOS, so this should
> +     # be no problem.
> +     atarist[e]:*MiNT:*:* | atarist[e]:*mint:*:* | atarist[e]:*TOS:*:*=
)
> +-        echo m68k-atari-mint${UNAME_RELEASE}
> ++	echo m68k-atari-mint"$UNAME_RELEASE"
> + 	exit ;;
> +     atari*:*MiNT:*:* | atari*:*mint:*:* | atarist[e]:*TOS:*:*)
> +-	echo m68k-atari-mint${UNAME_RELEASE}
> +-        exit ;;
> ++	echo m68k-atari-mint"$UNAME_RELEASE"
> ++	exit ;;
> +     *falcon*:*MiNT:*:* | *falcon*:*mint:*:* | *falcon*:*TOS:*:*)
> +-        echo m68k-atari-mint${UNAME_RELEASE}
> ++	echo m68k-atari-mint"$UNAME_RELEASE"
> + 	exit ;;
> +     milan*:*MiNT:*:* | milan*:*mint:*:* | *milan*:*TOS:*:*)
> +-        echo m68k-milan-mint${UNAME_RELEASE}
> +-        exit ;;
> ++	echo m68k-milan-mint"$UNAME_RELEASE"
> ++	exit ;;
> +     hades*:*MiNT:*:* | hades*:*mint:*:* | *hades*:*TOS:*:*)
> +-        echo m68k-hades-mint${UNAME_RELEASE}
> +-        exit ;;
> ++	echo m68k-hades-mint"$UNAME_RELEASE"
> ++	exit ;;
> +     *:*MiNT:*:* | *:*mint:*:* | *:*TOS:*:*)
> +-        echo m68k-unknown-mint${UNAME_RELEASE}
> +-        exit ;;
> ++	echo m68k-unknown-mint"$UNAME_RELEASE"
> ++	exit ;;
> +     m68k:machten:*:*)
> +-	echo m68k-apple-machten${UNAME_RELEASE}
> ++	echo m68k-apple-machten"$UNAME_RELEASE"
> + 	exit ;;
> +     powerpc:machten:*:*)
> +-	echo powerpc-apple-machten${UNAME_RELEASE}
> ++	echo powerpc-apple-machten"$UNAME_RELEASE"
> + 	exit ;;
> +     RISC*:Mach:*:*)
> + 	echo mips-dec-mach_bsd4.3
> + 	exit ;;
> +     RISC*:ULTRIX:*:*)
> +-	echo mips-dec-ultrix${UNAME_RELEASE}
> ++	echo mips-dec-ultrix"$UNAME_RELEASE"
> + 	exit ;;
> +     VAX*:ULTRIX*:*:*)
> +-	echo vax-dec-ultrix${UNAME_RELEASE}
> ++	echo vax-dec-ultrix"$UNAME_RELEASE"
> + 	exit ;;
> +     2020:CLIX:*:* | 2430:CLIX:*:*)
> +-	echo clipper-intergraph-clix${UNAME_RELEASE}
> ++	echo clipper-intergraph-clix"$UNAME_RELEASE"
> + 	exit ;;
> +     mips:*:*:UMIPS | mips:*:*:RISCos)
> +-	eval $set_cc_for_build
> +-	sed 's/^	//' << EOF >$dummy.c
> ++	eval "$set_cc_for_build"
> ++	sed 's/^	//' << EOF > "$dummy.c"
> + #ifdef __cplusplus
> + #include <stdio.h>  /* for printf() prototype */
> + 	int main (int argc, char *argv[]) {
> +@@ -437,23 +492,23 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> + #endif
> + 	#if defined (host_mips) && defined (MIPSEB)
> + 	#if defined (SYSTYPE_SYSV)
> +-	  printf ("mips-mips-riscos%ssysv\n", argv[1]); exit (0);
> ++	  printf ("mips-mips-riscos%ssysv\\n", argv[1]); exit (0);
> + 	#endif
> + 	#if defined (SYSTYPE_SVR4)
> +-	  printf ("mips-mips-riscos%ssvr4\n", argv[1]); exit (0);
> ++	  printf ("mips-mips-riscos%ssvr4\\n", argv[1]); exit (0);
> + 	#endif
> + 	#if defined (SYSTYPE_BSD43) || defined(SYSTYPE_BSD)
> +-	  printf ("mips-mips-riscos%sbsd\n", argv[1]); exit (0);
> ++	  printf ("mips-mips-riscos%sbsd\\n", argv[1]); exit (0);
> + 	#endif
> + 	#endif
> + 	  exit (-1);
> + 	}
> + EOF
> +-	$CC_FOR_BUILD -o $dummy $dummy.c &&
> +-	  dummyarg=3D`echo "${UNAME_RELEASE}" | sed -n 's/\([0-9]*\).*/\1/p'=
` &&
> +-	  SYSTEM_NAME=3D`$dummy $dummyarg` &&
> ++	$CC_FOR_BUILD -o "$dummy" "$dummy.c" &&
> ++	  dummyarg=3D`echo "$UNAME_RELEASE" | sed -n 's/\([0-9]*\).*/\1/p'` =
&&
> ++	  SYSTEM_NAME=3D`"$dummy" "$dummyarg"` &&
> + 	    { echo "$SYSTEM_NAME"; exit; }
> +-	echo mips-mips-riscos${UNAME_RELEASE}
> ++	echo mips-mips-riscos"$UNAME_RELEASE"
> + 	exit ;;
> +     Motorola:PowerMAX_OS:*:*)
> + 	echo powerpc-motorola-powermax
> +@@ -477,21 +532,21 @@ EOF
> + 	echo m88k-motorola-sysv3
> + 	exit ;;
> +     AViiON:dgux:*:*)
> +-        # DG/UX returns AViiON for all architectures
> +-        UNAME_PROCESSOR=3D`/usr/bin/uname -p`
> +-	if [ $UNAME_PROCESSOR =3D mc88100 ] || [ $UNAME_PROCESSOR =3D mc8811=
0 ]
> ++	# DG/UX returns AViiON for all architectures
> ++	UNAME_PROCESSOR=3D`/usr/bin/uname -p`
> ++	if [ "$UNAME_PROCESSOR" =3D mc88100 ] || [ "$UNAME_PROCESSOR" =3D mc=
88110 ]
> + 	then
> +-	    if [ ${TARGET_BINARY_INTERFACE}x =3D m88kdguxelfx ] || \
> +-	       [ ${TARGET_BINARY_INTERFACE}x =3D x ]
> ++	    if [ "$TARGET_BINARY_INTERFACE"x =3D m88kdguxelfx ] || \
> ++	       [ "$TARGET_BINARY_INTERFACE"x =3D x ]
> + 	    then
> +-		echo m88k-dg-dgux${UNAME_RELEASE}
> ++		echo m88k-dg-dgux"$UNAME_RELEASE"
> + 	    else
> +-		echo m88k-dg-dguxbcs${UNAME_RELEASE}
> ++		echo m88k-dg-dguxbcs"$UNAME_RELEASE"
> + 	    fi
> + 	else
> +-	    echo i586-dg-dgux${UNAME_RELEASE}
> ++	    echo i586-dg-dgux"$UNAME_RELEASE"
> + 	fi
> +- 	exit ;;
> ++	exit ;;
> +     M88*:DolphinOS:*:*)	# DolphinOS (SVR3)
> + 	echo m88k-dolphin-sysv3
> + 	exit ;;
> +@@ -506,7 +561,7 @@ EOF
> + 	echo m68k-tektronix-bsd
> + 	exit ;;
> +     *:IRIX*:*:*)
> +-	echo mips-sgi-irix`echo ${UNAME_RELEASE}|sed -e 's/-/_/g'`
> ++	echo mips-sgi-irix"`echo "$UNAME_RELEASE"|sed -e 's/-/_/g'`"
> + 	exit ;;
> +     ????????:AIX?:[12].1:2)   # AIX 2.2.1 or AIX 2.1.1 is RT/PC AIX.
> + 	echo romp-ibm-aix     # uname -m gives an 8 hex-code CPU id
> +@@ -518,14 +573,14 @@ EOF
> + 	if [ -x /usr/bin/oslevel ] ; then
> + 		IBM_REV=3D`/usr/bin/oslevel`
> + 	else
> +-		IBM_REV=3D${UNAME_VERSION}.${UNAME_RELEASE}
> ++		IBM_REV=3D"$UNAME_VERSION.$UNAME_RELEASE"
> + 	fi
> +-	echo ${UNAME_MACHINE}-ibm-aix${IBM_REV}
> ++	echo "$UNAME_MACHINE"-ibm-aix"$IBM_REV"
> + 	exit ;;
> +     *:AIX:2:3)
> + 	if grep bos325 /usr/include/stdio.h >/dev/null 2>&1; then
> +-		eval $set_cc_for_build
> +-		sed 's/^		//' << EOF >$dummy.c
> ++		eval "$set_cc_for_build"
> ++		sed 's/^		//' << EOF > "$dummy.c"
> + 		#include <sys/systemcfg.h>
> +=20
> + 		main()
> +@@ -536,7 +591,7 @@ EOF
> + 			exit(0);
> + 			}
> + EOF
> +-		if $CC_FOR_BUILD -o $dummy $dummy.c && SYSTEM_NAME=3D`$dummy`
> ++		if $CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=3D`"$dummy"`=

> + 		then
> + 			echo "$SYSTEM_NAME"
> + 		else
> +@@ -548,28 +603,29 @@ EOF
> + 		echo rs6000-ibm-aix3.2
> + 	fi
> + 	exit ;;
> +-    *:AIX:*:[456])
> ++    *:AIX:*:[4567])
> + 	IBM_CPU_ID=3D`/usr/sbin/lsdev -C -c processor -S available | sed 1q =
| awk '{ print $1 }'`
> +-	if /usr/sbin/lsattr -El ${IBM_CPU_ID} | grep ' POWER' >/dev/null 2>&=
1; then
> ++	if /usr/sbin/lsattr -El "$IBM_CPU_ID" | grep ' POWER' >/dev/null 2>&=
1; then
> + 		IBM_ARCH=3Drs6000
> + 	else
> + 		IBM_ARCH=3Dpowerpc
> + 	fi
> +-	if [ -x /usr/bin/oslevel ] ; then
> +-		IBM_REV=3D`/usr/bin/oslevel`
> ++	if [ -x /usr/bin/lslpp ] ; then
> ++		IBM_REV=3D`/usr/bin/lslpp -Lqc bos.rte.libc |
> ++			   awk -F: '{ print $3 }' | sed s/[0-9]*$/0/`
> + 	else
> +-		IBM_REV=3D${UNAME_VERSION}.${UNAME_RELEASE}
> ++		IBM_REV=3D"$UNAME_VERSION.$UNAME_RELEASE"
> + 	fi
> +-	echo ${IBM_ARCH}-ibm-aix${IBM_REV}
> ++	echo "$IBM_ARCH"-ibm-aix"$IBM_REV"
> + 	exit ;;
> +     *:AIX:*:*)
> + 	echo rs6000-ibm-aix
> + 	exit ;;
> +-    ibmrt:4.4BSD:*|romp-ibm:BSD:*)
> ++    ibmrt:4.4BSD:*|romp-ibm:4.4BSD:*)
> + 	echo romp-ibm-bsd4.4
> + 	exit ;;
> +     ibmrt:*BSD:*|romp-ibm:BSD:*)            # covers RT/PC BSD and
> +-	echo romp-ibm-bsd${UNAME_RELEASE}   # 4.3 with uname added to
> ++	echo romp-ibm-bsd"$UNAME_RELEASE"   # 4.3 with uname added to
> + 	exit ;;                             # report: romp-ibm BSD 4.3
> +     *:BOSX:*:*)
> + 	echo rs6000-bull-bosx
> +@@ -584,67 +640,67 @@ EOF
> + 	echo m68k-hp-bsd4.4
> + 	exit ;;
> +     9000/[34678]??:HP-UX:*:*)
> +-	HPUX_REV=3D`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
> +-	case "${UNAME_MACHINE}" in
> +-	    9000/31? )            HP_ARCH=3Dm68000 ;;
> +-	    9000/[34]?? )         HP_ARCH=3Dm68k ;;
> ++	HPUX_REV=3D`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
> ++	case "$UNAME_MACHINE" in
> ++	    9000/31?)            HP_ARCH=3Dm68000 ;;
> ++	    9000/[34]??)         HP_ARCH=3Dm68k ;;
> + 	    9000/[678][0-9][0-9])
> + 		if [ -x /usr/bin/getconf ]; then
> + 		    sc_cpu_version=3D`/usr/bin/getconf SC_CPU_VERSION 2>/dev/null`
> +-                    sc_kernel_bits=3D`/usr/bin/getconf SC_KERNEL_BITS=
 2>/dev/null`
> +-                    case "${sc_cpu_version}" in
> +-                      523) HP_ARCH=3D"hppa1.0" ;; # CPU_PA_RISC1_0
> +-                      528) HP_ARCH=3D"hppa1.1" ;; # CPU_PA_RISC1_1
> +-                      532)                      # CPU_PA_RISC2_0
> +-                        case "${sc_kernel_bits}" in
> +-                          32) HP_ARCH=3D"hppa2.0n" ;;
> +-                          64) HP_ARCH=3D"hppa2.0w" ;;
> +-			  '') HP_ARCH=3D"hppa2.0" ;;   # HP-UX 10.20
> +-                        esac ;;
> +-                    esac
> ++		    sc_kernel_bits=3D`/usr/bin/getconf SC_KERNEL_BITS 2>/dev/null`
> ++		    case "$sc_cpu_version" in
> ++		      523) HP_ARCH=3Dhppa1.0 ;; # CPU_PA_RISC1_0
> ++		      528) HP_ARCH=3Dhppa1.1 ;; # CPU_PA_RISC1_1
> ++		      532)                      # CPU_PA_RISC2_0
> ++			case "$sc_kernel_bits" in
> ++			  32) HP_ARCH=3Dhppa2.0n ;;
> ++			  64) HP_ARCH=3Dhppa2.0w ;;
> ++			  '') HP_ARCH=3Dhppa2.0 ;;   # HP-UX 10.20
> ++			esac ;;
> ++		    esac
> + 		fi
> +-		if [ "${HP_ARCH}" =3D "" ]; then
> +-		    eval $set_cc_for_build
> +-		    sed 's/^              //' << EOF >$dummy.c
> ++		if [ "$HP_ARCH" =3D "" ]; then
> ++		    eval "$set_cc_for_build"
> ++		    sed 's/^		//' << EOF > "$dummy.c"
> +=20
> +-              #define _HPUX_SOURCE
> +-              #include <stdlib.h>
> +-              #include <unistd.h>
> ++		#define _HPUX_SOURCE
> ++		#include <stdlib.h>
> ++		#include <unistd.h>
> +=20
> +-              int main ()
> +-              {
> +-              #if defined(_SC_KERNEL_BITS)
> +-                  long bits =3D sysconf(_SC_KERNEL_BITS);
> +-              #endif
> +-                  long cpu  =3D sysconf (_SC_CPU_VERSION);
> ++		int main ()
> ++		{
> ++		#if defined(_SC_KERNEL_BITS)
> ++		    long bits =3D sysconf(_SC_KERNEL_BITS);
> ++		#endif
> ++		    long cpu  =3D sysconf (_SC_CPU_VERSION);
> +=20
> +-                  switch (cpu)
> +-              	{
> +-              	case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
> +-              	case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
> +-              	case CPU_PA_RISC2_0:
> +-              #if defined(_SC_KERNEL_BITS)
> +-              	    switch (bits)
> +-              		{
> +-              		case 64: puts ("hppa2.0w"); break;
> +-              		case 32: puts ("hppa2.0n"); break;
> +-              		default: puts ("hppa2.0"); break;
> +-              		} break;
> +-              #else  /* !defined(_SC_KERNEL_BITS) */
> +-              	    puts ("hppa2.0"); break;
> +-              #endif
> +-              	default: puts ("hppa1.0"); break;
> +-              	}
> +-                  exit (0);
> +-              }
> ++		    switch (cpu)
> ++			{
> ++			case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
> ++			case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
> ++			case CPU_PA_RISC2_0:
> ++		#if defined(_SC_KERNEL_BITS)
> ++			    switch (bits)
> ++				{
> ++				case 64: puts ("hppa2.0w"); break;
> ++				case 32: puts ("hppa2.0n"); break;
> ++				default: puts ("hppa2.0"); break;
> ++				} break;
> ++		#else  /* !defined(_SC_KERNEL_BITS) */
> ++			    puts ("hppa2.0"); break;
> ++		#endif
> ++			default: puts ("hppa1.0"); break;
> ++			}
> ++		    exit (0);
> ++		}
> + EOF
> +-		    (CCOPTS=3D $CC_FOR_BUILD -o $dummy $dummy.c 2>/dev/null) && HP_=
ARCH=3D`$dummy`
> ++		    (CCOPTS=3D"" $CC_FOR_BUILD -o "$dummy" "$dummy.c" 2>/dev/null) =
&& HP_ARCH=3D`"$dummy"`
> + 		    test -z "$HP_ARCH" && HP_ARCH=3Dhppa
> + 		fi ;;
> + 	esac
> +-	if [ ${HP_ARCH} =3D "hppa2.0w" ]
> ++	if [ "$HP_ARCH" =3D hppa2.0w ]
> + 	then
> +-	    eval $set_cc_for_build
> ++	    eval "$set_cc_for_build"
> +=20
> + 	    # hppa2.0w-hp-hpux* has a 64-bit kernel and a compiler generatin=
g
> + 	    # 32-bit code.  hppa64-hp-hpux* has the same kernel and a compil=
er
> +@@ -655,23 +711,23 @@ EOF
> + 	    # $ CC_FOR_BUILD=3D"cc +DA2.0w" ./config.guess
> + 	    # =3D> hppa64-hp-hpux11.23
> +=20
> +-	    if echo __LP64__ | (CCOPTS=3D $CC_FOR_BUILD -E - 2>/dev/null) |
> +-		grep __LP64__ >/dev/null
> ++	    if echo __LP64__ | (CCOPTS=3D"" $CC_FOR_BUILD -E - 2>/dev/null) =
|
> ++		grep -q __LP64__
> + 	    then
> +-		HP_ARCH=3D"hppa2.0w"
> ++		HP_ARCH=3Dhppa2.0w
> + 	    else
> +-		HP_ARCH=3D"hppa64"
> ++		HP_ARCH=3Dhppa64
> + 	    fi
> + 	fi
> +-	echo ${HP_ARCH}-hp-hpux${HPUX_REV}
> ++	echo "$HP_ARCH"-hp-hpux"$HPUX_REV"
> + 	exit ;;
> +     ia64:HP-UX:*:*)
> +-	HPUX_REV=3D`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
> +-	echo ia64-hp-hpux${HPUX_REV}
> ++	HPUX_REV=3D`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
> ++	echo ia64-hp-hpux"$HPUX_REV"
> + 	exit ;;
> +     3050*:HI-UX:*:*)
> +-	eval $set_cc_for_build
> +-	sed 's/^	//' << EOF >$dummy.c
> ++	eval "$set_cc_for_build"
> ++	sed 's/^	//' << EOF > "$dummy.c"
> + 	#include <unistd.h>
> + 	int
> + 	main ()
> +@@ -696,11 +752,11 @@ EOF
> + 	  exit (0);
> + 	}
> + EOF
> +-	$CC_FOR_BUILD -o $dummy $dummy.c && SYSTEM_NAME=3D`$dummy` &&
> ++	$CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=3D`"$dummy"` &&
> + 		{ echo "$SYSTEM_NAME"; exit; }
> + 	echo unknown-hitachi-hiuxwe2
> + 	exit ;;
> +-    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:* )
> ++    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:*)
> + 	echo hppa1.1-hp-bsd
> + 	exit ;;
> +     9000/8??:4.3bsd:*:*)
> +@@ -709,7 +765,7 @@ EOF
> +     *9??*:MPE/iX:*:* | *3000*:MPE/iX:*:*)
> + 	echo hppa1.0-hp-mpeix
> + 	exit ;;
> +-    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:* )
> ++    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:*)
> + 	echo hppa1.1-hp-osf
> + 	exit ;;
> +     hp8??:OSF1:*:*)
> +@@ -717,9 +773,9 @@ EOF
> + 	exit ;;
> +     i*86:OSF1:*:*)
> + 	if [ -x /usr/sbin/sysversion ] ; then
> +-	    echo ${UNAME_MACHINE}-unknown-osf1mk
> ++	    echo "$UNAME_MACHINE"-unknown-osf1mk
> + 	else
> +-	    echo ${UNAME_MACHINE}-unknown-osf1
> ++	    echo "$UNAME_MACHINE"-unknown-osf1
> + 	fi
> + 	exit ;;
> +     parisc*:Lites*:*:*)
> +@@ -727,325 +783,274 @@ EOF
> + 	exit ;;
> +     C1*:ConvexOS:*:* | convex:ConvexOS:C1*:*)
> + 	echo c1-convex-bsd
> +-        exit ;;
> ++	exit ;;
> +     C2*:ConvexOS:*:* | convex:ConvexOS:C2*:*)
> + 	if getsysinfo -f scalar_acc
> + 	then echo c32-convex-bsd
> + 	else echo c2-convex-bsd
> + 	fi
> +-        exit ;;
> ++	exit ;;
> +     C34*:ConvexOS:*:* | convex:ConvexOS:C34*:*)
> + 	echo c34-convex-bsd
> +-        exit ;;
> ++	exit ;;
> +     C38*:ConvexOS:*:* | convex:ConvexOS:C38*:*)
> + 	echo c38-convex-bsd
> +-        exit ;;
> ++	exit ;;
> +     C4*:ConvexOS:*:* | convex:ConvexOS:C4*:*)
> + 	echo c4-convex-bsd
> +-        exit ;;
> ++	exit ;;
> +     CRAY*Y-MP:*:*:*)
> +-	echo ymp-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++	echo ymp-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> + 	exit ;;
> +     CRAY*[A-Z]90:*:*:*)
> +-	echo ${UNAME_MACHINE}-cray-unicos${UNAME_RELEASE} \
> ++	echo "$UNAME_MACHINE"-cray-unicos"$UNAME_RELEASE" \
> + 	| sed -e 's/CRAY.*\([A-Z]90\)/\1/' \
> + 	      -e y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/ \
> + 	      -e 's/\.[^.]*$/.X/'
> + 	exit ;;
> +     CRAY*TS:*:*:*)
> +-	echo t90-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++	echo t90-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> + 	exit ;;
> +     CRAY*T3E:*:*:*)
> +-	echo alphaev5-cray-unicosmk${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/=
'
> ++	echo alphaev5-cray-unicosmk"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/=
'
> + 	exit ;;
> +     CRAY*SV1:*:*:*)
> +-	echo sv1-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++	echo sv1-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> + 	exit ;;
> +     *:UNICOS/mp:*:*)
> +-	echo craynv-cray-unicosmp${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++	echo craynv-cray-unicosmp"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> + 	exit ;;
> +     F30[01]:UNIX_System_V:*:* | F700:UNIX_System_V:*:*)
> +-	FUJITSU_PROC=3D`uname -m | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefgh=
ijklmnopqrstuvwxyz'`
> +-        FUJITSU_SYS=3D`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'ab=
cdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
> +-        FUJITSU_REL=3D`echo ${UNAME_RELEASE} | sed -e 's/ /_/'`
> +-        echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> +-        exit ;;
> ++	FUJITSU_PROC=3D`uname -m | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijk=
lmnopqrstuvwxyz`
> ++	FUJITSU_SYS=3D`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijkl=
mnopqrstuvwxyz | sed -e 's/\///'`
> ++	FUJITSU_REL=3D`echo "$UNAME_RELEASE" | sed -e 's/ /_/'`
> ++	echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> ++	exit ;;
> +     5000:UNIX_System_V:4.*:*)
> +-        FUJITSU_SYS=3D`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'ab=
cdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
> +-        FUJITSU_REL=3D`echo ${UNAME_RELEASE} | tr 'ABCDEFGHIJKLMNOPQR=
STUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/ /_/'`
> +-        echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> ++	FUJITSU_SYS=3D`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijkl=
mnopqrstuvwxyz | sed -e 's/\///'`
> ++	FUJITSU_REL=3D`echo "$UNAME_RELEASE" | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ=
 abcdefghijklmnopqrstuvwxyz | sed -e 's/ /_/'`
> ++	echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> + 	exit ;;
> +     i*86:BSD/386:*:* | i*86:BSD/OS:*:* | *:Ascend\ Embedded/OS:*:*)
> +-	echo ${UNAME_MACHINE}-pc-bsdi${UNAME_RELEASE}
> ++	echo "$UNAME_MACHINE"-pc-bsdi"$UNAME_RELEASE"
> + 	exit ;;
> +     sparc*:BSD/OS:*:*)
> +-	echo sparc-unknown-bsdi${UNAME_RELEASE}
> ++	echo sparc-unknown-bsdi"$UNAME_RELEASE"
> + 	exit ;;
> +     *:BSD/OS:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-bsdi${UNAME_RELEASE}
> ++	echo "$UNAME_MACHINE"-unknown-bsdi"$UNAME_RELEASE"
> + 	exit ;;
> +     *:FreeBSD:*:*)
> +-	case ${UNAME_MACHINE} in
> +-	    pc98)
> +-		echo i386-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'=
` ;;
> ++	UNAME_PROCESSOR=3D`/usr/bin/uname -p`
> ++	case "$UNAME_PROCESSOR" in
> + 	    amd64)
> +-		echo x86_64-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*/=
/'` ;;
> +-	    *)
> +-		echo ${UNAME_MACHINE}-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e =
's/[-(].*//'` ;;
> ++		UNAME_PROCESSOR=3Dx86_64 ;;
> ++	    i386)
> ++		UNAME_PROCESSOR=3Di586 ;;
> + 	esac
> ++	echo "$UNAME_PROCESSOR"-unknown-freebsd"`echo "$UNAME_RELEASE"|sed -=
e 's/[-(].*//'`"
> + 	exit ;;
> +     i*:CYGWIN*:*)
> +-	echo ${UNAME_MACHINE}-pc-cygwin
> ++	echo "$UNAME_MACHINE"-pc-cygwin
> ++	exit ;;
> ++    *:MINGW64*:*)
> ++	echo "$UNAME_MACHINE"-pc-mingw64
> + 	exit ;;
> +     *:MINGW*:*)
> +-	echo ${UNAME_MACHINE}-pc-mingw32
> ++	echo "$UNAME_MACHINE"-pc-mingw32
> + 	exit ;;
> +-    i*:windows32*:*)
> +-    	# uname -m includes "-pc" on this system.
> +-    	echo ${UNAME_MACHINE}-mingw32
> ++    *:MSYS*:*)
> ++	echo "$UNAME_MACHINE"-pc-msys
> + 	exit ;;
> +     i*:PW*:*)
> +-	echo ${UNAME_MACHINE}-pc-pw32
> ++	echo "$UNAME_MACHINE"-pc-pw32
> + 	exit ;;
> +-    *:Interix*:[3456]*)
> +-    	case ${UNAME_MACHINE} in
> ++    *:Interix*:*)
> ++	case "$UNAME_MACHINE" in
> + 	    x86)
> +-		echo i586-pc-interix${UNAME_RELEASE}
> ++		echo i586-pc-interix"$UNAME_RELEASE"
> + 		exit ;;
> +-	    EM64T | authenticamd | genuineintel)
> +-		echo x86_64-unknown-interix${UNAME_RELEASE}
> ++	    authenticamd | genuineintel | EM64T)
> ++		echo x86_64-unknown-interix"$UNAME_RELEASE"
> + 		exit ;;
> + 	    IA64)
> +-		echo ia64-unknown-interix${UNAME_RELEASE}
> ++		echo ia64-unknown-interix"$UNAME_RELEASE"
> + 		exit ;;
> + 	esac ;;
> +-    [345]86:Windows_95:* | [345]86:Windows_98:* | [345]86:Windows_NT:=
*)
> +-	echo i${UNAME_MACHINE}-pc-mks
> +-	exit ;;
> +-    i*:Windows_NT*:* | Pentium*:Windows_NT*:*)
> +-	# How do we know it's Interix rather than the generic POSIX subsyste=
m?
> +-	# It also conflicts with pre-2.0 versions of AT&T UWIN. Should we
> +-	# UNAME_MACHINE based on the output of uname instead of i386?
> +-	echo i586-pc-interix
> +-	exit ;;
> +     i*:UWIN*:*)
> +-	echo ${UNAME_MACHINE}-pc-uwin
> ++	echo "$UNAME_MACHINE"-pc-uwin
> + 	exit ;;
> +     amd64:CYGWIN*:*:* | x86_64:CYGWIN*:*:*)
> + 	echo x86_64-unknown-cygwin
> + 	exit ;;
> +-    p*:CYGWIN*:*)
> +-	echo powerpcle-unknown-cygwin
> +-	exit ;;
> +     prep*:SunOS:5.*:*)
> +-	echo powerpcle-unknown-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]=
*//'`
> ++	echo powerpcle-unknown-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.=
]*//'`"
> + 	exit ;;
> +     *:GNU:*:*)
> + 	# the GNU system
> +-	echo `echo ${UNAME_MACHINE}|sed -e 's,[-/].*$,,'`-unknown-gnu`echo $=
{UNAME_RELEASE}|sed -e 's,/.*$,,'`
> ++	echo "`echo "$UNAME_MACHINE"|sed -e 's,[-/].*$,,'`-unknown-$LIBC`ech=
o "$UNAME_RELEASE"|sed -e 's,/.*$,,'`"
> + 	exit ;;
> +     *:GNU/*:*:*)
> + 	# other systems with GNU libc and userland
> +-	echo ${UNAME_MACHINE}-unknown-`echo ${UNAME_SYSTEM} | sed 's,^[^/]*/=
,,' | tr '[A-Z]' '[a-z]'``echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'`-gnu
> ++	echo "$UNAME_MACHINE-unknown-`echo "$UNAME_SYSTEM" | sed 's,^[^/]*/,=
,' | tr "[:upper:]" "[:lower:]"``echo "$UNAME_RELEASE"|sed -e 's/[-(].*//=
'`-$LIBC"
> ++	exit ;;
> ++    *:Minix:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-minix
> + 	exit ;;
> +-    i*86:Minix:*:*)
> +-	echo ${UNAME_MACHINE}-pc-minix
> ++    aarch64:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    aarch64_be:Linux:*:*)
> ++	UNAME_MACHINE=3Daarch64_be
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    alpha:Linux:*:*)
> ++	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
> ++	  EV5)   UNAME_MACHINE=3Dalphaev5 ;;
> ++	  EV56)  UNAME_MACHINE=3Dalphaev56 ;;
> ++	  PCA56) UNAME_MACHINE=3Dalphapca56 ;;
> ++	  PCA57) UNAME_MACHINE=3Dalphapca56 ;;
> ++	  EV6)   UNAME_MACHINE=3Dalphaev6 ;;
> ++	  EV67)  UNAME_MACHINE=3Dalphaev67 ;;
> ++	  EV68*) UNAME_MACHINE=3Dalphaev68 ;;
> ++	esac
> ++	objdump --private-headers /bin/sh | grep -q ld.so.1
> ++	if test "$?" =3D 0 ; then LIBC=3Dgnulibc1 ; fi
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    arc:Linux:*:* | arceb:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     arm*:Linux:*:*)
> +-	eval $set_cc_for_build
> ++	eval "$set_cc_for_build"
> + 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
> + 	    | grep -q __ARM_EABI__
> + 	then
> +-	    echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	    echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	else
> +-	    echo ${UNAME_MACHINE}-unknown-linux-gnueabi
> ++	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
> ++		| grep -q __ARM_PCS_VFP
> ++	    then
> ++		echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabi
> ++	    else
> ++		echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabihf
> ++	    fi
> + 	fi
> + 	exit ;;
> +     avr32*:Linux:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     cris:Linux:*:*)
> +-	echo cris-axis-linux-gnu
> ++	echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
> + 	exit ;;
> +     crisv32:Linux:*:*)
> +-	echo crisv32-axis-linux-gnu
> ++	echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
> ++	exit ;;
> ++    e2k:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     frv:Linux:*:*)
> +-    	echo frv-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    hexagon:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    i*86:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
> + 	exit ;;
> +     ia64:Linux:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    k1om:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     m32r*:Linux:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     m68*:Linux:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +-    mips:Linux:*:*)
> +-	eval $set_cc_for_build
> +-	sed 's/^	//' << EOF >$dummy.c
> +-	#undef CPU
> +-	#undef mips
> +-	#undef mipsel
> +-	#if defined(__MIPSEL__) || defined(__MIPSEL) || defined(_MIPSEL) || =
defined(MIPSEL)
> +-	CPU=3Dmipsel
> +-	#else
> +-	#if defined(__MIPSEB__) || defined(__MIPSEB) || defined(_MIPSEB) || =
defined(MIPSEB)
> +-	CPU=3Dmips
> +-	#else
> +-	CPU=3D
> +-	#endif
> +-	#endif
> +-EOF
> +-	eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> +-	    /^CPU/{
> +-		s: ::g
> +-		p
> +-	    }'`"
> +-	test x"${CPU}" !=3D x && { echo "${CPU}-unknown-linux-gnu"; exit; }
> +-	;;
> +-    mips64:Linux:*:*)
> +-	eval $set_cc_for_build
> +-	sed 's/^	//' << EOF >$dummy.c
> ++    mips:Linux:*:* | mips64:Linux:*:*)
> ++	eval "$set_cc_for_build"
> ++	sed 's/^	//' << EOF > "$dummy.c"
> + 	#undef CPU
> +-	#undef mips64
> +-	#undef mips64el
> ++	#undef ${UNAME_MACHINE}
> ++	#undef ${UNAME_MACHINE}el
> + 	#if defined(__MIPSEL__) || defined(__MIPSEL) || defined(_MIPSEL) || =
defined(MIPSEL)
> +-	CPU=3Dmips64el
> ++	CPU=3D${UNAME_MACHINE}el
> + 	#else
> + 	#if defined(__MIPSEB__) || defined(__MIPSEB) || defined(_MIPSEB) || =
defined(MIPSEB)
> +-	CPU=3Dmips64
> ++	CPU=3D${UNAME_MACHINE}
> + 	#else
> + 	CPU=3D
> + 	#endif
> + 	#endif
> + EOF
> +-	eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> +-	    /^CPU/{
> +-		s: ::g
> +-		p
> +-	    }'`"
> +-	test x"${CPU}" !=3D x && { echo "${CPU}-unknown-linux-gnu"; exit; }
> ++	eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^CPU'`"
> ++	test "x$CPU" !=3D x && { echo "$CPU-unknown-linux-$LIBC"; exit; }
> + 	;;
> +-    or32:Linux:*:*)
> +-	echo or32-unknown-linux-gnu
> ++    mips64el:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +-    ppc:Linux:*:*)
> +-	echo powerpc-unknown-linux-gnu
> ++    openrisc*:Linux:*:*)
> ++	echo or1k-unknown-linux-"$LIBC"
> + 	exit ;;
> +-    ppc64:Linux:*:*)
> +-	echo powerpc64-unknown-linux-gnu
> +-	exit ;;
> +-    alpha:Linux:*:*)
> +-	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
> +-	  EV5)   UNAME_MACHINE=3Dalphaev5 ;;
> +-	  EV56)  UNAME_MACHINE=3Dalphaev56 ;;
> +-	  PCA56) UNAME_MACHINE=3Dalphapca56 ;;
> +-	  PCA57) UNAME_MACHINE=3Dalphapca56 ;;
> +-	  EV6)   UNAME_MACHINE=3Dalphaev6 ;;
> +-	  EV67)  UNAME_MACHINE=3Dalphaev67 ;;
> +-	  EV68*) UNAME_MACHINE=3Dalphaev68 ;;
> +-        esac
> +-	objdump --private-headers /bin/sh | grep ld.so.1 >/dev/null
> +-	if test "$?" =3D 0 ; then LIBC=3D"libc1" ; else LIBC=3D"" ; fi
> +-	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
> ++    or32:Linux:*:* | or1k*:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     padre:Linux:*:*)
> +-	echo sparc-unknown-linux-gnu
> ++	echo sparc-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    parisc64:Linux:*:* | hppa64:Linux:*:*)
> ++	echo hppa64-unknown-linux-"$LIBC"
> + 	exit ;;
> +     parisc:Linux:*:* | hppa:Linux:*:*)
> + 	# Look for CPU level
> + 	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2`=
 in
> +-	  PA7*) echo hppa1.1-unknown-linux-gnu ;;
> +-	  PA8*) echo hppa2.0-unknown-linux-gnu ;;
> +-	  *)    echo hppa-unknown-linux-gnu ;;
> ++	  PA7*) echo hppa1.1-unknown-linux-"$LIBC" ;;
> ++	  PA8*) echo hppa2.0-unknown-linux-"$LIBC" ;;
> ++	  *)    echo hppa-unknown-linux-"$LIBC" ;;
> + 	esac
> + 	exit ;;
> +-    parisc64:Linux:*:* | hppa64:Linux:*:*)
> +-	echo hppa64-unknown-linux-gnu
> ++    ppc64:Linux:*:*)
> ++	echo powerpc64-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    ppc:Linux:*:*)
> ++	echo powerpc-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    ppc64le:Linux:*:*)
> ++	echo powerpc64le-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    ppcle:Linux:*:*)
> ++	echo powerpcle-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    riscv32:Linux:*:* | riscv64:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     s390:Linux:*:* | s390x:Linux:*:*)
> +-	echo ${UNAME_MACHINE}-ibm-linux
> ++	echo "$UNAME_MACHINE"-ibm-linux-"$LIBC"
> + 	exit ;;
> +     sh64*:Linux:*:*)
> +-    	echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     sh*:Linux:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     sparc:Linux:*:* | sparc64:Linux:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++	exit ;;
> ++    tile*:Linux:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +     vax:Linux:*:*)
> +-	echo ${UNAME_MACHINE}-dec-linux-gnu
> ++	echo "$UNAME_MACHINE"-dec-linux-"$LIBC"
> + 	exit ;;
> +     x86_64:Linux:*:*)
> +-	echo x86_64-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
> + 	exit ;;
> +     xtensa*:Linux:*:*)
> +-    	echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> + 	exit ;;
> +-    i*86:Linux:*:*)
> +-	# The BFD linker knows what the default object file format is, so
> +-	# first see if it will tell us. cd to the root directory to prevent
> +-	# problems with other programs or directories called `ld' in the pat=
h.
> +-	# Set LC_ALL=3DC to ensure ld outputs messages in English.
> +-	ld_supported_targets=3D`cd /; LC_ALL=3DC ld --help 2>&1 \
> +-			 | sed -ne '/supported targets:/!d
> +-				    s/[ 	][ 	]*/ /g
> +-				    s/.*supported targets: *//
> +-				    s/ .*//
> +-				    p'`
> +-        case "$ld_supported_targets" in
> +-	  elf32-i386)
> +-		TENTATIVE=3D"${UNAME_MACHINE}-pc-linux-gnu"
> +-		;;
> +-	  a.out-i386-linux)
> +-		echo "${UNAME_MACHINE}-pc-linux-gnuaout"
> +-		exit ;;
> +-	  "")
> +-		# Either a pre-BFD a.out linker (linux-gnuoldld) or
> +-		# one that does not give us useful --help.
> +-		echo "${UNAME_MACHINE}-pc-linux-gnuoldld"
> +-		exit ;;
> +-	esac
> +-	# Determine whether the default compiler is a.out or elf
> +-	eval $set_cc_for_build
> +-	sed 's/^	//' << EOF >$dummy.c
> +-	#include <features.h>
> +-	#ifdef __ELF__
> +-	# ifdef __GLIBC__
> +-	#  if __GLIBC__ >=3D 2
> +-	LIBC=3Dgnu
> +-	#  else
> +-	LIBC=3Dgnulibc1
> +-	#  endif
> +-	# else
> +-	LIBC=3Dgnulibc1
> +-	# endif
> +-	#else
> +-	#if defined(__INTEL_COMPILER) || defined(__PGI) || defined(__SUNPRO_=
C) || defined(__SUNPRO_CC)
> +-	LIBC=3Dgnu
> +-	#else
> +-	LIBC=3Dgnuaout
> +-	#endif
> +-	#endif
> +-	#ifdef __dietlibc__
> +-	LIBC=3Ddietlibc
> +-	#endif
> +-EOF
> +-	eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> +-	    /^LIBC/{
> +-		s: ::g
> +-		p
> +-	    }'`"
> +-	test x"${LIBC}" !=3D x && {
> +-		echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
> +-		exit
> +-	}
> +-	test x"${TENTATIVE}" !=3D x && { echo "${TENTATIVE}"; exit; }
> +-	;;
> +     i*86:DYNIX/ptx:4*:*)
> + 	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
> + 	# earlier versions are messed up and put the nodename in both
> +@@ -1053,54 +1058,54 @@ EOF
> + 	echo i386-sequent-sysv4
> + 	exit ;;
> +     i*86:UNIX_SV:4.2MP:2.*)
> +-        # Unixware is an offshoot of SVR4, but it has its own version=

> +-        # number series starting with 2...
> +-        # I am not positive that other SVR4 systems won't match this,=

> ++	# Unixware is an offshoot of SVR4, but it has its own version
> ++	# number series starting with 2...
> ++	# I am not positive that other SVR4 systems won't match this,
> + 	# I just have to hope.  -- rms.
> +-        # Use sysv4.2uw... so that sysv4* matches it.
> +-	echo ${UNAME_MACHINE}-pc-sysv4.2uw${UNAME_VERSION}
> ++	# Use sysv4.2uw... so that sysv4* matches it.
> ++	echo "$UNAME_MACHINE"-pc-sysv4.2uw"$UNAME_VERSION"
> + 	exit ;;
> +     i*86:OS/2:*:*)
> + 	# If we were able to find `uname', then EMX Unix compatibility
> + 	# is probably installed.
> +-	echo ${UNAME_MACHINE}-pc-os2-emx
> ++	echo "$UNAME_MACHINE"-pc-os2-emx
> + 	exit ;;
> +     i*86:XTS-300:*:STOP)
> +-	echo ${UNAME_MACHINE}-unknown-stop
> ++	echo "$UNAME_MACHINE"-unknown-stop
> + 	exit ;;
> +     i*86:atheos:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-atheos
> ++	echo "$UNAME_MACHINE"-unknown-atheos
> + 	exit ;;
> +     i*86:syllable:*:*)
> +-	echo ${UNAME_MACHINE}-pc-syllable
> ++	echo "$UNAME_MACHINE"-pc-syllable
> + 	exit ;;
> +-    i*86:LynxOS:2.*:* | i*86:LynxOS:3.[01]*:* | i*86:LynxOS:4.0*:*)
> +-	echo i386-unknown-lynxos${UNAME_RELEASE}
> ++    i*86:LynxOS:2.*:* | i*86:LynxOS:3.[01]*:* | i*86:LynxOS:4.[02]*:*=
)
> ++	echo i386-unknown-lynxos"$UNAME_RELEASE"
> + 	exit ;;
> +     i*86:*DOS:*:*)
> +-	echo ${UNAME_MACHINE}-pc-msdosdjgpp
> ++	echo "$UNAME_MACHINE"-pc-msdosdjgpp
> + 	exit ;;
> +-    i*86:*:4.*:* | i*86:SYSTEM_V:4.*:*)
> +-	UNAME_REL=3D`echo ${UNAME_RELEASE} | sed 's/\/MP$//'`
> ++    i*86:*:4.*:*)
> ++	UNAME_REL=3D`echo "$UNAME_RELEASE" | sed 's/\/MP$//'`
> + 	if grep Novell /usr/include/link.h >/dev/null 2>/dev/null; then
> +-		echo ${UNAME_MACHINE}-univel-sysv${UNAME_REL}
> ++		echo "$UNAME_MACHINE"-univel-sysv"$UNAME_REL"
> + 	else
> +-		echo ${UNAME_MACHINE}-pc-sysv${UNAME_REL}
> ++		echo "$UNAME_MACHINE"-pc-sysv"$UNAME_REL"
> + 	fi
> + 	exit ;;
> +     i*86:*:5:[678]*)
> +-    	# UnixWare 7.x, OpenUNIX and OpenServer 6.
> ++	# UnixWare 7.x, OpenUNIX and OpenServer 6.
> + 	case `/bin/uname -X | grep "^Machine"` in
> + 	    *486*)	     UNAME_MACHINE=3Di486 ;;
> + 	    *Pentium)	     UNAME_MACHINE=3Di586 ;;
> + 	    *Pent*|*Celeron) UNAME_MACHINE=3Di686 ;;
> + 	esac
> +-	echo ${UNAME_MACHINE}-unknown-sysv${UNAME_RELEASE}${UNAME_SYSTEM}${U=
NAME_VERSION}
> ++	echo "$UNAME_MACHINE-unknown-sysv${UNAME_RELEASE}${UNAME_SYSTEM}{$UN=
AME_VERSION}"
> + 	exit ;;
> +     i*86:*:3.2:*)
> + 	if test -f /usr/options/cb.name; then
> + 		UNAME_REL=3D`sed -n 's/.*Version //p' </usr/options/cb.name`
> +-		echo ${UNAME_MACHINE}-pc-isc$UNAME_REL
> ++		echo "$UNAME_MACHINE"-pc-isc"$UNAME_REL"
> + 	elif /bin/uname -X 2>/dev/null >/dev/null ; then
> + 		UNAME_REL=3D`(/bin/uname -X|grep Release|sed -e 's/.*=3D //')`
> + 		(/bin/uname -X|grep i80486 >/dev/null) && UNAME_MACHINE=3Di486
> +@@ -1110,20 +1115,20 @@ EOF
> + 			&& UNAME_MACHINE=3Di686
> + 		(/bin/uname -X|grep '^Machine.*Pentium Pro' >/dev/null) \
> + 			&& UNAME_MACHINE=3Di686
> +-		echo ${UNAME_MACHINE}-pc-sco$UNAME_REL
> ++		echo "$UNAME_MACHINE"-pc-sco"$UNAME_REL"
> + 	else
> +-		echo ${UNAME_MACHINE}-pc-sysv32
> ++		echo "$UNAME_MACHINE"-pc-sysv32
> + 	fi
> + 	exit ;;
> +     pc:*:*:*)
> + 	# Left here for compatibility:
> +-        # uname -m prints for DJGPP always 'pc', but it prints nothin=
g about
> +-        # the processor, so we play safe by assuming i586.
> ++	# uname -m prints for DJGPP always 'pc', but it prints nothing about=

> ++	# the processor, so we play safe by assuming i586.
> + 	# Note: whatever this is, it MUST be the same as what config.sub
> +-	# prints for the "djgpp" host, or else GDB configury will decide tha=
t
> ++	# prints for the "djgpp" host, or else GDB configure will decide tha=
t
> + 	# this is a cross-build.
> + 	echo i586-pc-msdosdjgpp
> +-        exit ;;
> ++	exit ;;
> +     Intel:Mach:3*:*)
> + 	echo i386-pc-mach3
> + 	exit ;;
> +@@ -1132,9 +1137,9 @@ EOF
> + 	exit ;;
> +     i860:*:4.*:*) # i860-SVR4
> + 	if grep Stardent /usr/include/sys/uadmin.h >/dev/null 2>&1 ; then
> +-	  echo i860-stardent-sysv${UNAME_RELEASE} # Stardent Vistra i860-SVR=
4
> ++	  echo i860-stardent-sysv"$UNAME_RELEASE" # Stardent Vistra i860-SVR=
4
> + 	else # Add other i860-SVR4 vendors below as they are discovered.
> +-	  echo i860-unknown-sysv${UNAME_RELEASE}  # Unknown i860-SVR4
> ++	  echo i860-unknown-sysv"$UNAME_RELEASE"  # Unknown i860-SVR4
> + 	fi
> + 	exit ;;
> +     mini*:CTIX:SYS*5:*)
> +@@ -1154,39 +1159,39 @@ EOF
> + 	test -r /etc/.relid \
> + 	&& OS_REL=3D.`sed -n 's/[^ ]* [^ ]* \([0-9][0-9]\).*/\1/p' < /etc/.r=
elid`
> + 	/bin/uname -p 2>/dev/null | grep 86 >/dev/null \
> +-	  && { echo i486-ncr-sysv4.3${OS_REL}; exit; }
> ++	  && { echo i486-ncr-sysv4.3"$OS_REL"; exit; }
> + 	/bin/uname -p 2>/dev/null | /bin/grep entium >/dev/null \
> +-	  && { echo i586-ncr-sysv4.3${OS_REL}; exit; } ;;
> ++	  && { echo i586-ncr-sysv4.3"$OS_REL"; exit; } ;;
> +     3[34]??:*:4.0:* | 3[34]??,*:*:4.0:*)
> +-        /bin/uname -p 2>/dev/null | grep 86 >/dev/null \
> +-          && { echo i486-ncr-sysv4; exit; } ;;
> ++	/bin/uname -p 2>/dev/null | grep 86 >/dev/null \
> ++	  && { echo i486-ncr-sysv4; exit; } ;;
> +     NCR*:*:4.2:* | MPRAS*:*:4.2:*)
> + 	OS_REL=3D'.3'
> + 	test -r /etc/.relid \
> + 	    && OS_REL=3D.`sed -n 's/[^ ]* [^ ]* \([0-9][0-9]\).*/\1/p' < /et=
c/.relid`
> + 	/bin/uname -p 2>/dev/null | grep 86 >/dev/null \
> +-	    && { echo i486-ncr-sysv4.3${OS_REL}; exit; }
> ++	    && { echo i486-ncr-sysv4.3"$OS_REL"; exit; }
> + 	/bin/uname -p 2>/dev/null | /bin/grep entium >/dev/null \
> +-	    && { echo i586-ncr-sysv4.3${OS_REL}; exit; }
> ++	    && { echo i586-ncr-sysv4.3"$OS_REL"; exit; }
> + 	/bin/uname -p 2>/dev/null | /bin/grep pteron >/dev/null \
> +-	    && { echo i586-ncr-sysv4.3${OS_REL}; exit; } ;;
> ++	    && { echo i586-ncr-sysv4.3"$OS_REL"; exit; } ;;
> +     m68*:LynxOS:2.*:* | m68*:LynxOS:3.0*:*)
> +-	echo m68k-unknown-lynxos${UNAME_RELEASE}
> ++	echo m68k-unknown-lynxos"$UNAME_RELEASE"
> + 	exit ;;
> +     mc68030:UNIX_System_V:4.*:*)
> + 	echo m68k-atari-sysv4
> + 	exit ;;
> +     TSUNAMI:LynxOS:2.*:*)
> +-	echo sparc-unknown-lynxos${UNAME_RELEASE}
> ++	echo sparc-unknown-lynxos"$UNAME_RELEASE"
> + 	exit ;;
> +     rs6000:LynxOS:2.*:*)
> +-	echo rs6000-unknown-lynxos${UNAME_RELEASE}
> ++	echo rs6000-unknown-lynxos"$UNAME_RELEASE"
> + 	exit ;;
> +-    PowerPC:LynxOS:2.*:* | PowerPC:LynxOS:3.[01]*:* | PowerPC:LynxOS:=
4.0*:*)
> +-	echo powerpc-unknown-lynxos${UNAME_RELEASE}
> ++    PowerPC:LynxOS:2.*:* | PowerPC:LynxOS:3.[01]*:* | PowerPC:LynxOS:=
4.[02]*:*)
> ++	echo powerpc-unknown-lynxos"$UNAME_RELEASE"
> + 	exit ;;
> +     SM[BE]S:UNIX_SV:*:*)
> +-	echo mips-dde-sysv${UNAME_RELEASE}
> ++	echo mips-dde-sysv"$UNAME_RELEASE"
> + 	exit ;;
> +     RM*:ReliantUNIX-*:*:*)
> + 	echo mips-sni-sysv4
> +@@ -1197,15 +1202,15 @@ EOF
> +     *:SINIX-*:*:*)
> + 	if uname -p 2>/dev/null >/dev/null ; then
> + 		UNAME_MACHINE=3D`(uname -p) 2>/dev/null`
> +-		echo ${UNAME_MACHINE}-sni-sysv4
> ++		echo "$UNAME_MACHINE"-sni-sysv4
> + 	else
> + 		echo ns32k-sni-sysv
> + 	fi
> + 	exit ;;
> +-    PENTIUM:*:4.0*:*) # Unisys `ClearPath HMP IX 4000' SVR4/MP effort=

> +-                      # says <Richard.M.Bartel@ccMail.Census.GOV>
> +-        echo i586-unisys-sysv4
> +-        exit ;;
> ++    PENTIUM:*:4.0*:*)	# Unisys `ClearPath HMP IX 4000' SVR4/MP effort=

> ++			# says <Richard.M.Bartel@ccMail.Census.GOV>
> ++	echo i586-unisys-sysv4
> ++	exit ;;
> +     *:UNIX_System_V:4*:FTX*)
> + 	# From Gerald Hewes <hewes@openmarket.com>.
> + 	# How about differentiating between stratus architectures? -djm
> +@@ -1217,25 +1222,25 @@ EOF
> + 	exit ;;
> +     i*86:VOS:*:*)
> + 	# From Paul.Green@stratus.com.
> +-	echo ${UNAME_MACHINE}-stratus-vos
> ++	echo "$UNAME_MACHINE"-stratus-vos
> + 	exit ;;
> +     *:VOS:*:*)
> + 	# From Paul.Green@stratus.com.
> + 	echo hppa1.1-stratus-vos
> + 	exit ;;
> +     mc68*:A/UX:*:*)
> +-	echo m68k-apple-aux${UNAME_RELEASE}
> ++	echo m68k-apple-aux"$UNAME_RELEASE"
> + 	exit ;;
> +     news*:NEWS-OS:6*:*)
> + 	echo mips-sony-newsos6
> + 	exit ;;
> +     R[34]000:*System_V*:*:* | R4000:UNIX_SYSV:*:* | R*000:UNIX_SV:*:*=
)
> + 	if [ -d /usr/nec ]; then
> +-	        echo mips-nec-sysv${UNAME_RELEASE}
> ++		echo mips-nec-sysv"$UNAME_RELEASE"
> + 	else
> +-	        echo mips-unknown-sysv${UNAME_RELEASE}
> ++		echo mips-unknown-sysv"$UNAME_RELEASE"
> + 	fi
> +-        exit ;;
> ++	exit ;;
> +     BeBox:BeOS:*:*)	# BeOS running on hardware made by Be, PPC only.
> + 	echo powerpc-be-beos
> + 	exit ;;
> +@@ -1248,53 +1253,97 @@ EOF
> +     BePC:Haiku:*:*)	# Haiku running on Intel PC compatible.
> + 	echo i586-pc-haiku
> + 	exit ;;
> ++    x86_64:Haiku:*:*)
> ++	echo x86_64-unknown-haiku
> ++	exit ;;
> +     SX-4:SUPER-UX:*:*)
> +-	echo sx4-nec-superux${UNAME_RELEASE}
> ++	echo sx4-nec-superux"$UNAME_RELEASE"
> + 	exit ;;
> +     SX-5:SUPER-UX:*:*)
> +-	echo sx5-nec-superux${UNAME_RELEASE}
> ++	echo sx5-nec-superux"$UNAME_RELEASE"
> + 	exit ;;
> +     SX-6:SUPER-UX:*:*)
> +-	echo sx6-nec-superux${UNAME_RELEASE}
> ++	echo sx6-nec-superux"$UNAME_RELEASE"
> + 	exit ;;
> +     SX-7:SUPER-UX:*:*)
> +-	echo sx7-nec-superux${UNAME_RELEASE}
> ++	echo sx7-nec-superux"$UNAME_RELEASE"
> + 	exit ;;
> +     SX-8:SUPER-UX:*:*)
> +-	echo sx8-nec-superux${UNAME_RELEASE}
> ++	echo sx8-nec-superux"$UNAME_RELEASE"
> + 	exit ;;
> +     SX-8R:SUPER-UX:*:*)
> +-	echo sx8r-nec-superux${UNAME_RELEASE}
> ++	echo sx8r-nec-superux"$UNAME_RELEASE"
> ++	exit ;;
> ++    SX-ACE:SUPER-UX:*:*)
> ++	echo sxace-nec-superux"$UNAME_RELEASE"
> + 	exit ;;
> +     Power*:Rhapsody:*:*)
> +-	echo powerpc-apple-rhapsody${UNAME_RELEASE}
> ++	echo powerpc-apple-rhapsody"$UNAME_RELEASE"
> + 	exit ;;
> +     *:Rhapsody:*:*)
> +-	echo ${UNAME_MACHINE}-apple-rhapsody${UNAME_RELEASE}
> ++	echo "$UNAME_MACHINE"-apple-rhapsody"$UNAME_RELEASE"
> + 	exit ;;
> +     *:Darwin:*:*)
> + 	UNAME_PROCESSOR=3D`uname -p` || UNAME_PROCESSOR=3Dunknown
> +-	case $UNAME_PROCESSOR in
> +-	    unknown) UNAME_PROCESSOR=3Dpowerpc ;;
> +-	esac
> +-	echo ${UNAME_PROCESSOR}-apple-darwin${UNAME_RELEASE}
> ++	eval "$set_cc_for_build"
> ++	if test "$UNAME_PROCESSOR" =3D unknown ; then
> ++	    UNAME_PROCESSOR=3Dpowerpc
> ++	fi
> ++	if test "`echo "$UNAME_RELEASE" | sed -e 's/\..*//'`" -le 10 ; then
> ++	    if [ "$CC_FOR_BUILD" !=3D no_compiler_found ]; then
> ++		if (echo '#ifdef __LP64__'; echo IS_64BIT_ARCH; echo '#endif') | \
> ++		       (CCOPTS=3D"" $CC_FOR_BUILD -E - 2>/dev/null) | \
> ++		       grep IS_64BIT_ARCH >/dev/null
> ++		then
> ++		    case $UNAME_PROCESSOR in
> ++			i386) UNAME_PROCESSOR=3Dx86_64 ;;
> ++			powerpc) UNAME_PROCESSOR=3Dpowerpc64 ;;
> ++		    esac
> ++		fi
> ++		# On 10.4-10.6 one might compile for PowerPC via gcc -arch ppc
> ++		if (echo '#ifdef __POWERPC__'; echo IS_PPC; echo '#endif') | \
> ++		       (CCOPTS=3D"" $CC_FOR_BUILD -E - 2>/dev/null) | \
> ++		       grep IS_PPC >/dev/null
> ++		then
> ++		    UNAME_PROCESSOR=3Dpowerpc
> ++		fi
> ++	    fi
> ++	elif test "$UNAME_PROCESSOR" =3D i386 ; then
> ++	    # Avoid executing cc on OS X 10.9, as it ships with a stub
> ++	    # that puts up a graphical alert prompting to install
> ++	    # developer tools.  Any system running Mac OS X 10.7 or
> ++	    # later (Darwin 11 and later) is required to have a 64-bit
> ++	    # processor. This is not true of the ARM version of Darwin
> ++	    # that Apple uses in portable devices.
> ++	    UNAME_PROCESSOR=3Dx86_64
> ++	fi
> ++	echo "$UNAME_PROCESSOR"-apple-darwin"$UNAME_RELEASE"
> + 	exit ;;
> +     *:procnto*:*:* | *:QNX:[0123456789]*:*)
> + 	UNAME_PROCESSOR=3D`uname -p`
> +-	if test "$UNAME_PROCESSOR" =3D "x86"; then
> ++	if test "$UNAME_PROCESSOR" =3D x86; then
> + 		UNAME_PROCESSOR=3Di386
> + 		UNAME_MACHINE=3Dpc
> + 	fi
> +-	echo ${UNAME_PROCESSOR}-${UNAME_MACHINE}-nto-qnx${UNAME_RELEASE}
> ++	echo "$UNAME_PROCESSOR"-"$UNAME_MACHINE"-nto-qnx"$UNAME_RELEASE"
> + 	exit ;;
> +     *:QNX:*:4*)
> + 	echo i386-pc-qnx
> + 	exit ;;
> +-    NSE-?:NONSTOP_KERNEL:*:*)
> +-	echo nse-tandem-nsk${UNAME_RELEASE}
> ++    NEO-*:NONSTOP_KERNEL:*:*)
> ++	echo neo-tandem-nsk"$UNAME_RELEASE"
> ++	exit ;;
> ++    NSE-*:NONSTOP_KERNEL:*:*)
> ++	echo nse-tandem-nsk"$UNAME_RELEASE"
> ++	exit ;;
> ++    NSR-*:NONSTOP_KERNEL:*:*)
> ++	echo nsr-tandem-nsk"$UNAME_RELEASE"
> + 	exit ;;
> +-    NSR-?:NONSTOP_KERNEL:*:*)
> +-	echo nsr-tandem-nsk${UNAME_RELEASE}
> ++    NSV-*:NONSTOP_KERNEL:*:*)
> ++	echo nsv-tandem-nsk"$UNAME_RELEASE"
> ++	exit ;;
> ++    NSX-*:NONSTOP_KERNEL:*:*)
> ++	echo nsx-tandem-nsk"$UNAME_RELEASE"
> + 	exit ;;
> +     *:NonStop-UX:*:*)
> + 	echo mips-compaq-nonstopux
> +@@ -1303,18 +1352,18 @@ EOF
> + 	echo bs2000-siemens-sysv
> + 	exit ;;
> +     DS/*:UNIX_System_V:*:*)
> +-	echo ${UNAME_MACHINE}-${UNAME_SYSTEM}-${UNAME_RELEASE}
> ++	echo "$UNAME_MACHINE"-"$UNAME_SYSTEM"-"$UNAME_RELEASE"
> + 	exit ;;
> +     *:Plan9:*:*)
> + 	# "uname -m" is not consistent, so use $cputype instead. 386
> + 	# is converted to i386 for consistency with other x86
> + 	# operating systems.
> +-	if test "$cputype" =3D "386"; then
> ++	if test "$cputype" =3D 386; then
> + 	    UNAME_MACHINE=3Di386
> + 	else
> + 	    UNAME_MACHINE=3D"$cputype"
> + 	fi
> +-	echo ${UNAME_MACHINE}-unknown-plan9
> ++	echo "$UNAME_MACHINE"-unknown-plan9
> + 	exit ;;
> +     *:TOPS-10:*:*)
> + 	echo pdp10-unknown-tops10
> +@@ -1335,14 +1384,14 @@ EOF
> + 	echo pdp10-unknown-its
> + 	exit ;;
> +     SEI:*:*:SEIUX)
> +-        echo mips-sei-seiux${UNAME_RELEASE}
> ++	echo mips-sei-seiux"$UNAME_RELEASE"
> + 	exit ;;
> +     *:DragonFly:*:*)
> +-	echo ${UNAME_MACHINE}-unknown-dragonfly`echo ${UNAME_RELEASE}|sed -e=
 's/[-(].*//'`
> ++	echo "$UNAME_MACHINE"-unknown-dragonfly"`echo "$UNAME_RELEASE"|sed -=
e 's/[-(].*//'`"
> + 	exit ;;
> +     *:*VMS:*:*)
> +-    	UNAME_MACHINE=3D`(uname -p) 2>/dev/null`
> +-	case "${UNAME_MACHINE}" in
> ++	UNAME_MACHINE=3D`(uname -p) 2>/dev/null`
> ++	case "$UNAME_MACHINE" in
> + 	    A*) echo alpha-dec-vms ; exit ;;
> + 	    I*) echo ia64-dec-vms ; exit ;;
> + 	    V*) echo vax-dec-vms ; exit ;;
> +@@ -1351,182 +1400,48 @@ EOF
> + 	echo i386-pc-xenix
> + 	exit ;;
> +     i*86:skyos:*:*)
> +-	echo ${UNAME_MACHINE}-pc-skyos`echo ${UNAME_RELEASE}` | sed -e 's/ .=
*$//'
> ++	echo "$UNAME_MACHINE"-pc-skyos"`echo "$UNAME_RELEASE" | sed -e 's/ .=
*$//'`"
> + 	exit ;;
> +     i*86:rdos:*:*)
> +-	echo ${UNAME_MACHINE}-pc-rdos
> ++	echo "$UNAME_MACHINE"-pc-rdos
> + 	exit ;;
> +     i*86:AROS:*:*)
> +-	echo ${UNAME_MACHINE}-pc-aros
> ++	echo "$UNAME_MACHINE"-pc-aros
> ++	exit ;;
> ++    x86_64:VMkernel:*:*)
> ++	echo "$UNAME_MACHINE"-unknown-esx
> ++	exit ;;
> ++    amd64:Isilon\ OneFS:*:*)
> ++	echo x86_64-unknown-onefs
> + 	exit ;;
> + esac
> +=20
> +-#echo '(No uname command or uname output not recognized.)' 1>&2
> +-#echo "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERS=
ION}" 1>&2
> ++echo "$0: unable to guess system type" >&2
> +=20
> +-eval $set_cc_for_build
> +-cat >$dummy.c <<EOF
> +-#ifdef _SEQUENT_
> +-# include <sys/types.h>
> +-# include <sys/utsname.h>
> +-#endif
> +-main ()
> +-{
> +-#if defined (sony)
> +-#if defined (MIPSEB)
> +-  /* BFD wants "bsd" instead of "newsos".  Perhaps BFD should be chan=
ged,
> +-     I don't know....  */
> +-  printf ("mips-sony-bsd\n"); exit (0);
> +-#else
> +-#include <sys/param.h>
> +-  printf ("m68k-sony-newsos%s\n",
> +-#ifdef NEWSOS4
> +-          "4"
> +-#else
> +-	  ""
> +-#endif
> +-         ); exit (0);
> +-#endif
> +-#endif
> +-
> +-#if defined (__arm) && defined (__acorn) && defined (__unix)
> +-  printf ("arm-acorn-riscix\n"); exit (0);
> +-#endif
> +-
> +-#if defined (hp300) && !defined (hpux)
> +-  printf ("m68k-hp-bsd\n"); exit (0);
> +-#endif
> +-
> +-#if defined (NeXT)
> +-#if !defined (__ARCHITECTURE__)
> +-#define __ARCHITECTURE__ "m68k"
> +-#endif
> +-  int version;
> +-  version=3D`(hostinfo | sed -n 's/.*NeXT Mach \([0-9]*\).*/\1/p') 2>=
/dev/null`;
> +-  if (version < 4)
> +-    printf ("%s-next-nextstep%d\n", __ARCHITECTURE__, version);
> +-  else
> +-    printf ("%s-next-openstep%d\n", __ARCHITECTURE__, version);
> +-  exit (0);
> +-#endif
> +-
> +-#if defined (MULTIMAX) || defined (n16)
> +-#if defined (UMAXV)
> +-  printf ("ns32k-encore-sysv\n"); exit (0);
> +-#else
> +-#if defined (CMU)
> +-  printf ("ns32k-encore-mach\n"); exit (0);
> +-#else
> +-  printf ("ns32k-encore-bsd\n"); exit (0);
> +-#endif
> +-#endif
> +-#endif
> +-
> +-#if defined (__386BSD__)
> +-  printf ("i386-pc-bsd\n"); exit (0);
> +-#endif
> +-
> +-#if defined (sequent)
> +-#if defined (i386)
> +-  printf ("i386-sequent-dynix\n"); exit (0);
> +-#endif
> +-#if defined (ns32000)
> +-  printf ("ns32k-sequent-dynix\n"); exit (0);
> +-#endif
> +-#endif
> +-
> +-#if defined (_SEQUENT_)
> +-    struct utsname un;
> +-
> +-    uname(&un);
> +-
> +-    if (strncmp(un.version, "V2", 2) =3D=3D 0) {
> +-	printf ("i386-sequent-ptx2\n"); exit (0);
> +-    }
> +-    if (strncmp(un.version, "V1", 2) =3D=3D 0) { /* XXX is V1 correct=
? */
> +-	printf ("i386-sequent-ptx1\n"); exit (0);
> +-    }
> +-    printf ("i386-sequent-ptx\n"); exit (0);
> +-
> +-#endif
> +-
> +-#if defined (vax)
> +-# if !defined (ultrix)
> +-#  include <sys/param.h>
> +-#  if defined (BSD)
> +-#   if BSD =3D=3D 43
> +-      printf ("vax-dec-bsd4.3\n"); exit (0);
> +-#   else
> +-#    if BSD =3D=3D 199006
> +-      printf ("vax-dec-bsd4.3reno\n"); exit (0);
> +-#    else
> +-      printf ("vax-dec-bsd\n"); exit (0);
> +-#    endif
> +-#   endif
> +-#  else
> +-    printf ("vax-dec-bsd\n"); exit (0);
> +-#  endif
> +-# else
> +-    printf ("vax-dec-ultrix\n"); exit (0);
> +-# endif
> +-#endif
> ++case "$UNAME_MACHINE:$UNAME_SYSTEM" in
> ++    mips:Linux | mips64:Linux)
> ++	# If we got here on MIPS GNU/Linux, output extra information.
> ++	cat >&2 <<EOF
> +=20
> +-#if defined (alliant) && defined (i860)
> +-  printf ("i860-alliant-bsd\n"); exit (0);
> +-#endif
> +-
> +-  exit (1);
> +-}
> ++NOTE: MIPS GNU/Linux systems require a C compiler to fully recognize
> ++the system type. Please install a C compiler and try again.
> + EOF
> +-
> +-$CC_FOR_BUILD -o $dummy $dummy.c 2>/dev/null && SYSTEM_NAME=3D`$dummy=
` &&
> +-	{ echo "$SYSTEM_NAME"; exit; }
> +-
> +-# Apollos put the system type in the environment.
> +-
> +-test -d /usr/apollo && { echo ${ISP}-apollo-${SYSTYPE}; exit; }
> +-
> +-# Convex versions that predate uname can use getsysinfo(1)
> +-
> +-if [ -x /usr/convex/getsysinfo ]
> +-then
> +-    case `getsysinfo -f cpu_type` in
> +-    c1*)
> +-	echo c1-convex-bsd
> +-	exit ;;
> +-    c2*)
> +-	if getsysinfo -f scalar_acc
> +-	then echo c32-convex-bsd
> +-	else echo c2-convex-bsd
> +-	fi
> +-	exit ;;
> +-    c34*)
> +-	echo c34-convex-bsd
> +-	exit ;;
> +-    c38*)
> +-	echo c38-convex-bsd
> +-	exit ;;
> +-    c4*)
> +-	echo c4-convex-bsd
> +-	exit ;;
> +-    esac
> +-fi
> ++	;;
> ++esac
> +=20
> + cat >&2 <<EOF
> +-$0: unable to guess system type
> +=20
> +-This script, last modified $timestamp, has failed to recognize
> +-the operating system you are using. It is advised that you
> +-download the most up to date version of the config scripts from
> ++This script (version $timestamp), has failed to recognize the
> ++operating system you are using. If your script is old, overwrite *all=
*
> ++copies of config.guess and config.sub with the latest versions from:
> +=20
> +-  http://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=3Dblob_plain;f=
=3Dconfig.guess;hb=3DHEAD
> ++  https://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=3Dblob_plain;=
f=3Dconfig.guess
> + and
> +-  http://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=3Dblob_plain;f=
=3Dconfig.sub;hb=3DHEAD
> ++  https://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=3Dblob_plain;=
f=3Dconfig.sub
> +=20
> +-If the version you run ($0) is already up to date, please
> +-send the following data and any information you think might be
> +-pertinent to <config-patches@gnu.org> in order to provide the needed
> +-information to handle your system.
> ++If $0 has already been updated, send the following data and any
> ++information you think might be pertinent to config-patches@gnu.org to=

> ++provide the necessary information to handle your system.
> +=20
> + config.guess timestamp =3D $timestamp
> +=20
> +@@ -1545,16 +1460,16 @@ hostinfo               =3D `(hostinfo) 2>/dev/=
null`
> + /usr/bin/oslevel       =3D `(/usr/bin/oslevel) 2>/dev/null`
> + /usr/convex/getsysinfo =3D `(/usr/convex/getsysinfo) 2>/dev/null`
> +=20
> +-UNAME_MACHINE =3D ${UNAME_MACHINE}
> +-UNAME_RELEASE =3D ${UNAME_RELEASE}
> +-UNAME_SYSTEM  =3D ${UNAME_SYSTEM}
> +-UNAME_VERSION =3D ${UNAME_VERSION}
> ++UNAME_MACHINE =3D "$UNAME_MACHINE"
> ++UNAME_RELEASE =3D "$UNAME_RELEASE"
> ++UNAME_SYSTEM  =3D "$UNAME_SYSTEM"
> ++UNAME_VERSION =3D "$UNAME_VERSION"
> + EOF
> +=20
> + exit 1
> +=20
> + # Local variables:
> +-# eval: (add-hook 'write-file-hooks 'time-stamp)
> ++# eval: (add-hook 'before-save-hook 'time-stamp)
> + # time-stamp-start: "timestamp=3D'"
> + # time-stamp-format: "%:y-%02m-%02d"
> + # time-stamp-end: "'"
> +diff --git a/tools/config.sub b/tools/config.sub
> +index a39437d..c95acc6 100755
> +--- a/tools/config.sub
> ++++ b/tools/config.sub
> +@@ -1,44 +1,40 @@
> + #! /bin/sh
> + # Configuration validation subroutine script.
> +-#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
> +-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
> +-#   Free Software Foundation, Inc.
> ++#   Copyright 1992-2018 Free Software Foundation, Inc.
> +=20
> +-timestamp=3D'2009-04-17'
> ++timestamp=3D'2018-07-03'
> +=20
> +-# This file is (in principle) common to ALL GNU software.
> +-# The presence of a machine in this file suggests that SOME GNU softw=
are
> +-# can handle that machine.  It does not imply ALL GNU software can.
> +-#
> +-# This file is free software; you can redistribute it and/or modify
> +-# it under the terms of the GNU General Public License as published b=
y
> +-# the Free Software Foundation; either version 2 of the License, or
> ++# This file is free software; you can redistribute it and/or modify i=
t
> ++# under the terms of the GNU General Public License as published by
> ++# the Free Software Foundation; either version 3 of the License, or
> + # (at your option) any later version.
> + #
> +-# This program is distributed in the hope that it will be useful,
> +-# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-# GNU General Public License for more details.
> ++# This program is distributed in the hope that it will be useful, but=

> ++# WITHOUT ANY WARRANTY; without even the implied warranty of
> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++# General Public License for more details.
> + #
> + # You should have received a copy of the GNU General Public License
> +-# along with this program; if not, write to the Free Software
> +-# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
> +-# 02110-1301, USA.
> ++# along with this program; if not, see <https://www.gnu.org/licenses/=
>.
> + #
> + # As a special exception to the GNU General Public License, if you
> + # distribute this file as part of a program that contains a
> + # configuration script generated by Autoconf, you may include it unde=
r
> +-# the same distribution terms that you use for the rest of that progr=
am.
> ++# the same distribution terms that you use for the rest of that
> ++# program.  This Exception is an additional permission under section =
7
> ++# of the GNU General Public License, version 3 ("GPLv3").
> +=20
> +=20
> +-# Please send patches to <config-patches@gnu.org>.  Submit a context
> +-# diff and a properly formatted ChangeLog entry.
> ++# Please send patches to <config-patches@gnu.org>.
> + #
> + # Configuration subroutine to validate and canonicalize a configurati=
on type.
> + # Supply the specified configuration type as an argument.
> + # If it is invalid, we print an error message on stderr and exit with=
 code 1.
> + # Otherwise, we print the canonical config type on stdout and succeed=
=2E
> +=20
> ++# You can get the latest version of this script from:
> ++# https://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=3Dblob_plain;=
f=3Dconfig.sub
> ++
> + # This file is supposed to be the same for all GNU packages
> + # and recognize all the CPU types, system types and aliases
> + # that are meaningful with *any* GNU software.
> +@@ -57,12 +53,11 @@ timestamp=3D'2009-04-17'
> + me=3D`echo "$0" | sed -e 's,.*/,,'`
> +=20
> + usage=3D"\
> +-Usage: $0 [OPTION] CPU-MFR-OPSYS
> +-       $0 [OPTION] ALIAS
> ++Usage: $0 [OPTION] CPU-MFR-OPSYS or ALIAS
> +=20
> + Canonicalize a configuration name.
> +=20
> +-Operation modes:
> ++Options:
> +   -h, --help         print this help, then exit
> +   -t, --time-stamp   print date of last modification, then exit
> +   -v, --version      print version number, then exit
> +@@ -72,8 +67,7 @@ Report bugs and patches to <config-patches@gnu.org>.=
"
> + version=3D"\
> + GNU config.sub ($timestamp)
> +=20
> +-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2=
001,
> +-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, In=
c.
> ++Copyright 1992-2018 Free Software Foundation, Inc.
> +=20
> + This is free software; see the source for copying conditions.  There =
is NO
> + warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PU=
RPOSE."
> +@@ -100,7 +94,7 @@ while test $# -gt 0 ; do
> +=20
> +     *local*)
> +        # First pass through any local machine types.
> +-       echo $1
> ++       echo "$1"
> +        exit ;;
> +=20
> +     * )
> +@@ -116,120 +110,455 @@ case $# in
> +     exit 1;;
> + esac
> +=20
> +-# Separate what the user gave into CPU-COMPANY and OS or KERNEL-OS (i=
f any).
> +-# Here we must recognize all the valid KERNEL-OS combinations.
> +-maybe_os=3D`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
> +-case $maybe_os in
> +-  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-ucli=
bc* | \
> +-  uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | n=
etbsd*-gnu* | \
> +-  kopensolaris*-gnu* | \
> +-  storm-chaos* | os2-emx* | rtmk-nova*)
> +-    os=3D-$maybe_os
> +-    basic_machine=3D`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
> +-    ;;
> +-  *)
> +-    basic_machine=3D`echo $1 | sed 's/-[^-]*$//'`
> +-    if [ $basic_machine !=3D $1 ]
> +-    then os=3D`echo $1 | sed 's/.*-/-/'`
> +-    else os=3D; fi
> +-    ;;
> +-esac
> ++# Split fields of configuration type
> ++IFS=3D"-" read -r field1 field2 field3 field4 <<EOF
> ++$1
> ++EOF
> +=20
> +-### Let's recognize common machines as not being operating systems so=

> +-### that things like config.sub decstation-3100 work.  We also
> +-### recognize some manufacturers as not being operating systems, so w=
e
> +-### can provide default operating systems below.
> +-case $os in
> +-	-sun*os*)
> +-		# Prevent following clause from handling this invalid input.
> +-		;;
> +-	-dec* | -mips* | -sequent* | -encore* | -pc532* | -sgi* | -sony* | \=

> +-	-att* | -7300* | -3300* | -delta* | -motorola* | -sun[234]* | \
> +-	-unicom* | -ibm* | -next | -hp | -isi* | -apollo | -altos* | \
> +-	-convergent* | -ncr* | -news | -32* | -3600* | -3100* | -hitachi* |\=

> +-	-c[123]* | -convex* | -sun | -crds | -omron* | -dg | -ultra | -tti* =
| \
> +-	-harris | -dolphin | -highlevel | -gould | -cbm | -ns | -masscomp | =
\
> +-	-apple | -axis | -knuth | -cray)
> +-		os=3D
> +-		basic_machine=3D$1
> +-		;;
> +-	-sim | -cisco | -oki | -wec | -winbond)
> +-		os=3D
> +-		basic_machine=3D$1
> +-		;;
> +-	-scout)
> +-		;;
> +-	-wrs)
> +-		os=3D-vxworks
> +-		basic_machine=3D$1
> +-		;;
> +-	-chorusos*)
> +-		os=3D-chorusos
> +-		basic_machine=3D$1
> +-		;;
> +- 	-chorusrdb)
> +- 		os=3D-chorusrdb
> +-		basic_machine=3D$1
> +- 		;;
> +-	-hiux*)
> +-		os=3D-hiuxwe2
> +-		;;
> +-	-sco6)
> +-		os=3D-sco5v6
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-sco5)
> +-		os=3D-sco3.2v5
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-sco4)
> +-		os=3D-sco3.2v4
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-sco3.2.[4-9]*)
> +-		os=3D`echo $os | sed -e 's/sco3.2./sco3.2v/'`
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-sco3.2v[4-9]*)
> +-		# Don't forget version if it is 3.2v4 or newer.
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-sco5v6*)
> +-		# Don't forget version if it is 3.2v4 or newer.
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-sco*)
> +-		os=3D-sco3.2v2
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-udk*)
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-isc)
> +-		os=3D-isc2.2
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-clix*)
> +-		basic_machine=3Dclipper-intergraph
> +-		;;
> +-	-isc*)
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-pc/'`
> +-		;;
> +-	-lynx*)
> +-		os=3D-lynxos
> ++# Separate into logical components for further validation
> ++case $1 in
> ++	*-*-*-*-*)
> ++		echo Invalid configuration \`"$1"\': more than four components >&2
> ++		exit 1
> + 		;;
> +-	-ptx*)
> +-		basic_machine=3D`echo $1 | sed -e 's/86-.*/86-sequent/'`
> ++	*-*-*-*)
> ++		basic_machine=3D$field1-$field2
> ++		os=3D$field3-$field4
> + 		;;
> +-	-windowsnt*)
> +-		os=3D`echo $os | sed -e 's/windowsnt/winnt/'`
> ++	*-*-*)
> ++		# Ambiguous whether COMPANY is present, or skipped and KERNEL-OS is=
 two
> ++		# parts
> ++		maybe_os=3D$field2-$field3
> ++		case $maybe_os in
> ++			nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc \
> ++			| linux-newlib* | linux-musl* | linux-uclibc* | uclinux-uclibc* \
> ++			| uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* \
> ++			| netbsd*-eabi* | kopensolaris*-gnu* | cloudabi*-eabi* \
> ++			| storm-chaos* | os2-emx* | rtmk-nova*)
> ++				basic_machine=3D$field1
> ++				os=3D$maybe_os
> ++				;;
> ++			android-linux)
> ++				basic_machine=3D$field1-unknown
> ++				os=3Dlinux-android
> ++				;;
> ++			*)
> ++				basic_machine=3D$field1-$field2
> ++				os=3D$field3
> ++				;;
> ++		esac
> + 		;;
> +-	-psos*)
> +-		os=3D-psos
> ++	*-*)
> ++		# Second component is usually, but not always the OS
> ++		case $field2 in
> ++			# Prevent following clause from handling this valid os
> ++			sun*os*)
> ++				basic_machine=3D$field1
> ++				os=3D$field2
> ++				;;
> ++			# Manufacturers
> ++			dec* | mips* | sequent* | encore* | pc532* | sgi* | sony* \
> ++			| att* | 7300* | 3300* | delta* | motorola* | sun[234]* \
> ++			| unicom* | ibm* | next | hp | isi* | apollo | altos* \
> ++			| convergent* | ncr* | news | 32* | 3600* | 3100* | hitachi* \
> ++			| c[123]* | convex* | sun | crds | omron* | dg | ultra | tti* \
> ++			| harris | dolphin | highlevel | gould | cbm | ns | masscomp \
> ++			| apple | axis | knuth | cray | microblaze* \
> ++			| sim | cisco | oki | wec | wrs | winbond)
> ++				basic_machine=3D$field1-$field2
> ++				os=3D
> ++				;;
> ++			*)
> ++				basic_machine=3D$field1
> ++				os=3D$field2
> ++				;;
> ++		esac
> + 		;;
> +-	-mint | -mint[0-9]*)
> +-		basic_machine=3Dm68k-atari
> +-		os=3D-mint
> ++	*)
> ++		# Convert single-component short-hands not valid as part of
> ++		# multi-component configurations.
> ++		case $field1 in
> ++			386bsd)
> ++				basic_machine=3Di386-pc
> ++				os=3Dbsd
> ++				;;
> ++			a29khif)
> ++				basic_machine=3Da29k-amd
> ++				os=3Dudi
> ++				;;
> ++			adobe68k)
> ++				basic_machine=3Dm68010-adobe
> ++				os=3Dscout
> ++				;;
> ++			am29k)
> ++				basic_machine=3Da29k-none
> ++				os=3Dbsd
> ++				;;
> ++			amdahl)
> ++				basic_machine=3D580-amdahl
> ++				os=3Dsysv
> ++				;;
> ++			amigaos | amigados)
> ++				basic_machine=3Dm68k-unknown
> ++				os=3Damigaos
> ++				;;
> ++			amigaunix | amix)
> ++				basic_machine=3Dm68k-unknown
> ++				os=3Dsysv4
> ++				;;
> ++			apollo68)
> ++				basic_machine=3Dm68k-apollo
> ++				os=3Dsysv
> ++				;;
> ++			apollo68bsd)
> ++				basic_machine=3Dm68k-apollo
> ++				os=3Dbsd
> ++				;;
> ++			aros)
> ++				basic_machine=3Di386-pc
> ++				os=3Daros
> ++				;;
> ++			aux)
> ++				basic_machine=3Dm68k-apple
> ++				os=3Daux
> ++				;;
> ++			balance)
> ++				basic_machine=3Dns32k-sequent
> ++				os=3Ddynix
> ++				;;
> ++			blackfin)
> ++				basic_machine=3Dbfin-unknown
> ++				os=3Dlinux
> ++				;;
> ++			cegcc)
> ++				basic_machine=3Darm-unknown
> ++				os=3Dcegcc
> ++				;;
> ++			cray)
> ++				basic_machine=3Dj90-cray
> ++				os=3Dunicos
> ++				;;
> ++			craynv)
> ++				basic_machine=3Dcraynv-cray
> ++				os=3Dunicosmp
> ++				;;
> ++			delta88)
> ++				basic_machine=3Dm88k-motorola
> ++				os=3Dsysv3
> ++				;;
> ++			dicos)
> ++				basic_machine=3Di686-pc
> ++				os=3Ddicos
> ++				;;
> ++			djgpp)
> ++				basic_machine=3Di586-pc
> ++				os=3Dmsdosdjgpp
> ++				;;
> ++			ebmon29k)
> ++				basic_machine=3Da29k-amd
> ++				os=3Debmon
> ++				;;
> ++			es1800 | OSE68k | ose68k | ose | OSE)
> ++				basic_machine=3Dm68k-ericsson
> ++				os=3Dose
> ++				;;
> ++			gmicro)
> ++				basic_machine=3Dtron-gmicro
> ++				os=3Dsysv
> ++				;;
> ++			go32)
> ++				basic_machine=3Di386-pc
> ++				os=3Dgo32
> ++				;;
> ++			h8300hms)
> ++				basic_machine=3Dh8300-hitachi
> ++				os=3Dhms
> ++				;;
> ++			h8300xray)
> ++				basic_machine=3Dh8300-hitachi
> ++				os=3Dxray
> ++				;;
> ++			h8500hms)
> ++				basic_machine=3Dh8500-hitachi
> ++				os=3Dhms
> ++				;;
> ++			harris)
> ++				basic_machine=3Dm88k-harris
> ++				os=3Dsysv3
> ++				;;
> ++			hp300bsd)
> ++				basic_machine=3Dm68k-hp
> ++				os=3Dbsd
> ++				;;
> ++			hp300hpux)
> ++				basic_machine=3Dm68k-hp
> ++				os=3Dhpux
> ++				;;
> ++			hppaosf)
> ++				basic_machine=3Dhppa1.1-hp
> ++				os=3Dosf
> ++				;;
> ++			hppro)
> ++				basic_machine=3Dhppa1.1-hp
> ++				os=3Dproelf
> ++				;;
> ++			i386mach)
> ++				basic_machine=3Di386-mach
> ++				os=3Dmach
> ++				;;
> ++			vsta)
> ++				basic_machine=3Di386-unknown
> ++				os=3Dvsta
> ++				;;
> ++			isi68 | isi)
> ++				basic_machine=3Dm68k-isi
> ++				os=3Dsysv
> ++				;;
> ++			m68knommu)
> ++				basic_machine=3Dm68k-unknown
> ++				os=3Dlinux
> ++				;;
> ++			magnum | m3230)
> ++				basic_machine=3Dmips-mips
> ++				os=3Dsysv
> ++				;;
> ++			merlin)
> ++				basic_machine=3Dns32k-utek
> ++				os=3Dsysv
> ++				;;
> ++			mingw64)
> ++				basic_machine=3Dx86_64-pc
> ++				os=3Dmingw64
> ++				;;
> ++			mingw32)
> ++				basic_machine=3Di686-pc
> ++				os=3Dmingw32
> ++				;;
> ++			mingw32ce)
> ++				basic_machine=3Darm-unknown
> ++				os=3Dmingw32ce
> ++				;;
> ++			monitor)
> ++				basic_machine=3Dm68k-rom68k
> ++				os=3Dcoff
> ++				;;
> ++			morphos)
> ++				basic_machine=3Dpowerpc-unknown
> ++				os=3Dmorphos
> ++				;;
> ++			moxiebox)
> ++				basic_machine=3Dmoxie-unknown
> ++				os=3Dmoxiebox
> ++				;;
> ++			msdos)
> ++				basic_machine=3Di386-pc
> ++				os=3Dmsdos
> ++				;;
> ++			msys)
> ++				basic_machine=3Di686-pc
> ++				os=3Dmsys
> ++				;;
> ++			mvs)
> ++				basic_machine=3Di370-ibm
> ++				os=3Dmvs
> ++				;;
> ++			nacl)
> ++				basic_machine=3Dle32-unknown
> ++				os=3Dnacl
> ++				;;
> ++			ncr3000)
> ++				basic_machine=3Di486-ncr
> ++				os=3Dsysv4
> ++				;;
> ++			netbsd386)
> ++				basic_machine=3Di386-unknown
> ++				os=3Dnetbsd
> ++				;;
> ++			netwinder)
> ++				basic_machine=3Darmv4l-rebel
> ++				os=3Dlinux
> ++				;;
> ++			news | news700 | news800 | news900)
> ++				basic_machine=3Dm68k-sony
> ++				os=3Dnewsos
> ++				;;
> ++			news1000)
> ++				basic_machine=3Dm68030-sony
> ++				os=3Dnewsos
> ++				;;
> ++			necv70)
> ++				basic_machine=3Dv70-nec
> ++				os=3Dsysv
> ++				;;
> ++			nh3000)
> ++				basic_machine=3Dm68k-harris
> ++				os=3Dcxux
> ++				;;
> ++			nh[45]000)
> ++				basic_machine=3Dm88k-harris
> ++				os=3Dcxux
> ++				;;
> ++			nindy960)
> ++				basic_machine=3Di960-intel
> ++				os=3Dnindy
> ++				;;
> ++			mon960)
> ++				basic_machine=3Di960-intel
> ++				os=3Dmon960
> ++				;;
> ++			nonstopux)
> ++				basic_machine=3Dmips-compaq
> ++				os=3Dnonstopux
> ++				;;
> ++			os400)
> ++				basic_machine=3Dpowerpc-ibm
> ++				os=3Dos400
> ++				;;
> ++			OSE68000 | ose68000)
> ++				basic_machine=3Dm68000-ericsson
> ++				os=3Dose
> ++				;;
> ++			os68k)
> ++				basic_machine=3Dm68k-none
> ++				os=3Dos68k
> ++				;;
> ++			paragon)
> ++				basic_machine=3Di860-intel
> ++				os=3Dosf
> ++				;;
> ++			parisc)
> ++				basic_machine=3Dhppa-unknown
> ++				os=3Dlinux
> ++				;;
> ++			pw32)
> ++				basic_machine=3Di586-unknown
> ++				os=3Dpw32
> ++				;;
> ++			rdos | rdos64)
> ++				basic_machine=3Dx86_64-pc
> ++				os=3Drdos
> ++				;;
> ++			rdos32)
> ++				basic_machine=3Di386-pc
> ++				os=3Drdos
> ++				;;
> ++			rom68k)
> ++				basic_machine=3Dm68k-rom68k
> ++				os=3Dcoff
> ++				;;
> ++			sa29200)
> ++				basic_machine=3Da29k-amd
> ++				os=3Dudi
> ++				;;
> ++			sei)
> ++				basic_machine=3Dmips-sei
> ++				os=3Dseiux
> ++				;;
> ++			sps7)
> ++				basic_machine=3Dm68k-bull
> ++				os=3Dsysv2
> ++				;;
> ++			stratus)
> ++				basic_machine=3Di860-stratus
> ++				os=3Dsysv4
> ++				;;
> ++			sun2os3)
> ++				basic_machine=3Dm68000-sun
> ++				os=3Dsunos3
> ++				;;
> ++			sun2os4)
> ++				basic_machine=3Dm68000-sun
> ++				os=3Dsunos4
> ++				;;
> ++			sun3os3)
> ++				basic_machine=3Dm68k-sun
> ++				os=3Dsunos3
> ++				;;
> ++			sun3os4)
> ++				basic_machine=3Dm68k-sun
> ++				os=3Dsunos4
> ++				;;
> ++			sun4os3)
> ++				basic_machine=3Dsparc-sun
> ++				os=3Dsunos3
> ++				;;
> ++			sun4os4)
> ++				basic_machine=3Dsparc-sun
> ++				os=3Dsunos4
> ++				;;
> ++			sun4sol2)
> ++				basic_machine=3Dsparc-sun
> ++				os=3Dsolaris2
> ++				;;
> ++			sv1)
> ++				basic_machine=3Dsv1-cray
> ++				os=3Dunicos
> ++				;;
> ++			symmetry)
> ++				basic_machine=3Di386-sequent
> ++				os=3Ddynix
> ++				;;
> ++			t3e)
> ++				basic_machine=3Dalphaev5-cray
> ++				os=3Dunicos
> ++				;;
> ++			t90)
> ++				basic_machine=3Dt90-cray
> ++				os=3Dunicos
> ++				;;
> ++			toad1)
> ++				basic_machine=3Dpdp10-xkl
> ++				os=3Dtops20
> ++				;;
> ++			tpf)
> ++				basic_machine=3Ds390x-ibm
> ++				os=3Dtpf
> ++				;;
> ++			udi29k)
> ++				basic_machine=3Da29k-amd
> ++				os=3Dudi
> ++				;;
> ++			ultra3)
> ++				basic_machine=3Da29k-nyu
> ++				os=3Dsym1
> ++				;;
> ++			v810 | necv810)
> ++				basic_machine=3Dv810-nec
> ++				os=3Dnone
> ++				;;
> ++			vaxv)
> ++				basic_machine=3Dvax-dec
> ++				os=3Dsysv
> ++				;;
> ++			vms)
> ++				basic_machine=3Dvax-dec
> ++				os=3Dvms
> ++				;;
> ++			vxworks960)
> ++				basic_machine=3Di960-wrs
> ++				os=3Dvxworks
> ++				;;
> ++			vxworks68)
> ++				basic_machine=3Dm68k-wrs
> ++				os=3Dvxworks
> ++				;;
> ++			vxworks29k)
> ++				basic_machine=3Da29k-wrs
> ++				os=3Dvxworks
> ++				;;
> ++			xbox)
> ++				basic_machine=3Di686-pc
> ++				os=3Dmingw32
> ++				;;
> ++			ymp)
> ++				basic_machine=3Dymp-cray
> ++				os=3Dunicos
> ++				;;
> ++			*)
> ++				basic_machine=3D$1
> ++				os=3D
> ++				;;
> ++		esac
> + 		;;
> + esac
> +=20
> +@@ -239,20 +568,29 @@ case $basic_machine in
> + 	# Some are omitted here because they have special meanings below.
> + 	1750a | 580 \
> + 	| a29k \
> ++	| aarch64 | aarch64_be \
> + 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
> + 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64p=
ca5[67] \
> + 	| am33_2.0 \
> +-	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr=
 | avr32 \
> ++	| arc | arceb \
> ++	| arm | arm[bl]e | arme[lb] | armv[2-8] | armv[3-8][lb] | armv6m | a=
rmv[78][arm] \
> ++	| avr | avr32 \
> ++	| ba \
> ++	| be32 | be64 \
> + 	| bfin \
> +-	| c4x | clipper \
> ++	| c4x | c8051 | clipper | csky \
> + 	| d10v | d30v | dlx | dsp16xx \
> +-	| fido | fr30 | frv \
> ++	| e2k | epiphany \
> ++	| fido | fr30 | frv | ft32 \
> + 	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64=
 \
> +-	| i370 | i860 | i960 | ia64 \
> ++	| hexagon \
> ++	| i370 | i860 | i960 | ia16 | ia64 \
> + 	| ip2k | iq2000 \
> ++	| k1om \
> ++	| le32 | le64 \
> + 	| lm32 \
> + 	| m32c | m32r | m32rle | m68000 | m68k | m88k \
> +-	| maxq | mb | microblaze | mcore | mep | metag \
> ++	| maxq | mb | microblaze | microblazeel | mcore | mep | metag \
> + 	| mips | mipsbe | mipseb | mipsel | mipsle \
> + 	| mips16 \
> + 	| mips64 | mips64el \
> +@@ -266,44 +604,83 @@ case $basic_machine in
> + 	| mips64vr5900 | mips64vr5900el \
> + 	| mipsisa32 | mipsisa32el \
> + 	| mipsisa32r2 | mipsisa32r2el \
> ++	| mipsisa32r6 | mipsisa32r6el \
> + 	| mipsisa64 | mipsisa64el \
> + 	| mipsisa64r2 | mipsisa64r2el \
> ++	| mipsisa64r6 | mipsisa64r6el \
> + 	| mipsisa64sb1 | mipsisa64sb1el \
> + 	| mipsisa64sr71k | mipsisa64sr71kel \
> ++	| mipsr5900 | mipsr5900el \
> + 	| mipstx39 | mipstx39el \
> + 	| mn10200 | mn10300 \
> + 	| moxie \
> + 	| mt \
> + 	| msp430 \
> +-	| nios | nios2 \
> ++	| nds32 | nds32le | nds32be \
> ++	| nfp \
> ++	| nios | nios2 | nios2eb | nios2el \
> + 	| ns16k | ns32k \
> +-	| or32 \
> +-	| pdp10 | pdp11 | pj | pjl \
> +-	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
> ++	| open8 | or1k | or1knd | or32 \
> ++	| pdp10 | pj | pjl \
> ++	| powerpc | powerpc64 | powerpc64le | powerpcle \
> ++	| pru \
> + 	| pyramid \
> ++	| riscv | riscv32 | riscv64 \
> ++	| rl78 | rx \
> + 	| score \
> +-	| sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[34]eb | sheb | =
shbe | shle | sh[1234]le | sh3ele \
> ++	| sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[234]eb | sheb |=
 shbe | shle | sh[1234]le | sh3ele \
> + 	| sh64 | sh64le \
> + 	| sparc | sparc64 | sparc64b | sparc64v | sparc86x | sparclet | spar=
clite \
> + 	| sparcv8 | sparcv9 | sparcv9b | sparcv9v \
> +-	| spu | strongarm \
> +-	| tahoe | thumb | tic4x | tic80 | tron \
> +-	| v850 | v850e \
> +-	| we32k \
> +-	| x86 | xc16x | xscale | xscalee[bl] | xstormy16 | xtensa \
> ++	| spu \
> ++	| tahoe | tic4x | tic54x | tic55x | tic6x | tic80 | tron \
> ++	| ubicom32 \
> ++	| v850 | v850e | v850e1 | v850e2 | v850es | v850e2v3 \
> ++	| visium \
> ++	| wasm32 \
> ++	| x86 | xc16x | xstormy16 | xtensa \
> + 	| z8k | z80)
> + 		basic_machine=3D$basic_machine-unknown
> + 		;;
> +-	m6811 | m68hc11 | m6812 | m68hc12)
> +-		# Motorola 68HC11/12.
> ++	c54x)
> ++		basic_machine=3Dtic54x-unknown
> ++		;;
> ++	c55x)
> ++		basic_machine=3Dtic55x-unknown
> ++		;;
> ++	c6x)
> ++		basic_machine=3Dtic6x-unknown
> ++		;;
> ++	leon|leon[3-9])
> ++		basic_machine=3Dsparc-$basic_machine
> ++		;;
> ++	m6811 | m68hc11 | m6812 | m68hc12 | m68hcs12x | nvptx | picochip)
> + 		basic_machine=3D$basic_machine-unknown
> +-		os=3D-none
> ++		os=3D${os:-none}
> + 		;;
> +-	m88110 | m680[12346]0 | m683?2 | m68360 | m5200 | v70 | w65 | z8k)
> ++	m88110 | m680[12346]0 | m683?2 | m68360 | m5200 | v70 | w65)
> ++		;;
> ++	m9s12z | m68hcs12z | hcs12z | s12z)
> ++		basic_machine=3Ds12z-unknown
> ++		os=3D${os:-none}
> + 		;;
> + 	ms1)
> + 		basic_machine=3Dmt-unknown
> + 		;;
> ++	strongarm | thumb | xscale)
> ++		basic_machine=3Darm-unknown
> ++		;;
> ++	xgate)
> ++		basic_machine=3D$basic_machine-unknown
> ++		os=3D${os:-none}
> ++		;;
> ++	xscaleeb)
> ++		basic_machine=3Darmeb-unknown
> ++		;;
> ++
> ++	xscaleel)
> ++		basic_machine=3Darmel-unknown
> ++		;;
> +=20
> + 	# We use `pc' rather than `unknown'
> + 	# because (1) that's what they normally are, and
> +@@ -311,33 +688,35 @@ case $basic_machine in
> + 	i*86 | x86_64)
> + 	  basic_machine=3D$basic_machine-pc
> + 	  ;;
> +-	# Object if more than one company name word.
> +-	*-*-*)
> +-		echo Invalid configuration \`$1\': machine \`$basic_machine\' not r=
ecognized 1>&2
> +-		exit 1
> +-		;;
> + 	# Recognize the basic CPU types with company name.
> + 	580-* \
> + 	| a29k-* \
> ++	| aarch64-* | aarch64_be-* \
> + 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
> + 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
> +-	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
> ++	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* | arceb-* \
> + 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
> + 	| avr-* | avr32-* \
> ++	| ba-* \
> ++	| be32-* | be64-* \
> + 	| bfin-* | bs2000-* \
> +-	| c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x-* \
> +-	| clipper-* | craynv-* | cydra-* \
> ++	| c[123]* | c30-* | [cjt]90-* | c4x-* \
> ++	| c8051-* | clipper-* | craynv-* | csky-* | cydra-* \
> + 	| d10v-* | d30v-* | dlx-* \
> +-	| elxsi-* \
> ++	| e2k-* | elxsi-* \
> + 	| f30[01]-* | f700-* | fido-* | fr30-* | frv-* | fx80-* \
> + 	| h8300-* | h8500-* \
> + 	| hppa-* | hppa1.[01]-* | hppa2.0-* | hppa2.0[nw]-* | hppa64-* \
> +-	| i*86-* | i860-* | i960-* | ia64-* \
> ++	| hexagon-* \
> ++	| i*86-* | i860-* | i960-* | ia16-* | ia64-* \
> + 	| ip2k-* | iq2000-* \
> ++	| k1om-* \
> ++	| le32-* | le64-* \
> + 	| lm32-* \
> + 	| m32c-* | m32r-* | m32rle-* \
> + 	| m68000-* | m680[012346]0-* | m68360-* | m683?2-* | m68k-* \
> + 	| m88110-* | m88k-* | maxq-* | mcore-* | metag-* \
> ++	| microblaze-* | microblazeel-* \
> + 	| mips-* | mipsbe-* | mipseb-* | mipsel-* | mipsle-* \
> + 	| mips16-* \
> + 	| mips64-* | mips64el-* \
> +@@ -351,32 +730,46 @@ case $basic_machine in
> + 	| mips64vr5900-* | mips64vr5900el-* \
> + 	| mipsisa32-* | mipsisa32el-* \
> + 	| mipsisa32r2-* | mipsisa32r2el-* \
> ++	| mipsisa32r6-* | mipsisa32r6el-* \
> + 	| mipsisa64-* | mipsisa64el-* \
> + 	| mipsisa64r2-* | mipsisa64r2el-* \
> ++	| mipsisa64r6-* | mipsisa64r6el-* \
> + 	| mipsisa64sb1-* | mipsisa64sb1el-* \
> + 	| mipsisa64sr71k-* | mipsisa64sr71kel-* \
> ++	| mipsr5900-* | mipsr5900el-* \
> + 	| mipstx39-* | mipstx39el-* \
> + 	| mmix-* \
> + 	| mt-* \
> + 	| msp430-* \
> +-	| nios-* | nios2-* \
> ++	| nds32-* | nds32le-* | nds32be-* \
> ++	| nfp-* \
> ++	| nios-* | nios2-* | nios2eb-* | nios2el-* \
> + 	| none-* | np1-* | ns16k-* | ns32k-* \
> ++	| open8-* \
> ++	| or1k*-* \
> + 	| orion-* \
> + 	| pdp10-* | pdp11-* | pj-* | pjl-* | pn-* | power-* \
> +-	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
> ++	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* \
> ++	| pru-* \
> + 	| pyramid-* \
> +-	| romp-* | rs6000-* \
> ++	| riscv-* | riscv32-* | riscv64-* \
> ++	| rl78-* | romp-* | rs6000-* | rx-* \
> + 	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]aeb-* | sh[23]e-* | sh[34]eb=
-* | sheb-* | shbe-* \
> + 	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
> + 	| sparc-* | sparc64-* | sparc64b-* | sparc64v-* | sparc86x-* | sparc=
let-* \
> + 	| sparclite-* \
> +-	| sparcv8-* | sparcv9-* | sparcv9b-* | sparcv9v-* | strongarm-* | sv=
1-* | sx?-* \
> +-	| tahoe-* | thumb-* \
> +-	| tic30-* | tic4x-* | tic54x-* | tic55x-* | tic6x-* | tic80-* | tile=
-* \
> ++	| sparcv8-* | sparcv9-* | sparcv9b-* | sparcv9v-* | sv1-* | sx*-* \
> ++	| tahoe-* \
> ++	| tic30-* | tic4x-* | tic54x-* | tic55x-* | tic6x-* | tic80-* \
> ++	| tile*-* \
> + 	| tron-* \
> +-	| v850-* | v850e-* | vax-* \
> ++	| ubicom32-* \
> ++	| v850-* | v850e-* | v850e1-* | v850es-* | v850e2-* | v850e2v3-* \
> ++	| vax-* \
> ++	| visium-* \
> ++	| wasm32-* \
> + 	| we32k-* \
> +-	| x86-* | x86_64-* | xc16x-* | xps100-* | xscale-* | xscalee[bl]-* \=

> ++	| x86-* | x86_64-* | xc16x-* | xps100-* \
> + 	| xstormy16-* | xtensa*-* \
> + 	| ymp-* \
> + 	| z8k-* | z80-*)
> +@@ -387,125 +780,77 @@ case $basic_machine in
> + 		;;
> + 	# Recognize the various machine names and aliases which stand
> + 	# for a CPU type and a company and sometimes even an OS.
> +-	386bsd)
> +-		basic_machine=3Di386-unknown
> +-		os=3D-bsd
> +-		;;
> + 	3b1 | 7300 | 7300-att | att-7300 | pc7300 | safari | unixpc)
> + 		basic_machine=3Dm68000-att
> + 		;;
> + 	3b*)
> + 		basic_machine=3Dwe32k-att
> + 		;;
> +-	a29khif)
> +-		basic_machine=3Da29k-amd
> +-		os=3D-udi
> +-		;;
> +-    	abacus)
> ++	abacus)
> + 		basic_machine=3Dabacus-unknown
> + 		;;
> +-	adobe68k)
> +-		basic_machine=3Dm68010-adobe
> +-		os=3D-scout
> +-		;;
> + 	alliant | fx80)
> + 		basic_machine=3Dfx80-alliant
> + 		;;
> + 	altos | altos3068)
> + 		basic_machine=3Dm68k-altos
> + 		;;
> +-	am29k)
> +-		basic_machine=3Da29k-none
> +-		os=3D-bsd
> +-		;;
> + 	amd64)
> + 		basic_machine=3Dx86_64-pc
> + 		;;
> + 	amd64-*)
> +-		basic_machine=3Dx86_64-`echo $basic_machine | sed 's/^[^-]*-//'`
> +-		;;
> +-	amdahl)
> +-		basic_machine=3D580-amdahl
> +-		os=3D-sysv
> ++		basic_machine=3Dx86_64-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> + 	amiga | amiga-*)
> + 		basic_machine=3Dm68k-unknown
> + 		;;
> +-	amigaos | amigados)
> +-		basic_machine=3Dm68k-unknown
> +-		os=3D-amigaos
> +-		;;
> +-	amigaunix | amix)
> +-		basic_machine=3Dm68k-unknown
> +-		os=3D-sysv4
> +-		;;
> +-	apollo68)
> +-		basic_machine=3Dm68k-apollo
> +-		os=3D-sysv
> +-		;;
> +-	apollo68bsd)
> +-		basic_machine=3Dm68k-apollo
> +-		os=3D-bsd
> ++	asmjs)
> ++		basic_machine=3Dasmjs-unknown
> + 		;;
> +-	aros)
> +-		basic_machine=3Di386-pc
> +-		os=3D-aros
> ++	blackfin-*)
> ++		basic_machine=3Dbfin-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> ++		os=3Dlinux
> + 		;;
> +-	aux)
> +-		basic_machine=3Dm68k-apple
> +-		os=3D-aux
> ++	bluegene*)
> ++		basic_machine=3Dpowerpc-ibm
> ++		os=3Dcnk
> + 		;;
> +-	balance)
> +-		basic_machine=3Dns32k-sequent
> +-		os=3D-dynix
> ++	c54x-*)
> ++		basic_machine=3Dtic54x-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> +-	blackfin)
> +-		basic_machine=3Dbfin-unknown
> +-		os=3D-linux
> ++	c55x-*)
> ++		basic_machine=3Dtic55x-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> +-	blackfin-*)
> +-		basic_machine=3Dbfin-`echo $basic_machine | sed 's/^[^-]*-//'`
> +-		os=3D-linux
> ++	c6x-*)
> ++		basic_machine=3Dtic6x-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> + 	c90)
> + 		basic_machine=3Dc90-cray
> +-		os=3D-unicos
> +-		;;
> +-        cegcc)
> +-		basic_machine=3Darm-unknown
> +-		os=3D-cegcc
> ++		os=3D${os:-unicos}
> + 		;;
> + 	convex-c1)
> + 		basic_machine=3Dc1-convex
> +-		os=3D-bsd
> ++		os=3Dbsd
> + 		;;
> + 	convex-c2)
> + 		basic_machine=3Dc2-convex
> +-		os=3D-bsd
> ++		os=3Dbsd
> + 		;;
> + 	convex-c32)
> + 		basic_machine=3Dc32-convex
> +-		os=3D-bsd
> ++		os=3Dbsd
> + 		;;
> + 	convex-c34)
> + 		basic_machine=3Dc34-convex
> +-		os=3D-bsd
> ++		os=3Dbsd
> + 		;;
> + 	convex-c38)
> + 		basic_machine=3Dc38-convex
> +-		os=3D-bsd
> +-		;;
> +-	cray | j90)
> +-		basic_machine=3Dj90-cray
> +-		os=3D-unicos
> +-		;;
> +-	craynv)
> +-		basic_machine=3Dcraynv-cray
> +-		os=3D-unicosmp
> ++		os=3Dbsd
> + 		;;
> +-	cr16)
> ++	cr16 | cr16-*)
> + 		basic_machine=3Dcr16-unknown
> +-		os=3D-elf
> ++		os=3D${os:-elf}
> + 		;;
> + 	crds | unos)
> + 		basic_machine=3Dm68k-crds
> +@@ -518,7 +863,7 @@ case $basic_machine in
> + 		;;
> + 	crx)
> + 		basic_machine=3Dcrx-unknown
> +-		os=3D-elf
> ++		os=3D${os:-elf}
> + 		;;
> + 	da30 | da30-*)
> + 		basic_machine=3Dm68k-da30
> +@@ -528,50 +873,38 @@ case $basic_machine in
> + 		;;
> + 	decsystem10* | dec10*)
> + 		basic_machine=3Dpdp10-dec
> +-		os=3D-tops10
> ++		os=3Dtops10
> + 		;;
> + 	decsystem20* | dec20*)
> + 		basic_machine=3Dpdp10-dec
> +-		os=3D-tops20
> ++		os=3Dtops20
> + 		;;
> + 	delta | 3300 | motorola-3300 | motorola-delta \
> + 	      | 3300-motorola | delta-motorola)
> + 		basic_machine=3Dm68k-motorola
> + 		;;
> +-	delta88)
> +-		basic_machine=3Dm88k-motorola
> +-		os=3D-sysv3
> +-		;;
> +-	dicos)
> +-		basic_machine=3Di686-pc
> +-		os=3D-dicos
> +-		;;
> +-	djgpp)
> +-		basic_machine=3Di586-pc
> +-		os=3D-msdosdjgpp
> +-		;;
> + 	dpx20 | dpx20-*)
> + 		basic_machine=3Drs6000-bull
> +-		os=3D-bosx
> ++		os=3D${os:-bosx}
> + 		;;
> +-	dpx2* | dpx2*-bull)
> ++	dpx2*)
> + 		basic_machine=3Dm68k-bull
> +-		os=3D-sysv3
> ++		os=3Dsysv3
> + 		;;
> +-	ebmon29k)
> +-		basic_machine=3Da29k-amd
> +-		os=3D-ebmon
> ++	e500v[12])
> ++		basic_machine=3Dpowerpc-unknown
> ++		os=3D$os"spe"
> + 		;;
> +-	elxsi)
> +-		basic_machine=3Delxsi-elxsi
> +-		os=3D-bsd
> ++	e500v[12]-*)
> ++		basic_machine=3Dpowerpc-`echo "$basic_machine" | sed 's/^[^-]*-//'`=

> ++		os=3D$os"spe"
> + 		;;
> + 	encore | umax | mmax)
> + 		basic_machine=3Dns32k-encore
> + 		;;
> +-	es1800 | OSE68k | ose68k | ose | OSE)
> +-		basic_machine=3Dm68k-ericsson
> +-		os=3D-ose
> ++	elxsi)
> ++		basic_machine=3Delxsi-elxsi
> ++		os=3D${os:-bsd}
> + 		;;
> + 	fx2800)
> + 		basic_machine=3Di860-alliant
> +@@ -579,45 +912,13 @@ case $basic_machine in
> + 	genix)
> + 		basic_machine=3Dns32k-ns
> + 		;;
> +-	gmicro)
> +-		basic_machine=3Dtron-gmicro
> +-		os=3D-sysv
> +-		;;
> +-	go32)
> +-		basic_machine=3Di386-pc
> +-		os=3D-go32
> +-		;;
> + 	h3050r* | hiux*)
> + 		basic_machine=3Dhppa1.1-hitachi
> +-		os=3D-hiuxwe2
> +-		;;
> +-	h8300hms)
> +-		basic_machine=3Dh8300-hitachi
> +-		os=3D-hms
> +-		;;
> +-	h8300xray)
> +-		basic_machine=3Dh8300-hitachi
> +-		os=3D-xray
> +-		;;
> +-	h8500hms)
> +-		basic_machine=3Dh8500-hitachi
> +-		os=3D-hms
> +-		;;
> +-	harris)
> +-		basic_machine=3Dm88k-harris
> +-		os=3D-sysv3
> ++		os=3Dhiuxwe2
> + 		;;
> + 	hp300-*)
> + 		basic_machine=3Dm68k-hp
> + 		;;
> +-	hp300bsd)
> +-		basic_machine=3Dm68k-hp
> +-		os=3D-bsd
> +-		;;
> +-	hp300hpux)
> +-		basic_machine=3Dm68k-hp
> +-		os=3D-hpux
> +-		;;
> + 	hp3k9[0-9][0-9] | hp9[0-9][0-9])
> + 		basic_machine=3Dhppa1.0-hp
> + 		;;
> +@@ -647,219 +948,114 @@ case $basic_machine in
> + 	hp9k8[0-9][0-9] | hp8[0-9][0-9])
> + 		basic_machine=3Dhppa1.0-hp
> + 		;;
> +-	hppa-next)
> +-		os=3D-nextstep3
> +-		;;
> +-	hppaosf)
> +-		basic_machine=3Dhppa1.1-hp
> +-		os=3D-osf
> +-		;;
> +-	hppro)
> +-		basic_machine=3Dhppa1.1-hp
> +-		os=3D-proelf
> +-		;;
> + 	i370-ibm* | ibm*)
> + 		basic_machine=3Di370-ibm
> + 		;;
> +-# I'm not sure what "Sysv32" means.  Should this be sysv3.2?
> + 	i*86v32)
> +-		basic_machine=3D`echo $1 | sed -e 's/86.*/86-pc/'`
> +-		os=3D-sysv32
> ++		basic_machine=3D`echo "$1" | sed -e 's/86.*/86-pc/'`
> ++		os=3Dsysv32
> + 		;;
> + 	i*86v4*)
> +-		basic_machine=3D`echo $1 | sed -e 's/86.*/86-pc/'`
> +-		os=3D-sysv4
> ++		basic_machine=3D`echo "$1" | sed -e 's/86.*/86-pc/'`
> ++		os=3Dsysv4
> + 		;;
> + 	i*86v)
> +-		basic_machine=3D`echo $1 | sed -e 's/86.*/86-pc/'`
> +-		os=3D-sysv
> ++		basic_machine=3D`echo "$1" | sed -e 's/86.*/86-pc/'`
> ++		os=3Dsysv
> + 		;;
> + 	i*86sol2)
> +-		basic_machine=3D`echo $1 | sed -e 's/86.*/86-pc/'`
> +-		os=3D-solaris2
> ++		basic_machine=3D`echo "$1" | sed -e 's/86.*/86-pc/'`
> ++		os=3Dsolaris2
> + 		;;
> +-	i386mach)
> +-		basic_machine=3Di386-mach
> +-		os=3D-mach
> +-		;;
> +-	i386-vsta | vsta)
> +-		basic_machine=3Di386-unknown
> +-		os=3D-vsta
> ++	j90 | j90-cray)
> ++		basic_machine=3Dj90-cray
> ++		os=3D${os:-unicos}
> + 		;;
> + 	iris | iris4d)
> + 		basic_machine=3Dmips-sgi
> + 		case $os in
> +-		    -irix*)
> ++		    irix*)
> + 			;;
> + 		    *)
> +-			os=3D-irix4
> ++			os=3Dirix4
> + 			;;
> + 		esac
> + 		;;
> +-	isi68 | isi)
> +-		basic_machine=3Dm68k-isi
> +-		os=3D-sysv
> +-		;;
> +-	m68knommu)
> +-		basic_machine=3Dm68k-unknown
> +-		os=3D-linux
> ++	leon-*|leon[3-9]-*)
> ++		basic_machine=3Dsparc-`echo "$basic_machine" | sed 's/-.*//'`
> + 		;;
> + 	m68knommu-*)
> +-		basic_machine=3Dm68k-`echo $basic_machine | sed 's/^[^-]*-//'`
> +-		os=3D-linux
> +-		;;
> +-	m88k-omron*)
> +-		basic_machine=3Dm88k-omron
> +-		;;
> +-	magnum | m3230)
> +-		basic_machine=3Dmips-mips
> +-		os=3D-sysv
> +-		;;
> +-	merlin)
> +-		basic_machine=3Dns32k-utek
> +-		os=3D-sysv
> +-		;;
> +-	mingw32)
> +-		basic_machine=3Di386-pc
> +-		os=3D-mingw32
> ++		basic_machine=3Dm68k-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> ++		os=3Dlinux
> + 		;;
> +-	mingw32ce)
> +-		basic_machine=3Darm-unknown
> +-		os=3D-mingw32ce
> ++	microblaze*)
> ++		basic_machine=3Dmicroblaze-xilinx
> + 		;;
> + 	miniframe)
> + 		basic_machine=3Dm68000-convergent
> + 		;;
> +-	*mint | -mint[0-9]* | *MiNT | *MiNT[0-9]*)
> ++	*mint | mint[0-9]* | *MiNT | *MiNT[0-9]*)
> + 		basic_machine=3Dm68k-atari
> +-		os=3D-mint
> ++		os=3Dmint
> + 		;;
> + 	mips3*-*)
> +-		basic_machine=3D`echo $basic_machine | sed -e 's/mips3/mips64/'`
> ++		basic_machine=3D`echo "$basic_machine" | sed -e 's/mips3/mips64/'`
> + 		;;
> + 	mips3*)
> +-		basic_machine=3D`echo $basic_machine | sed -e 's/mips3/mips64/'`-un=
known
> +-		;;
> +-	monitor)
> +-		basic_machine=3Dm68k-rom68k
> +-		os=3D-coff
> +-		;;
> +-	morphos)
> +-		basic_machine=3Dpowerpc-unknown
> +-		os=3D-morphos
> +-		;;
> +-	msdos)
> +-		basic_machine=3Di386-pc
> +-		os=3D-msdos
> ++		basic_machine=3D`echo "$basic_machine" | sed -e 's/mips3/mips64/'`-=
unknown
> + 		;;
> + 	ms1-*)
> +-		basic_machine=3D`echo $basic_machine | sed -e 's/ms1-/mt-/'`
> +-		;;
> +-	mvs)
> +-		basic_machine=3Di370-ibm
> +-		os=3D-mvs
> +-		;;
> +-	ncr3000)
> +-		basic_machine=3Di486-ncr
> +-		os=3D-sysv4
> +-		;;
> +-	netbsd386)
> +-		basic_machine=3Di386-unknown
> +-		os=3D-netbsd
> +-		;;
> +-	netwinder)
> +-		basic_machine=3Darmv4l-rebel
> +-		os=3D-linux
> +-		;;
> +-	news | news700 | news800 | news900)
> +-		basic_machine=3Dm68k-sony
> +-		os=3D-newsos
> +-		;;
> +-	news1000)
> +-		basic_machine=3Dm68030-sony
> +-		os=3D-newsos
> ++		basic_machine=3D`echo "$basic_machine" | sed -e 's/ms1-/mt-/'`
> + 		;;
> + 	news-3600 | risc-news)
> + 		basic_machine=3Dmips-sony
> +-		os=3D-newsos
> ++		os=3Dnewsos
> + 		;;
> +-	necv70)
> +-		basic_machine=3Dv70-nec
> +-		os=3D-sysv
> +-		;;
> +-	next | m*-next )
> ++	next | m*-next)
> + 		basic_machine=3Dm68k-next
> + 		case $os in
> +-		    -nextstep* )
> ++		    nextstep* )
> + 			;;
> +-		    -ns2*)
> +-		      os=3D-nextstep2
> ++		    ns2*)
> ++		      os=3Dnextstep2
> + 			;;
> + 		    *)
> +-		      os=3D-nextstep3
> ++		      os=3Dnextstep3
> + 			;;
> + 		esac
> + 		;;
> +-	nh3000)
> +-		basic_machine=3Dm68k-harris
> +-		os=3D-cxux
> +-		;;
> +-	nh[45]000)
> +-		basic_machine=3Dm88k-harris
> +-		os=3D-cxux
> +-		;;
> +-	nindy960)
> +-		basic_machine=3Di960-intel
> +-		os=3D-nindy
> +-		;;
> +-	mon960)
> +-		basic_machine=3Di960-intel
> +-		os=3D-mon960
> +-		;;
> +-	nonstopux)
> +-		basic_machine=3Dmips-compaq
> +-		os=3D-nonstopux
> +-		;;
> + 	np1)
> + 		basic_machine=3Dnp1-gould
> + 		;;
> ++	neo-tandem)
> ++		basic_machine=3Dneo-tandem
> ++		;;
> ++	nse-tandem)
> ++		basic_machine=3Dnse-tandem
> ++		;;
> + 	nsr-tandem)
> + 		basic_machine=3Dnsr-tandem
> + 		;;
> ++	nsv-tandem)
> ++		basic_machine=3Dnsv-tandem
> ++		;;
> ++	nsx-tandem)
> ++		basic_machine=3Dnsx-tandem
> ++		;;
> + 	op50n-* | op60c-*)
> + 		basic_machine=3Dhppa1.1-oki
> +-		os=3D-proelf
> ++		os=3Dproelf
> + 		;;
> + 	openrisc | openrisc-*)
> + 		basic_machine=3Dor32-unknown
> + 		;;
> +-	os400)
> +-		basic_machine=3Dpowerpc-ibm
> +-		os=3D-os400
> +-		;;
> +-	OSE68000 | ose68000)
> +-		basic_machine=3Dm68000-ericsson
> +-		os=3D-ose
> +-		;;
> +-	os68k)
> +-		basic_machine=3Dm68k-none
> +-		os=3D-os68k
> +-		;;
> + 	pa-hitachi)
> + 		basic_machine=3Dhppa1.1-hitachi
> +-		os=3D-hiuxwe2
> +-		;;
> +-	paragon)
> +-		basic_machine=3Di860-intel
> +-		os=3D-osf
> +-		;;
> +-	parisc)
> +-		basic_machine=3Dhppa-unknown
> +-		os=3D-linux
> ++		os=3Dhiuxwe2
> + 		;;
> + 	parisc-*)
> +-		basic_machine=3Dhppa-`echo $basic_machine | sed 's/^[^-]*-//'`
> +-		os=3D-linux
> ++		basic_machine=3Dhppa-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> ++		os=3Dlinux
> + 		;;
> + 	pbd)
> + 		basic_machine=3Dsparc-tti
> +@@ -874,7 +1070,7 @@ case $basic_machine in
> + 		basic_machine=3Di386-pc
> + 		;;
> + 	pc98-*)
> +-		basic_machine=3Di386-`echo $basic_machine | sed 's/^[^-]*-//'`
> ++		basic_machine=3Di386-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> + 	pentium | p5 | k5 | k6 | nexgen | viac3)
> + 		basic_machine=3Di586-pc
> +@@ -889,57 +1085,46 @@ case $basic_machine in
> + 		basic_machine=3Di786-pc
> + 		;;
> + 	pentium-* | p5-* | k5-* | k6-* | nexgen-* | viac3-*)
> +-		basic_machine=3Di586-`echo $basic_machine | sed 's/^[^-]*-//'`
> ++		basic_machine=3Di586-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> + 	pentiumpro-* | p6-* | 6x86-* | athlon-*)
> +-		basic_machine=3Di686-`echo $basic_machine | sed 's/^[^-]*-//'`
> ++		basic_machine=3Di686-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> + 	pentiumii-* | pentium2-* | pentiumiii-* | pentium3-*)
> +-		basic_machine=3Di686-`echo $basic_machine | sed 's/^[^-]*-//'`
> ++		basic_machine=3Di686-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> + 	pentium4-*)
> +-		basic_machine=3Di786-`echo $basic_machine | sed 's/^[^-]*-//'`
> ++		basic_machine=3Di786-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> + 	pn)
> + 		basic_machine=3Dpn-gould
> + 		;;
> + 	power)	basic_machine=3Dpower-ibm
> + 		;;
> +-	ppc)	basic_machine=3Dpowerpc-unknown
> ++	ppc | ppcbe)	basic_machine=3Dpowerpc-unknown
> + 		;;
> +-	ppc-*)	basic_machine=3Dpowerpc-`echo $basic_machine | sed 's/^[^-]*-=
//'`
> ++	ppc-* | ppcbe-*)
> ++		basic_machine=3Dpowerpc-`echo "$basic_machine" | sed 's/^[^-]*-//'`=

> + 		;;
> +-	ppcle | powerpclittle | ppc-le | powerpc-little)
> ++	ppcle | powerpclittle)
> + 		basic_machine=3Dpowerpcle-unknown
> + 		;;
> + 	ppcle-* | powerpclittle-*)
> +-		basic_machine=3Dpowerpcle-`echo $basic_machine | sed 's/^[^-]*-//'`=

> ++		basic_machine=3Dpowerpcle-`echo "$basic_machine" | sed 's/^[^-]*-//=
'`
> + 		;;
> + 	ppc64)	basic_machine=3Dpowerpc64-unknown
> + 		;;
> +-	ppc64-*) basic_machine=3Dpowerpc64-`echo $basic_machine | sed 's/^[^=
-]*-//'`
> ++	ppc64-*) basic_machine=3Dpowerpc64-`echo "$basic_machine" | sed 's/^=
[^-]*-//'`
> + 		;;
> +-	ppc64le | powerpc64little | ppc64-le | powerpc64-little)
> ++	ppc64le | powerpc64little)
> + 		basic_machine=3Dpowerpc64le-unknown
> + 		;;
> + 	ppc64le-* | powerpc64little-*)
> +-		basic_machine=3Dpowerpc64le-`echo $basic_machine | sed 's/^[^-]*-//=
'`
> ++		basic_machine=3Dpowerpc64le-`echo "$basic_machine" | sed 's/^[^-]*-=
//'`
> + 		;;
> + 	ps2)
> + 		basic_machine=3Di386-ibm
> + 		;;
> +-	pw32)
> +-		basic_machine=3Di586-unknown
> +-		os=3D-pw32
> +-		;;
> +-	rdos)
> +-		basic_machine=3Di386-pc
> +-		os=3D-rdos
> +-		;;
> +-	rom68k)
> +-		basic_machine=3Dm68k-rom68k
> +-		os=3D-coff
> +-		;;
> + 	rm[46]00)
> + 		basic_machine=3Dmips-siemens
> + 		;;
> +@@ -952,10 +1137,6 @@ case $basic_machine in
> + 	s390x | s390x-*)
> + 		basic_machine=3Ds390x-ibm
> + 		;;
> +-	sa29200)
> +-		basic_machine=3Da29k-amd
> +-		os=3D-udi
> +-		;;
> + 	sb1)
> + 		basic_machine=3Dmipsisa64sb1-unknown
> + 		;;
> +@@ -964,32 +1145,17 @@ case $basic_machine in
> + 		;;
> + 	sde)
> + 		basic_machine=3Dmipsisa32-sde
> +-		os=3D-elf
> +-		;;
> +-	sei)
> +-		basic_machine=3Dmips-sei
> +-		os=3D-seiux
> ++		os=3D${os:-elf}
> + 		;;
> + 	sequent)
> + 		basic_machine=3Di386-sequent
> + 		;;
> +-	sh)
> +-		basic_machine=3Dsh-hitachi
> +-		os=3D-hms
> +-		;;
> + 	sh5el)
> + 		basic_machine=3Dsh5le-unknown
> + 		;;
> +-	sh64)
> +-		basic_machine=3Dsh64-unknown
> +-		;;
> +-	sparclite-wrs | simso-wrs)
> ++	simso-wrs)
> + 		basic_machine=3Dsparclite-wrs
> +-		os=3D-vxworks
> +-		;;
> +-	sps7)
> +-		basic_machine=3Dm68k-bull
> +-		os=3D-sysv2
> ++		os=3Dvxworks
> + 		;;
> + 	spur)
> + 		basic_machine=3Dspur-unknown
> +@@ -997,41 +1163,12 @@ case $basic_machine in
> + 	st2000)
> + 		basic_machine=3Dm68k-tandem
> + 		;;
> +-	stratus)
> +-		basic_machine=3Di860-stratus
> +-		os=3D-sysv4
> ++	strongarm-* | thumb-*)
> ++		basic_machine=3Darm-`echo "$basic_machine" | sed 's/^[^-]*-//'`
> + 		;;
> + 	sun2)
> + 		basic_machine=3Dm68000-sun
> + 		;;
> +-	sun2os3)
> +-		basic_machine=3Dm68000-sun
> +-		os=3D-sunos3
> +-		;;
> +-	sun2os4)
> +-		basic_machine=3Dm68000-sun
> +-		os=3D-sunos4
> +-		;;
> +-	sun3os3)
> +-		basic_machine=3Dm68k-sun
> +-		os=3D-sunos3
> +-		;;
> +-	sun3os4)
> +-		basic_machine=3Dm68k-sun
> +-		os=3D-sunos4
> +-		;;
> +-	sun4os3)
> +-		basic_machine=3Dsparc-sun
> +-		os=3D-sunos3
> +-		;;
> +-	sun4os4)
> +-		basic_machine=3Dsparc-sun
> +-		os=3D-sunos4
> +-		;;
> +-	sun4sol2)
> +-		basic_machine=3Dsparc-sun
> +-		os=3D-solaris2
> +-		;;
> + 	sun3 | sun3-*)
> + 		basic_machine=3Dm68k-sun
> + 		;;
> +@@ -1041,37 +1178,9 @@ case $basic_machine in
> + 	sun386 | sun386i | roadrunner)
> + 		basic_machine=3Di386-sun
> + 		;;
> +-	sv1)
> +-		basic_machine=3Dsv1-cray
> +-		os=3D-unicos
> +-		;;
> +-	symmetry)
> +-		basic_machine=3Di386-sequent
> +-		os=3D-dynix
> +-		;;
> +-	t3e)
> +-		basic_machine=3Dalphaev5-cray
> +-		os=3D-unicos
> +-		;;
> +-	t90)
> +-		basic_machine=3Dt90-cray
> +-		os=3D-unicos
> +-		;;
> +-	tic54x | c54x*)
> +-		basic_machine=3Dtic54x-unknown
> +-		os=3D-coff
> +-		;;
> +-	tic55x | c55x*)
> +-		basic_machine=3Dtic55x-unknown
> +-		os=3D-coff
> +-		;;
> +-	tic6x | c6x*)
> +-		basic_machine=3Dtic6x-unknown
> +-		os=3D-coff
> +-		;;
> + 	tile*)
> +-		basic_machine=3Dtile-unknown
> +-		os=3D-linux-gnu
> ++		basic_machine=3D$basic_machine-unknown
> ++		os=3Dlinux-gnu
> + 		;;
> + 	tx39)
> + 		basic_machine=3Dmipstx39-unknown
> +@@ -1079,82 +1188,32 @@ case $basic_machine in
> + 	tx39el)
> + 		basic_machine=3Dmipstx39el-unknown
> + 		;;
> +-	toad1)
> +-		basic_machine=3Dpdp10-xkl
> +-		os=3D-tops20
> +-		;;
> + 	tower | tower-32)
> + 		basic_machine=3Dm68k-ncr
> + 		;;
> +-	tpf)
> +-		basic_machine=3Ds390x-ibm
> +-		os=3D-tpf
> +-		;;
> +-	udi29k)
> +-		basic_machine=3Da29k-amd
> +-		os=3D-udi
> +-		;;
> +-	ultra3)
> +-		basic_machine=3Da29k-nyu
> +-		os=3D-sym1
> +-		;;
> +-	v810 | necv810)
> +-		basic_machine=3Dv810-nec
> +-		os=3D-none
> +-		;;
> +-	vaxv)
> +-		basic_machine=3Dvax-dec
> +-		os=3D-sysv
> +-		;;
> +-	vms)
> +-		basic_machine=3Dvax-dec
> +-		os=3D-vms
> +-		;;
> + 	vpp*|vx|vx-*)
> + 		basic_machine=3Df301-fujitsu
> + 		;;
> +-	vxworks960)
> +-		basic_machine=3Di960-wrs
> +-		os=3D-vxworks
> +-		;;
> +-	vxworks68)
> +-		basic_machine=3Dm68k-wrs
> +-		os=3D-vxworks
> +-		;;
> +-	vxworks29k)
> +-		basic_machine=3Da29k-wrs
> +-		os=3D-vxworks
> +-		;;
> + 	w65*)
> + 		basic_machine=3Dw65-wdc
> +-		os=3D-none
> ++		os=3Dnone
> + 		;;
> + 	w89k-*)
> + 		basic_machine=3Dhppa1.1-winbond
> +-		os=3D-proelf
> ++		os=3Dproelf
> + 		;;
> +-	xbox)
> +-		basic_machine=3Di686-pc
> +-		os=3D-mingw32
> ++	x64)
> ++		basic_machine=3Dx86_64-pc
> + 		;;
> + 	xps | xps100)
> + 		basic_machine=3Dxps100-honeywell
> + 		;;
> +-	ymp)
> +-		basic_machine=3Dymp-cray
> +-		os=3D-unicos
> +-		;;
> +-	z8k-*-coff)
> +-		basic_machine=3Dz8k-unknown
> +-		os=3D-sim
> +-		;;
> +-	z80-*-coff)
> +-		basic_machine=3Dz80-unknown
> +-		os=3D-sim
> ++	xscale-* | xscalee[bl]-*)
> ++		basic_machine=3D`echo "$basic_machine" | sed 's/^xscale/arm/'`
> + 		;;
> + 	none)
> + 		basic_machine=3Dnone-none
> +-		os=3D-none
> ++		os=3D${os:-none}
> + 		;;
> +=20
> + # Here we handle the default manufacturer of certain CPU types.  It i=
s in
> +@@ -1180,10 +1239,6 @@ case $basic_machine in
> + 	vax)
> + 		basic_machine=3Dvax-dec
> + 		;;
> +-	pdp10)
> +-		# there are many clones, so DEC is not a safe bet
> +-		basic_machine=3Dpdp10-unknown
> +-		;;
> + 	pdp11)
> + 		basic_machine=3Dpdp11-dec
> + 		;;
> +@@ -1193,9 +1248,6 @@ case $basic_machine in
> + 	sh[1234] | sh[24]a | sh[24]aeb | sh[34]eb | sh[1234]le | sh[23]ele)
> + 		basic_machine=3Dsh-unknown
> + 		;;
> +-	sparc | sparcv8 | sparcv9 | sparcv9b | sparcv9v)
> +-		basic_machine=3Dsparc-sun
> +-		;;
> + 	cydra)
> + 		basic_machine=3Dcydra-cydrome
> + 		;;
> +@@ -1215,7 +1267,7 @@ case $basic_machine in
> + 		# Make sure to match an already-canonicalized machine name.
> + 		;;
> + 	*)
> +-		echo Invalid configuration \`$1\': machine \`$basic_machine\' not r=
ecognized 1>&2
> ++		echo Invalid configuration \`"$1"\': machine \`"$basic_machine"\' n=
ot recognized 1>&2
> + 		exit 1
> + 		;;
> + esac
> +@@ -1223,10 +1275,10 @@ esac
> + # Here we canonicalize certain aliases for manufacturers.
> + case $basic_machine in
> + 	*-digital*)
> +-		basic_machine=3D`echo $basic_machine | sed 's/digital.*/dec/'`
> ++		basic_machine=3D`echo "$basic_machine" | sed 's/digital.*/dec/'`
> + 		;;
> + 	*-commodore*)
> +-		basic_machine=3D`echo $basic_machine | sed 's/commodore.*/cbm/'`
> ++		basic_machine=3D`echo "$basic_machine" | sed 's/commodore.*/cbm/'`
> + 		;;
> + 	*)
> + 		;;
> +@@ -1234,194 +1286,246 @@ esac
> +=20
> + # Decode manufacturer-specific aliases for certain operating systems.=

> +=20
> +-if [ x"$os" !=3D x"" ]
> ++if [ x$os !=3D x ]
> + then
> + case $os in
> +-        # First match some system type aliases
> +-        # that might get confused with valid system types.
> +-	# -solaris* is a basic system type, with this one exception.
> +-	-solaris1 | -solaris1.*)
> +-		os=3D`echo $os | sed -e 's|solaris1|sunos4|'`
> ++	# First match some system type aliases that might get confused
> ++	# with valid system types.
> ++	# solaris* is a basic system type, with this one exception.
> ++	auroraux)
> ++		os=3Dauroraux
> ++		;;
> ++	bluegene*)
> ++		os=3Dcnk
> + 		;;
> +-	-solaris)
> +-		os=3D-solaris2
> ++	solaris1 | solaris1.*)
> ++		os=3D`echo $os | sed -e 's|solaris1|sunos4|'`
> + 		;;
> +-	-svr4*)
> +-		os=3D-sysv4
> ++	solaris)
> ++		os=3Dsolaris2
> + 		;;
> +-	-unixware*)
> +-		os=3D-sysv4.2uw
> ++	unixware*)
> ++		os=3Dsysv4.2uw
> + 		;;
> +-	-gnu/linux*)
> ++	gnu/linux*)
> + 		os=3D`echo $os | sed -e 's|gnu/linux|linux-gnu|'`
> + 		;;
> +-	# First accept the basic system types.
> ++	# es1800 is here to avoid being matched by es* (a different OS)
> ++	es1800*)
> ++		os=3Dose
> ++		;;
> ++	# Some version numbers need modification
> ++	chorusos*)
> ++		os=3Dchorusos
> ++		;;
> ++	isc)
> ++		os=3Disc2.2
> ++		;;
> ++	sco6)
> ++		os=3Dsco5v6
> ++		;;
> ++	sco5)
> ++		os=3Dsco3.2v5
> ++		;;
> ++	sco4)
> ++		os=3Dsco3.2v4
> ++		;;
> ++	sco3.2.[4-9]*)
> ++		os=3D`echo $os | sed -e 's/sco3.2./sco3.2v/'`
> ++		;;
> ++	sco3.2v[4-9]* | sco5v6*)
> ++		# Don't forget version if it is 3.2v4 or newer.
> ++		;;
> ++	scout)
> ++		# Don't match below
> ++		;;
> ++	sco*)
> ++		os=3Dsco3.2v2
> ++		;;
> ++	psos*)
> ++		os=3Dpsos
> ++		;;
> ++	# Now accept the basic system types.
> + 	# The portable systems comes first.
> +-	# Each alternative MUST END IN A *, to match a version number.
> +-	# -sysv* is not here because it comes later, after sysvr4.
> +-	-gnu* | -bsd* | -mach* | -minix* | -genix* | -ultrix* | -irix* \
> +-	      | -*vms* | -sco* | -esix* | -isc* | -aix* | -sunos | -sunos[34=
]*\
> +-	      | -hpux* | -unos* | -osf* | -luna* | -dgux* | -solaris* | -sym=
* \
> +-	      | -kopensolaris* \
> +-	      | -amigaos* | -amigados* | -msdos* | -newsos* | -unicos* | -ao=
f* \
> +-	      | -aos* | -aros* \
> +-	      | -nindy* | -vxsim* | -vxworks* | -ebmon* | -hms* | -mvs* \
> +-	      | -clix* | -riscos* | -uniplus* | -iris* | -rtu* | -xenix* \
> +-	      | -hiux* | -386bsd* | -knetbsd* | -mirbsd* | -netbsd* \
> +-	      | -openbsd* | -solidbsd* \
> +-	      | -ekkobsd* | -kfreebsd* | -freebsd* | -riscix* | -lynxos* \
> +-	      | -bosx* | -nextstep* | -cxux* | -aout* | -elf* | -oabi* \
> +-	      | -ptx* | -coff* | -ecoff* | -winnt* | -domain* | -vsta* \
> +-	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
> +-	      | -chorusos* | -chorusrdb* | -cegcc* \
> +-	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
> +-	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
> +-	      | -uxpv* | -beos* | -mpeix* | -udk* \
> +-	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened=
* \
> +-	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
> +-	      | -storm-chaos* | -tops10* | -tenex* | -tops20* | -its* \
> +-	      | -os2* | -vos* | -palmos* | -uclinux* | -nucleus* \
> +-	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* \
> +-	      | -powermax* | -dnix* | -nx6 | -nx7 | -sei* | -dragonfly* \
> +-	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops*)
> ++	# Each alternative MUST end in a * to match a version number.
> ++	# sysv* is not here because it comes later, after sysvr4.
> ++	gnu* | bsd* | mach* | minix* | genix* | ultrix* | irix* \
> ++	     | *vms* | esix* | aix* | cnk* | sunos | sunos[34]*\
> ++	     | hpux* | unos* | osf* | luna* | dgux* | auroraux* | solaris* \=

> ++	     | sym* | kopensolaris* | plan9* \
> ++	     | amigaos* | amigados* | msdos* | newsos* | unicos* | aof* \
> ++	     | aos* | aros* | cloudabi* | sortix* \
> ++	     | nindy* | vxsim* | vxworks* | ebmon* | hms* | mvs* \
> ++	     | clix* | riscos* | uniplus* | iris* | rtu* | xenix* \
> ++	     | knetbsd* | mirbsd* | netbsd* \
> ++	     | bitrig* | openbsd* | solidbsd* | libertybsd* \
> ++	     | ekkobsd* | kfreebsd* | freebsd* | riscix* | lynxos* \
> ++	     | bosx* | nextstep* | cxux* | aout* | elf* | oabi* \
> ++	     | ptx* | coff* | ecoff* | winnt* | domain* | vsta* \
> ++	     | udi* | eabi* | lites* | ieee* | go32* | aux* | hcos* \
> ++	     | chorusrdb* | cegcc* | glidix* \
> ++	     | cygwin* | msys* | pe* | moss* | proelf* | rtems* \
> ++	     | midipix* | mingw32* | mingw64* | linux-gnu* | linux-android* =
\
> ++	     | linux-newlib* | linux-musl* | linux-uclibc* \
> ++	     | uxpv* | beos* | mpeix* | udk* | moxiebox* \
> ++	     | interix* | uwin* | mks* | rhapsody* | darwin* \
> ++	     | openstep* | oskit* | conix* | pw32* | nonstopux* \
> ++	     | storm-chaos* | tops10* | tenex* | tops20* | its* \
> ++	     | os2* | vos* | palmos* | uclinux* | nucleus* \
> ++	     | morphos* | superux* | rtmk* | windiss* \
> ++	     | powermax* | dnix* | nx6 | nx7 | sei* | dragonfly* \
> ++	     | skyos* | haiku* | rdos* | toppers* | drops* | es* \
> ++	     | onefs* | tirtos* | phoenix* | fuchsia* | redox* | bme* \
> ++	     | midnightbsd*)
> + 	# Remember, each alternative MUST END IN *, to match a version numbe=
r.
> + 		;;
> +-	-qnx*)
> ++	qnx*)
> + 		case $basic_machine in
> + 		    x86-* | i*86-*)
> + 			;;
> + 		    *)
> +-			os=3D-nto$os
> ++			os=3Dnto-$os
> + 			;;
> + 		esac
> + 		;;
> +-	-nto-qnx*)
> ++	hiux*)
> ++		os=3Dhiuxwe2
> + 		;;
> +-	-nto*)
> +-		os=3D`echo $os | sed -e 's|nto|nto-qnx|'`
> ++	nto-qnx*)
> + 		;;
> +-	-sim | -es1800* | -hms* | -xray | -os68k* | -none* | -v88r* \
> +-	      | -windows* | -osx | -abug | -netware* | -os9* | -beos* | -hai=
ku* \
> +-	      | -macos* | -mpw* | -magic* | -mmixware* | -mon960* | -lnews*)=

> ++	nto*)
> ++		os=3D`echo $os | sed -e 's|nto|nto-qnx|'`
> + 		;;
> +-	-mac*)
> +-		os=3D`echo $os | sed -e 's|mac|macos|'`
> ++	sim | xray | os68k* | v88r* \
> ++	    | windows* | osx | abug | netware* | os9* \
> ++	    | macos* | mpw* | magic* | mmixware* | mon960* | lnews*)
> + 		;;
> +-	-linux-dietlibc)
> +-		os=3D-linux-dietlibc
> ++	linux-dietlibc)
> ++		os=3Dlinux-dietlibc
> + 		;;
> +-	-linux*)
> ++	linux*)
> + 		os=3D`echo $os | sed -e 's|linux|linux-gnu|'`
> + 		;;
> +-	-sunos5*)
> +-		os=3D`echo $os | sed -e 's|sunos5|solaris2|'`
> ++	lynx*178)
> ++		os=3Dlynxos178
> ++		;;
> ++	lynx*5)
> ++		os=3Dlynxos5
> ++		;;
> ++	lynx*)
> ++		os=3Dlynxos
> + 		;;
> +-	-sunos6*)
> +-		os=3D`echo $os | sed -e 's|sunos6|solaris3|'`
> ++	mac*)
> ++		os=3D`echo "$os" | sed -e 's|mac|macos|'`
> + 		;;
> +-	-opened*)
> +-		os=3D-openedition
> ++	opened*)
> ++		os=3Dopenedition
> + 		;;
> +-        -os400*)
> +-		os=3D-os400
> ++	os400*)
> ++		os=3Dos400
> + 		;;
> +-	-wince*)
> +-		os=3D-wince
> ++	sunos5*)
> ++		os=3D`echo "$os" | sed -e 's|sunos5|solaris2|'`
> + 		;;
> +-	-osfrose*)
> +-		os=3D-osfrose
> ++	sunos6*)
> ++		os=3D`echo "$os" | sed -e 's|sunos6|solaris3|'`
> + 		;;
> +-	-osf*)
> +-		os=3D-osf
> ++	wince*)
> ++		os=3Dwince
> + 		;;
> +-	-utek*)
> +-		os=3D-bsd
> ++	utek*)
> ++		os=3Dbsd
> + 		;;
> +-	-dynix*)
> +-		os=3D-bsd
> ++	dynix*)
> ++		os=3Dbsd
> + 		;;
> +-	-acis*)
> +-		os=3D-aos
> ++	acis*)
> ++		os=3Daos
> + 		;;
> +-	-atheos*)
> +-		os=3D-atheos
> ++	atheos*)
> ++		os=3Datheos
> + 		;;
> +-	-syllable*)
> +-		os=3D-syllable
> ++	syllable*)
> ++		os=3Dsyllable
> + 		;;
> +-	-386bsd)
> +-		os=3D-bsd
> ++	386bsd)
> ++		os=3Dbsd
> + 		;;
> +-	-ctix* | -uts*)
> +-		os=3D-sysv
> ++	ctix* | uts*)
> ++		os=3Dsysv
> + 		;;
> +-	-nova*)
> +-		os=3D-rtmk-nova
> ++	nova*)
> ++		os=3Drtmk-nova
> + 		;;
> +-	-ns2 )
> +-		os=3D-nextstep2
> ++	ns2)
> ++		os=3Dnextstep2
> + 		;;
> +-	-nsk*)
> +-		os=3D-nsk
> ++	nsk*)
> ++		os=3Dnsk
> + 		;;
> + 	# Preserve the version number of sinix5.
> +-	-sinix5.*)
> ++	sinix5.*)
> + 		os=3D`echo $os | sed -e 's|sinix|sysv|'`
> + 		;;
> +-	-sinix*)
> +-		os=3D-sysv4
> ++	sinix*)
> ++		os=3Dsysv4
> + 		;;
> +-        -tpf*)
> +-		os=3D-tpf
> ++	tpf*)
> ++		os=3Dtpf
> + 		;;
> +-	-triton*)
> +-		os=3D-sysv3
> ++	triton*)
> ++		os=3Dsysv3
> + 		;;
> +-	-oss*)
> +-		os=3D-sysv3
> ++	oss*)
> ++		os=3Dsysv3
> + 		;;
> +-	-svr4)
> +-		os=3D-sysv4
> ++	svr4*)
> ++		os=3Dsysv4
> + 		;;
> +-	-svr3)
> +-		os=3D-sysv3
> ++	svr3)
> ++		os=3Dsysv3
> + 		;;
> +-	-sysvr4)
> +-		os=3D-sysv4
> ++	sysvr4)
> ++		os=3Dsysv4
> + 		;;
> +-	# This must come after -sysvr4.
> +-	-sysv*)
> ++	# This must come after sysvr4.
> ++	sysv*)
> + 		;;
> +-	-ose*)
> +-		os=3D-ose
> ++	ose*)
> ++		os=3Dose
> + 		;;
> +-	-es1800*)
> +-		os=3D-ose
> ++	*mint | mint[0-9]* | *MiNT | MiNT[0-9]*)
> ++		os=3Dmint
> + 		;;
> +-	-xenix)
> +-		os=3D-xenix
> ++	zvmoe)
> ++		os=3Dzvmoe
> + 		;;
> +-	-*mint | -mint[0-9]* | -*MiNT | -MiNT[0-9]*)
> +-		os=3D-mint
> ++	dicos*)
> ++		os=3Ddicos
> + 		;;
> +-	-aros*)
> +-		os=3D-aros
> ++	pikeos*)
> ++		# Until real need of OS specific support for
> ++		# particular features comes up, bare metal
> ++		# configurations are quite functional.
> ++		case $basic_machine in
> ++		    arm*)
> ++			os=3Deabi
> ++			;;
> ++		    *)
> ++			os=3Delf
> ++			;;
> ++		esac
> + 		;;
> +-	-kaos*)
> +-		os=3D-kaos
> ++	nacl*)
> + 		;;
> +-	-zvmoe)
> +-		os=3D-zvmoe
> ++	ios)
> + 		;;
> +-	-dicos*)
> +-		os=3D-dicos
> ++	none)
> + 		;;
> +-	-none)
> ++	*-eabi)
> + 		;;
> + 	*)
> +-		# Get rid of the `-' at the beginning of $os.
> +-		os=3D`echo $os | sed 's/[^-]*-//'`
> +-		echo Invalid configuration \`$1\': system \`$os\' not recognized 1>=
&2
> ++		echo Invalid configuration \`"$1"\': system \`"$os"\' not recognize=
d 1>&2
> + 		exit 1
> + 		;;
> + esac
> +@@ -1438,165 +1542,180 @@ else
> + # system, and we'll never get to this point.
> +=20
> + case $basic_machine in
> +-        score-*)
> +-		os=3D-elf
> ++	score-*)
> ++		os=3Delf
> + 		;;
> +-        spu-*)
> +-		os=3D-elf
> ++	spu-*)
> ++		os=3Delf
> + 		;;
> + 	*-acorn)
> +-		os=3D-riscix1.2
> ++		os=3Driscix1.2
> + 		;;
> + 	arm*-rebel)
> +-		os=3D-linux
> ++		os=3Dlinux
> + 		;;
> + 	arm*-semi)
> +-		os=3D-aout
> ++		os=3Daout
> ++		;;
> ++	c4x-* | tic4x-*)
> ++		os=3Dcoff
> ++		;;
> ++	c8051-*)
> ++		os=3Delf
> ++		;;
> ++	clipper-intergraph)
> ++		os=3Dclix
> + 		;;
> +-        c4x-* | tic4x-*)
> +-        	os=3D-coff
> ++	hexagon-*)
> ++		os=3Delf
> ++		;;
> ++	tic54x-*)
> ++		os=3Dcoff
> ++		;;
> ++	tic55x-*)
> ++		os=3Dcoff
> ++		;;
> ++	tic6x-*)
> ++		os=3Dcoff
> + 		;;
> + 	# This must come before the *-dec entry.
> + 	pdp10-*)
> +-		os=3D-tops20
> ++		os=3Dtops20
> + 		;;
> + 	pdp11-*)
> +-		os=3D-none
> ++		os=3Dnone
> + 		;;
> + 	*-dec | vax-*)
> +-		os=3D-ultrix4.2
> ++		os=3Dultrix4.2
> + 		;;
> + 	m68*-apollo)
> +-		os=3D-domain
> ++		os=3Ddomain
> + 		;;
> + 	i386-sun)
> +-		os=3D-sunos4.0.2
> ++		os=3Dsunos4.0.2
> + 		;;
> + 	m68000-sun)
> +-		os=3D-sunos3
> +-		# This also exists in the configure program, but was not the
> +-		# default.
> +-		# os=3D-sunos4
> ++		os=3Dsunos3
> + 		;;
> + 	m68*-cisco)
> +-		os=3D-aout
> ++		os=3Daout
> + 		;;
> +-        mep-*)
> +-		os=3D-elf
> ++	mep-*)
> ++		os=3Delf
> + 		;;
> + 	mips*-cisco)
> +-		os=3D-elf
> ++		os=3Delf
> + 		;;
> + 	mips*-*)
> +-		os=3D-elf
> ++		os=3Delf
> + 		;;
> + 	or32-*)
> +-		os=3D-coff
> ++		os=3Dcoff
> + 		;;
> + 	*-tti)	# must be before sparc entry or we get the wrong os.
> +-		os=3D-sysv3
> ++		os=3Dsysv3
> + 		;;
> + 	sparc-* | *-sun)
> +-		os=3D-sunos4.1.1
> ++		os=3Dsunos4.1.1
> + 		;;
> +-	*-be)
> +-		os=3D-beos
> ++	pru-*)
> ++		os=3Delf
> + 		;;
> +-	*-haiku)
> +-		os=3D-haiku
> ++	*-be)
> ++		os=3Dbeos
> + 		;;
> + 	*-ibm)
> +-		os=3D-aix
> ++		os=3Daix
> + 		;;
> +-    	*-knuth)
> +-		os=3D-mmixware
> ++	*-knuth)
> ++		os=3Dmmixware
> + 		;;
> + 	*-wec)
> +-		os=3D-proelf
> ++		os=3Dproelf
> + 		;;
> + 	*-winbond)
> +-		os=3D-proelf
> ++		os=3Dproelf
> + 		;;
> + 	*-oki)
> +-		os=3D-proelf
> ++		os=3Dproelf
> + 		;;
> + 	*-hp)
> +-		os=3D-hpux
> ++		os=3Dhpux
> + 		;;
> + 	*-hitachi)
> +-		os=3D-hiux
> ++		os=3Dhiux
> + 		;;
> + 	i860-* | *-att | *-ncr | *-altos | *-motorola | *-convergent)
> +-		os=3D-sysv
> ++		os=3Dsysv
> + 		;;
> + 	*-cbm)
> +-		os=3D-amigaos
> ++		os=3Damigaos
> + 		;;
> + 	*-dg)
> +-		os=3D-dgux
> ++		os=3Ddgux
> + 		;;
> + 	*-dolphin)
> +-		os=3D-sysv3
> ++		os=3Dsysv3
> + 		;;
> + 	m68k-ccur)
> +-		os=3D-rtu
> ++		os=3Drtu
> + 		;;
> + 	m88k-omron*)
> +-		os=3D-luna
> ++		os=3Dluna
> + 		;;
> +-	*-next )
> +-		os=3D-nextstep
> ++	*-next)
> ++		os=3Dnextstep
> + 		;;
> + 	*-sequent)
> +-		os=3D-ptx
> ++		os=3Dptx
> + 		;;
> + 	*-crds)
> +-		os=3D-unos
> ++		os=3Dunos
> + 		;;
> + 	*-ns)
> +-		os=3D-genix
> ++		os=3Dgenix
> + 		;;
> + 	i370-*)
> +-		os=3D-mvs
> +-		;;
> +-	*-next)
> +-		os=3D-nextstep3
> ++		os=3Dmvs
> + 		;;
> + 	*-gould)
> +-		os=3D-sysv
> ++		os=3Dsysv
> + 		;;
> + 	*-highlevel)
> +-		os=3D-bsd
> ++		os=3Dbsd
> + 		;;
> + 	*-encore)
> +-		os=3D-bsd
> ++		os=3Dbsd
> + 		;;
> + 	*-sgi)
> +-		os=3D-irix
> ++		os=3Dirix
> + 		;;
> + 	*-siemens)
> +-		os=3D-sysv4
> ++		os=3Dsysv4
> + 		;;
> + 	*-masscomp)
> +-		os=3D-rtu
> ++		os=3Drtu
> + 		;;
> + 	f30[01]-fujitsu | f700-fujitsu)
> +-		os=3D-uxpv
> ++		os=3Duxpv
> + 		;;
> + 	*-rom68k)
> +-		os=3D-coff
> ++		os=3Dcoff
> + 		;;
> + 	*-*bug)
> +-		os=3D-coff
> ++		os=3Dcoff
> + 		;;
> + 	*-apple)
> +-		os=3D-macos
> ++		os=3Dmacos
> + 		;;
> + 	*-atari*)
> +-		os=3D-mint
> ++		os=3Dmint
> ++		;;
> ++	*-wrs)
> ++		os=3Dvxworks
> + 		;;
> + 	*)
> +-		os=3D-none
> ++		os=3Dnone
> + 		;;
> + esac
> + fi
> +@@ -1607,79 +1726,82 @@ vendor=3Dunknown
> + case $basic_machine in
> + 	*-unknown)
> + 		case $os in
> +-			-riscix*)
> ++			riscix*)
> + 				vendor=3Dacorn
> + 				;;
> +-			-sunos*)
> ++			sunos*)
> + 				vendor=3Dsun
> + 				;;
> +-			-aix*)
> ++			cnk*|-aix*)
> + 				vendor=3Dibm
> + 				;;
> +-			-beos*)
> ++			beos*)
> + 				vendor=3Dbe
> + 				;;
> +-			-hpux*)
> ++			hpux*)
> + 				vendor=3Dhp
> + 				;;
> +-			-mpeix*)
> ++			mpeix*)
> + 				vendor=3Dhp
> + 				;;
> +-			-hiux*)
> ++			hiux*)
> + 				vendor=3Dhitachi
> + 				;;
> +-			-unos*)
> ++			unos*)
> + 				vendor=3Dcrds
> + 				;;
> +-			-dgux*)
> ++			dgux*)
> + 				vendor=3Ddg
> + 				;;
> +-			-luna*)
> ++			luna*)
> + 				vendor=3Domron
> + 				;;
> +-			-genix*)
> ++			genix*)
> + 				vendor=3Dns
> + 				;;
> +-			-mvs* | -opened*)
> ++			clix*)
> ++				vendor=3Dintergraph
> ++				;;
> ++			mvs* | opened*)
> + 				vendor=3Dibm
> + 				;;
> +-			-os400*)
> ++			os400*)
> + 				vendor=3Dibm
> + 				;;
> +-			-ptx*)
> ++			ptx*)
> + 				vendor=3Dsequent
> + 				;;
> +-			-tpf*)
> ++			tpf*)
> + 				vendor=3Dibm
> + 				;;
> +-			-vxsim* | -vxworks* | -windiss*)
> ++			vxsim* | vxworks* | windiss*)
> + 				vendor=3Dwrs
> + 				;;
> +-			-aux*)
> ++			aux*)
> + 				vendor=3Dapple
> + 				;;
> +-			-hms*)
> ++			hms*)
> + 				vendor=3Dhitachi
> + 				;;
> +-			-mpw* | -macos*)
> ++			mpw* | macos*)
> + 				vendor=3Dapple
> + 				;;
> +-			-*mint | -mint[0-9]* | -*MiNT | -MiNT[0-9]*)
> ++			*mint | mint[0-9]* | *MiNT | MiNT[0-9]*)
> + 				vendor=3Datari
> + 				;;
> +-			-vos*)
> ++			vos*)
> + 				vendor=3Dstratus
> + 				;;
> + 		esac
> +-		basic_machine=3D`echo $basic_machine | sed "s/unknown/$vendor/"`
> ++		basic_machine=3D`echo "$basic_machine" | sed "s/unknown/$vendor/"`
> + 		;;
> + esac
> +=20
> +-echo $basic_machine$os
> ++echo "$basic_machine-$os"
> + exit
> +=20
> + # Local variables:
> +-# eval: (add-hook 'write-file-hooks 'time-stamp)
> ++# eval: (add-hook 'before-save-hook 'time-stamp)
> + # time-stamp-start: "timestamp=3D'"
> + # time-stamp-format: "%:y-%02m-%02d"
> + # time-stamp-end: "'"
> +--=20
> +2.17.1
> +
> diff --git a/meta-networking/recipes-protocols/bird/files/bird.init b/m=
eta-networking/recipes-protocols/bird/files/bird.init
> new file mode 100755
> index 000000000..ebef0f448
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/bird/files/bird.init
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +exec /usr/sbin/bird -d -c /etc/bird.conf -s /var/run/bird.ctl
>=20


--vkrWasu52rLlldIdTjWkKyz1Jh4zODZ6W--

--QgXpNsEa9g8AcE9IQHzGVuEETyRwwHxm4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW3YQowAKCRC7BTNVkZ0z
FFf8AJ9nWNHXPmjxyr4/AstepvBlJ7CZrwCeJE7AWszeP/4gtwKyyj38bJa5Rqg=
=LZdG
-----END PGP SIGNATURE-----

--QgXpNsEa9g8AcE9IQHzGVuEETyRwwHxm4--
