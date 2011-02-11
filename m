Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pnhgd-0005gy-H4
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 02:20:39 +0100
Received: by gxk20 with SMTP id 20so857500gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 17:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=krZwOK2URkwECsJSoArr+vuiExZpPsJ3BjyA3Sesopo=;
	b=hgQrG7p1K1Pk3sujLt1QyiIVhsmywRDgYhkNrEcXGOG6+yQRkFZ6Cx+Q4pCuOWk+ZW
	6/wgsA3gSckGv60wqfnbFTcpE5XEWDd+rs2lDb93eY2u9LTCELCCO/k37DZhAM3Wna6y
	pi3YhxmKfeLEe534ZNonk231I+HsaghTscO30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=M4FNOwkc5EwwRrzt2+V1Rgc7T8g1jJ1P7rpbckFwVaPMiczfDu4cPd6UCWuKmNiu9U
	88OQaKUdQp9qpp3xsiBmDGJHDPAhMhcpyRfZht9aIIyjJ+0hBxoYLN64o+KLo0vJxNOO
	CAPMZV1kLi0yTxbLLSGmxiwYlclDFEXjavy9I=
Received: by 10.90.74.14 with SMTP id w14mr97818aga.34.1297387170814; Thu, 10
	Feb 2011 17:19:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 10 Feb 2011 17:19:10 -0800 (PST)
