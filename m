Return-Path: <Hongjun.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB85D60097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 07:16:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M7GVZY000767
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 00:16:31 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 22 Oct 2014 00:16:30 -0700
Message-ID: <544759CD.6000102@windriver.com>
Date: Wed, 22 Oct 2014 15:16:29 +0800
From: Yang Hongjun <Hongjun.Yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1413960967-6653-1-git-send-email-Hongjun.Yang@windriver.com>
In-Reply-To: <1413960967-6653-1-git-send-email-Hongjun.Yang@windriver.com>
Subject: Re: [meta-networking][PATCH] tcpdump: Add ptest
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
X-List-Received-Date: Wed, 22 Oct 2014 07:16:36 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

some path of this patch is wrong, I will send the new patch later.

On 2014年10月22日 14:56, Hongjun Yang wrote:
> From: "Hongjun.Yang" <hongjun.yang@windriver.com>
>
> Add ptest supports for tcpdump
>
> Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
>
> ---
>   .../tcpdump/tcpdump-4.6.1/add-ptest.patch          | 38 ++++++++++++++++++++++
>   .../tcpdump/tcpdump-4.6.1/run-ptest                |  5 +++
>   .../recipes-support/tcpdump/tcpdump_4.6.1.bb       |  4 ++-
>   3 files changed, 46 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/add-ptest.patch
>   create mode 100755 meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/run-ptest
>
> diff --git a/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/add-ptest.patch b/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/add-ptest.patch
> new file mode 100644
> index 0000000..ab0312e
> --- /dev/null
> +++ b/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/add-ptest.patch
> @@ -0,0 +1,38 @@
> +From 7b259580800e259d232229dc89f97058b56e2fe8 Mon Sep 17 00:00:00 2001
> +From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> +Date: Wed, 22 Oct 2014 10:02:48 +0800
> +Subject: [PATCH] Add ptest for tcpdump
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
> +---
> + Makefile.in | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 8c35a45..4fb8ae6 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -428,9 +428,17 @@ distclean:
> + 	    tests/failure-outputs.txt
> + 	rm -rf autom4te.cache tests/DIFF tests/NEW
> +
> +-check: tcpdump
> ++buildtest-TESTS: tcpdump
> ++
> ++runtest-PTEST:
> + 	(cd tests && ./TESTrun.sh)
> +
> ++install-ptest:
> ++	cp -r tests			$(DESTDIR)
> ++	cp -r config.h			$(DESTDIR)
> ++	install -m 0755 Makefile 	$(DESTDIR)
> ++	ln -sf /usr/sbin/tcpdump	$(DESTDIR)/tcpdump
> ++
> + tags: $(TAGFILES)
> + 	ctags -wtd $(TAGFILES)
> +
> +--
> +1.9.1
> +
> diff --git a/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/run-ptest b/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/run-ptest
> new file mode 100755
> index 0000000..c03a8b8
> --- /dev/null
> +++ b/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +make -k runtest-PTEST | sed -e '/: passed/ s/^/PASS: /g' \
> +			-e '/: failed/ s/^/FAIL: /g' \
> +			-e 's/: passed//g' \
> +			-e 's/: failed//g'
> diff --git a/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb b/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> index 58bcb98..ddf0052 100644
> --- a/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> +++ b/meta-networking/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
> @@ -11,12 +11,14 @@ SRC_URI = " \
>       file://unnecessary-to-check-libpcap.patch \
>       file://tcpdump-configure-dlpi.patch \
>       file://tcpdump-cross-getaddrinfo.patch \
> +    file://add-ptest.patch \
> +    file://run-ptest \
>   "
>   SRC_URI[md5sum] = "dab267ec30216a069747d10314079ec7"
>   SRC_URI[sha256sum] = "4c88c2a9aeb4047074f344fc9b2b6577b219972d359e192f6d12ccf983a13fd7"
>   export LIBS=" -lpcap"
>   
> -inherit autotools-brokensep
> +inherit autotools-brokensep ptest
>   CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
>   
>   PACKAGECONFIG ??= "openssl ipv6"


