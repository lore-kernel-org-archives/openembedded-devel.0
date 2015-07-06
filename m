Return-Path: <joe@deserted.net>
Received: from mail-vn0-f44.google.com (mail-vn0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id B49A573215
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2015 19:26:42 +0000 (UTC)
Received: by vnbf1 with SMTP id f1so13327811vnb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jul 2015 12:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=YAavixQpsHKYymYjdGinSYnndg7qpTiZxy2NVlVQXtM=;
	b=e8wu7+dvaYYadaD6VlnQci+yyXhCtGHrN32DgUd8E3eOeeqivXJk/vBLFH6gVZWaEi
	PZn5f788ZKkgBhwSmOt1JeMs9p+ywrRXJp2nrfRGnWcdehOIrlg8dfmi6zqIjswWfZFB
	GeEQtVzvBI0CZq4jKOdBGEU23VSU/InktADdHlo3b3QtPkU7lAVuhnHTiUwVvkBJYxRP
	TSa9EYd79OCvKWGDf0GChUnAbWds/bGqza3IdYzrMYiwxltFqINcG+pmGC/PGkRiSsfV
	iHIttlvx+doJUgt/UvyF6ejCGTCWBQghMKVBV/4Nd1Ss6cpPGNveOOFcFHVrMcO52Uph
	G7xg==
X-Gm-Message-State: ALoCoQlhDmeotyuKeVlN68aJqIOn1zW56TiiECHdU/NJuG29FuPwzDjlhRR6dFfyBWfx53MLqc/w
MIME-Version: 1.0
X-Received: by 10.52.83.66 with SMTP id o2mr561151vdy.26.1436210802080; Mon,
	06 Jul 2015 12:26:42 -0700 (PDT)
Received: by 10.31.58.132 with HTTP; Mon, 6 Jul 2015 12:26:41 -0700 (PDT)
In-Reply-To: <1434510209-22324-1-git-send-email-rongqing.li@windriver.com>
References: <1434510209-22324-1-git-send-email-rongqing.li@windriver.com>
Date: Mon, 6 Jul 2015 15:26:41 -0400
Message-ID: <CANBf+V2=eO4XoktBeG5fmniNoDMosLKfeXboN71eYW0SUhM8-w@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][v2] squid: upgrade to 3.5.5
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
X-List-Received-Date: Mon, 06 Jul 2015 19:26:45 -0000
Content-Type: text/plain; charset=UTF-8

Looks okay, but there's this in Martin's logs:

squid-3.5.5: squid rdepends on libpam, but it isn't a build
dependency? [build-deps]

Can you update the recipe for that?

-J.

On Tue, Jun 16, 2015 at 11:03 PM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> 1. Remove the squid-change-ksh-referen*.patch which is not needed, since
>    3.5.5 did not use ksh by default.
> 2. Update the checksum of COPYING,since the date in it has been changed.
> 3. Define BUILDCXXFLAGS, otherwise the target gcc options -std=c++11 will
>    add into it, and lead to building failure since host gcc maybe not
>    support "-std=c++11"
> 4. Assume to support GNU atomic operations by default, the running check
>    on cross-compile setup does not work
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...ge-ksh-reference-in-krb-ldap-helper-to-sh.patch | 39 ----------------------
>  .../squid/{squid_3.4.7.bb => squid_3.5.5.bb}       |  9 ++---
>  2 files changed, 5 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
>  rename meta-networking/recipes-daemons/squid/{squid_3.4.7.bb => squid_3.5.5.bb} (88%)
>
> diff --git a/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch b/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
> deleted file mode 100644
> index 8e03860..0000000
> --- a/meta-networking/recipes-daemons/squid/files/squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch
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
> -diff --git a/helpers/external_acl/kerberos_ldap_group/cert_tool b/helpers/external_acl/kerberos_ldap_group/cert_tool
> -index 9f14959..8c4ea11 100644
> ---- a/helpers/external_acl/kerberos_ldap_group/cert_tool
> -+++ b/helpers/external_acl/kerberos_ldap_group/cert_tool
> -@@ -1,4 +1,4 @@
> --#!/bin/ksh
> -+#!/bin/sh
> - #
> - #  -----------------------------------------------------------------------------
> - #
> -@@ -64,9 +64,9 @@ QUIT
> - # Create database for Sun ldap and pem file for Openldap
> - #
> - rm ${server}_[0-9]*.pem 2>/dev/null
> --let i=0
> -+i=0
> -  ls ${server}_[0-9]*.cert | while read file; do
> -- let i=i+1
> -+ i=`expr $i + 1`
> -  cat  $file  >> ${server}_$i.pem
> -  CA=`openssl x509 -noout -text -in  ${server}_$i.pem | grep -i "CA:.*true"`
> -  if [ -n "$CA" ]; then
> ---
> -1.9.1
> -
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> similarity index 88%
> rename from meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> rename to meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> index 7b00dfc..ac18e0f 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.5.bb
> @@ -16,17 +16,16 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>             file://Set-up-for-cross-compilation.patch \
>             file://Skip-AC_RUN_IFELSE-tests.patch \
>             file://Fix-flawed-dynamic-ldb-link-test-in-configure.patch \
> -           file://squid-change-ksh-reference-in-krb-ldap-helper-to-sh.patch \
>             file://squid-use-serial-tests-config-needed-by-ptest.patch \
>             file://run-ptest \
>             file://volatiles.03_squid \
>  "
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
> -                    file://COPYRIGHT;md5=2900f50789c498be8e9f1eb23b55cbe9 \
> +                    file://errors/COPYRIGHT;md5=0fed8f1462f6fdbc62bb431bcb618f46 \
>                     "
> -SRC_URI[md5sum] = "9951034b10f7ee0f45a95cfae61c57c2"
> -SRC_URI[sha256sum] = "7b423f3d3495a317503ca559ea535f80445fd7c4e3c3e268cb7a8c97c61af2b6"
> +SRC_URI[md5sum] = "6aac5c2e9cbbeabcbf2e9e49a178a931"
> +SRC_URI[sha256sum] = "741c24a307c50f0d845d53cabb66b36d91ce9a73c8a165eae5def5e4d11e6a0d"
>
>  DEPENDS = "libtool krb5 openldap db cyrus-sasl"
>
> @@ -38,6 +37,8 @@ USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --she
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
>  EXTRA_OECONF += "--with-default-user=squid"
> +export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
> +CACHED_CONFIGUREVARS += "squid_cv_gnu_atomics=yes"
>
>  TESTDIR = "test-suite"
>  do_compile_ptest() {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Joe MacDonald
:wq

