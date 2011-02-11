Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PnnBh-0006YZ-Be
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 08:13:05 +0100
Received: by ywi6 with SMTP id 6so945647ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 23:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=a0AYHG9bI4TQYL1O1czcuSNNrDD1kFiWUAosfp4j8O4=;
	b=e99fVrowyaJQzTIByrvKP7PjZ/nJ0oBktd2Ep4qpp9k47yYO348tmoLmi6pERG6P3U
	En5VpAlNxz7qfT0giK3SW07QlhQGLr3Ao/xrf2BQLzNKwWcFJuQ6H4ZM8i2H7s0DLk5E
	gOVSpi6gyQj/9jWF7NwanWg20+7U8chXqVMDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ID0/lVUxeeNyDngdtyP6d4e7o5okhMriB0ww6/jyoQU1gCjUOpbFYwzZN468Aq/kFl
	nXidFF56PiLvGyGspBj1ZfFT1PwOlNsHLlVbnoIbpiQ7XEAzYiTxtfzQrkSun5+fL4cA
	nskJ02BZIVlNTonUU5F+pQsBdvzuCD3BBkz0w=
MIME-Version: 1.0
Received: by 10.151.45.12 with SMTP id x12mr173294ybj.307.1297408319394; Thu,
	10 Feb 2011 23:11:59 -0800 (PST)
Received: by 10.147.41.14 with HTTP; Thu, 10 Feb 2011 23:11:59 -0800 (PST)
In-Reply-To: <1297380250-22567-1-git-send-email-tom_rini@mentor.com>
References: <1297380250-22567-1-git-send-email-tom_rini@mentor.com>
Date: Fri, 11 Feb 2011 08:11:59 +0100
Message-ID: <AANLkTinaB68OaFFkH2Pvh60u8zLM0ZBXf7SkY8QhKwSD@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 11 Feb 2011 07:13:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2011 at 12:24 AM, Tom Rini <tom_rini@mentor.com> wrote:
> We update SHR to pinning 8.4.7 (safe upgrade) and drop
> 8.1.x (EOL) and 8.2.x (un-pinned and EOL this year).
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
> =A0conf/distro/include/preferred-shr-versions.inc =A0 =A0 | =A0 =A02 +-

Feel free to remove P_V_postgresql completely from
preferred-shr-versions.inc now

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> =A0.../remove.autoconf.version.check.patch =A0 =A0 =A0 =A0 =A0 =A0| =A0 1=
5 ---------------
> =A0.../remove.autoconf.version.check.patch =A0 =A0 =A0 =A0 =A0 =A0| =A0 1=
5 +++++++++++++++
> =A0recipes/postgresql/postgresql.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/postgresql/postgresql_8.1.4.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A06 ------
> =A0recipes/postgresql/postgresql_8.1.8.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A06 ------
> =A0recipes/postgresql/postgresql_8.2.4.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
0 ----------
> =A0recipes/postgresql/postgresql_8.4.4.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
1 -----------
> =A0recipes/postgresql/postgresql_8.4.7.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A08 ++++++++
> =A09 files changed, 25 insertions(+), 50 deletions(-)
> =A0delete mode 100644 recipes/postgresql/postgresql-8.4.4/remove.autoconf=
.version.check.patch
> =A0create mode 100644 recipes/postgresql/postgresql-8.4.7/remove.autoconf=
.version.check.patch
> =A0delete mode 100644 recipes/postgresql/postgresql_8.1.4.bb
> =A0delete mode 100644 recipes/postgresql/postgresql_8.1.8.bb
> =A0delete mode 100644 recipes/postgresql/postgresql_8.2.4.bb
> =A0delete mode 100644 recipes/postgresql/postgresql_8.4.4.bb
> =A0create mode 100644 recipes/postgresql/postgresql_8.4.7.bb
>
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro=
/include/preferred-shr-versions.inc
> index eede319..2709102 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -29,7 +29,7 @@ PREFERRED_VERSION_perl =3D "5.10.1"
> =A0PREFERRED_VERSION_perl-native =3D "5.10.1"
> =A0UDEV_GE_141 =3D "1"
>
> -PREFERRED_VERSION_postgresql =3D "8.4.4"
> +PREFERRED_VERSION_postgresql =3D "8.4.7"
> =A0ANGSTROM_QT_VERSION ?=3D "4.7.1"
> =A0PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
> =A0PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
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
> --recommended. =A0You can remove the check from 'configure.in' but it is =
then
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
> +-recommended. =A0You can remove the check from 'configure.in' but it is =
then
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
> =A0#WARNING: this recipe assumes you have the timezone compiler present i=
n /usr/sbin/zic
>
> -SRC_URI =3D "ftp://ftp-archives.postgresql.org/pub/source/v${PV}/${P}.ta=
r.bz2"
> +SRC_URI =3D "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
>
> =A0LEAD_SONAME =3D "libpq.so"
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
> - =A0 =A0 =A0 =A0 =A0 file://remove.autoconf.version.check.patch"
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


