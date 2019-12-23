Return-Path: <Quanyang.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AAF077F59D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 08:10:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBN8Ar9V017263
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 23 Dec 2019 00:10:53 -0800 (PST)
Received: from [128.224.162.199] (128.224.162.199) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 23 Dec 2019 00:10:52 -0800
To: Adrian Bunk <bunk@stusta.de>
References: <20191223071421.24530-1-quanyang.wang@windriver.com>
	<20191223075236.GA16532@localhost>
From: Quanyang Wang <quanyang.wang@windriver.com>
Message-ID: <410bad56-529c-fd07-c9f5-4419b9827211@windriver.com>
Date: Mon, 23 Dec 2019 16:10:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191223075236.GA16532@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] glog: fix do_fetch error
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
X-List-Received-Date: Mon, 23 Dec 2019 08:10:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Adrian,

On 12/23/19 3:52 PM, Adrian Bunk wrote:
> On Mon, Dec 23, 2019 at 03:14:21PM +0800, quanyang.wang@windriver.com wrote:
>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>
>> This fixes the build error as below:
>> WARNING: glog-0.3.5-r0 do_fetch: Failed to fetch URL git://github.com/google/glog.git;branch=v035, attempting MIRRORS if available
>> ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure: Unable to find revision a6a166db069520dbbd653c97c2e5b12e08a8bb26 in branch v035 even from upstream
>> ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure for URL: 'git://github.com/google/glog.git;branch=v035'. Unable to fetch URL from any source.
>> ...
>> --- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
>> +++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
>> @@ -9,14 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
>>   DEPENDS = "libunwind"
>>   
>>   SRC_URI = " \
>> -    git://github.com/google/glog.git;branch=v035 \
>> +    git://github.com/google/glog.git;nobranch=1;tag=v0.3.5 \
>> ...
>> -SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
>> ...
> Please continue using SRCREV instead of tag.

OK. Will send a V2 patch to fix it.

Thanks,

Quanyang

>
> Upstream could move a tag to a different commit, or someone could
> do a man-in-the middle attack providing anything under this tag.
>
> cu
> Adrian

