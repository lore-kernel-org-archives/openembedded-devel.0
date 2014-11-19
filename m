Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id D71D66AC82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 15:05:51 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so2164292wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=92sBMwQEeUP0E3msJvsUvXxt3LrD8uB3uV4QozafNVc=;
	b=H0NnHlVnm8VBLC4XaIqDhnJDu0Jwm8MeUTTiJW8zA731hQ4qcFOeO/CCM5mbCWsD0S
	NMyJIkkHRTa99m9UDrH0mEH88xtxoE1mRZ6vkilbJXmHG+EmfN2oIhsupLeFtnDSdmWB
	0DOsVG3FO0VREWoS953o7td1wmS4odhOtood8coXASfCOH2O1HCfXH6bcidxcec4sRGm
	UQaYVfyqeD6WD2Ku6UrKvr5i4honpX/eI4tv66coCEkWIBZquLlBYaoo2GvFPooyfRgm
	G7JzmM3Wf/rySygoXcijKnjYpLRnTNE3BzQApmacBySbRpZIr3lTQ+3JDzXfaoUGmROR
	zP9g==
X-Received: by 10.180.103.33 with SMTP id ft1mr14056642wib.71.1416409552463;
	Wed, 19 Nov 2014 07:05:52 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n3sm2646851wjz.21.2014.11.19.07.05.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 07:05:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 16:05:52 +0100
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20141119150552.GL3315@jama>
References: <cover.1415177915.git.hongxu.jia@windriver.com>
	<9a453b465a06c1fccad20ed161e8ca1eee2e37e0.1415177915.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <9a453b465a06c1fccad20ed161e8ca1eee2e37e0.1415177915.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] mariadb:fix do_compile failed: No rule to make target /path/to/sysroots/x86-kvm-guest/usr/include/krb5.h
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
X-List-Received-Date: Wed, 19 Nov 2014 15:05:55 -0000
X-Groupsio-MsgNum: 52938
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E6lVPAHcXg6biC3t"
Content-Disposition: inline

--E6lVPAHcXg6biC3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2014 at 05:00:46PM +0800, Hongxu Jia wrote:
> There is occasionally compile failure while krb5.h removed
> from sysroot during maradb compiling.
> ...
> [2014-10-27 17:18:06.998709364-07:00] | make -f storage/maria/CMakeFiles/
>  aria_embedded.dir/build.make storage/maria/CMakeFiles/aria_embedded.dir/
> depend
> [2014-10-27 17:18:07.458369132-07:00] | make -f storage/maria/CMakeFiles/
> aria_embedded.dir/build.make storage/maria/CMakeFiles/aria_embedded.dir/
> build
> [2014-10-27 17:18:12.547556095-07:00] | make[2]: *** No rule to make targ=
et
> `tmp/sysroots/x86-kvm-guest/usr/include/krb5.h', needed by `storage/maria/
> CMakeFiles/aria_embedded.dir/ha_maria.cc.o'.  Stop.
> ...
>=20
> The ha_maria.cc requires <openssl/ssl.h>, <openssl/ssl.h> requires <opens=
sl/
> kssl.h>, and <openssl/kssl.h> conditionally requires <krb5.h>, but CMake
> ignore the condition, force to add krb5.h to mariadb's dependencies, it is
> the issue of CMake dependency scanner:
> http://www.cmake.org/Wiki/CMake_FAQ#CMake_dependency_scanner
> http://www.cmake.org/pipermail/cmake/2010-July/038465.html
>=20
> As the above failure log shows, the dependency scanner was done at 17:18:=
06,
> and the compiling start at 17:18:07, but compiling ha_maria.cc.o failed at
> 17:18:12, removing krb5.h within that 5 seconds caused the above failure.
>=20
> So we tweak the compile order, let ha_maria.cc as the first compile objec=
t,
> it will reduce the risk time of removing krb5.h.

rebase and resend if still needed with 5.5.40

>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ia-CMakeLists.txt-tweak-source-file-compi.patch | 62 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/mysql/mariadb_5.5.39.inc   |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/storage-maria-C=
MakeLists.txt-tweak-source-file-compi.patch
>=20
> diff --git a/meta-oe/recipes-support/mysql/mariadb/storage-maria-CMakeLis=
ts.txt-tweak-source-file-compi.patch b/meta-oe/recipes-support/mysql/mariad=
b/storage-maria-CMakeLists.txt-tweak-source-file-compi.patch
> new file mode 100644
> index 0000000..b498423
> --- /dev/null
> +++ b/meta-oe/recipes-support/mysql/mariadb/storage-maria-CMakeLists.txt-=
tweak-source-file-compi.patch
> @@ -0,0 +1,62 @@
> +From 4e99ef5cdffc92da783b04fa4fd07da47485f394 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 5 Nov 2014 16:25:52 +0800
> +Subject: [PATCH] storage/maria/CMakeLists.txt: tweak source file compile=
 order
