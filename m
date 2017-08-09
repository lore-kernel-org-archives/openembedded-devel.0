Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31A8177CF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 02:03:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v79230QA004646
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Aug 2017 19:03:00 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 8 Aug 2017 19:02:59 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
	<BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
	<f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
	<CAMKF1srRkN_vfF5HkMQy4YM5aa8bUCC+HOX0zALdbweUeT8dCQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <9ec26f7f-f87b-b470-ee15-459ac5712bfd@windriver.com>
Date: Tue, 8 Aug 2017 22:02:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srRkN_vfF5HkMQy4YM5aa8bUCC+HOX0zALdbweUeT8dCQ@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Wed, 09 Aug 2017 02:03:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-08-08 08:42 PM, Khem Raj wrote:
> I am seeing
> 
> downloads 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz'
> --progress=dot -v failed with exit code 8, output:
> --2017-08-08 15:05:59--
> http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz
> Resolving www.imagemagick.org... 198.72.81.86
> Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2017-08-08 15:05:59 ERROR 404: Not Found.
> 
> 
> ERROR: imagemagick-7.0.6-r0 do_fetch: Fetcher failure for URL:
> 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz'.
> Unable to fetch URL from any source.
> ERROR: imagemagick-7.0.6-r0 do_fetch: Function failed: base_do_fetch
> ERROR: Logfile of failure stored in:
> /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/imagemagick/7.0.6-r0/temp/log.do_fetch.17282

Ugh, the imagemagick devs have moved on to:
  http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-5.tar.gz

and deleted the 7.0.6-4 tarball already!
I'll send a patch in the morning and also talk to upstream about their
archiving policy. I don't see a directory for that at the moment.

Thanks for the heads up.

../Randy

> 
> On Wed, Aug 2, 2017 at 12:57 PM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 2017-08-02 01:21 PM, Koen Kooi wrote:
>>>
>>> Oops, I could’ve sworn I have submitted it to meta-oe :/ Thanks for
>>> looking into this!
>>>
>>>> It's not working for me on qemux86 since python-wand
>>>> is looking for:
>>>>     libMagickWand-6.Q16HDRI and
>>>>     libMagickWand-7.Q16HDRI is the current version.
>>>> If I soft link to work-around that problem, there's another issue:
>>>>     ImportError: MagickWand shared library not found.
>>>>
>>>> python-wand hasn't released a version newer than 0.4.4.
>>>> I'm not really interested in trying the git repo.
>>>
>>> I’ll have a look at trying the git repo with your patch to update
>>> imagemagick and hopefully get it working well enough to get it into oe-core
>>> :)
>>>
>>
>> Err,
>> The meta-yocto version is actually still on 0.4.3.
>> I updated to 0.4.4 and that didn't help.
>>
>> A simple patch to require imagemagick version 7 does
>> get me one more step to:
>>
>> AttributeError: /usr/lib/libMagickWand-7.Q16HDRI.so.3: undefined symbol:
>> MagickGetImageChannelDepth
>>
>> At first I thought this was due to the imagemagick .so being
>> striped when packaged but it's a bunch of function renames from 6 to 7
>> based on git. I asked if that had be fixed on the wand irc channel
>> and it hasn't. Known misbehaving wand:
>>    https://github.com/dahlia/wand/issues/287
>>
>> ../Randy
>>
>>
>>
>>>>> from wand.image import Image
>> Traceback (most recent call last):
>>    File "<stdin>", line 1, in <module>
>>    File "/usr/lib/python2.7/site-packages/wand/image.py", line 20, in
>> <module>
>>      from .api import MagickPixelPacket, libc, libmagick, library
>>    File "/usr/lib/python2.7/site-packages/wand/api.py", line 1394, in
>> <module>
>>      traceback.format_exc())
>> ImportError: MagickWand shared library not found or incompatible
>> Original exception was raised in:
>> Traceback (most recent call last):
>>    File "/usr/lib/python2.7/site-packages/wand/api.py", line 370, in <module>
>>      ctypes.c_int]
>>    File "/usr/lib/python2.7/ctypes/__init__.py", line 375, in __getattr__
>>      func = self.__getitem__(name)
>>    File "/usr/lib/python2.7/ctypes/__init__.py", line 380, in __getitem__
>>      func = self._FuncPtr((name_or_ordinal, self))
>> AttributeError: /usr/lib/libMagickWand-7.Q16HDRI.so.3: undefined symbol:
>> MagickGetImageChannelDepth
>>
>>>>>
>>
>>
>>
>> [15:46] <vmeson> Hey, I'm trying to get wand to work with
>> imagemagick-7.0.6p4 (in Yocto) -- several api have changed such as
>> MagickGetImageChannelDepth -> MagickGetImageDepth or maybe just
>> GetImageDepth
>> [15:47] <vmeson> I've got the git repo and I'm working through it but I
>> wonder if anyone has done this already and if a new tag is forthcoming to
>> support imagemagick-7
>> [15:47] * vmeson searchs for/in the email list.
>> [15:47] <hongminh1e> No one did that yet
>> [15:48] <hongminh1e> Afaik
>> [15:48] <vmeson> hongminh1e: thanks for the info. I might take a stab at it
>> but it's not a high priority for me right now.
>>
>>
>>
>>
>>
>>
>> --
>> # Randy MacLeod. SMTS, Linux, Wind River
>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada,
>> K2K 2W5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

