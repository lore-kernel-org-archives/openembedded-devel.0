Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pnnb4-0006u2-AW for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 08:39:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pnna2-0007tL-8O for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 08:38:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 08:38:14 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 08:38:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 11 Feb 2011 08:38:03 +0100
Message-ID: <ij2p0r$hq7$1@dough.gmane.org>
References: <1297380250-22567-1-git-send-email-tom_rini@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1297380250-22567-1-git-send-email-tom_rini@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] postgresql: Update from 8.4.4 to 8.4.7, drop 8.1.x, 8.2.4
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
X-List-Received-Date: Fri, 11 Feb 2011 07:39:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-02-11 00:24, Tom Rini wrote:
> We update SHR to pinning 8.4.7 (safe upgrade) and drop
> 8.1.x (EOL) and 8.2.x (un-pinned and EOL this year).
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  conf/distro/include/preferred-shr-versions.inc     |    2 +-
>  .../remove.autoconf.version.check.patch            |   15 ---------------
>  .../remove.autoconf.version.check.patch            |   15 +++++++++++++++
>  recipes/postgresql/postgresql.inc                  |    2 +-
>  recipes/postgresql/postgresql_8.1.4.bb             |    6 ------
>  recipes/postgresql/postgresql_8.1.8.bb             |    6 ------
>  recipes/postgresql/postgresql_8.2.4.bb             |   10 ----------
>  recipes/postgresql/postgresql_8.4.4.bb             |   11 -----------
>  recipes/postgresql/postgresql_8.4.7.bb             |    8 ++++++++
>  9 files changed, 25 insertions(+), 50 deletions(-)
>  delete mode 100644 recipes/postgresql/postgresql-8.4.4/remove.autoconf.version.check.patch
>  create mode 100644 recipes/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch
>  delete mode 100644 recipes/postgresql/postgresql_8.1.4.bb
>  delete mode 100644 recipes/postgresql/postgresql_8.1.8.bb
>  delete mode 100644 recipes/postgresql/postgresql_8.2.4.bb
>  delete mode 100644 recipes/postgresql/postgresql_8.4.4.bb
>  create mode 100644 recipes/postgresql/postgresql_8.4.7.bb
> 
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
> index eede319..2709102 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -29,7 +29,7 @@ PREFERRED_VERSION_perl = "5.10.1"
>  PREFERRED_VERSION_perl-native = "5.10.1"
>  UDEV_GE_141 = "1"
>  
> -PREFERRED_VERSION_postgresql = "8.4.4"
> +PREFERRED_VERSION_postgresql = "8.4.7"
>  ANGSTROM_QT_VERSION ?= "4.7.1"
>  PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
> diff --git a/recipes/postgresql/postgresql-8.4.4/remove.autoconf.version.check.patch b/recipes/postgresql/postgresql-8.4.4/remove.autoconf.version.check.patch
> deleted file mode 100644
> index d027061..0000000
> --- a/recipes/postgresql/postgresql-8.4.4/remove.autoconf.version.check.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Index: postgresql-8.4.4/configure.in
> -===================================================================
> ---- postgresql-8.4.4.orig/configure.in
> -+++ postgresql-8.4.4/configure.in
> -@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
> - 
> - AC_INIT([PostgreSQL], [8.4.4], [pgsql-bugs@postgresql.org])
> - 
> --m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.61], [], [m4_fatal([Autoconf version 2.61 is required.
> --Untested combinations of 'autoconf' and PostgreSQL versions are not
> --recommended.  You can remove the check from 'configure.in' but it is then
> --your responsibility whether the result works or not.])])
> - AC_COPYRIGHT([Copyright (c) 1996-2009, PostgreSQL Global Development Group])
> - AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
> - AC_CONFIG_AUX_DIR(config)
> diff --git a/recipes/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch b/recipes/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch
> new file mode 100644
> index 0000000..514a9aa
> --- /dev/null
> +++ b/recipes/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch
> @@ -0,0 +1,15 @@
> +Index: postgresql-8.4.7/configure.in
> +===================================================================
> +--- postgresql-8.4.7.orig/configure.in
> ++++ postgresql-8.4.7/configure.in
> +@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
> + 
> + AC_INIT([PostgreSQL], [8.4.7], [pgsql-bugs@postgresql.org])
> + 
> +-m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.61], [], [m4_fatal([Autoconf version 2.61 is required.
> +-Untested combinations of 'autoconf' and PostgreSQL versions are not
> +-recommended.  You can remove the check from 'configure.in' but it is then
> +-your responsibility whether the result works or not.])])
> + AC_COPYRIGHT([Copyright (c) 1996-2009, PostgreSQL Global Development Group])
> + AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
> + AC_CONFIG_AUX_DIR(config)
> diff --git a/recipes/postgresql/postgresql.inc b/recipes/postgresql/postgresql.inc
> index e8cf561..53c38df 100644
> --- a/recipes/postgresql/postgresql.inc
> +++ b/recipes/postgresql/postgresql.inc
> @@ -8,7 +8,7 @@ ARM_INSTRUCTION_SET = "arm"
>  
>  #WARNING: this recipe assumes you have the timezone compiler present in /usr/sbin/zic
>  
> -SRC_URI = "ftp://ftp-archives.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
> +SRC_URI = "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
>  
>  LEAD_SONAME = "libpq.so"
>  
> diff --git a/recipes/postgresql/postgresql_8.1.4.bb b/recipes/postgresql/postgresql_8.1.4.bb
> deleted file mode 100644
> index 8a1db3a..0000000
> --- a/recipes/postgresql/postgresql_8.1.4.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require postgresql.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "a65bdc5d833169d28bf6fbaaa8d57fcf"
> -SRC_URI[sha256sum] = "ac7e7d311b07abd27b084041bcc943398df303bc86601f281891537bdf1a4e0b"
> diff --git a/recipes/postgresql/postgresql_8.1.8.bb b/recipes/postgresql/postgresql_8.1.8.bb
> deleted file mode 100644
> index ae9ac69..0000000
> --- a/recipes/postgresql/postgresql_8.1.8.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require postgresql.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "b05e1d7f0cac9cc4e096aa21409dee55"
> -SRC_URI[sha256sum] = "91f75eb29c07271fcbfa2082c8300690efe4a72f2fbf35dace98108b0c6f7ba3"
> diff --git a/recipes/postgresql/postgresql_8.2.4.bb b/recipes/postgresql/postgresql_8.2.4.bb
> deleted file mode 100644
> index f4162ab..0000000
> --- a/recipes/postgresql/postgresql_8.2.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require postgresql.inc
> -
> -PR = "${INC_PR}.0"
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -SRC_URI += "file://no-ecpg-test.patch"
> -
> -SRC_URI[md5sum] = "af7ec100a33c41bfb8d87b5e0ec2f44a"
> -SRC_URI[sha256sum] = "8ff6afab743e894c0d96e668dcf9b3d3c1044719d6def45ef7390c64b54ed268"
> diff --git a/recipes/postgresql/postgresql_8.4.4.bb b/recipes/postgresql/postgresql_8.4.4.bb
> deleted file mode 100644
> index d9bf58e..0000000
> --- a/recipes/postgresql/postgresql_8.4.4.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require postgresql.inc
> -
> -PR = "${INC_PR}.0"
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -SRC_URI = "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
> -           file://remove.autoconf.version.check.patch"
> -
> -SRC_URI[md5sum] = "4bf2448ad965bca3940df648c02194df"
> -SRC_URI[sha256sum] = "e66b398d565f7fb16d8ae58ae72881dcd3dbb1b88f532bbe1c2d1284812be37e"
> diff --git a/recipes/postgresql/postgresql_8.4.7.bb b/recipes/postgresql/postgresql_8.4.7.bb
> new file mode 100644
> index 0000000..696cfd9
> --- /dev/null
> +++ b/recipes/postgresql/postgresql_8.4.7.bb
> @@ -0,0 +1,8 @@
> +require postgresql.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI += "file://remove.autoconf.version.check.patch"
> +
> +SRC_URI[md5sum] = "689397187bb1dfe9b5cbde99538311c3"
> +SRC_URI[sha256sum] = "08032849da121e67e318f7ff4e68d3ac88f29050e242641f717c4270839b597b"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNVOdbMkyGM64RGpERAh+SAKC9giEhJaW8gwF7DFmoG5yoL7jA/gCfbKUv
VqlPAv9GCHmJjPRwLH2ddCc=
=9ikE
-----END PGP SIGNATURE-----



