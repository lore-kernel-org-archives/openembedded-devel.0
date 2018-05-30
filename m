Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36E3374CFB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 00:04:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U04h3e001791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2018 17:04:43 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 17:04:42 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1527143259-6532-1-git-send-email-yi.zhao@windriver.com>
	<CAMKF1spw0KO4_EZ3tmyb-nJ4_akM-7xJR=SKKh7BZ4Vr=KtcVA@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <585a0716-9ee3-4dd2-1d26-8de9929da16e@windriver.com>
Date: Wed, 30 May 2018 08:04:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spw0KO4_EZ3tmyb-nJ4_akM-7xJR=SKKh7BZ4Vr=KtcVA@mail.gmail.com>
X-Originating-IP: [128.224.162.137]
Cc: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] meta-multimedia: update LAYERDEPENDS
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
X-List-Received-Date: Wed, 30 May 2018 00:04:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年05月30日 00:04, Khem Raj 写道:
> On Wed, May 23, 2018 at 11:27 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
>> Add meta-oe as LAYERDEPENDS to fix ParseError:
>> meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb:13:
>> Could not inherit file classes/dos2unix.bbclass
>>
> If thats the only dependency on meta-oe then
> Perhaps dos2unix class should be migrated to OE-Core. Can you prepare
> a patch for that instead ?
OK. I will do it.

//Yi

>
> We should try to make these layers independent of each other as much
> as we can.
>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-multimedia/conf/layer.conf | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
>> index cfedf2f..24d7a6d 100644
>> --- a/meta-multimedia/conf/layer.conf
>> +++ b/meta-multimedia/conf/layer.conf
>> @@ -28,5 +28,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
>>   LAYERVERSION_multimedia-layer = "1"
>>
>>   LAYERDEPENDS_multimedia-layer = "core"
>> +LAYERDEPENDS_multimedia-layer += "openembedded-layer"
>>
>>   LAYERSERIES_COMPAT_multimedia-layer = "sumo"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


