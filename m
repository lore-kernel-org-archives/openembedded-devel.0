Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.9818.1613843937408501056
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 09:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m7lNoy2O;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id t11so7450003pgu.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=X98DFxtTnce7e/6HS4HNowHi+m/1kh8L8XdKoh7oxOk=;
        b=m7lNoy2OwESd0iTXn3efddqhiKEl9bDS16Ah8OtOsdwa2njGYoytIpmyH6Y056y2Ws
         DLOHBf9X2TVjbHwhcWfFchfH/yYZS64qL1FHsjtmJD4Xl8T36NTlzeV0HX/mC9Carn//
         pbfAvsP8LkAhBuPiJzURGM0/+HxW0ohxYMua8eYoaVF+qeSSzGX2ZiwlUb8oisKHRpIo
         0akSUTDXkctaRWCV+pY6XRf/n+QComvfTNA2q62l09bRTmnsmJfPhg4knKsWiVAoPQ4q
         fi85YIUJuh3bpdD0e0yjayXplfg7WTqzRUWAIDkIQLhExyjqDsJyffhjyRA5Mfk8TVT1
         fysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=X98DFxtTnce7e/6HS4HNowHi+m/1kh8L8XdKoh7oxOk=;
        b=qqnCqBFjnj75LH1j96PiItYibzG7/Y5jYuseGcYSarpOT3xqrXpj9lZijltSBkxwrU
         dCfCHNDS1dpEtjQjB0Z8farKoLhnHu6g/04mAH0TWLN9m1jZmuHxto5Iyib76VKt2clP
         rdlhROurFex+RgmRIxk64Bqs/0+eFierq57gjrZ1uRpUs0yILvDDy0d3RcYZdFklasGx
         ZGTryirYD5S+KVcObsnRGrzMbRcag2ftlsSgBwGigzueWUHjNtovOYAdr5eNByEwSD1Z
         jCxn5IdctDTqb4DHfcrVQc+Bwwc01b/UFh90kh1sK17mlnAIFLS32lyxltRJv3Vkfaja
         iIkg==
X-Gm-Message-State: AOAM533G7fcssC32W8ggUBgGE7oPfID6FPxTUpauOKKQGgD88AClNLi+
	SOC2fD3LUP1lTg4Q83GGYeVqfLa1x5cZKQ==
X-Google-Smtp-Source: ABdhPJyO3T4H+FgAUn1HZ3xdGDJSpuvUyFLw9hCja945O0ijTQPKps7q/yqbdCRzLmT1qEk70ZveYA==
X-Received: by 2002:a63:4b21:: with SMTP id y33mr13296737pga.73.1613843936537;
        Sat, 20 Feb 2021 09:58:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:70a2:885b:8c45:14d6? ([2601:202:4180:a5c0:70a2:885b:8c45:14d6])
        by smtp.gmail.com with ESMTPSA id js15sm4555965pjb.37.2021.02.20.09.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 09:58:56 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] tcpdump: update 4.9.3 -> 4.99.0
To: Yi Fan Yu <yifan.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210220031725.10051-1-yifan.yu@windriver.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <811a2c42-b427-7001-59e6-c0c31c3b02b3@gmail.com>
Date: Sat, 20 Feb 2021 09:58:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210220031725.10051-1-yifan.yu@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/19/21 7:17 PM, Yi Fan Yu wrote:
> Removed patches:
>     * avoid-absolute-path-when-searching-for-libdlpi.patch
>     reason: this is a solaris specific patch,
>             It no longer generates QA error.
>
>     * unnecessary-to-check-libpcap.patch
>     reason: upstream changed the logic, a new patch was needed.
>
> New patch:
>     * 0001-aclocal.m4-Skip-checking-for-pcap-config.patch
>     reason: configure shouldn't look for pcap-config.
>     upstream reference: cfc4c750a
>
> Modified patch:
>     * add-ptest.patch
>     reason: Makefile had slight change.
>             new unrelated perl script was introduced,
>             removed to make package QA happy.
>
> License:
>     upstream removed some whitespace
>
> Ptest:
>     binaries are now present in /usr/bin not /usr/sbin
>         upstream commit: 95096be4f
>     add perl libraries dependencies
>
>     tests passed: 571 (qemux86-64)
>     tests failed: 0

