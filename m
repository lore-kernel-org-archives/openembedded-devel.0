Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RESCd-00020G-Vn
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 22:48:32 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id A99461660A5B; Thu, 13 Oct 2011 14:42:44 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9D25B1660A56;
	Thu, 13 Oct 2011 14:42:43 -0600 (MDT)
Message-ID: <4E974D43.5090509@mlbassoc.com>
Date: Thu, 13 Oct 2011 14:42:43 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4E96E9FE.1060005@mlbassoc.com>
	<6E64F0B8-773E-4558-B470-37BA010F419D@ti.com>
	<4E96F59A.6030206@mlbassoc.com>
	<CAMKF1sroXD8KQE4HPXgUcvC8X35TDrzzf=SVmVLAvM073WD9vA@mail.gmail.com>
	<4E9734B7.2030207@mlbassoc.com>
	<CAMKF1spOdXy2sAAr9J2vdFctPS1T3+U63wbf6DM1Q+fTzuKU7Q@mail.gmail.com>
In-Reply-To: <CAMKF1spOdXy2sAAr9J2vdFctPS1T3+U63wbf6DM1Q+fTzuKU7Q@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Can't build libcgroup
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
X-List-Received-Date: Thu, 13 Oct 2011 20:48:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-13 14:33, Khem Raj wrote:
> On Thu, Oct 13, 2011 at 11:57 AM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> On 2011-10-13 12:48, Khem Raj wrote:
>>>
>>> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com>    wrote:
>>>>
>>>> On 2011-10-13 08:16, Kridner, Jason wrote:
>>>>>
>>>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com>      wrote:
>>>>>
>>>>>> Trying to follow the Angstrom instructions directly.
>>>>>>
>>>>>> OE Build Configuration:
>>>>>> BB_VERSION        = "1.13.3"
>>>>>> TARGET_ARCH       = "arm"
>>>>>> TARGET_OS         = "linux-gnueabi"
>>>>>> MACHINE           = "beagleboard"
>>>>>> DISTRO            = "angstrom"
>>>>>> DISTRO_VERSION    = "v2011.10-core"
>>>>>> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
>>>>>> TARGET_FPU        = "vfp-neon"
>>>>>> meta-angstrom     = "master:66263650f8548d6b0b5f593ab728f536d5e05a9f"
>>>>>> meta-oe
>>>>>> meta-efl
>>>>>> meta-gpe
>>>>>> meta-gnome
>>>>>> meta-xfce         = "master:1e5d73ec4f44200104de085838f04e31a49435da"
>>>>>> meta-ti           = "master:3530f1025efc3792334b897a4e70c6d5822ef56d"
>>>>>> meta              = "master:5ad1ca59dea6d5045f252ed7b786ad193faced64"
>>>>>>
>>>>>> Fails with this error:
>>>>>> | ccache arm-angstrom-linux-gnueabi-gcc  -march=armv7-a
>>>>>> -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp
>>>>>> -mfpu=neon
>>>>>> -mtune=cortex-a8 -mthumb-interwork -mno-thumb
>>>>>>
>>>>>> --sysroot=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard
>>>>>> -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g
>>>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>>>>> | libcg_ba.cpp:18:18: fatal error: string: No such file or directory
>>>
>>> Does this happen with lastest angstrom on oe-core ? or classic oe.dev
>>> I am unable to reproduce it on my end
>>
>> Latest angstrom with layers as above.
>
> strange, I have it working well for qemuarm and I cant imagine how C++
> headers could be broken for beagle

Maybe you could try it using the Angstrom tools?  Here's the [documented]
sequence I used:
   % MACHINE="beagleboard" ./oebb.sh config beagleboard
   ... adjust conf/site.conf for my local DL_DIR
   ... adjust conf/local.conf to include MACHINE=beagleboard, set parallel build flags, etc
   ... removed all meta-intel repos from conf/bblayers.conf (to avoid xorg-dri issues)
   % . ~/.oe/environment-oecore
   % bitbake systemd-image

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


