Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 952307E26B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:41:58 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a2so8892643pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=om6w7b0uM4HFTA9g+VymiaCzxl72K56IwS2J4o4DpG8=;
	b=kOvEdu7b2+n5C0C6NXaYmwsFV7B9T7KbrRMIuMV4Hh8j8lRwimItNFE0a3zTMH7BIt
	6GZvxgYRYXrMHtbEYFOr0yWLsnjSKb5yjMW2F+FhzfqRLSOozWjIiiYKOR6PouHQkOLQ
	4Xy0OrqCHqMBdSkUypaTrweJB4JkzoVgksos3C5OZoJRazyQ3GfkL0jTFFWwFlB1UM1d
	dERBaaFo0adKwco1Ip/xbkV1DQZPYOiqNFLZkpWCFWqCORmUTAwNA3V9144D4Q6FjHfu
	oo4PBGXjYoSdvzGeAM5/PpChPaNcqQwerzTxHZrVAZDWtqYMNbztEaWcSR9Uy5yW0pwV
	h5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=om6w7b0uM4HFTA9g+VymiaCzxl72K56IwS2J4o4DpG8=;
	b=luedKcV/f8ouar534RDvftMxMacE3W/G2noAR8Ny+v+XFHw6QnNR5Zy3lm7T9PFKgf
	NUX5j7FAe3EWMPjHIr+zcFuGwsRh61cvWt4UMNVLRuYOjhrRYaEtzSfWxtmIXoxLw9+F
	DqfkVynH8rrQnVngU1rDNFLlGHecyqPxp2ldoyZDXsRI79F0g0ZmaFZSCWUje5OTuP7b
	Q0kM9m/hhmzNthNEOx2ipWdSB1Axhf0HJwIkitRug09sjsuNINxGtTWd2QS7KoLs2b+v
	LeKKdYyMdWuVy4XlDPG/Y1GhvsmqNiob2auH19hou9/A6rYZsufHE0qsXpLyHuJg7OVA
	wy2g==
X-Gm-Message-State: APjAAAXX0MPaf7zfzVea2otXDJAhG4SxDOnzn3W3gsey4oYDi0UXgR4z
	CuWRWZhwnRVDsNBFlj2j88oNrimV/vs=
X-Google-Smtp-Source: APXvYqwNPJoG5uWBsk0dPFC0xPWDc3DID6aloy2fLXlGrbvsafyeL+nTE+JaMdDbbu22UrqoJAQM3Q==
X-Received: by 2002:a62:8749:: with SMTP id i70mr32387170pfe.12.1570462919398; 
	Mon, 07 Oct 2019 08:41:59 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:65e8:7322:d189:1d85?
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	u18sm16392370pge.69.2019.10.07.08.41.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Oct 2019 08:41:58 -0700 (PDT)
To: Peiran Hong <peiran.hong@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20191007134340.36555-1-peiran.hong@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fa510513-1377-c94e-a635-0e38ef519789@gmail.com>
Date: Mon, 7 Oct 2019 08:41:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007134340.36555-1-peiran.hong@windriver.com>
Subject: Re: [meta-oe][PATCH] tcpdump: upgrade 4.9.2 -> 4.9.3
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
X-List-Received-Date: Mon, 07 Oct 2019 15:41:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/7/19 6:43 AM, Peiran Hong wrote:
> This upgrade adds some new features and fixes numerous bugs including
> the following CVEs:
> CVE: CVE-2017-16808 (AoE)
> CVE: CVE-2018-14468 (FrameRelay)
> CVE: CVE-2018-14469 (IKEv1)
> CVE: CVE-2018-14470 (BABEL)
> CVE: CVE-2018-14466 (AFS/RX)
> CVE: CVE-2018-14461 (LDP)
> CVE: CVE-2018-14462 (ICMP)
> CVE: CVE-2018-14465 (RSVP)
> CVE: CVE-2018-14881 (BGP)
> CVE: CVE-2018-14464 (LMP)
> CVE: CVE-2018-14463 (VRRP)
> CVE: CVE-2018-14467 (BGP)
> CVE: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
> CVE: CVE-2018-10105 (SMB - too unreliably reproduced,
>                            SMB printing disabled)
> CVE: CVE-2018-14880 (OSPF6)
> CVE: CVE-2018-16451 (SMB)
> CVE: CVE-2018-14882 (RPL)
> CVE: CVE-2018-16227 (802.11)
> CVE: CVE-2018-16229 (DCCP)
> CVE: CVE-2018-16301 (was fixed in libpcap)
> CVE: CVE-2018-16230 (BGP)
> CVE: CVE-2018-16452 (SMB)
> CVE: CVE-2018-16300 (BGP)
> CVE: CVE-2018-16228 (HNCP)
> CVE: CVE-2019-15166 (LMP)
> CVE: CVE-2019-15167 (VRRP)
> CVE: CVE-2018-14879 (tcpdump -V)