Thanks for providing this additional information.  Great to see the
ptest baseline.

-armin
>
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>  ...ping-don-t-allocate-a-too-large-buff.patch | 70 -------------------
>  ...cal.m4-Skip-checking-for-pcap-config.patch | 33 +++++++++
>  .../tcpdump/tcpdump/add-ptest.patch           | 28 +++++---
>  ...lute-path-when-searching-for-libdlpi.patch | 31 --------
>  .../unnecessary-to-check-libpcap.patch        | 40 -----------
>  .../{tcpdump_4.9.3.bb => tcpdump_4.99.0.bb}   | 23 +++---
>  6 files changed, 67 insertions(+), 158 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
>  create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch
>  delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
>  delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.3.bb => tcpdump_4.99.0.bb} (67%)
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
> deleted file mode 100644
> index 9b74e00c5..000000000
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 32027e199368dad9508965aae8cd8de5b6ab5231 Mon Sep 17 00:00:00 2001
> -From: Guy Harris <guy@alum.mit.edu>
> -Date: Sat, 18 Apr 2020 14:04:59 -0700
> -Subject: [PATCH] PPP: When un-escaping, don't allocate a too-large buffer.
> -
> -The buffer should be big enough to hold the captured data, but it
> -doesn't need to be big enough to hold the entire on-the-network packet,
> -if we haven't captured all of it.
> -
> -(backported from commit e4add0b010ed6f2180dcb05a13026242ed935334)
> -
> -Upstream-Status: Backport
> -Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
> -
> ----
> - print-ppp.c | 18 ++++++++++++++----
> - 1 file changed, 14 insertions(+), 4 deletions(-)
> -
> -diff --git a/print-ppp.c b/print-ppp.c
> -index 89176172..33fb0341 100644
> ---- a/print-ppp.c
> -+++ b/print-ppp.c
> -@@ -1367,19 +1367,29 @@ trunc:
> - 	return 0;
> - }
> - 
> -+/*
> -+ * Un-escape RFC 1662 PPP in HDLC-like framing, with octet escapes.
> -+ * The length argument is the on-the-wire length, not the captured
> -+ * length; we can only un-escape the captured part.
> -+ */
> - static void
> - ppp_hdlc(netdissect_options *ndo,
> -          const u_char *p, int length)
> - {
> -+	u_int caplen = ndo->ndo_snapend - p;
> - 	u_char *b, *t, c;
> - 	const u_char *s;
> --	int i, proto;
> -+	u_int i;
> -+	int proto;
> - 	const void *se;
> - 
> -+	if (caplen == 0)
> -+		return;
> -+
> -         if (length <= 0)
> -                 return;
> - 
> --	b = (u_char *)malloc(length);
> -+	b = (u_char *)malloc(caplen);
> - 	if (b == NULL)
> - 		return;
> - 
> -@@ -1388,10 +1398,10 @@ ppp_hdlc(netdissect_options *ndo,
> - 	 * Do this so that we dont overwrite the original packet
> - 	 * contents.
> - 	 */
> --	for (s = p, t = b, i = length; i > 0 && ND_TTEST(*s); i--) {
> -+	for (s = p, t = b, i = caplen; i != 0; i--) {
> - 		c = *s++;
> - 		if (c == 0x7d) {
> --			if (i <= 1 || !ND_TTEST(*s))
> -+			if (i <= 1)
> - 				break;
> - 			i--;
> - 			c = *s++ ^ 0x20;
> --- 
> -2.17.1
> -
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch
> new file mode 100644
> index 000000000..bb56c4d4c
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch
> @@ -0,0 +1,33 @@
> +From 867bf5c9d0fb64e1b4e64cb13b983674c270a6bf Mon Sep 17 00:00:00 2001
> +From: Yi Fan Yu <yifan.yu@windriver.com>
> +Date: Fri, 19 Feb 2021 00:52:35 -0500
> +Subject: [PATCH] aclocal.m4: Skip checking for pcap-config
> +
> +Bitbake triggers an configure error
> +saying we should look for pkg-config instead.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> +---
> + aclocal.m4 | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/aclocal.m4 b/aclocal.m4
> +index bd4e27a5..136cb8ca 100644
> +--- a/aclocal.m4
> ++++ b/aclocal.m4
> +@@ -584,8 +584,8 @@ AC_DEFUN(AC_LBL_LIBPCAP,
> +             # No pkg-config
> +             # Look for an installed pcap-config.
> +             #
> +-            AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
> +-            if test -n "$PCAP_CONFIG" ; then
> ++            # AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
> ++            if false; then
> +                 #
> +                 # Found - use it to get the include flags for
> +                 # libpcap and the flags to link with libpcap.
> +-- 
> +2.29.2
> +
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> index f8ff354fe..c46de4b96 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> @@ -1,6 +1,6 @@
> -From 8c9c728757f89ebe6c4019114b83a63c63596f69 Mon Sep 17 00:00:00 2001
> -From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> -Date: Wed, 2 Oct 2019 16:57:06 -0400
> +From 5f0f70192b0e20336e642b02ca9662ba2fef66cf Mon Sep 17 00:00:00 2001
> +From: Yi Fan Yu <yifan.yu@windriver.com>
> +Date: Fri, 19 Feb 2021 15:21:18 -0500
>  Subject: [PATCH] Add ptest for tcpdump
>  
>  Upstream-Status: Pending
> @@ -8,15 +8,21 @@ Upstream-Status: Pending
>  Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
>  Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
>  
> +remove perl script not required by ptest causing QA problems
> +
> +reference upstream issue/commit:
> +https://github.com/the-tcpdump-group/tcpdump/issues/26
> +
> +Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>  ---
> - Makefile.in | 10 +++++++++-
> - 1 file changed, 9 insertions(+), 1 deletion(-)
> + Makefile.in | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
>  
>  diff --git a/Makefile.in b/Makefile.in
> -index 3b589184..7b10e38c 100644
> +index ea1ef1d0..e7987bd8 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -437,9 +437,17 @@ distclean:
> +@@ -445,9 +445,18 @@ distclean:
>   	    tests/failure-outputs.txt
>   	rm -rf autom4te.cache tests/DIFF tests/NEW
>   
> @@ -24,14 +30,18 @@ index 3b589184..7b10e38c 100644
>  +buildtest-TESTS: tcpdump
>  +
>  +runtest-PTEST:
> -	(mkdir -p tests && SRCDIR=`cd ${srcdir}; pwd` && export SRCDIR && $$SRCDIR/tests/TESTrun.sh )
> + 	$(srcdir)/tests/TESTrun
>   
>  +install-ptest:
>  +	cp -r tests                     $(DESTDIR)
> ++	rm $(DESTDIR)/tests/setkey2esp-secrets.pl
>  +	cp -r config.h                  $(DESTDIR)
>  +	install -m 0755 Makefile        $(DESTDIR)
> -+	ln -sf /usr/sbin/tcpdump        $(DESTDIR)/tcpdump
> ++	ln -s /usr/bin/tcpdump          $(DESTDIR)/tcpdump
>  +
>   extags: $(TAGFILES)
>   	ctags $(TAGFILES)
>   
> +-- 
> +2.29.2
> +
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
> deleted file mode 100644
> index 977ab95b7..000000000
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 02085028cdaf075943c27ebc02bb6de0289ec1d3 Mon Sep 17 00:00:00 2001
> -From: Andre McCurdy <armccurdy@gmail.com>
> -Date: Wed, 2 Oct 2019 16:43:48 -0400
> -Subject: [PATCH] avoid absolute path when searching for libdlpi
> -
> -Let the build environment control library search paths.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> -Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 3401a7a3..6a52485a 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -528,7 +528,7 @@ don't.])
> - fi
> - 
> - # libdlpi is needed for Solaris 11 and later.
> --AC_CHECK_LIB(dlpi, dlpi_walk, LIBS="$LIBS -ldlpi" LDFLAGS="-L/lib $LDFLAGS", ,-L/lib)
> -+AC_CHECK_LIB(dlpi, dlpi_walk, LIBS="$LIBS -ldlpi")
> - 
> - dnl
> - dnl Check for "pcap_list_datalinks()", "pcap_set_datalink()",
> --- 
> -2.17.1
> -
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> deleted file mode 100644
> index 8793bf7a3..000000000
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From dd023c133980fcc0cff5896e85377675e0571894 Mon Sep 17 00:00:00 2001
> -From: Roy Li <rongqing.li@windriver.com>
> -Date: Tue, 8 Jul 2014 13:20:47 +0800
> -Subject: [PATCH] unnecessary to check libpcap
> -
> -since the check of libpcap did not consider the cross-compile, lead to the
> -below error:
> -	This autoconf log indicates errors, it looked at host include and/or
> -	library paths while determining system capabilities.
> -
> -In fact, the libpcap has been added into the tcpdump's DEPENDS, not need to
> -check if libpcap existed.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> -Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
> ----
> - configure.ac | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 56e2a624..3401a7a3 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -404,7 +404,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
> - AC_SEARCH_LIBS(getrpcbynumber, nsl,
> -     AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber()]))
> - 
> --AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
> -+# Simplified (more cross compile friendly) check for libpcap. All we really
> -+# need is to sanity check that libpcap is available and add -lpcap to LIBS.
> -+AC_CHECK_LIB(pcap, pcap_compile, LIBS="$LIBS -lpcap")
> - 
> - #
> - # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
> --- 
> -2.17.1
> -
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb
> similarity index 67%
> rename from meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb
> index afcb4d508..66510b7fd 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb
> @@ -2,26 +2,33 @@ SUMMARY = "A sophisticated network protocol analyzer"
>  HOMEPAGE = "http://www.tcpdump.org/"
>  SECTION = "net"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453"
>  
>  DEPENDS = "libpcap"
>  
>  RDEPENDS_${PN}-ptest += " make perl \
>  	perl-module-file-basename \
> +	perl-module-file-spec \
> +	perl-module-file-spec-unix \
> +	perl-module-file-path \
> +	perl-module-file-glob \
> +	perl-module-data-dumper \
> +	perl-module-bytes \
>  	perl-module-posix \
> -	perl-module-carp"
> +	perl-module-carp \
> +	perl-module-cwd \
> +    perl-module-constant \
> +"
>  
>  SRC_URI = " \
>      http://www.tcpdump.org/release/${BP}.tar.gz \
> -    file://unnecessary-to-check-libpcap.patch \
> -    file://avoid-absolute-path-when-searching-for-libdlpi.patch \
>      file://add-ptest.patch \
>      file://run-ptest \
> -    file://0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch \
> +    file://0001-aclocal.m4-Skip-checking-for-pcap-config.patch \
>  "
>  
> -SRC_URI[md5sum] = "a4ead41d371f91aa0a2287f589958bae"
> -SRC_URI[sha256sum] = "2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e5151e16559db6410"
> +SRC_URI[md5sum] = "b10aa2f497def7283bc060f626879ce5"
> +SRC_URI[sha256sum] = "8cf2f17a9528774a7b41060323be8b73f76024f7778f59c34efa65d49d80b842"
>  
>  UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
>  
> @@ -46,7 +53,7 @@ do_configure_prepend() {
>  
>  do_install_append() {
>      # make install installs an unneeded extra copy of the tcpdump binary
> -    rm -f ${D}${sbindir}/tcpdump.${PV}
> +    rm ${D}${bindir}/tcpdump.${PV}
>  }
>  
>  do_compile_ptest() {
>
> 
>

