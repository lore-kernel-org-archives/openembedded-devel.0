Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SJueO-0007Vg-Cf
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2012 00:44:00 +0200
Received: by qcso7 with SMTP id o7so3505662qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 15:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=L7oMUXNf0bmXyYLUkSiAmFWKT3Pmy5R83ktohoXJNFg=;
	b=lSOH5V+jotyyZ2wQE3Ba02ZjD1HekbVkQSSpxjNPd0wWE2ta2uJp+357wt2LvopqYF
	gdQleIdxrdDlOiOYR+2H8oMPg/ow3zdbXTyDUY8QeksUljnhm0Cs7jS+Z4CThkWbOX0b
	wtrezU+A8SEAKZFkSByE4DY2g9Two1PpboTPH4ipt/zU1fbfjlbVlA8TW3bsw1ea+6Y+
	8LqCwkjCiY4Ez70F7ED324GpEx2PmEXFB4HqlxURk9HKtm2CPApgHZs2S7UAibY49SM4
	EVeWGPAn7XmGHMgvu8lc3F70QInIxSgcaFDOe13szJCJP7VKg5/xIZAB4rlObCZ7iGwY
	M5Iw==
Received: by 10.224.31.204 with SMTP id z12mr17611066qac.89.1334615674709;
	Mon, 16 Apr 2012 15:34:34 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id y13sm33133698qac.14.2012.04.16.15.34.28
	(version=SSLv3 cipher=OTHER); Mon, 16 Apr 2012 15:34:34 -0700 (PDT)
Message-ID: <4F8C9E68.9050106@gmail.com>
Date: Mon, 16 Apr 2012 15:34:16 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
In-Reply-To: <4F8C9D26.9050500@mlbassoc.com>
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Mon, 16 Apr 2012 22:44:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2012 03:28 PM, Gary Thomas wrote:
> On 2012-04-16 16:11, j wrote:
>> On 04/13/2012 03:50 PM, j wrote:
>>> On 04/13/2012 03:46 PM, j wrote:
>>>> There seems to be a couple of packages when I build that cause ld 
>>>> segfaults such as
>>>> [ 6635.846581] ld[14419]: segfault at 8 ip 0077f1bf sp bfbf4a8c 
>>>> error 4 in libc-2.13.so[73d000+15c000]
>>>> [ 6656.831878] ld[20772]: segfault at 8 ip 00ba61bf sp bfaf1bfc 
>>>> error 4 in libc-2.13.so[b64000+15c000]
>>>>
>>>> I can not seem to be able to track down the package/packages that 
>>>> are causing this. I have tried with a clean build dir and only 
>>>> building nano and I get it so it is something in
>>>> the getting environment ready steps. Is there a way I can easily 
>>>> track down the build/builds that are causing this? Am I even on the 
>>>> right track in this thinking? Nothing fails
>>>> to build and other than task-native-sdk all result in what seem to 
>>>> be working packages.
>>>>
>>>> Any info on what or how to figure it out would be greatly appreciated.
>>>> building for bbxm on 11.04(uptodate), build environment setup with 
>>>> Angstrom scripts and all is up to date.
>>>>
>>>> Thank you
>>> Sorry forgot the info from qa.log
>>>
>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>> libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a' 
>>>
>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>> libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a' 
>>>
>>> libgcc-4.5: non -staticdev package contains static .a library: 
>>> libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a' 
>>>
>>> bash-4.2: bash: Found a reference to /usr/ in
>>> /home/beagle/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug 
>>>
>>> bash-4.2: Shell scripts in base_bindir and base_sbindir should not 
>>> reference anything in exec_prefix
>>>
>>> Any other places to check, as these I do not think relate to a 
>>> segfault?
>>
>> I have now tried the build on 3 different OS's the most recent being 
>> Arch. All give the same QA log's and all give me segfaults. That are 
>> all basically close to the same errors
>> just differing libc versions.
>>
>> I have tried Ubuntu 10.04 11.04 Fedora 16 and now Arch. What is 
>> causing the segfaults? Is it what is in the QA log?
>>
>>
>>
>> Most current
>> [ 6433.379801] ld[22955]: segfault at 403 ip 00007f703ddcc435 sp 
>> 00007fffb0bd9f50 error 4 in libc-2.15.so[7f703dd85000+197000]
>> [ 6444.526227] ld[31806]: segfault at 403 ip 00007f0dffc51435 sp 
>> 00007fffc0a990d0 error 4 in libc-2.15.so[7f0dffc0a000+197000]
>>
>> libgcc-4.5: non -staticdev package contains static .a library: 
>> libgcc-dev path
>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a' 
>>
>> libgcc-4.5: non -staticdev package contains static .a library: 
>> libgcc-dev path
>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a' 
>>
>> libgcc-4.5: non -staticdev package contains static .a library: 
>> libgcc-dev path
>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a' 
>>
>> bash-4.2: bash: Found a reference to /usr/ in
>> /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug 
>>
>> bash-4.2: Shell scripts in base_bindir and base_sbindir should not 
>> reference anything in exec_prefix
>>
>>
>> The only reason I am concerned with this and it may be un related is 
>> that every time I build task-native-sdk it does not build a working 
>> sdk for my device. BB-xm. Yes I know I can
>> install one from the repo, but I want to figure out what is wrong 
>> with building one for me.
>>
>> Does anyone have input, advice something?
>
> You've tried different Operating Systems, but one would assume that
> this is all on the same hardware?   Have you tried a different build
> host (i.e. hardware/box)?
>
Also it seems to happen around when bitbake starts building gcc-4.5 from 
a fresh install that is why I posted the QA info about it.


