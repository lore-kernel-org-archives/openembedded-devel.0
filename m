Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5816FF73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 03:09:19 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id l24so19340720pfj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 19:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=TiY8r2/XGqTn18flVuYbAkBtGg+Ac4lCJVSonGILYX4=;
	b=QTRm7hOjfQdrVajw15xjeicjlOGBlEgGC0UIDmRb8G8TM0nBzIZqV6pj5tJetO+T5K
	fmo4EWneMG3u2vpAKJ1/R/fw8OFtN4gRWBHRn4dit42mkQL3cj6jYgw429b+rTLWLWmM
	CDYPXrhA976Q+e3bTEZJRretY8S82entVp+ZZo9etK5n+yPY+okzMxpivT0K0KRCzIrd
	efyCbqBImKUB8YB4/SjCnYuj+BBB2hiUesuUwC9iVsAiT65/cF74lCKEGUkGFEBsMgMH
	D/Kdyz6P6Q++GB+NwSLCI/h9VEt1coupfxYD3dvAlrq2lbyzaL4dkG4qMgCiG9uak5nU
	BL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TiY8r2/XGqTn18flVuYbAkBtGg+Ac4lCJVSonGILYX4=;
	b=HtBkJBua9DXWOmsKI9CyWKAEfnOX1ftr1O1/vS+mJ2UgwuH+kbaOIcKMZ0V/M3pDaN
	9CIcTLrtsblMv2ma4+Z35fyex7JG4FrdaHTOi9Pedd3FOiLtZ3Klb7ueQT93dWnJo2JD
	pN0rS9ZyWXOZlHgJDrt/m60LoXR8rCyzL7EHVI7ZBS64l7NkBIQnozrxOZQJy+uAaxNx
	7WDT4/1jTVBtmBlcyeZ/wkD4Oucnp6PSu9PFkPHbmU/+eTsn4LwKdFV5F8pbgsPFQSGc
	3BOxOJdPlQ8pCarhf2bk7YhvMdgd+UHpeGyGdI2i1U9FeMQdZh1FVuBcPgMwmprw8N0Z
	9i5w==
X-Gm-Message-State: AKGB3mKBuy50gU8EtmrRYOaPSug3WdkoX1NUHxsUzS4oAsm0SeeiqRUn
	QLg1Q9t07STNEnNe5liAee+MEA==
X-Google-Smtp-Source: ACJfBoty4O9bj4rq/fY3+0bdmo51n2JGZ5UhAnDzld4XMkutDYARagFVbsLmPQDXaAATZAk7kA1+ZQ==
X-Received: by 10.99.160.9 with SMTP id r9mr3565916pge.145.1514344160254;
	Tue, 26 Dec 2017 19:09:20 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:bd87:68dc:7ad5:c07b?
	([2601:202:4000:1184:bd87:68dc:7ad5:c07b])
	by smtp.gmail.com with ESMTPSA id
	j6sm61705107pfg.85.2017.12.26.19.09.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Dec 2017 19:09:19 -0800 (PST)
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	openembedded-devel@lists.openembedded.org
References: <20171218140110.1395-1-adrian.ratiu@ni.com>
	<20171218140110.1395-2-adrian.ratiu@ni.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bf6b42e5-d4d5-e483-d71d-7eda025db44e@gmail.com>
Date: Tue, 26 Dec 2017 19:09:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171218140110.1395-2-adrian.ratiu@ni.com>
Subject: Re: [meta-oe][PATCH 2/2] iperf: rename to iperf2 and bump 2.0.5 -> 2.0.10
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
X-List-Received-Date: Wed, 27 Dec 2017 03:09:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/18/2017 06:01 AM, Ioan-Adrian Ratiu wrote:
> Both iperf2 and iperf3 are actively maintained projects. iperf2 was
> forked from the old iperf codebase because iperf3 is an incompatible
> and as of yet incomplete rewrite from scratch.
>
> Rename the old iperf to ipref2 to avoid ambiguity. Drop all 3 patches
> we were carrying because they got merged upstream.

I am seeing these error on arm.

| In file included from ../../iperf-2.0.10/compat/string.c:54:0:
| ../../iperf-2.0.10/include/util.h:73:1: error: unknown type name 'bool'; did you mean '_Bool'?
|  bool setsock_blocking(int fd, bool blocking);
|  ^~~~
|  _Bool
| ../../iperf-2.0.10/include/util.h:73:31: error: unknown type name 'bool'; did you mean '_Bool'?
|  bool setsock_blocking(int fd, bool blocking);
|                                ^~~~
|                                _Bool
| In file included from ../../iperf-2.0.10/compat/delay.c:55:0:
| ../../iperf-2.0.10/include/util.h:73:1: error: unknown type name 'bool'; did you mean '_Bool'?
|  bool setsock_blocking(int fd, bool blocking);
|  ^~~~
|  _Bool
| ../../iperf-2.0.10/include/util.h:73:31: error: unknown type name 'bool'; did you mean '_Bool'?
|  bool setsock_blocking(int fd, bool blocking);


Could the removed patch:  0002-fix-bool-size-m4.patch be needed?

