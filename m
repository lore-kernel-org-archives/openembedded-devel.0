Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 57BC260670
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:47:16 +0000 (UTC)
Received: by wiga1 with SMTP id a1so106279318wig.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 04:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=5eP9Gpzt2isaKL3EhCvG0mu88gUaF9prEBHMnSy7fmQ=;
	b=mJu9jyKKctm4n8ao7iG5xpVraXvHbHTK6cPL/UEsb7NqlDveeXCXXd3JtpwJY4KmJa
	yyyRX+gOTE3A1gh5ThyA9HKldgegbDBJRpS9+uxdWNbZWBpjVUkl7UowhHCjKdsMeKbZ
	4LQhE66rPsslgcZFvkFA35c1vw5HbsQPuau0JyqcoiTO6IUkYoOHLZvpjtnQY5j9YSKr
	Ab37I1EY21qjYJBESLQox0j3D4YScmFbwbCviV80C8iyEtGa1cnBT2CpSkNcU25M+yx6
	1RPAy9wEXXkB3TPIq5g5BsBmOIjfB3B+2uq5l3CyCC1wLVlD+CCnSMQ4SWzf2ZyYDhtb
	fH6A==
X-Received: by 10.180.106.6 with SMTP id gq6mr6022365wib.39.1434455235767;
	Tue, 16 Jun 2015 04:47:15 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id o6sm20411265wiz.24.2015.06.16.04.47.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jun 2015 04:47:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 Jun 2015 13:47:24 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150616114724.GB2395@jama>
References: <1434355855-769-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1434355855-769-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] squid: upgrade to 3.5.5
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
X-List-Received-Date: Tue, 16 Jun 2015 11:47:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 04:10:55PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> remove the squid-change-ksh-referen*.patch which is not needed,
> since 3.5.5 did not use ksh by default.
> update the checksum of COPYING,since the date in it has been changed.

fails to build in world:

| g++  -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hid=
den -std=3Dc++11 -o cf_gen /home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5te-oe-linux-gnueabi/squid/3.5.5-r0/squid-3.5.5/src/cf_gen.cc -I/home/je=
nkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/squid/3.5.5=
-r0/squid-3.5.5/src -I../include/ -I../src
| cc1plus: error: unrecognized command line option '-std=3Dc++11'
| make[1]: *** [cf_gen] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/squid/3.5.5-r0/build/src'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/squid/3.5.5-r0/te=
mp/log.do_compile.18374)
NOTE: recipe squid-3.5.5-r0: task do_compile: Failed
ERROR: Task 27024 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-n=
etworking/recipes-daemons/squid/squid_3.5.5.bb, do_compile) failed with exi=
t code '1'


>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...ge-ksh-reference-in-krb-ldap-helper-to-sh.patch | 39 ----------------=
------
>  .../squid/{squid_3.4.7.bb =3D> squid_3.5.5.bb}       |  8 ++---
>  2 files changed, 4 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/squid/files/squid-cha=
nge-ksh-reference-in-krb-ldap-helper-to-sh.patch
>  rename meta-networking/recipes-daemons/squid/{squid_3.4.7.bb =3D> squid_=
3.5.5.bb} (88%)
>=20
> diff --git a/meta-networking/recipes-daemons/squid/files/squid-change-ksh=
-reference-in-krb-ldap-helper-to-sh.patch b/meta-networking/recipes-daemons=
/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
> deleted file mode 100644
> index 8e03860..0000000
> --- a/meta-networking/recipes-daemons/squid/files/squid-change-ksh-refere=
nce-in-krb-ldap-helper-to-sh.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -squid: change ksh reference in krb ldap helper to sh
> -
> -Very simple cert_tool script with no ksh specifics.
> -Change it to use sh so a package dependency doesn't
> -get created to ksh.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> -Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ----
> - helpers/external_acl/kerberos_ldap_group/cert_tool | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helper=
s/external_acl/kerberos_ldap_group/cert_tool
> -index 9f14959..8c4ea11 100644
> ---- a/helpers/external_acl/kerberos_ldap_group/cert_tool
> -+++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
> -@@ -1,4 +1,4 @@
> --#!/bin/ksh
> -+#!/bin/sh
> - #
> - #  --------------------------------------------------------------------=
---------
> - #=20
> -@@ -64,9 +64,9 @@ QUIT
> - # Create database for Sun ldap and pem file for Openldap=20
> - #
> - rm ${server}_[0-9]*.pem 2>/dev/null
> --let i=3D0
> -+i=3D0
> -  ls ${server}_[0-9]*.cert | while read file; do
> -- let i=3Di+1
> -+ i=3D`expr $i + 1`
> -  cat  $file  >> ${server}_$i.pem
> -  CA=3D`openssl x509 -noout -text -in  ${server}_$i.pem | grep -i "CA:.*=
true"`
> -  if [ -n "$CA" ]; then
> ---=20
> -1.9.1
> -
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-=
networking/recipes-daemons/squid/squid_3.5.5.bb
> similarity index 88%
> rename from meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> rename to meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> index 7b00dfc..1f445e5 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> @@ -16,17 +16,16 @@ SRC_URI =3D "http://www.squid-cache.org/Versions/v${M=
AJ_VER}/${MIN_VER}/${BPN}-${P
>             file://Set-up-for-cross-compilation.patch \
>             file://Skip-AC_RUN_IFELSE-tests.patch \
>             file://Fix-flawed-dynamic-ldb-link-test-in-configure.patch \
> -           file://squid-change-ksh-reference-in-krb-ldap-helper-to-sh.pa=
tch \
>             file://squid-use-serial-tests-config-needed-by-ptest.patch \
>             file://run-ptest \
>             file://volatiles.03_squid \
>  "
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc492e2d6d32ec5c1aad0e0609a141=
ce9 \
> -                    file://COPYRIGHT;md5=3D2900f50789c498be8e9f1eb23b55c=
be9 \
> +                    file://errors/COPYRIGHT;md5=3D0fed8f1462f6fdbc62bb43=
1bcb618f46 \
>                     "
> -SRC_URI[md5sum] =3D "9951034b10f7ee0f45a95cfae61c57c2"
> -SRC_URI[sha256sum] =3D "7b423f3d3495a317503ca559ea535f80445fd7c4e3c3e268=
cb7a8c97c61af2b6"
> +SRC_URI[md5sum] =3D "6aac5c2e9cbbeabcbf2e9e49a178a931"
> +SRC_URI[sha256sum] =3D "741c24a307c50f0d845d53cabb66b36d91ce9a73c8a165ea=
e5def5e4d11e6a0d"
> =20
>  DEPENDS =3D "libtool krb5 openldap db cyrus-sasl"
> =20
> @@ -38,6 +37,7 @@ USERADD_PARAM_${PN} =3D "--system --no-create-home --ho=
me-dir /var/run/squid --she
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[libnetfilter-conntrack] =3D "--with-netfilter-conntrack=3D=
${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
>  EXTRA_OECONF +=3D "--with-default-user=3Dsquid"
> +CACHED_CONFIGUREVARS +=3D "squid_cv_gnu_atomics=3Dno"
> =20
>  TESTDIR =3D "test-suite"
>  do_compile_ptest() {
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

