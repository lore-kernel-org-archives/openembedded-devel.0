Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1887F489
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 00:42:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00E0g9B3010602
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 16:42:25 -0800
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 13 Jan 2020 16:42:13 -0800
From: Randy MacLeod <randy.macleod@windriver.com>
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
	<bc6e63b4-17f5-4d2c-761b-abe8ef476551@windriver.com>
	<CALbNGRT-yQLsGTLsSTJzbhU5b6zzLxHmb6A2wi-pDfmZt-4_8A@mail.gmail.com>
	<87k15vw1jv.fsf@windriver.com>
	<2ec962d4-e6de-2ed2-2b4f-436041fccac3@windriver.com>
Message-ID: <8a4e2520-b610-bea4-4842-51e86f5eeb91@windriver.com>
Date: Mon, 13 Jan 2020 19:42:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2ec962d4-e6de-2ed2-2b4f-436041fccac3@windriver.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [PATCH 1/9] poppler: upgrade 0.82.0 -> 0.84.0
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
X-List-Received-Date: Tue, 14 Jan 2020 00:42:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 1/13/20 3:34 PM, Randy MacLeod wrote:
> On 1/13/20 3:20 PM, Mingde (Matthew) Zeng wrote:
>>>> Have you by chance tried to add ptest coverage for poppler?
>>>> If not, Matthew may do that.
>>>>
>>>>
>>> Have not done any ptest on this - just some runtime tests on target 
>>> with evince
>>>
>>> Andreas
>> ```
>> $ make test
>> Running tests...
>> Test project /home/mzeng/code/poppler/build
>>        Start  1: check_qt5_attachments
>>   1/21 Test  #1: check_qt5_attachments ............***Failed    2.47 sec
>>        Start  2: check_qt5_dateConversion
>>   2/21 Test  #2: check_qt5_dateConversion .........   Passed    0.58 sec
>> ...
>> ```
>>
>> Poppler's `make test` runs tests from the `/build/qt5/tests` 
>> directory, which apparently are relying on qt5.
>>
>> ```
>> /**************************************************************************** 
>>
>> ** Meta object code from reading C++ file 'check_attachments.cpp'
>> **
>> ** Created by: The Qt Meta Object Compiler version 67 (Qt 5.14.0)
>> **
>> ** WARNING! All changes made in this file will be lost!
>> *****************************************************************************/ 
>>
>>
>> #include <memory>
>> #include <QtCore/qbytearray.h>
>> #include <QtCore/qmetatype.h>
>> ...
>> ```
>>
>> Is it worth it to write a ptest and sort out the meta-qt5 layer?
> 
> No, we can't have meta-openembedded packages depend
> on meta-qt5 content.
> 
> The meta-oe layer only depends on oe-core (aka core):
> 
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/conf/layer.conf#n30 

Of course you could add the ptest code in a .bbappend in
the meta-qt5 layer but I won't ask you to do that.

Take a look at the bbappends in meta-qt5 if you are curious:
https://layers.openembedded.org/layerindex/branch/master/layer/meta-qt5/#appends

../Randy
> 
> 
> Thanks for looking into it Matthew,
> 
> ../Randy
> 
>>
>>      Matthew
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

