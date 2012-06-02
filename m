Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1Saqep-0003DD-Aq
	for openembedded-devel@openembedded.org; Sat, 02 Jun 2012 17:54:27 +0200
Received: by mail-lb0-f175.google.com with SMTP id l5so2333655lbo.6
	for <openembedded-devel@openembedded.org>;
	Sat, 02 Jun 2012 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/IkPAnecRuBmTmQIPeQRF9GvXV6dVz5iWfqzuL9x8JQ=;
	b=Qwgd21+/bmphLEsr4X/TpMrXRYoCOvYqDlcjgtNaoOc7/u4vH5o9kV5uOUIq1mfg1k
	LVv9X4xkLDXR7gxjkUY1DpQn2mb2nwebwns5F5CcuX367sA4TiVvLCtTyv1zLxGd3zik
	XJl1X4WbcRKVZjBM6So7ojUMAgMhZWAvowmesE4fh4eAscj/AUcbBuzNfaf6hr9PQV2d
	JB00pJW2PmxJ6Pj23kQMqxUrgIOfc/pcXHqtQU/wCPKpuI/L9T+WHJVCcGT8LMV7JtYJ
	KETfFjmyuikV8r6vUIZ8phQPtOj5Yhg+lTinmIPY2j+RVcZkJrrIIeAzPRK3rYX6IMh4
	NIMw==
Received: by 10.152.148.169 with SMTP id tt9mr6736752lab.49.1338651847145;
	Sat, 02 Jun 2012 08:44:07 -0700 (PDT)
Received: from Kristoffers-iMac.local
	(c-34dae555.010-30-6c6b7012.cust.bredbandsbolaget.se.
	[85.229.218.52])
	by mx.google.com with ESMTPS id hi14sm8431298lab.4.2012.06.02.08.44.04
	(version=SSLv3 cipher=OTHER); Sat, 02 Jun 2012 08:44:05 -0700 (PDT)
Message-ID: <4FCA34C3.80500@gmail.com>
Date: Sat, 02 Jun 2012 17:44:03 +0200
From: Kristoffer Eriksson <kristoffer.ericson@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Apelete Seketeli <apelete@seketeli.net>
References: <20120520201022.GQ19142@hermes>
In-Reply-To: <20120520201022.GQ19142@hermes>
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/1] util-linux-ng: Update SRC_URI to kernel.org valid URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Jun 2012 15:54:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Apelete Seketeli skrev 2012-05-20 22:10:
> Hello,
>
> Le 15-May-12, Apelete Seketeli a écrit:
>> This updates SRC_URI as the former kernel.org URI was no longer valid.
>>
>> Signed-off-by: Apelete Seketeli<apelete@seketeli.net>
>> ---
>>   recipes/util-linux-ng/util-linux-ng.inc |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
>> index 9c2a5da..7d5faf0 100644
>> --- a/recipes/util-linux-ng/util-linux-ng.inc
>> +++ b/recipes/util-linux-ng/util-linux-ng.inc
>> @@ -11,7 +11,7 @@ INC_PR = "r36"
>>   # allows for a release candidate
>>   RC ?= ""
>>
>> -SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2;name=archive"
>> +SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2;name=archive"
>>
>>   SRC_URI_append_chinook-compat = " file://chinook_libtool.patch "
>>
>> -- 
>> 1.7.9.5
>>
> I need util-linux-ng to build muffinman-image in oe-classic, can
> someone please review this patch ?
> Kristoffer, you can get it from here if needed:
>
> http://patchwork.openembedded.org/patch/27737/
>
> Regards.

Applied, Thanks



