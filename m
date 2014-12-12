Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E74556017E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 16:33:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBCGXV07005806
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 08:33:32 -0800 (PST)
Received: from [172.25.44.9] (172.25.44.9) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 12 Dec 2014 08:33:31 -0800
Message-ID: <548B18D9.3060600@windriver.com>
Date: Fri, 12 Dec 2014 11:33:29 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>,
	<openembedded-devel@lists.openembedded.org>, "Hatle, Mark"
	<mark.hatle@windriver.com>
References: <1418251028-27954-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1418251028-27954-1-git-send-email-jslater@windriver.com>
X-Originating-IP: [172.25.44.9]
Subject: Re: [meta-networking][PATCH 1/1] tcpreplay: improve search for libpcap
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
X-List-Received-Date: Fri, 12 Dec 2014 16:33:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


build for cav-octeon3

merged:
To ssh://git.wrs.com/git/layers/meta-networking
    7f702c5..75228f4  wr-7.0-20141118 -> wr-7.0-20141118

I'm away for a while so please mind the build Mark.

../Randy


On 2014-12-10 05:37 PM, Joe Slater wrote:
> Add a test to find libpcap if testdir/.. is a sysroot.
>
> Upstream-Status: Pending
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   ...cpreplay-3.4.4-improve-search-for-libpcap.patch |   33 ++++++++++++++++++++
>   .../recipes-support/tcpreplay/tcpreplay_3.4.4.bb   |    1 +
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
>
> diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
> new file mode 100644
> index 0000000..50f024c
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
> @@ -0,0 +1,33 @@
> +tcpreplay: improve search for libpcap
> +
> +Add a test which will find libpcap if $testdir/.. is a sysroot.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -350,14 +350,20 @@ for testdir in $trypcapdir /usr/local /o
> +     if test -f "${testdir}/include/pcap.h" -a $foundpcap = no ; then
> +         LPCAPINC="${testdir}/include/pcap.h"
> +         LPCAPINCDIR="${testdir}/include"
> ++        # If testdir/.. is a sysroot, then sDir should point to where the libraries are.
> ++        sDir=$(readlink -m ${testdir}/../${libdir})
> +         if test $dynamic_link = yes; then
> +-            if test -f "${testdir}/lib64/libpcap${shrext_cmds}" ; then
> ++            if test -f "${sDir}/libpcap${shrext_cmds}" ; then
> ++                LPCAPLIB="-L${sDir} -lpcap"
> ++            elif test -f "${testdir}/lib64/libpcap${shrext_cmds}" ; then
> +                 LPCAPLIB="-L${testdir}/lib64 -lpcap"
> +             elif test -f "${testdir}/lib/libpcap${shrext_cmds}" ; then
> +                 LPCAPLIB="-L${testdir}/lib -lpcap"
> +             else
> +                 AC_ERROR([Unable to find libpcap in ${testdir}])
> +             fi
> ++        elif test -f "${sDir}/libpcap.${libext}" ; then
> ++            LPCAPLIB="${sDir}/libpcap.${libext}"
> +         elif test -f "${testdir}/lib64/libpcap.${libext}" ; then
> +             LPCAPLIB="${testdir}/lib64/libpcap.${libext}"
> +         elif test -f "${testdir}/lib/libpcap.${libext}" ; then
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> index 4bce270..9ecb695 100644
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> @@ -10,6 +10,7 @@ SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.ta
>              file://tcpreplay-3.4.4-cross-compile.patch \
>              file://tcpreplay-3.4.4-no-bfp-support.patch \
>              file://tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch \
> +           file://tcpreplay-3.4.4-improve-search-for-libpcap.patch \
>              "
>   SRC_URI[md5sum] = "22725feb9b2590809f9350308ec65180"
>   SRC_URI[sha256sum] = "7a809c58ddec86407fd6e5597ac883d7874a19bea81d716bb2b1c6e3b0e7b58f"
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