> +
> +There is occasionally compile failure while krb5.h removed
> +from sysroot during maradb compiling.
> +...
> +[2014-10-27 17:18:06.998709364-07:00] | make -f storage/maria/CMakeFiles/
> + aria_embedded.dir/build.make storage/maria/CMakeFiles/aria_embedded.dir/
> +depend
> +[2014-10-27 17:18:07.458369132-07:00] | make -f storage/maria/CMakeFiles/
> +aria_embedded.dir/build.make storage/maria/CMakeFiles/aria_embedded.dir/
> +build
> +[2014-10-27 17:18:12.547556095-07:00] | make[2]: *** No rule to make tar=
get
> +`tmp/sysroots/x86-kvm-guest/usr/include/krb5.h', needed by `storage/mari=
a/
> +CMakeFiles/aria_embedded.dir/ha_maria.cc.o'.  Stop.
> +...
> +
> +The ha_maria.cc requires <openssl/ssl.h>, <openssl/ssl.h> requires <open=
ssl/
> +kssl.h>, and <openssl/kssl.h> conditionally requires <krb5.h>, but CMake
> +ignore the condition, force to add krb5.h to mariadb's dependencies, it =
is
> +the issue of CMake dependency scanner:
> +http://www.cmake.org/Wiki/CMake_FAQ#CMake_dependency_scanner
> +
> +As the above failure log shows, the dependency scanner was done at 17:18=
:06,
> +and the compiling start at 17:18:07, but compiling ha_maria.cc.o failed =
at
> +17:18:12, removing krb5.h within that 5 seconds caused the above failure.
> +
> +So we tweak the compile order, let ha_maria.cc as the first compile obje=
ct,
> +it will reduce the risk time of removing krb5.h.
> +
> +Upstream-Status: Pending
> +---
> + storage/maria/CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/storage/maria/CMakeLists.txt b/storage/maria/CMakeLists.txt
> +index 0f30f8f..6fcaccf 100644
> +--- a/storage/maria/CMakeLists.txt
> ++++ b/storage/maria/CMakeLists.txt
> +@@ -15,7 +15,7 @@
> +=20
> + INCLUDE(CMakeDependentOption)
> +=20
> +-SET(ARIA_SOURCES ma_init.c ma_open.c ma_extra.c ma_info.c ma_rkey.c=20
> ++SET(ARIA_SOURCES ha_maria.cc ma_init.c ma_open.c ma_extra.c ma_info.c m=
a_rkey.c
> +             ma_rnext.c ma_rnext_same.c=20
> +             ma_search.c ma_page.c ma_key_recover.c ma_key.c=20
> +             ma_locking.c ma_state.c
> +@@ -32,7 +32,7 @@ SET(ARIA_SOURCES ma_init.c ma_open.c ma_extra.c ma_inf=
o.c ma_rkey.c
> +             ma_keycache.c ma_preload.c ma_ft_parser.c=20
> +             ma_ft_update.c ma_ft_boolean_search.c=20
> +             ma_ft_nlq_search.c ft_maria.c ma_sort.c=20
> +-            ha_maria.cc trnman.c lockman.c
> ++            trnman.c lockman.c
> +             ma_rt_index.c ma_rt_key.c ma_rt_mbr.c ma_rt_split.c=20
> +             ma_sp_key.c ma_control_file.c ma_loghandler.c=20
> +             ma_pagecache.c ma_pagecaches.c
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/r=
ecipes-support/mysql/mariadb_5.5.39.inc
> index ae2e92b..42c8f3e 100644
> --- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> @@ -8,6 +8,7 @@ SRC_URI =3D "http://mirror.stshosting.co.uk/mariadb/maria=
db-${PV}/source/mariadb-$
>             file://fix-cmake-module-path.patch \
>             file://remove-bad-path.patch \
>             file://fix-mysqlclient-r-version.patch \
> +           file://storage-maria-CMakeLists.txt-tweak-source-file-compi.p=
atch \
>             file://my.cnf \
>             file://mysqld.service \
>            "
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E6lVPAHcXg6biC3t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRssdAACgkQN1Ujt2V2gBzftQCePLqT4aKIZNV88JDNWBKGoG/I
s1gAnjNo8cH+pOaqSiYAsKMFMPs5znXu
=7euq
-----END PGP SIGNATURE-----

--E6lVPAHcXg6biC3t--
