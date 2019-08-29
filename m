Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E21B87ECB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 01:48:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7T1lrmW011723
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2019 18:47:53 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 28 Aug 2019 18:47:52 -0700
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
	<20190828180616.GA3044@localhost>
	<CAMKF1sq84RHmHY3dyj7rpO=w3xDQry3jAHG6ZeOiQvLMiMnRVg@mail.gmail.com>
	<20190828195635.GB3044@localhost>
	<CAMKF1srYu8m58Mbvek7wsXgty=K1YT-TBQuXcPnZsSU7rbaDOw@mail.gmail.com>
	<20190828214003.GE3044@localhost>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <0454f751-2c68-6654-0ba0-8aa0b4d72259@windriver.com>
Date: Thu, 29 Aug 2019 09:47:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828214003.GE3044@localhost>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][RFC PATCH 0/1] Failed to compile networkmanager with musl
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
X-List-Received-Date: Thu, 29 Aug 2019 01:48:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/29 上午5:40, Adrian Bunk wrote:
> On Wed, Aug 28, 2019 at 01:32:52PM -0700, Khem Raj wrote:
>> On Wed, Aug 28, 2019 at 12:56 PM Adrian Bunk <bunk@stusta.de> wrote:
>>> On Wed, Aug 28, 2019 at 11:53:27AM -0700, Khem Raj wrote:
>>>> On Wed, Aug 28, 2019 at 11:06 AM Adrian Bunk <bunk@stusta.de> wrote:
>>>>> What about marking networkmanager as incompatible with musl instead of
>>>>> maintaining an ever-growing mess?
>>>>>
>>>> if the fix is specifically done for musl alone then I would agree, but
>>>> in many cases, the fixes
>>>> have been cleaning up assumptions in kernel UAPI headers on glibc
>>>> provided headers
>>>> which is a good thing, and it does take some time for kernel header
>>>> changes to flow upstream
>>>> but eventually, they do. e.g. see [1]
>>> This is not a cleanup, this is a workaround for a misfeature of musl.
>>>
>>> The kernel userspace headers are the userspace ABI of the kernel for
>>> usage by all C libraries provided in one place, they are not tied to
>>> any specific C library.
>>>
>>> musl upstream does not even try to use the kernel userspace headers.
>>>
>>> The kernel userspace headers used to be a mess, but after more than 10
>>> years of cleanup there is no excuse for musl to insist on providing own
>>> definitions of what is already provided by the kernel headers.
>> I was citing an example, you might have good feedback maybe bring it up
>> upstream with musl or
> musl upstream says the patched kernel-headers package from sabotage
> linux should be used:
>    https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting-

There has been a patch of networkmanger for the headers issue. And I 
update it then this problem gone.


>
>> ...
>>> There is a benefit of a small C library when your flash space is
>>> single-digit megabytes, but maintaining plenty of not upstreamable
>>> OE-only patches for using networkmanager on musl without a sane
>>> usecase is a waste of effort.
>> I have said it before as well, I will say it again if we can improve an upstream
>> packages portability that itself is a good thing, but we should not go overboard
>> if its too much of work.
> Networkmanager doesn't aim at portability and is too much work.

Yes, another following issue is that NetworkManger uses non-posix 
portable functions mrand48_r() and struct drand48_data. musl doesn't 
recognize them.
After adapt to posix functions jrand48(), it segment fault when startup. 
(The point of segment fault is far from my patch). Still working on it. :(

Regards,
Kai


>
>> there are container distros using musl so we
>> have a wide
>> list of packages which work well with musl, and this list is always
>> increasing, so I
>> would refrain from pushing musl to a narrow usecase
> AFAIK OE is the only distribution trying to build software like systemd
> or networkmanager with musl, and container distros optimized for size
> are only supporting smaller alternatives.
>
> cu
> Adrian
>

-- 
Kai Kang