thanks,

Armin
>
> Deleted patch "0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch"
> since the fix is included in the upgrade.
>
> Modified patches "avoid-absolute-path-when-searching-for-libdlpi.patch",
> "unnecessary-to-check-libpcap.patch", and "add-ptest.path" since
> the upgrade renamed configure.in to configure.ac and made changes
> to the file.
>
> Added PACKAGECONFIG for smb. It is disabled by default in
> the upgraded version in both the package's configure script and this
> bitbake recipe since it is insecure.
>
> Modified the parsing of ptest result to align with the new output
> format.
>
> With core-image-minimal on qemux86-64/kvm:
> Recipe         | Passed      | Failed   | Skipped   | Time(s)
> Before         | 408         | 0        | 2         | 4
> After          | 431         | 11       | 2         | 10
>
> 11 test failed after the upgrade since libpcap is not upgraded
> alongside with tcpdump.
>
> Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
> ---
>  .../tcpdump/tcpdump/add-ptest.patch           |  9 +++++----
>  ...lute-path-when-searching-for-libdlpi.patch | 19 ++++++++++---------
>  .../recipes-support/tcpdump/tcpdump/run-ptest |  4 ++--
>  .../unnecessary-to-check-libpcap.patch        | 15 ++++++++-------
>  .../{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb}    | 12 +++++++++---
>  5 files changed, 34 insertions(+), 25 deletions(-)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb} (74%)
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> index b71435a04..f8ff354fe 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> @@ -1,18 +1,19 @@
> -From 8ee1ab1ac89557d48ac1ab7ddcc3c51be9b734ad Mon Sep 17 00:00:00 2001
> +From 8c9c728757f89ebe6c4019114b83a63c63596f69 Mon Sep 17 00:00:00 2001
>  From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> -Date: Wed, 22 Oct 2014 10:02:48 +0800
> +Date: Wed, 2 Oct 2019 16:57:06 -0400
>  Subject: [PATCH] Add ptest for tcpdump
>  
>  Upstream-Status: Pending
>  
>  Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
> +Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
>  
>  ---
>   Makefile.in | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>  
>  diff --git a/Makefile.in b/Makefile.in
> -index 0941f0e..3ce40c6 100644
> +index 3b589184..7b10e38c 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
>  @@ -437,9 +437,17 @@ distclean:
> @@ -23,7 +24,7 @@ index 0941f0e..3ce40c6 100644
>  +buildtest-TESTS: tcpdump
>  +
>  +runtest-PTEST:
> - 	(cd tests && ./TESTrun.sh)
> +	(mkdir -p tests && SRCDIR=`cd ${srcdir}; pwd` && export SRCDIR && $$SRCDIR/tests/TESTrun.sh )
>   
>  +install-ptest:
>  +	cp -r tests                     $(DESTDIR)
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
> index d82c16053..977ab95b7 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
> @@ -1,6 +1,6 @@
> -From a2bfd28034d9aa48d8ff109c1314e53bc9779752 Mon Sep 17 00:00:00 2001
> +From 02085028cdaf075943c27ebc02bb6de0289ec1d3 Mon Sep 17 00:00:00 2001
>  From: Andre McCurdy <armccurdy@gmail.com>
> -Date: Wed, 24 Oct 2018 22:26:08 -0700
> +Date: Wed, 2 Oct 2019 16:43:48 -0400
>  Subject: [PATCH] avoid absolute path when searching for libdlpi
>  
>  Let the build environment control library search paths.
> @@ -8,15 +8,16 @@ Let the build environment control library search paths.
>  Upstream-Status: Inappropriate [OE specific]
>  
>  Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
>  ---
> - configure.in | 2 +-
> + configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
> -diff --git a/configure.in b/configure.in
> -index c882909..52aefd6 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -542,7 +542,7 @@ don't.])
> +diff --git a/configure.ac b/configure.ac
> +index 3401a7a3..6a52485a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -528,7 +528,7 @@ don't.])
>   fi
>   
>   # libdlpi is needed for Solaris 11 and later.
> @@ -26,5 +27,5 @@ index c882909..52aefd6 100644
>   dnl
>   dnl Check for "pcap_list_datalinks()", "pcap_set_datalink()",
>  -- 
> -1.9.1
> +2.17.1
>  
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest b/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
> index c03a8b8ef..2bfb2267d 100755
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
> @@ -1,5 +1,5 @@
>  #!/bin/sh
>  make -k runtest-PTEST | sed -e '/: passed/ s/^/PASS: /g' \
> -			-e '/: failed/ s/^/FAIL: /g' \
> +			-e '/: TEST FAILED.*/ s/^/FAIL: /g' \
>  			-e 's/: passed//g' \
> -			-e 's/: failed//g'
> +			-e 's/: TEST FAILED.*//g'
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> index 69d68baac..8793bf7a3 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> @@ -15,15 +15,16 @@ Upstream-Status: Inappropriate [OE specific]
>  
>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
>  Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
>  ---
> - configure.in | 4 +++-
> + configure.ac | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>  
> -diff --git a/configure.in b/configure.in
> -index b2305a5..c882909 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -418,7 +418,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
> +diff --git a/configure.ac b/configure.ac
> +index 56e2a624..3401a7a3 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -404,7 +404,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
>   AC_SEARCH_LIBS(getrpcbynumber, nsl,
>       AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber()]))
>   
> @@ -35,5 +36,5 @@ index b2305a5..c882909 100644
>   #
>   # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
>  -- 
> -1.9.1
> +2.17.1
>  
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> similarity index 74%
> rename from meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> index 9bd861cd4..3cd12aee7 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> @@ -6,17 +6,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
>  
>  DEPENDS = "libpcap"
>  
> +RDEPENDS_${PN}-ptest += " make perl \
> +	perl-module-file-basename \
> +	perl-module-posix \
> +	perl-module-carp"
> +
>  SRC_URI = " \
>      http://www.tcpdump.org/release/${BP}.tar.gz \
>      file://unnecessary-to-check-libpcap.patch \
>      file://avoid-absolute-path-when-searching-for-libdlpi.patch \
>      file://add-ptest.patch \
>      file://run-ptest \
> -    file://0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch \
>  "
>  
> -SRC_URI[md5sum] = "9bbc1ee33dab61302411b02dd0515576"
> -SRC_URI[sha256sum] = "798b3536a29832ce0cbb07fafb1ce5097c95e308a6f592d14052e1ef1505fe79"
> +SRC_URI[md5sum] = "a4ead41d371f91aa0a2287f589958bae"
> +SRC_URI[sha256sum] = "2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e5151e16559db6410"
>  
>  inherit autotools-brokensep ptest
>  
> @@ -25,6 +29,8 @@ PACKAGECONFIG ?= "openssl"
>  PACKAGECONFIG[libcap-ng] = "--with-cap-ng,--without-cap-ng,libcap-ng"
>  PACKAGECONFIG[openssl] = "--with-crypto,--without-openssl --without-crypto,openssl"
>  PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
> +# Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
> +PACKAGECONFIG[smb] = "--enable-smb,--disable-smb"
>  
>  EXTRA_AUTORECONF += "-I m4"
>  


