Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PsvzJ-0001UR-Ci
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 12:37:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 1BD5D314E12B;
	Fri, 25 Feb 2011 12:36:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id h7hs+KU99CZI; Fri, 25 Feb 2011 12:36:06 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id F0260314E12A;
	Fri, 25 Feb 2011 12:36:05 +0100 (CET)
Message-ID: <4D679425.9050401@opendreambox.org>
Date: Fri, 25 Feb 2011 12:36:05 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4D5A5871.7000005@dresearch.de>	<4D5A89CD.803@opendreambox.org>	<4D5A92BC.1010906@dresearch.de>	<4D5E422B.3040703@dresearch.de>	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>	<4D665D92.7000100@dresearch.de>
	<4D6671C2.7060604@opendreambox.org> <4D675D08.6050301@dresearch.de>
In-Reply-To: <4D675D08.6050301@dresearch.de>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 25 Feb 2011 11:37:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/25/2011 08:40 AM, Steffen Sledz wrote:
> On 02/24/2011 03:57 PM, Andreas Oberritter wrote:
>> On 02/24/2011 02:30 PM, Steffen Sledz wrote:
>>> On 02/18/2011 04:30 PM, Khem Raj wrote:
>>>> On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz <sledz@dresearch.de> =
wrote:
>>>>> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>>>>>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>>>>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>>>>>> "Kernel headers are backwards compatible, but not forwards compa=
tible.  This
>>>>>>>> means that a program built against a C library using older kerne=
l headers
>>>>>>>> should run on a newer kernel (although it may not have access to=
 new
>>>>>>>> features), but a program built against newer kernel headers may =
not work on an
>>>>>>>> older kernel."[2]
>>>>>>>
>>>>>>> Isn't this what the variable OLDEST_KERNEL is good for, when comp=
iling
>>>>>>> glibc?
>>>>>>
>>>>>> If i'm right this goes to the --enable-kernel=3DVERSION configure =
option of glibc just to optimize the library.
>>>>>>
>>>>>> "the configure option --enable-kernel=3DX.Y.Z allows to strip out =
compatibility for kernel versions before X.Y.Z."
>>>>>>
>>>>>> Imho it is not legitimately to follow that glibc has compatibility=
 code for all kernels greater or equal X.Y.Z.
>>>>>>
>>>>>> Another question is the handling in other libc implementations.
>>>>>>
>>>>>> And finally there are a lot of programs using userland kernel head=
ers directly.
>>>>>
>>>>> Ping!
>>>>>
>>>>> If i interpret responses from Tom and Phil right they agree with me=
 (or at least do not disagree). ;-)
>>>>>
>>>>> But i miss reactions from the distro maintainers (especially =C3=85=
ngstr=C3=B6m).
>>>>>
>>>>
>>>> I think we should make sure that linux version chosen for a build is
>>>> equal or newer than linux-libc-headers for that build. Another optio=
n
>>>> is that linux-libc-headers are driven out
>>>> of selected virtual/kernel too but this may be a bit clunky since it
>>>> would mean that
>>>> every machine will have them different and we share sysroots e.g. tw=
o
>>>> armv5te may use
>>>> same sysroot
>>>
>>> I like to force the discussion/work/decision on this problem because =
we're one of the mourners (we're forced to use 2.6.24 kernel by out hardw=
are vendor :( ).
>>>
>>> I also see the multi-machine problem (the shared sysroot at build tim=
e and the feed problem too).
>>>
>>> So what options do we (our =C3=85ngstr=C3=B6m) have?
>>>
>>> (1) Do not support kernel older than 2.6.31 (which is the current LIN=
UX_LIBC_HEADERS_VERSION).
>>>
>>> (2) Set LINUX_LIBC_HEADERS_VERSION to 2.6.16 (which is the current OL=
DEST_KERNEL).
>>>
>>> (3) Support machine specific distro incarnations (incl. special feeds=
).
>>>
>>> May be some more. Option (1) would be really bad for us. I believe (2=
) would be bad for a lot of users because of a potential loss of function=
ality.
>>
>> I'm still not convinced that requiring older headers is a good way to
>> go. If applications are using new syscalls directly, they need to hand=
le
>> ENOSYS. If the applications already contain code to be compatible acro=
ss
>> various kernel versions at compile time, then it won't be that hard to
>> change those applications to detect available interfaces at runtime.
>=20
> At first i believe that practically it is not possible for us to guaran=
tee that all apps do this in the right way.

Sure. It's not possible to guarantee that all apps don't have severe
bugs. But we can test and fix apps that are important to us.

> But second i'm not sure if this is the only problem.
>=20
> The kernel docu (what's the primary docu for me) itself says "but a pro=
gram built against newer kernel headers may not work on an older kernel."=
 (see top of this post).

That's right, because programs using compile time detection of kernel
features may not work. No other issues have been brought up yet.

> This should be reason enough to avoid newer kernel headers (like all ot=
her linux distros do)!

Non-embedded linux distros have different requirements and in general
they ship only one kernel version for all targets.

Btw., recently I tried to boot a rootfs built with kernel headers 2.6.18
with a 2.6.38-rc kernel. I don't know why, but it didn't work at all
(running init failed). Rebuilding with kernel headers 2.6.37 allowed me
to boot both kernels 2.6.18 and 2.6.38-rc.

After all it's the distro's decision which headers to use, so I won't
argue for or against any policy that Angstr=C3=B6m uses. But I'm interest=
ed
in actual issues faced with old kernels running binaries compiled with
new headers.

Regards,
Andreas


