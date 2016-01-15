Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC93E7317D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 07:19:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F7JIiQ005117
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 23:19:18 -0800 (PST)
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 14 Jan 2016 23:19:18 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1452759356.git.yi.zhao@windriver.com>
	<569776A1.4000205@topic.nl>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <56989D73.8080303@windriver.com>
Date: Fri, 15 Jan 2016 15:19:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <569776A1.4000205@topic.nl>
X-Originating-IP: [128.224.162.175]
Subject: Re: [meta-oe][PATCH 0/4] host-user-contaminated fixes for meta-oe
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
X-List-Received-Date: Fri, 15 Jan 2016 07:19:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2016年01月14日 18:21, Mike Looijmans 写道:
> Instead of patching things up with chown, you could also instruct the 
> "cp" command to not attempt to preserve ownership (the -a and -p 
> options will do that).
>
> Instead of "cp -r -p ..." use "cp -r --preserve=mode,links ..."
>
> Instead of "cp -a ..." use "cp -R --no-dereference 
> --preserve=mode,links ..."
>
> This fixes these QA warnings in a more structured way.
>

Thanks, Mike

I will send V2 patch.

Yi


>
> On 14-01-16 09:19, Yi Zhao wrote:
>>
>> The following changes since commit 
>> 73af5c278f6617149a46b2d2a1549bc154fa79e5:
>>
>>    mime-construct: Perform more mangling for perl path (2016-01-06 
>> 13:27:21 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/meta-openembedded-contrib yzhao/4-fixes
>> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/4-fixes
>>
>> Yi Zhao (4):
>>    debootstrap: fix host-user-contaminated
>>    espeak: fix host-user-contaminated
>>    orrery: fix host-user-contaminated
>>    logwatch: fix host-user-contaminated
>>
>>   .../debootstrap/debootstrap_1.0.67.bb              |    1 +
>>   .../recipes-extended/logwatch/logwatch_7.4.1.bb    |    1 +
>>   meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |    1 +
>>   meta-oe/recipes-support/espeak/espeak_1.37.bb      |    1 +
>>   4 files changed, 4 insertions(+)
>>
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>