In-Reply-To: <1297380250-22567-1-git-send-email-tom_rini@mentor.com>
References: <1297380250-22567-1-git-send-email-tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Feb 2011 17:19:10 -0800
Message-ID: <AANLkTi=T_6gGjwF0Z__asPfwPvVm5Roc21LFfMb+L12Z@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 11 Feb 2011 01:20:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2011 at 3:24 PM, Tom Rini <tom_rini@mentor.com> wrote:
> We update SHR to pinning 8.4.7 (safe upgrade) and drop
> 8.1.x (EOL) and 8.2.x (un-pinned and EOL this year).
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0conf/distro/include/preferred-shr-versions.inc =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A0.../remove.autoconf.version.check.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 15 ---------------
> =C2=A0.../remove.autoconf.version.check.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 15 +++++++++++++++
> =C2=A0recipes/postgresql/postgresql.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/postgresql/postgresql_8.1.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A06 ------
> =C2=A0recipes/postgresql/postgresql_8.1.8.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A06 ------
> =C2=A0recipes/postgresql/postgresql_8.2.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 10 ----------
> =C2=A0recipes/postgresql/postgresql_8.4.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 11 -----------
> =C2=A0recipes/postgresql/postgresql_8.4.7.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A08 ++++++++
> =C2=A09 files changed, 25 insertions(+), 50 deletions(-)
> =C2=A0delete mode 100644 recipes/postgresql/postgresql-8.4.4/remove.autoc=
onf.version.check.patch
> =C2=A0create mode 100644 recipes/postgresql/postgresql-8.4.7/remove.autoc=
onf.version.check.patch
> =C2=A0delete mode 100644 recipes/postgresql/postgresql_8.1.4.bb
> =C2=A0delete mode 100644 recipes/postgresql/postgresql_8.1.8.bb
> =C2=A0delete mode 100644 recipes/postgresql/postgresql_8.2.4.bb
> =C2=A0delete mode 100644 recipes/postgresql/postgresql_8.4.4.bb
> =C2=A0create mode 100644 recipes/postgresql/postgresql_8.4.7.bb
>
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro=
/include/preferred-shr-versions.inc
> index eede319..2709102 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -29,7 +29,7 @@ PREFERRED_VERSION_perl =3D "5.10.1"
> =C2=A0PREFERRED_VERSION_perl-native =3D "5.10.1"
> =C2=A0UDEV_GE_141 =3D "1"
>
> -PREFERRED_VERSION_postgresql =3D "8.4.4"
> +PREFERRED_VERSION_postgresql =3D "8.4.7"
> =C2=A0ANGSTROM_QT_VERSION ?=3D "4.7.1"
> =C2=A0PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
> =C2=A0PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
> diff --git a/recipes/postgresql/postgresql-8.4.4/remove.autoconf.version.=
check.patch b/recipes/postgresql/postgresql-8.4.4/remove.autoconf.version.c=
heck.patch
> deleted file mode 100644
> index d027061..0000000
> --- a/recipes/postgresql/postgresql-8.4.4/remove.autoconf.version.check.p=
atch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Index: postgresql-8.4.4/configure.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- postgresql-8.4.4.orig/configure.in
> -+++ postgresql-8.4.4/configure.in
> -@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
> -
> - AC_INIT([PostgreSQL], [8.4.4], [pgsql-bugs@postgresql.org])
> -
> --m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.61], [], [m4_fatal([Autoconf ve=
rsion 2.61 is required.
> --Untested combinations of 'autoconf' and PostgreSQL versions are not
> --recommended. =C2=A0You can remove the check from 'configure.in' but it =
is then
> --your responsibility whether the result works or not.])])
> - AC_COPYRIGHT([Copyright (c) 1996-2009, PostgreSQL Global Development Gr=
oup])
> - AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
> - AC_CONFIG_AUX_DIR(config)
> diff --git a/recipes/postgresql/postgresql-8.4.7/remove.autoconf.version.=
check.patch b/recipes/postgresql/postgresql-8.4.7/remove.autoconf.version.c=
heck.patch
> new file mode 100644
> index 0000000..514a9aa
> --- /dev/null
> +++ b/recipes/postgresql/postgresql-8.4.7/remove.autoconf.version.check.p=
atch
> @@ -0,0 +1,15 @@
> +Index: postgresql-8.4.7/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- postgresql-8.4.7.orig/configure.in
> ++++ postgresql-8.4.7/configure.in
> +@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
> +
> + AC_INIT([PostgreSQL], [8.4.7], [pgsql-bugs@postgresql.org])
> +
> +-m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.61], [], [m4_fatal([Autoconf ve=
rsion 2.61 is required.
> +-Untested combinations of 'autoconf' and PostgreSQL versions are not
> +-recommended. =C2=A0You can remove the check from 'configure.in' but it =
is then
> +-your responsibility whether the result works or not.])])
> + AC_COPYRIGHT([Copyright (c) 1996-2009, PostgreSQL Global Development Gr=
oup])
> + AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
> + AC_CONFIG_AUX_DIR(config)
> diff --git a/recipes/postgresql/postgresql.inc b/recipes/postgresql/postg=
resql.inc
> index e8cf561..53c38df 100644
> --- a/recipes/postgresql/postgresql.inc
> +++ b/recipes/postgresql/postgresql.inc
> @@ -8,7 +8,7 @@ ARM_INSTRUCTION_SET =3D "arm"
>
> =C2=A0#WARNING: this recipe assumes you have the timezone compiler presen=
t in /usr/sbin/zic
>
> -SRC_URI =3D "ftp://ftp-archives.postgresql.org/pub/source/v${PV}/${P}.ta=
r.bz2"
> +SRC_URI =3D "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
>
> =C2=A0LEAD_SONAME =3D "libpq.so"
>
> diff --git a/recipes/postgresql/postgresql_8.1.4.bb b/recipes/postgresql/=
postgresql_8.1.4.bb
> deleted file mode 100644
> index 8a1db3a..0000000
> --- a/recipes/postgresql/postgresql_8.1.4.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require postgresql.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "a65bdc5d833169d28bf6fbaaa8d57fcf"
> -SRC_URI[sha256sum] =3D "ac7e7d311b07abd27b084041bcc943398df303bc86601f28=
1891537bdf1a4e0b"
> diff --git a/recipes/postgresql/postgresql_8.1.8.bb b/recipes/postgresql/=
postgresql_8.1.8.bb
> deleted file mode 100644
> index ae9ac69..0000000
> --- a/recipes/postgresql/postgresql_8.1.8.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require postgresql.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "b05e1d7f0cac9cc4e096aa21409dee55"
> -SRC_URI[sha256sum] =3D "91f75eb29c07271fcbfa2082c8300690efe4a72f2fbf35da=
ce98108b0c6f7ba3"
> diff --git a/recipes/postgresql/postgresql_8.2.4.bb b/recipes/postgresql/=
postgresql_8.2.4.bb
> deleted file mode 100644
> index f4162ab..0000000
> --- a/recipes/postgresql/postgresql_8.2.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require postgresql.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -SRC_URI +=3D "file://no-ecpg-test.patch"
> -
> -SRC_URI[md5sum] =3D "af7ec100a33c41bfb8d87b5e0ec2f44a"
> -SRC_URI[sha256sum] =3D "8ff6afab743e894c0d96e668dcf9b3d3c1044719d6def45e=
f7390c64b54ed268"
> diff --git a/recipes/postgresql/postgresql_8.4.4.bb b/recipes/postgresql/=
postgresql_8.4.4.bb
> deleted file mode 100644
> index d9bf58e..0000000
> --- a/recipes/postgresql/postgresql_8.4.4.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require postgresql.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -SRC_URI =3D "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove.autoconf.version.check=
.patch"
> -
> -SRC_URI[md5sum] =3D "4bf2448ad965bca3940df648c02194df"
> -SRC_URI[sha256sum] =3D "e66b398d565f7fb16d8ae58ae72881dcd3dbb1b88f532bbe=
1c2d1284812be37e"
> diff --git a/recipes/postgresql/postgresql_8.4.7.bb b/recipes/postgresql/=
postgresql_8.4.7.bb
> new file mode 100644
> index 0000000..696cfd9
> --- /dev/null
> +++ b/recipes/postgresql/postgresql_8.4.7.bb
> @@ -0,0 +1,8 @@
> +require postgresql.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D "file://remove.autoconf.version.check.patch"
> +
> +SRC_URI[md5sum] =3D "689397187bb1dfe9b5cbde99538311c3"
> +SRC_URI[sha256sum] =3D "08032849da121e67e318f7ff4e68d3ac88f29050e242641f=
717c4270839b597b"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


