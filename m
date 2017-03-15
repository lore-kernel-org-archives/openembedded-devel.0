Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A512C73075
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 02:32:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2F2VPFL022375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Mar 2017 19:31:26 -0700
Received: from [128.224.162.185] (128.224.162.185) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 19:31:24 -0700
To: Denys Dmytriyenko <denis@denix.org>
References: <20170313032921.8669-1-kai.kang@windriver.com>
	<20170313032921.8669-2-kai.kang@windriver.com>
	<20170314184552.GL15664@denix.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <d31d1a21-39c9-b680-8e79-1efe6fe3b271@windriver.com>
Date: Wed, 15 Mar 2017 10:29:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170314184552.GL15664@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/5] fuse: update HOMEPAGE and SRC_URI
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
X-List-Received-Date: Wed, 15 Mar 2017 02:32:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年03月15日 02:45, Denys Dmytriyenko wrote:
> On Mon, Mar 13, 2017 at 11:29:17AM +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> The homepage of fuse is redirected to github. So update HOMEPAGE and
>> SRC_URI.
>>
>> Correct license LGPLv2 with LGPLv2.1 at same time.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
>> index 153fcb4..b34efa1 100644
>> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
>> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
>> @@ -4,13 +4,13 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
>>                  also aims to provide a secure method for non privileged users to \
>>                  create and mount their own filesystem implementations. \
>>                 "
>> -HOMEPAGE = "http://fuse.sf.net"
>> +HOMEPAGE = "https://github.com/libfuse/libfuse"
>>   SECTION = "libs"
>> -LICENSE = "GPLv2 & LGPLv2"
>> +LICENSE = "GPLv2 & LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>                       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>>   
>> -SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
>> +SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse_2_9_4/${BP}.tar.gz \
> Can you use ${@d.getVar('PV').replace('.', '_')} in the path here ^^^^^^^^^
> Similar to what you did in lmsensors...

Thanks for your comment. But Martin said that it should use git rather 
than tar ball which may be regenerated and checksum changes on github.
I am planning replace it with _git version.


Regards,
Kai

>
>
>>              file://gold-unversioned-symbol.patch \
>>              file://aarch64.patch \
>>              file://0001-fuse-fix-the-return-value-of-help-option.patch \
>> -- 
>> 2.10.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Regards,
Neil | Kai Kang


