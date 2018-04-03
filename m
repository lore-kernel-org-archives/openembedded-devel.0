Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCF274A6C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 23:19:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 16:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,403,1517904000"; d="scan'208";a="188427575"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO [10.255.134.23])
	([10.255.134.23])
	by orsmga004.jf.intel.com with ESMTP; 03 Apr 2018 16:19:11 -0700
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-devel@lists.openembedded.org
References: <1522796439-37319-1-git-send-email-denis@denix.org>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <ba82469b-4003-a312-9a47-b034ac18712b@intel.com>
Date: Wed, 4 Apr 2018 07:19:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522796439-37319-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] iperf3: refresh local patches to avoid fuzz warnings
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
X-List-Received-Date: Tue, 03 Apr 2018 23:19:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/04/2018 07:00 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...nclude-stdint.h-for-various-std-c99-int-types.patch | 16 +++++++---------
>  .../iperf3/0002-Remove-pg-from-profile_CFLAGS.patch    | 12 +++++-------
>  .../iperf3/iperf3/automake-foreign.patch               | 18 ++++++++++++++----
>  3 files changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
> index ae36208..3db188f 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
> @@ -1,21 +1,22 @@
> -From be653711fb92d2430b3ecc546b4e3ad927d19ec5 Mon Sep 17 00:00:00 2001
> +From b26687cfe958c6be009717a6267da403cb802197 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 14 Jul 2017 12:59:42 -0700
> -Subject: [PATCH 1/2] include stdint.h for various std c99 int types
> +Subject: [PATCH] include stdint.h for various std c99 int types
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
>   src/cjson.h | 2 ++
>   src/timer.h | 1 +
>   2 files changed, 3 insertions(+)
>  
>  diff --git a/src/cjson.h b/src/cjson.h
> -index fb8cd3b..69cd272 100644
> +index fa7cb73..41a41dd 100644
>  --- a/src/cjson.h
>  +++ b/src/cjson.h
> -@@ -23,6 +23,8 @@
> - #ifndef cJSON__h
> - #define cJSON__h
> +@@ -28,6 +28,8 @@
> + #include <stdint.h>
> + #endif
>   
>  +#include <stdint.h>
>  +

This patch should probably be removed now since it's now just adding
stdint.h twice. Upstream has fixed this.

