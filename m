Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 863A074A78
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 23:25:13 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id x4-v6so11269013pln.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 16:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kvmBfJrVgC8Q3lTy5WiQdYWLSIfc3+1XCffyo58Jenc=;
	b=tChcTQkcTCXgADouhrhmFay+GiGXrRBp6jwovhSwkLu2WQ5hjc4ms0USGTzOcsCrda
	7hjI37fl8aX5D1vGYy1t8o24+Nemr9gp2JYv/+XKhGzGW+xn7WyqndVMKZscuqrmWF+b
	GFI/SLTufSQ+PXp/qxMIptiChu1zSUMTnbuJxWNphU/W0FbYESkwQ8pn/bNKfNLOjFlk
	90+9dSsml2WcDOUoot5oSwij0KTp9NCOl4a+6FRhbi1aqWSnWVnWYdWC+ZhPSH6sUjf2
	k9RQA5eEMUtLfrY1Q4iw14ZwOe/xBZJS00cXy6n/RIdxmyKAhDPlaHP7gOg259HQCMSQ
	KxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=kvmBfJrVgC8Q3lTy5WiQdYWLSIfc3+1XCffyo58Jenc=;
	b=JV3bqWyXXuilBVBfV/0Mo8jLLNYZzg9MSUSKdkbJyFxwLe4Oymq/ZMLeALHwXjay/e
	tEOpHbSXzwD7hqKJoXKyU/73SUKcYEYLh4llbvufT24weKPnfhjPTcioAlVWoMTbKBcW
	xNtU2u73vOEiiuO+WlFJdGiGBr5OF84FdfedFFL+K71CIHJbeP52TjG+swXnnluY+n1y
	WNupLg4edM5J6cINmddYQzPTJdR7p1h5KFqMahIb8o9/rByCCsQFGhoRdWnUMHUUQzx5
	wz6wkFBNQjXeJbhuvU9WhqT6m1kWhHCkcj3iblSwZqCVQxHESyEOkDH9swSW7eCXugL0
	p9iQ==
X-Gm-Message-State: AElRT7FVKJscqRHfvxIVZyD2eYi2rC133N67+YnaogJQPbBAQ9c4Xn7M
	EVnlYOR9KHWPYvEBLZHAXFg=
X-Google-Smtp-Source: AIpwx4+PqJOUNyoSUu69zEAd69HbyuHw09UVfmMNbWGbPUvvlf9IKUSHMDaeLKsChimqbAgQpAnXPQ==
X-Received: by 10.99.115.69 with SMTP id d5mr10410279pgn.289.1522797914547;
	Tue, 03 Apr 2018 16:25:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a4f3:7c10:9123:63ea?
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id r11sm8453421pfg.0.2018.04.03.16.25.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Apr 2018 16:25:14 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-devel@lists.openembedded.org
References: <1522796604-38261-1-git-send-email-denis@denix.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; keydata=
	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
	8CS2NxU=
Message-ID: <f74a3d7c-ba09-8aa6-9ec1-d55022e6ecb3@gmail.com>
Date: Tue, 3 Apr 2018 16:25:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1522796604-38261-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-networking][PATCH] tcpdump: refresh local patches to avoid fuzz warnings
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
X-List-Received-Date: Tue, 03 Apr 2018 23:25:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/03/2018 04:03 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
at fix like this is in master-next already.

- armin
>  .../recipes-support/tcpdump/tcpdump/add-ptest.patch   | 13 +++++++------
>  .../tcpdump/unnecessary-to-check-libpcap.patch        | 19 ++++++++++---------
>  2 files changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> index 196cec7..7a02155 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
> @@ -1,4 +1,4 @@
> -From 7b259580800e259d232229dc89f97058b56e2fe8 Mon Sep 17 00:00:00 2001
> +From 09c310b48f73b62dc6673ce0bdfc638d9ae4bbda Mon Sep 17 00:00:00 2001
>  From: "Hongjun.Yang" <hongjun.yang@windriver.com>
>  Date: Wed, 22 Oct 2014 10:02:48 +0800
>  Subject: [PATCH] Add ptest for tcpdump
> @@ -6,15 +6,16 @@ Subject: [PATCH] Add ptest for tcpdump
>  Upstream-Status: Pending
>  
>  Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
> +
>  ---
>   Makefile.in | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>  
> -Index: tcpdump-4.9.0/Makefile.in
> -===================================================================
> ---- tcpdump-4.9.0.orig/Makefile.in
> -+++ tcpdump-4.9.0/Makefile.in
> -@@ -436,9 +436,17 @@ distclean:
> +diff --git a/Makefile.in b/Makefile.in
> +index 0941f0e..3ce40c6 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -437,9 +437,17 @@ distclean:
>   	    tests/failure-outputs.txt
>   	rm -rf autom4te.cache tests/DIFF tests/NEW
>   
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> index d7a3ac2..c70404c 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
> @@ -1,4 +1,7 @@
> -unnecessary to check libpcap
> +From 66ee5c0d49c3e4a67cd9a691c1313e4a02eafa59 Mon Sep 17 00:00:00 2001
> +From: Roy Li <rongqing.li@windriver.com>
> +Date: Tue, 8 Jul 2014 13:20:47 +0800
> +Subject: [PATCH] unnecessary to check libpcap
>  
>  Upstream-Status: Pending
>  
> @@ -11,23 +14,21 @@ In fact, the libpcap has been added into the tcpdump's DEPENDS, not need to
>  check if libpcap existed.
>  
>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +
>  ---
> - configure.in |    2 +-
> + configure.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/configure.in b/configure.in
> -index 06fade1..9125de7 100644
> +index b2305a5..b3b5dbf 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -567,7 +567,7 @@ AC_SEARCH_LIBS(getrpcbynumber, nsl,
> - dnl AC_CHECK_LIB(z, uncompress)
> - dnl AC_CHECK_HEADERS(zlib.h)
> +@@ -418,7 +418,7 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
> + AC_SEARCH_LIBS(getrpcbynumber, nsl,
> +     AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber()]))
>   
>  -AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
>  +#AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
>   
>   #
>   # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
> --- 
> -1.7.9.5
> -


