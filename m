Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N64dU-0005ix-Qu for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 16:52:35 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N64MZ-00080h-Es
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 16:35:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 16:35:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 16:35:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Nov 2009 16:31:16 +0100
Message-ID: <hcur44$elg$2@ger.gmane.org>
References: <1256849813-10538-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
	<1257427111-32537-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1257427111-32537-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] boost: more elaborate and correct usage of GCC atomicity.
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
X-List-Received-Date: Thu, 05 Nov 2009 15:52:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05-11-09 14:18, Przemyslaw Wesolek wrote:
>
> Signed-off-by: Przemyslaw Wesolek<przemyslaw.wesolek@cs.put.poznan.pl>
> ---
>
> This patch is based on upstream corrections spotted in 1.40 version.
> They allow to properly compile Boost on both<4.2 and>=4.2 GCC, for
> ARM machines.
>
> Applicable to both devel and stable.

Your patch seems to be based on an old (as in: the day before yesterday) 
snapshot of OE. I added a different set of patches which do almost the 
same, but keep proper atomic ops for armv6 and armv7a, while yours would 
fall back to emulated atomic ops for all arm platforms.

regards,

Koen

>
>
>   recipes/boost/boost_1.36.0.bb                      |    4 +++-
>   recipes/boost/files/atomic_count_arm.patch         |   11 +++++++++++
>   .../boost/files/atomic_count_gcc_atomicity.patch   |    7 +++++--
>   3 files changed, 19 insertions(+), 3 deletions(-)
>   create mode 100644 recipes/boost/files/atomic_count_arm.patch
>
> diff --git a/recipes/boost/boost_1.36.0.bb b/recipes/boost/boost_1.36.0.bb
> index 140ab29..276ca9b 100644
> --- a/recipes/boost/boost_1.36.0.bb
> +++ b/recipes/boost/boost_1.36.0.bb
> @@ -1,9 +1,11 @@
>   include boost-36.inc
>
> -PR = "r6"
> +PR = "r8"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2 \
>              file://arm-intrinsics.patch;patch=1 \
> +           file://atomic_count_gcc_atomicity.patch;patch=1 \
> +           file://atomic_count_arm.patch;patch=1 \
>             "
>
>   BJAM_OPTS    = '${BJAM_TOOLS} \
> diff --git a/recipes/boost/files/atomic_count_arm.patch b/recipes/boost/files/atomic_count_arm.patch
> new file mode 100644
> index 0000000..1017ebc
> --- /dev/null
> +++ b/recipes/boost/files/atomic_count_arm.patch
> @@ -0,0 +1,11 @@
> +--- boost_1_36_0/boost/detail/atomic_count.hpp.orig	2007-11-23 18:03:14.000000000 +0100
> ++++ boost_1_36_0/boost/detail/atomic_count.hpp	2009-09-25 18:17:12.602907541 +0200
> +@@ -101,7 +101,7 @@
> +
> + #  include<boost/detail/atomic_count_win32.hpp>
> +
> +-#elif defined( __GNUC__ )&&  ( __GNUC__ * 100 + __GNUC_MINOR__>= 401 )
> ++#elif defined( __GNUC__ )&&  ( __GNUC__ * 100 + __GNUC_MINOR__>= 401 )&&  !defined( __arm__ )&&  !defined( __armel__ )
> +
> + #  include<boost/detail/atomic_count_sync.hpp>
> +
> diff --git a/recipes/boost/files/atomic_count_gcc_atomicity.patch b/recipes/boost/files/atomic_count_gcc_atomicity.patch
> index 7d08e73..3b09a8a 100644
> --- a/recipes/boost/files/atomic_count_gcc_atomicity.patch
> +++ b/recipes/boost/files/atomic_count_gcc_atomicity.patch
> @@ -2,12 +2,15 @@ Index: boost_1_33_1/boost/detail/atomic_count_gcc.hpp
>   ===================================================================
>   --- boost_1_33_1.orig/boost/detail/atomic_count_gcc.hpp	2008-05-01 20:43:45.000000000 +0200
>   +++ boost_1_33_1/boost/detail/atomic_count_gcc.hpp	2008-05-01 20:43:55.000000000 +0200
> -@@ -17,7 +17,7 @@
> +@@ -17,7 +17,11 @@
>    //  http://www.boost.org/LICENSE_1_0.txt)
>    //
>
> --#include<bits/atomicity.h>
> ++#if __GNUC__ * 100 + __GNUC_MINOR__>= 402
>   +#include<ext/atomicity.h>
> ++#else
> + #include<bits/atomicity.h>
> ++#endif
>
>    namespace boost
>    {




