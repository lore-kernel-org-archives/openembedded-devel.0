Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pt4sY-0002Za-5k
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 22:07:10 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pt4rE-0002Wu-0i from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 13:05:48 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 25 Feb 2011 13:05:47 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Fri, 25 Feb 2011 13:05:47 -0800
Message-ID: <4D68199D.9030404@mentor.com>
Date: Fri, 25 Feb 2011 14:05:33 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D5A5871.7000005@dresearch.de>
	<4D5A89CD.803@opendreambox.org>	<4D5A92BC.1010906@dresearch.de>
	<4D5E422B.3040703@dresearch.de>	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de>
In-Reply-To: <4D665D92.7000100@dresearch.de>
X-OriginalArrivalTime: 25 Feb 2011 21:05:47.0616 (UTC)
	FILETIME=[C63B8600:01CBD52F]
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Fri, 25 Feb 2011 21:07:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 02/24/2011 06:30 AM, Steffen Sledz wrote:
> On 02/18/2011 04:30 PM, Khem Raj wrote:
>> On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz<sledz@dresearch.de>  wrote:
>>> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>>>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>>>> "Kernel headers are backwards compatible, but not forwards compatible.  This
>>>>>> means that a program built against a C library using older kernel headers
>>>>>> should run on a newer kernel (although it may not have access to new
>>>>>> features), but a program built against newer kernel headers may not work on an
>>>>>> older kernel."[2]
>>>>>
>>>>> Isn't this what the variable OLDEST_KERNEL is good for, when compiling
>>>>> glibc?
>>>>
>>>> If i'm right this goes to the --enable-kernel=VERSION configure option of glibc just to optimize the library.
>>>>
>>>> "the configure option --enable-kernel=X.Y.Z allows to strip out compatibility for kernel versions before X.Y.Z."
>>>>
>>>> Imho it is not legitimately to follow that glibc has compatibility code for all kernels greater or equal X.Y.Z.
>>>>
>>>> Another question is the handling in other libc implementations.
>>>>
>>>> And finally there are a lot of programs using userland kernel headers directly.
>>>
>>> Ping!
>>>
>>> If i interpret responses from Tom and Phil right they agree with me (or at least do not disagree). ;-)
>>>
>>> But i miss reactions from the distro maintainers (especially Ångström).
>>>
>>
>> I think we should make sure that linux version chosen for a build is
>> equal or newer than linux-libc-headers for that build. Another option
>> is that linux-libc-headers are driven out
>> of selected virtual/kernel too but this may be a bit clunky since it
>> would mean that
>> every machine will have them different and we share sysroots e.g. two
>> armv5te may use
>> same sysroot
>
> I like to force the discussion/work/decision on this problem because we're one of the mourners (we're forced to use 2.6.24 kernel by out hardware vendor :( ).
>
> I also see the multi-machine problem (the shared sysroot at build time and the feed problem too).
>
> So what options do we (our Ångström) have?
>
> (1) Do not support kernel older than 2.6.31 (which is the current LINUX_LIBC_HEADERS_VERSION).
>
> (2) Set LINUX_LIBC_HEADERS_VERSION to 2.6.16 (which is the current OLDEST_KERNEL).
>
> (3) Support machine specific distro incarnations (incl. special feeds).

I hate to state the semi-obvious but one of the problems you have now is 
that the distro has said that they want to stay on these more recent 
headers (which are required for building things which do need newer 
headers).  So I think you need to have a (private?) discussion about how 
to do #3 with the least amount of headache.

-- 
Tom Rini
Mentor Graphics Corporation


