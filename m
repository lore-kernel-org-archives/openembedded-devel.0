Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TaUX0-0006vd-9C
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 17:49:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAJGZ2f6020854
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 08:35:03 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 19 Nov 2012 08:35:02 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id EBA307FD0;	Mon, 19 Nov 2012 11:34:24 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	E30886A7C43; Mon, 19 Nov 2012 11:35:01 -0500 (EST)
Date: Mon, 19 Nov 2012 11:35:01 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121119163501.GP5534@windriver.com>
References: <1352365309-24398-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1352365309-24398-1-git-send-email-jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jackie.Huang@windriver.com, Zhenfeng.Zhao@windriver.com
Subject: Re: [meta-networking][PATCH] ptpd-2.2.0: drop the patch adjust-daemon-name.patch
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
X-List-Received-Date: Mon, 19 Nov 2012 16:49:10 -0000
X-Groupsio-MsgNum: 41557
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z87VqPJ/HsYrR2WM"
Content-Disposition: inline

--z87VqPJ/HsYrR2WM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] ptpd-2.2.0: drop the patch adjust-daemon-nam=
e.patch] On 12.11.08 (Thu 17:01) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The patch adjust-daemon-name.patch is to change the daemon name
> ptpd2 back to ptpd, which broke some functionality:
>=20
> root@qemu0:~# ptpd -g
> Error: 1 ptpd daemon(s) detected in parallel, but we were not expecting a=
ny. Exiting.
>=20
> so drop it and use the default daemon name ptpd2.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../ptpd/ptpd-2.2.0/adjust-daemon-name.patch       |   61 --------------=
------
>  meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |    5 +-
>  2 files changed, 3 insertions(+), 63 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjus=
t-daemon-name.patch
>=20
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemo=
n-name.patch b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemo=
n-name.patch
> deleted file mode 100644
> index f6934b6..0000000
> --- a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/adjust-daemon-name.=
patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -Patch from http://patch-tracker.debian.org/package/ptpd
> -
> -Description: Executable name ptpd
> - This patch adjusts the binary executable to be called ptpd instead of p=
tpd2.
> - Similarly, the man page name is adjusted.
> -Author: Roland Stigge <stigge@antcom.de>
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - src/Makefile |    4 ++--
> - src/ptpd2.8  |    8 ++++----
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/src/Makefile b/src/Makefile
> -index dbbe525..a672625 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -1,4 +1,4 @@
> --# Makefile for ptpd2
> -+# Makefile for ptpd
> -=20
> - #
> - # Compile time defines:
> -@@ -42,7 +42,7 @@ CFLAGS +=3D -DPTP_EXPERIMENTAL
> -=20
> - LDFLAGS+=3D -lm -lrt
> -=20
> --PROG =3D ptpd2
> -+PROG =3D ptpd
> - SRCS =3D ptpd.c arith.c bmc.c protocol.c display.c\
> - 	dep/msg.c dep/net.c dep/servo.c dep/startup.c dep/sys.c dep/timer.c
> -=20
> -diff --git a/src/ptpd2.8 b/src/ptpd2.8
> -index c6100f4..21f1906 100644
> ---- a/src/ptpd2.8
> -+++ b/src/ptpd2.8
> -@@ -1,9 +1,9 @@
> - .\" -*- nroff -*"
> --.TH ptpd2 8 "January, 2012" "version 2.2.0" "Precision Time Protocol da=
emon"
> -+.TH ptpd 8 "January, 2012" "version 2.2.0" "Precision Time Protocol dae=
mon"
> - .SH NAME
> --ptpd2 \- Precision Time Protocol daemon (1588-2008)
> -+ptpd \- Precision Time Protocol daemon (1588-2008)
> - .SH SYNOPSIS
> --.B ptpd2
> -+.B ptpd
> - [?]
> - [-B]
> - [-c]
> -@@ -182,7 +182,7 @@ run as master without NTP
> - set an initial delay request value
> - .TP
> - .B \-L
> --enable running multiple ptpd2 daemons
> -+enable running multiple ptpd daemons
> - .TP
> - .B \-j
> - turn off IGMP refresh messages
> ---=20
> -1.7.4
> -
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb b/meta-ne=
tworking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> index 3449ee8..39a0cdd 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> @@ -8,8 +8,9 @@ SECTION =3D "network"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://../COPYRIGHT;md5=3D3d8ac2c46c116bce2d2ad838=
b6cf3491"
> =20
> +PR =3D "r1"
> +
>  SRC_URI =3D "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/pt=
pd-${PV}.tar.gz \
> -           file://adjust-daemon-name.patch;striplevel=3D2 \
>             file://ld-as-needed.patch;striplevel=3D2 \
>  "
> =20
> @@ -22,6 +23,6 @@ EXTRA_OEMAKE =3D ""
> =20
>  do_install() {
>          install -d ${D}${bindir} ${D}${mandir}/man8
> -        install -m 0755 ptpd ${D}${bindir}
> +        install -m 0755 ptpd2 ${D}${bindir}
>          install -m 0644 ptpd2.8 ${D}${mandir}/man8
>  }
--=20
-Joe MacDonald.
:wq

--z87VqPJ/HsYrR2WM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCqX7UACgkQPN8S4W6ZZnfUmACdG0sD0dsLg7iKFQaFle6g38EA
m5kAmQF5I2HRXnqZYzhlkPJ4AYaYSyzG
=oG1+
-----END PGP SIGNATURE-----

--z87VqPJ/HsYrR2WM--
