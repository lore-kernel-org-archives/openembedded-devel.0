Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B22616AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 15:37:33 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id fp1so12531508pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 07:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9K6CQjnhxmjwU6/OOWMFnqhxaARr7XoSisDjdhZ+Afo=;
	b=rtYuCcVAIFHIL0tfJMLlvmy2f17ox5Pc8BNI4/MS6s/LTHGQgqsxrRPov97sFW8qpv
	pUl563MikhBmvXvURS6sXmdS3vpsrillv0zu20lB+S7YRVjVW2tm9l0LFB2TiqLc/en0
	RylX3KzRk8owjJA4Nn7N2PvmnykWazTLsm25zz7EtieOrEGN1KFdPE4tvrb8xl4M+Pxb
	LRjyeCr9/u/RZgf4qHc89JsVN307F/+k2wOIx2U1c3U2ti5gg7sA6RetB3t2sQiZ3tfX
	Z/I5j1geyqZNWliKGdeaxVXBtrFTSCjqR73rcaOR6xPNM5Mwh6fxPekYnxAqH3QK/2KJ
	Kp6Q==
X-Received: by 10.68.78.4 with SMTP id x4mr19681198pbw.74.1422286653731;
	Mon, 26 Jan 2015 07:37:33 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:707b:3366:1172:a58?
	([2601:c:a700:272f:707b:3366:1172:a58])
	by mx.google.com with ESMTPSA id
	ak5sm10220884pad.44.2015.01.26.07.37.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 07:37:32 -0800 (PST)
Message-ID: <54C65F38.3020404@gmail.com>
Date: Mon, 26 Jan 2015 07:37:28 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1422053452.git.akuster808@gmail.com>	<f3765d513c8971761e10bb0f249f8745b9aa3504.1422053452.git.akuster808@gmail.com>
	<m9vng5$cmq$1@ger.gmane.org>
In-Reply-To: <m9vng5$cmq$1@ger.gmane.org>
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
X-List-Received-Date: Mon, 26 Jan 2015 15:37:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I appreciate the review but I got this patch from master with the 
"Missing Upstream-status". This is for dizzy update. ( I really need to 
fix my process)

regards,
- Armin

On 01/24/2015 01:09 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Armin Kuster schreef op 23-01-15 om 23:53:
>> From: "Belal, Awais" <Awais_Belal@mentor.com>
>>
>> The configure step uses a package header to check for support of
>> types/declares, this package header encapsulates all the required system
>> headers for providing the needed resources. When configured from an out
>> of tree directory the package header is not found due to the hard path.
>> We now make the path for package header relative to 'srcdir' so it is
>> found appropriately.
>>
>> Signed-off-by: Awais Belal <awais_belal@mentor.com> Signed-off-by: Martin
>> Jansa <Martin.Jansa@gmail.com> Signed-off-by: Armin Kuster
>> <akuster808@gmail.com> ---
>> .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52
>> ++++++++++++++++++++++ meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
>> |  1 + 2 files changed, 53 insertions(+) create mode 100644
>> meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
>>
>>   diff --git
>> a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
>> b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
>>
>>
> new file mode 100644
>> index 0000000..e8a0297 --- /dev/null +++
>> b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
>>
>>
> @@ -0,0 +1,52 @@
>> +iperf: fix out of tree configuration + +The configure step uses a
>> package header to check for support of types/declares, +this package
>> header encapsulates all the required system header for providing +the
>> needed resources. When configured from an out of tree directory the
>> package +header is not found due to the hard path. +We now make the path
>> for package header relative to our 'srcdir' so it is +found
>> appropriately. + +Signed-off-by: Awais Belal <awais_belal@mentor.com>
>
> Missing Upstream-status
>
>
>> +--- +diff --git a/configure.ac b/configure.ac +index 2b3fd20..d420f9e
>> 100644 +--- a/configure.ac ++++ b/configure.ac +@@ -176,8 +176,8 @@ dnl
>> Check for system services + + dnl check for multicast + if test
>> "$ac_cv_multicast" != no; then +-  AC_CHECK_TYPES(struct
>> ip_mreq,,,[#include "compat/headers_slim.h"]) +-
>> AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"]) ++
>> AC_CHECK_TYPES(struct ip_mreq,,,[#include
>> "${srcdir}/compat/headers_slim.h"]) ++
>> AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include
>> "${srcdir}/compat/headers_slim.h"]) +   AC_MSG_CHECKING(for multicast
>> support) +   ac_cv_multicast=no +   if test
>> "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" = yes; then +@@ -193,9 +193,9 @@ fi
>> + + dnl check for IPv6 + if test "$ac_cv_have_ipv6" != no; then +-
>> AC_CHECK_TYPES(struct sockaddr_storage,,,[#include
>> "compat/headers_slim.h"]) +-  AC_CHECK_TYPES(struct
>> sockaddr_in6,,,[#include "compat/headers_slim.h"]) +-
>> AC_CHECK_DECLS(AF_INET6,,,[#include "compat/headers_slim.h"]) ++
>> AC_CHECK_TYPES(struct sockaddr_storage,,,[#include
>> "${srcdir}/compat/headers_slim.h"]) ++  AC_CHECK_TYPES(struct
>> sockaddr_in6,,,[#include "${srcdir}/compat/headers_slim.h"]) ++
>> AC_CHECK_DECLS(AF_INET6,,,[#include "${srcdir}/compat/headers_slim.h"]) +
>> AC_MSG_CHECKING(for IPv6 headers and structures) +   ac_cv_have_ipv6=no +
>> if test "$ac_cv_type_struct_sockaddr_storage" = yes; then +@@ -211,9
>> +211,9 @@ fi + + if test "$ac_cv_have_ipv6" = yes; then +   if test
>> "$ac_cv_multicast" = yes; then +-    AC_CHECK_TYPES(struct
>> ipv6_mreq,,,[#include "compat/headers_slim.h"]) +-
>> AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
>> +-    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include
>> "compat/headers_slim.h"]) ++    AC_CHECK_TYPES(struct
>> ipv6_mreq,,,[#include "${srcdir}/compat/headers_slim.h"]) ++
>> AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include
>> "${srcdir}/compat/headers_slim.h"]) ++
>> AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include
>> "${srcdir}/compat/headers_slim.h"]) +     AC_MSG_CHECKING(for IPv6
>> multicast support) +     ac_cv_have_ipv6_multicast=no +     if test
>> "$ac_cv_type_struct_ipv6_mreq" = yes; then diff --git
>> a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
>> b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb index 1bd554b..20adc0d
>> 100644 --- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb +++
>> b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb @@ -6,6 +6,7 @@
>> LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
>>
>> SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
>> file://iperf-2.0.5_ManPage.patch \ +
>> file://0001-fix-out-of-tree-config.patch \ "
>>
>> SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFUw2FFMkyGM64RGpERArugAJ4nkEYjuGS9ZOgyq/2ouo8dIUY7xQCeM58n
> jN/V4SPAvQw8zcM6qCTjyAw=
> =4Vn9
> -----END PGP SIGNATURE-----
>