- armin 

>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ----------------------
>  .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch  | 16 -------
>  .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch    |  8 ----
>  meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     | 23 ----------
>  meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb  | 19 ++++++++
>  5 files changed, 19 insertions(+), 99 deletions(-)
>  delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
>  delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
>  delete mode 100755 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
>  delete mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
>  create mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb
>
> diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
> deleted file mode 100644
> index e8a029790..000000000
> --- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -iperf: fix out of tree configuration
> -
> -The configure step uses a package header to check for support of types/declares,
> -this package header encapsulates all the required system header for providing
> -the needed resources. When configured from an out of tree directory the package
> -header is not found due to the hard path.
> -We now make the path for package header relative to our 'srcdir' so it is
> -found appropriately.
> -
> -Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ----
> -diff --git a/configure.ac b/configure.ac
> -index 2b3fd20..d420f9e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -176,8 +176,8 @@ dnl Check for system services
> - 
> - dnl check for multicast
> - if test "$ac_cv_multicast" != no; then
> --  AC_CHECK_TYPES(struct ip_mreq,,,[#include "compat/headers_slim.h"])
> --  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
> -+  AC_CHECK_TYPES(struct ip_mreq,,,[#include "${srcdir}/compat/headers_slim.h"])
> -+  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_slim.h"])
> -   AC_MSG_CHECKING(for multicast support)
> -   ac_cv_multicast=no
> -   if test "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" = yes; then
> -@@ -193,9 +193,9 @@ fi
> - 
> - dnl check for IPv6
> - if test "$ac_cv_have_ipv6" != no; then
> --  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "compat/headers_slim.h"])
> --  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "compat/headers_slim.h"])
> --  AC_CHECK_DECLS(AF_INET6,,,[#include "compat/headers_slim.h"])
> -+  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "${srcdir}/compat/headers_slim.h"])
> -+  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "${srcdir}/compat/headers_slim.h"])
> -+  AC_CHECK_DECLS(AF_INET6,,,[#include "${srcdir}/compat/headers_slim.h"])
> -   AC_MSG_CHECKING(for IPv6 headers and structures)
> -   ac_cv_have_ipv6=no
> -   if test "$ac_cv_type_struct_sockaddr_storage" = yes; then
> -@@ -211,9 +211,9 @@ fi
> - 
> - if test "$ac_cv_have_ipv6" = yes; then
> -   if test "$ac_cv_multicast" = yes; then
> --    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "compat/headers_slim.h"])
> --    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
> --    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "compat/headers_slim.h"])
> -+    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "${srcdir}/compat/headers_slim.h"])
> -+    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_slim.h"])
> -+    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "${srcdir}/compat/headers_slim.h"])
> -     AC_MSG_CHECKING(for IPv6 multicast support)
> -     ac_cv_have_ipv6_multicast=no
> -     if test "$ac_cv_type_struct_ipv6_mreq" = yes; then
> diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
> deleted file mode 100644
> index 348e316ce..000000000
> --- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> ---- iperf-2.0.5/m4/dast.m4.orig	2016-06-15 11:42:03.945581785 -0400
> -+++ iperf-2.0.5/m4/dast.m4	2016-06-15 11:42:11.053581641 -0400
> -@@ -11,7 +11,12 @@
> - 
> - AC_DEFUN(DAST_CHECK_BOOL, [
> - 
> --AC_CHECK_SIZEOF(bool)
> -+if test "$ac_cv_header_stdbool_h" = yes; then
> -+  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
> -+else
> -+    AC_CHECK_SIZEOF(bool)
> -+fi
> -+
> - if test "$ac_cv_sizeof_bool" = 0 ; then
> -   AC_DEFINE(bool, int)
> - fi
> diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
> deleted file mode 100755
> index 12e8f4631..000000000
> --- a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
> - index ed97bc6..728873f 100644
> ---- iperf-2.0.5/man/Makefile.am
> -+++ iperf-2.0.5/man/Makefile.am
> -@@ -1,2 +1 @@
> --man_MANS = iperf.1
> --dist_man_MANS = $(man_MANS)
> -+dist_man_MANS = iperf.1
> diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
> deleted file mode 100644
> index 9981d8275..000000000
> --- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
> -HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
> -SECTION = "console/network"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
> -
> -SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
> -            file://iperf-2.0.5_ManPage.patch \
> -            file://0001-fix-out-of-tree-config.patch \
> -            file://0002-fix-bool-size-m4.patch \
> -          "
> -
> -SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
> -SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
> -
> -S = "${WORKDIR}/${BP}"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
> -
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
> -PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb
> new file mode 100644
> index 000000000..1322d0788
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
> +HOMEPAGE = "https://sourceforge.net/projects/iperf2/"
> +SECTION = "console/network"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
> +
> +SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf2/iperf-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "097cf0754bc1afa165975c06a91e6906"
> +SRC_URI[sha256sum] = "7fe4348dcca313b74e0aa9c34a8ccd713b84a5615b8578f4aa94cedce9891ef2"
> +
> +S = "${WORKDIR}/iperf-${PV}"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
> +PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"


