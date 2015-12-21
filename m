Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B35876FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 06:04:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBL64txn009032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2015 22:04:55 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 20 Dec 2015 22:04:55 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
	<1449130728-4066-5-git-send-email-kai.kang@windriver.com>
	<20151218162211.GA2556@jama>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56779688.8020604@windriver.com>
Date: Mon, 21 Dec 2015 14:04:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151218162211.GA2556@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 4/4] meta-networking: depends on layer meta-perl
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
X-List-Received-Date: Mon, 21 Dec 2015 06:04:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年12月19日 00:22, Martin Jansa wrote:
> On Thu, Dec 03, 2015 at 04:18:48PM +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Package mime-construct in layer meta-networking depends on some perl
>> modules in layer meta-perl. So make meta-networking depends on layer
>> meta-perl.
> Cannot we move mime-construct to meta-perl instead?
>
> It doesn't have any dependencies provided by meta-networking and also
> nothing in meta-networking is using mime-construct.

It is ok for me.  I'll move it to meta-perl and revert the layer 
dependency commit.

Thanks,
Kai

>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-networking/conf/layer.conf | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
>> index 63bb07d..b7fc183 100644
>> --- a/meta-networking/conf/layer.conf
>> +++ b/meta-networking/conf/layer.conf
>> @@ -16,5 +16,6 @@ LAYERVERSION_networking-layer = "1"
>>   LAYERDEPENDS_networking-layer = "core"
>>   LAYERDEPENDS_networking-layer += "openembedded-layer"
>>   LAYERDEPENDS_networking-layer += "meta-python"
>> +LAYERDEPENDS_networking-layer += "perl-layer"
>>   
>>   LICENSE_PATH += "${LAYERDIR}/licenses"
>> -- 
>> 2.6.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Regards,
Neil | Kai Kang


