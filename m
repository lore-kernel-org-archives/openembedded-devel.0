Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CEE5F7D71B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 00:08:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5H07wb3022894
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Jun 2019 17:08:14 -0700
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 16 Jun 2019 17:07:59 -0700
To: akuster808 <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1560475578-28568-1-git-send-email-yi.zhao@windriver.com>
	<dfda746c-9a6c-6d06-8d2a-38256bccb179@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <343ed473-6aa7-b590-0e52-b24cc188764e@windriver.com>
Date: Mon, 17 Jun 2019 08:07:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <dfda746c-9a6c-6d06-8d2a-38256bccb179@gmail.com>
X-Originating-IP: [128.224.162.136]
Subject: Re: [meta-filesystems][PATCH 1/3] fuse: upgrade 2.9.8 -> 2.9.9
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
X-List-Received-Date: Mon, 17 Jun 2019 00:08:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/16/19 2:08 AM, akuster808 wrote:
>
> On 6/13/19 6:26 PM, Yi Zhao wrote:
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> is this a bug fix only update?

I think it is a bug fix release:

https://github.com/libfuse/libfuse/releases/tag/fuse-2.9.9


//Yi

>> ---
>>   .../recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb}             | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-filesystems/recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb} (94%)
>>
>> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
>> similarity index 94%
>> rename from meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
>> rename to meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
>> index caa75c7..c83e7f6 100644
>> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
>> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
>> @@ -16,8 +16,8 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
>>              file://0001-fuse-fix-the-return-value-of-help-option.patch \
>>              file://fuse.conf \
>>   "
>> -SRC_URI[md5sum] = "f365e848a82504edb0b7a33df790ca78"
>> -SRC_URI[sha256sum] = "5e84f81d8dd527ea74f39b6bc001c874c02bad6871d7a9b0c14efb57430eafe3"
>> +SRC_URI[md5sum] = "8000410aadc9231fd48495f7642f3312"
>> +SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
>>   
>>   UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
>>   UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
>

