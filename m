Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A879A7F29F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 07:48:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8R7lRjQ030009
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Sep 2019 00:47:37 -0700
Received: from [128.224.158.233] (128.224.158.233) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 27 Sep 2019 00:47:17 -0700
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20190926162655.375600-1-Martin.Jansa@gmail.com>
	<20190926194855.GA27652@localhost>
	<3a37c354-dfca-d7e3-70c3-842d13fae466@windriver.com>
	<b8fc2607-3244-84be-82a5-c27d942155ad@windriver.com>
	<CA+chaQe4ozUnBNE4qQX3io1LjBtEZ8CSYxX+wQohQ4kxzTJ5_Q@mail.gmail.com>
	<CAMKF1sp5CC7pYsOLQhCNgAePf5-_0dKB=js+cYZ6w-myB30vpA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d1162cd1-7740-b5b8-3f90-1700c5cca88b@windriver.com>
Date: Fri, 27 Sep 2019 15:46:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp5CC7pYsOLQhCNgAePf5-_0dKB=js+cYZ6w-myB30vpA@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH 1/2] spice: append -Wno-error=address-of-packed-member only for target
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
X-List-Received-Date: Fri, 27 Sep 2019 07:48:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/27/19 3:43 PM, Khem Raj wrote:
> On Fri, Sep 27, 2019 at 12:42 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> Why? there are many PACKAGECONFIGs for optional dependencies which aren't
>> in the same layer as the recipe with that PACKAGECONFIG.
>>
>> As long as it's not enabled by default it is correct to have the
>> PACKAGECONFIG to control the dependency explicitly.
>>
> 
> right

Got it, thanks.

// Robert

> 
>> Cheers,
>>
>> On Fri, Sep 27, 2019 at 9:20 AM Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>
>>> Hi Martin,
>>>
>>> We found another problem on spice_git.bb:
>>>
>>> PACKAGECONFIG[smartcard] =
>>> "--enable-smartcard,--disable-smartcard,libcacard,"
>>>
>>> I can't find libcacard:
>>>
>>>
>>> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libcacard
>>>
>>>
>>> So it seems that this PACKAGECONFIG is invalid, should we remove it?
>>>
>>> // Robert
>>>
>>> On 9/27/19 11:56 AM, Robert Yang wrote:
>>>>
>>>>
>>>> On 9/27/19 3:48 AM, Adrian Bunk wrote:
>>>>> On Thu, Sep 26, 2019 at 04:26:54PM +0000, Martin Jansa wrote:
>>>>>> * with older native gcc on host this will break spice-native with:
>>>>>>     cc1: error: -Werror=address-of-packed-member: no option
>>>>>> -Waddress-of-packed-member
>>>>>>
>>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>>> ---
>>>>>>    meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
>>>>>> b/meta-networking/recipes-support/spice/spice_git.bb
>>>>>> index 30e939ac07..2829a59d15 100644
>>>>>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>>>>>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>>>>>> @@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
>>>>>>    export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
>>>>>>    export
>>> PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
>>>>>> -CFLAGS_append = " -Wno-error=address-of-packed-member"
>>>>>> +CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
>>>>
>>>> Yes, the error was the same as you mentioned in the commit message, and
>>>> "bitbake spice-native" works with this change.
>>>>
>>>>>> ...
>>>>>
>>>>> Least hassle would be
>>>>>     CFLAGS_append = " -Wno-error"
>>>>
>>>> "bitbake nativesdk-spice" works with this change, otherwise, it doesn't
>>> work.
>>>>
>>>> This patch works for me.
>>>>
>>>> // Robert
>>>>
>>>>>
>>>>> cu
>>>>> Adrian
>>>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

