Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1E8571984
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 14:10:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5IE9fLJ005519
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 07:10:01 -0700
Received: from [172.25.59.213] (172.25.59.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 07:09:50 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20180616132433.75139-1-jason.wessel@windriver.com>
	<8007a236-6e6c-e48a-2ef2-e3a4466e4b22@gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <6e67db8e-f42e-26b9-9272-5b825d5c31bc@windriver.com>
Date: Mon, 18 Jun 2018 09:09:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <8007a236-6e6c-e48a-2ef2-e3a4466e4b22@gmail.com>
Subject: Re: [meta-networking][PATCH] spice: Uprev to fix compile errors from gcc 8.1.0
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
X-List-Received-Date: Mon, 18 Jun 2018 14:10:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 06/16/2018 10:45 AM, Khem Raj wrote:
> 
> 
> On 6/16/18 6:24 AM, Jason Wessel wrote:
>> The upstream spice already fixed the following problems:
>>
>>                                               ^
>> ../../git/server/char-device.c: In function 'red_char_device_reset':
>> ../../git/server/char-device.c:838:49: error: cast between incompatible function types from 'void (*)(RedPipeItem *)' {aka 'void (*)(struct RedPipeItem *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
>>            g_queue_foreach(dev_client->send_queue, (GFunc)red_pipe_item_unref, NULL);
>>
>> --
> 
> I think these dashes will confuse patchwork. Can you remove them and
> resend ?
> 
>>
>> The new commit also changed opus to compile in by default.  This is
>> now added as a PKGCONFIG option.
>>


I guess git will allow you to dump a patch it won't import correctly.  I sent along a new version of the patch and of course will not use a "--" as a separator in the future.  See the mail with the subject: [oe] [meta-networking][PATCH] spice: Uprev to latest and add opus PKGCONFIG

Cheers,
Jason.

