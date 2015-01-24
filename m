Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9014472A7F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2015 09:09:33 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YEwii-0005h9-3j for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jan 2015 10:09:32 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2015 10:09:32 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2015 10:09:32 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 24 Jan 2015 10:09:25 +0100
Message-ID: <m9vng5$cmq$1@ger.gmane.org>
References: <cover.1422053452.git.akuster808@gmail.com>
	<f3765d513c8971761e10bb0f249f8745b9aa3504.1422053452.git.akuster808@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
In-Reply-To: <f3765d513c8971761e10bb0f249f8745b9aa3504.1422053452.git.akuster808@gmail.com>
Subject: Re: [PATCH 01/11] iperf: fix out of tree configuration
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
X-List-Received-Date: Sat, 24 Jan 2015 09:09:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Armin Kuster schreef op 23-01-15 om 23:53:
> From: "Belal, Awais" <Awais_Belal@mentor.com>
> 
> The configure step uses a package header to check for support of
> types/declares, this package header encapsulates all the required system
> headers for providing the needed resources. When configured from an out
> of tree directory the package header is not found due to the hard path. 
> We now make the path for package header relative to 'srcdir' so it is
> found appropriately.
> 
> Signed-off-by: Awais Belal <awais_belal@mentor.com> Signed-off-by: Martin
> Jansa <Martin.Jansa@gmail.com> Signed-off-by: Armin Kuster
> <akuster808@gmail.com> --- 
> .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52
> ++++++++++++++++++++++ meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
> |  1 + 2 files changed, 53 insertions(+) create mode 100644
> meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
>
>  diff --git
> a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
> b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
>
> 
new file mode 100644
> index 0000000..e8a0297 --- /dev/null +++
> b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
>
> 
@@ -0,0 +1,52 @@
> +iperf: fix out of tree configuration + +The configure step uses a
> package header to check for support of types/declares, +this package
> header encapsulates all the required system header for providing +the
> needed resources. When configured from an out of tree directory the
> package +header is not found due to the hard path. +We now make the path
> for package header relative to our 'srcdir' so it is +found
> appropriately. + +Signed-off-by: Awais Belal <awais_belal@mentor.com>

Missing Upstream-status


> +--- +diff --git a/configure.ac b/configure.ac +index 2b3fd20..d420f9e
> 100644 +--- a/configure.ac ++++ b/configure.ac +@@ -176,8 +176,8 @@ dnl
> Check for system services + + dnl check for multicast + if test
> "$ac_cv_multicast" != no; then +-  AC_CHECK_TYPES(struct
> ip_mreq,,,[#include "compat/headers_slim.h"]) +-
> AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"]) ++
> AC_CHECK_TYPES(struct ip_mreq,,,[#include
> "${srcdir}/compat/headers_slim.h"]) ++
> AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include
> "${srcdir}/compat/headers_slim.h"]) +   AC_MSG_CHECKING(for multicast
> support) +   ac_cv_multicast=no +   if test
> "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" = yes; then +@@ -193,9 +193,9 @@ fi 
> + + dnl check for IPv6 + if test "$ac_cv_have_ipv6" != no; then +-
> AC_CHECK_TYPES(struct sockaddr_storage,,,[#include
> "compat/headers_slim.h"]) +-  AC_CHECK_TYPES(struct
> sockaddr_in6,,,[#include "compat/headers_slim.h"]) +-
> AC_CHECK_DECLS(AF_INET6,,,[#include "compat/headers_slim.h"]) ++
> AC_CHECK_TYPES(struct sockaddr_storage,,,[#include
> "${srcdir}/compat/headers_slim.h"]) ++  AC_CHECK_TYPES(struct
> sockaddr_in6,,,[#include "${srcdir}/compat/headers_slim.h"]) ++
> AC_CHECK_DECLS(AF_INET6,,,[#include "${srcdir}/compat/headers_slim.h"]) +
> AC_MSG_CHECKING(for IPv6 headers and structures) +   ac_cv_have_ipv6=no +
> if test "$ac_cv_type_struct_sockaddr_storage" = yes; then +@@ -211,9
> +211,9 @@ fi + + if test "$ac_cv_have_ipv6" = yes; then +   if test
> "$ac_cv_multicast" = yes; then +-    AC_CHECK_TYPES(struct
> ipv6_mreq,,,[#include "compat/headers_slim.h"]) +-
> AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"]) 
> +-    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include
> "compat/headers_slim.h"]) ++    AC_CHECK_TYPES(struct
> ipv6_mreq,,,[#include "${srcdir}/compat/headers_slim.h"]) ++
> AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include
> "${srcdir}/compat/headers_slim.h"]) ++
> AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include
> "${srcdir}/compat/headers_slim.h"]) +     AC_MSG_CHECKING(for IPv6
> multicast support) +     ac_cv_have_ipv6_multicast=no +     if test
> "$ac_cv_type_struct_ipv6_mreq" = yes; then diff --git
> a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
> b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb index 1bd554b..20adc0d
> 100644 --- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb +++
> b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb @@ -6,6 +6,7 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
> 
> SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \ 
> file://iperf-2.0.5_ManPage.patch \ +
> file://0001-fix-out-of-tree-config.patch \ "
> 
> SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUw2FFMkyGM64RGpERArugAJ4nkEYjuGS9ZOgyq/2ouo8dIUY7xQCeM58n
jN/V4SPAvQw8zcM6qCTjyAw=
=4Vn9
-----END PGP SIGNATURE-----


