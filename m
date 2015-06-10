Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B7C957573C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 13:21:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5ADLMSN021521
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Jun 2015 06:21:22 -0700 (PDT)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Jun 2015 06:21:22 -0700
Message-ID: <557839D1.20700@windriver.com>
Date: Wed, 10 Jun 2015 09:21:21 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, "Huang, Jie (Jackie)"
	<Jackie.Huang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1433496408-24477-1-git-send-email-jackie.huang@windriver.com>	<CAJTo0LZLPgpeY+SfvUDAqc4efsRW3L8TS-vROj0FKqWKAz5C=w@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11CFD41@ALA-MBB.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF11CFD41@ALA-MBB.corp.ad.wrs.com>
X-Originating-IP: [128.224.56.84]
Subject: Re: [meta-oe][PATCH] libcanberra: upgrade and add packageconfig for gstreamer and gtk
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jun 2015 13:21:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-07 09:49 PM, Huang, Jie (Jackie) wrote:
>
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Burton, Ross
>> Sent: Friday, June 05, 2015 5:48 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe][PATCH] libcanberra: upgrade and add packageconfig for gstreamer and
>> gtk
>>
>> On 5 June 2015 at 10:26, <jackie.huang@windriver.com> wrote:
>>
>>> +
>>>   ${@base_contains('DISTRO_FEATURES','gstreamer','gstreamer','',d)} \
>>>
>>
>> Lets not invent distro features for no reason.
>
> Ok, so I will remove this and left gstreamer not enabled by default, someone can enable it
> when needed, does that make sense?
>
> Thanks,
> Jackie

I think Ross is saying that you can just add a PACKAGECONFIG
for gstreamer itself rather than make gstreamer a DISTRO_FEATURE.
For example see: meta-efl/recipes-efl/efl/efl.inc

../Randy

>
>>
>> Ross
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

