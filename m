Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SJuks-0007eP-S2
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2012 00:50:43 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 11FACF8120D; Mon, 16 Apr 2012 16:41:19 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 14BCFF81208;
	Mon, 16 Apr 2012 16:41:17 -0600 (MDT)
Message-ID: <4F8CA00D.5010409@mlbassoc.com>
Date: Mon, 16 Apr 2012 16:41:17 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9DEE.7010904@gmail.com>
In-Reply-To: <4F8C9DEE.7010904@gmail.com>
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
X-List-Received-Date: Mon, 16 Apr 2012 22:50:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-16 16:32, j wrote:
> On 04/16/2012 03:28 PM, Gary Thomas wrote:
>> On 2012-04-16 16:11, j wrote:
>>> On 04/13/2012 03:50 PM, j wrote:
>>>> On 04/13/2012 03:46 PM, j wrote:
>>>>> There seems to be a couple of packages when I build that cause ld segfaults such as
>>>>> [ 6635.846581] ld[14419]: segfault at 8 ip 0077f1bf sp bfbf4a8c error 4 in libc-2.13.so[73d000+15c000]
>>>>> [ 6656.831878] ld[20772]: segfault at 8 ip 00ba61bf sp bfaf1bfc error 4 in libc-2.13.so[b64000+15c000]
>>>>>
>>>>> I can not seem to be able to track down the package/packages that are causing this. I have tried with a clean build dir and only building nano and I get it so it is something in
>>>>> the getting environment ready steps. Is there a way I can easily track down the build/builds that are causing this? Am I even on the right track in this thinking? Nothing fails
>>>>> to build and other than task-native-sdk all result in what seem to be working packages.
>>>>>
>>>>> Any info on what or how to figure it out would be greatly appreciated.
>>>>> building for bbxm on 11.04(uptodate), build environment setup with Angstrom scripts and all is up to date.
>>>>>
>>>>> Thank you
>>>> Sorry forgot the info from qa.log
>>>>
>>>> libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path
>>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a'
>>>> libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path
>>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a'
>>>> libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path
>>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a'
>>>> bash-4.2: bash: Found a reference to /usr/ in
>>>> /home/beagle/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug
>>>> bash-4.2: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix
>>>>
>>>> Any other places to check, as these I do not think relate to a segfault?
>>>
>>> I have now tried the build on 3 different OS's the most recent being Arch. All give the same QA log's and all give me segfaults. That are all basically close to the same errors
>>> just differing libc versions.
>>>
>>> I have tried Ubuntu 10.04 11.04 Fedora 16 and now Arch. What is causing the segfaults? Is it what is in the QA log?
>>>
>>>
>>>
>>> Most current
>>> [ 6433.379801] ld[22955]: segfault at 403 ip 00007f703ddcc435 sp 00007fffb0bd9f50 error 4 in libc-2.15.so[7f703dd85000+197000]
>>> [ 6444.526227] ld[31806]: segfault at 403 ip 00007f0dffc51435 sp 00007fffc0a990d0 error 4 in libc-2.15.so[7f0dffc0a000+197000]
>>>
>>> libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc_eh.a'
>>> libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcc.a'
>>> libgcc-4.5: non -staticdev package contains static .a library: libgcc-dev path
>>> '/work/armv7a-angstrom-linux-gnueabi/libgcc-4.5-r48+svnr184907/packages-split/libgcc-dev/usr/lib/arm-angstrom-linux-gnueabi/4.5.4/libgcov.a'
>>> bash-4.2: bash: Found a reference to /usr/ in
>>> /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/bash-4.2-r2/packages-split/bash/bin/bashbug
>>> bash-4.2: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix
>>>
>>>
>>> The only reason I am concerned with this and it may be un related is that every time I build task-native-sdk it does not build a working sdk for my device. BB-xm. Yes I know I can
>>> install one from the repo, but I want to figure out what is wrong with building one for me.
>>>
>>> Does anyone have input, advice something?
>>
>> You've tried different Operating Systems, but one would assume that
>> this is all on the same hardware? Have you tried a different build
>> host (i.e. hardware/box)?
>>
> sadly the only other hardware I have is to old to try a build on. Would take me weeks to get a complete image.
>
> So this could be a hardware problem on my end? If so any chance you know what I could search for in logs or anything like that to try and track down what on the hardware side is
> causing it?

Random errors like this always make me question the hardware.  The fact that it
can work fine in one setup but not another reinforces that.  It might not be the
case, but I think you'll have to check it out.

>
> Thanks a bunch for your reply though is not something I took in to account, reason being is I can build the gumstix overo chain (oe-classic I believe it is) on the same hardware
> with out running into this issue.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


