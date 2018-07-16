Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D302C6E616
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 07:11:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2018 00:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,360,1526367600"; d="scan'208";a="57971630"
Received: from pbbalakr-mobl.gar.corp.intel.com (HELO [10.255.174.241])
	([10.255.174.241])
	by orsmga006.jf.intel.com with ESMTP; 16 Jul 2018 00:11:16 -0700
To: mingli.yu@windriver.com, openembedded-devel@lists.openembedded.org
References: <20180716053602.14820-1-mingli.yu@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <ee78bb47-93a1-c8c3-5ab6-2cd9bdae0d17@intel.com>
Date: Mon, 16 Jul 2018 15:11:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180716053602.14820-1-mingli.yu@windriver.com>
Subject: Re: [meta-oe][PATCH] bonnie++: Upgrade to 1.04
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
X-List-Received-Date: Mon, 16 Jul 2018 07:11:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/16/2018 01:36 PM, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../bonnie/{bonnie++_1.03e.bb => bonnie++_1.04.bb}         | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-benchmark/bonnie/{bonnie++_1.03e.bb => bonnie++_1.04.bb} (73%)
> 
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
> similarity index 73%
> rename from meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> rename to meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
> index 2c1217e34..d7583f076 100644
> --- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
> @@ -4,11 +4,10 @@ SECTION = "benchmark/tests"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
>  
> -SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
> -           file://gcc-4.3-fixes.patch \
> +SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}_${PV}.tgz \
>  "

Should the patch file itself be deleted too?

Thanks,

Anuj

