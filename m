Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E314B60778
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 22:32:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wACMWT4K023870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 14:32:30 -0800 (PST)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 12 Nov 2018 14:32:29 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <20181112211459.26202-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <0a3a1a79-4593-1cb7-8edf-6227918068e2@windriver.com>
Date: Mon, 12 Nov 2018 17:32:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181112211459.26202-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [meta-oe][PATCH] stress-ng: Upgrade from 0.09.37 to 0.09.45
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
X-List-Received-Date: Mon, 12 Nov 2018 22:32:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 11/12/18 4:14 PM, Randy MacLeod wrote:
> Drop the upstreamed patch:
>     0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
> Rebase other patches except for the stress-malloc.c change
> which has made it upstream:
>     c3a2e662 stress-malloc: use HAVE_MALLOPT check for mallopt glibc function
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   ...force-sync-after-build-in-case-reboo.patch | 21 +++++----
>   ...01-Several-changes-to-fix-musl-build.patch | 47 ++++++++-----------
>   ...-don-t-enable-TARGET_CLONES-for-musl.patch | 30 ------------
>   ...ess-ng_0.09.37.bb => stress-ng_0.09.45.bb} |  6 +--
>   4 files changed, 34 insertions(+), 70 deletions(-)
>   delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
>   rename meta-oe/recipes-test/stress-ng/{stress-ng_0.09.37.bb => stress-ng_0.09.45.bb} (78%)

...

> +SRC_URI[md5sum] = "b03744c2eb68bf7e9a300e78e397f348"
> +SRC_URI[sha256sum] = "0741e3004bf590bb7af3db979a46fe89bee7aaad6065cd1d87d0b7fa49046cb2"
>   
>   UPSTREAM_CHECK_URI ?= "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/"
>   UPSTREAM_CHECK_REGEX ?= "(?P<pver>\d+(\.\d+)+)\.tar"
> 


Builds fine for all qemu machines for glibc and musl,
except for qemuarm/musl which fails to build due to:

| CC stress-nop.c
| CC stress-null.c
| stress-fp-error.c: In function 'stress_fp_error':
| stress-fp-error.c:98:10: error: 'FE_INVALID' undeclared (first use in 
this function); did you mean 'EINVAL'?
|     EDOM, FE_INVALID);
|           ^~~~~~~~~~
|           EINVAL
| stress-fp-error.c:98:10: note: each undeclared identifier is reported 
only once for each function it appears in
| stress-fp-error.c:104:12: error: 'FE_DIVBYZERO' undeclared (first use 
in this function); did you mean 'FP_ZERO'?
|     ERANGE, FE_DIVBYZERO);
|             ^~~~~~~~~~~~
|             FP_ZERO
| CC stress-oom-pipe.c
| stress-fp-error.c:139:7: error: 'FE_INEXACT' undeclared (first use in 
this function); did you mean 'AF_INET'?
|     0, FE_INEXACT);
|        ^~~~~~~~~~


I'm not sure how to handle that since in the source file,
there does seem to be a guard already:

#if defined(EDOM)
                 stress_fp_clear_error();
                 stress_fp_check(args, "log(-1.0)", log(-1.0), NAN,
                         EDOM, FE_INVALID);
#endif

but clearly EDOM is defined for qemuarm.
Should I stub out the whole body of the function:
stress_fp_error() if FE_INVALID isn't defined?

Any better ideas?


Oh and stress-ng runs fine for both glibc/musl in qemux86-64.

../Randy



-- 
# Randy MacLeod
# Wind River Linux

