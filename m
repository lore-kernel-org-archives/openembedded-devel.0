Return-Path: <prvs=130c1562b=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC3A7ED57
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 05:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1566451759; x=1597987759;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=4V6ANzCLEegBjQvlv8Z0tO8C8Rf1sb0kxG1zHfiGEjI=;
	b=HgRy67tI4VfeiCbo4M/7tEkqeFGB0tKl3hqhFI0oGcFvAjtW5Ocw9LgL
	EiAGm1xp5ZLyfhgBI9cPrMRsLBDdK1uY+UwormvdyHTTE6wYy/Il6h1jB
	EWQZJfs2pxz6DIsS3ZAzS5CaMmfpLKfXz7DVkeT0bS6kfI40QeQDl1cxz
	5vb8W4aBQP2rUVNZmxQaX/qBlS9zyIpfGhQmo9d9zf7jmGRBWAIo6jcVw
	tMam6M2RNGEQGdKBjK4FPVc6Gd32vCrtvfvPCAS/KjWDpSPRH36NrXYmZ
	TMmvuutZxFu90aj/D/SXD8NIKSBavlEjLjUJiL5KhbTg+sZhfvDNaZIlC Q==;
IronPort-SDR: OeOOPFVyYwpfpJqEN7qPLA5e4hdq503H+p9y3+niKmRHSNwBug8E2uCLeHZL0til1b2JaUbBNi
	17ygXttd0ZSH7n/gcdfhaouOTfbAYdEtrUSbfjpn+Ew/5V5H4hYm+/Fj/8gMGtH6TSTPo/ZgMk
	iSYve0GkRTgiaB7/L67TEiQSMgwRcjhwKhimd8hb0Q8tL3BE/a2i1Z7AdDOuwAsLndu5/f94PY
	ok0jSaqz//mZYxRi5tDwyq6tiFRt954lR7a8nBbZqWdts/RxIJQMKm1fwmeAKD0Z2l3SPKOfxV
	Eqg=
X-IronPort-AV: E=Sophos;i="5.64,415,1559512800"; d="scan'208";a="19111523"
To: <openembedded-devel@lists.openembedded.org>,
	<matthias.schoepfer@googlemail.com>, <matthias.schoepfer@ithinx.io>,
	<jacob.kroon@gmail.com>
References: <20190821134646.13589-1-matthias.schoepfer@ithinx.io>
	<13881d01-473f-6551-a5be-756f7063e4e5@gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <ac04e6b1-c277-d12f-1d74-9a8fdf0d3875@skidata.com>
Date: Thu, 22 Aug 2019 07:29:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <13881d01-473f-6551-a5be-756f7063e4e5@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] openjdk-8: fix build on machines with linux kernel 5.0+
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
X-List-Received-Date: Thu, 22 Aug 2019 05:29:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 21/08/2019 16:24, Jacob Kroon wrote:
> On 8/21/19 3:46 PM, Matthias Schoepfer via Openembedded-devel wrote:
>> Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>> ---
>>   .../openjdk-8-release-172b11-common.inc       |  1 +
>>   ...fixing-build-for-kernel-versions-5.x.patch | 27 +++++++++++++++++++
>>   2 files changed, 28 insertions(+)
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch 
>>
>>
>> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc 
>> b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
>> index ad20585..eb7e38a 100644
>> --- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
>> +++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
>> @@ -21,6 +21,7 @@ PATCHES_URI = "\
>>       ${LIBPNG_NEON_PATCH} \
>>       file://handle_extra_output.patch \
>>       file://hotspot-handle-gcc7-format-overflow.patch \
>> +    file://0001-fixing-build-for-kernel-versions-5.x.patch \
>>   "
>>   HOTSPOT_UB_PATCH = "\
>>       file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
>> diff --git 
>> a/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch 
>> b/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch 
>>
>> new file mode 100644
>> index 0000000..9b17b66
>> --- /dev/null
>> +++ 
>> b/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch 
>>
>> @@ -0,0 +1,27 @@
>> +From 51b022bcc596aa85e72e8d8bb93ffc3be843b8b9 Mon Sep 17 00:00:00 2001
>> +From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>> +Date: Wed, 21 Aug 2019 14:33:02 +0200
>> +Subject: [PATCH] fixing build for kernel versions 5.x
>> +
>> +This simply extends the possibility of having a version 5+ linux kernel
>> +
>> +
>> +Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>> +
>> +---
>> + hotspot/make/linux/Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/hotspot/make/linux/Makefile b/hotspot/make/linux/Makefile
>> +index 17c14097..02cb0b33 100644
>> +--- a/hotspot/make/linux/Makefile
>> ++++ b/hotspot/make/linux/Makefile
>> +@@ -233,7 +233,7 @@ checks: check_os_version check_j2se_version
>> + # Solaris 2.5.1, 2.6).
>> + # Disable this check by setting DISABLE_HOTSPOT_OS_VERSION_CHECK=ok.
>> +
>> +-SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4%
>> ++SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4% 5%
>> + OS_VERSION := $(shell uname -r)
>> + EMPTY_IF_NOT_SUPPORTED = $(filter 
>> $(SUPPORTED_OS_VERSION),$(OS_VERSION))
>> +
>>
> 
> This is already fixed in master-next.

True ;-)

> 
> /me wonders when those patches will be merged to master.

If the tests pass, likely today afternoon or tomorrow morning (CET).

regards;Richard.L

> 
> /Jacob

