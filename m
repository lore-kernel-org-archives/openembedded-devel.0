Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Psspm-0006ZB-7a
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 09:15:30 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 24B82491278;
	Fri, 25 Feb 2011 09:14:08 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 25 Feb 2011 09:14:08 +0100
Message-ID: <4D6764CF.7050305@dresearch.de>
Date: Fri, 25 Feb 2011 09:14:07 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de> <4D6671C2.7060604@opendreambox.org>
	<4D675D08.6050301@dresearch.de>
	<AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
In-Reply-To: <AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
X-OriginalArrivalTime: 25 Feb 2011 08:14:08.0340 (UTC)
	FILETIME=[F9B6A940:01CBD4C3]
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 25 Feb 2011 08:15:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 25.02.2011 08:51, schrieb Khem Raj:
> On Thu, Feb 24, 2011 at 11:40 PM, Steffen Sledz <sledz@dresearch.de> wr=
ote:
>> On 02/24/2011 03:57 PM, Andreas Oberritter wrote:
>>> On 02/24/2011 02:30 PM, Steffen Sledz wrote:
>>>> On 02/18/2011 04:30 PM, Khem Raj wrote:
>>>>> On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz <sledz@dresearch.de>=
 wrote:
>>>>>> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>>>>>>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>>>>>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>>>>>>> "Kernel headers are backwards compatible, but not forwards comp=
atible.  This
>>>>>>>>> means that a program built against a C library using older kern=
el headers
>>>>>>>>> should run on a newer kernel (although it may not have access t=
o new
>>>>>>>>> features), but a program built against newer kernel headers may=
 not work on an
>>>>>>>>> older kernel."[2]
>>>>>>>>
>>>>>>>> Isn't this what the variable OLDEST_KERNEL is good for, when com=
piling
>>>>>>>> glibc?
>>>>>>>
>>>>>>> If i'm right this goes to the --enable-kernel=3DVERSION configure=
 option of glibc just to optimize the library.
>>>>>>>
>>>>>>> "the configure option --enable-kernel=3DX.Y.Z allows to strip out=
 compatibility for kernel versions before X.Y.Z."
>>>>>>>
>>>>>>> Imho it is not legitimately to follow that glibc has compatibilit=
y code for all kernels greater or equal X.Y.Z.
>>>>>>>
>>>>>>> Another question is the handling in other libc implementations.
>>>>>>>
>>>>>>> And finally there are a lot of programs using userland kernel hea=
ders directly.
>>>>>>
>>>>>> Ping!
>>>>>>
>>>>>> If i interpret responses from Tom and Phil right they agree with m=
e (or at least do not disagree). ;-)
>>>>>>
>>>>>> But i miss reactions from the distro maintainers (especially =C3=85=
ngstr=C3=B6m).
>>>>>>
>>>>>
>>>>> I think we should make sure that linux version chosen for a build i=
s
>>>>> equal or newer than linux-libc-headers for that build. Another opti=
on
>>>>> is that linux-libc-headers are driven out
>>>>> of selected virtual/kernel too but this may be a bit clunky since i=
t
>>>>> would mean that
>>>>> every machine will have them different and we share sysroots e.g. t=
wo
>>>>> armv5te may use
>>>>> same sysroot
>>>>
>>>> I like to force the discussion/work/decision on this problem because=
 we're one of the mourners (we're forced to use 2.6.24 kernel by out hard=
ware vendor :( ).
>>>>
>>>> I also see the multi-machine problem (the shared sysroot at build ti=
me and the feed problem too).
>>>>
>>>> So what options do we (our =C3=85ngstr=C3=B6m) have?
>>>>
>>>> (1) Do not support kernel older than 2.6.31 (which is the current LI=
NUX_LIBC_HEADERS_VERSION).
>>>>
>>>> (2) Set LINUX_LIBC_HEADERS_VERSION to 2.6.16 (which is the current O=
LDEST_KERNEL).
>>>>
>>>> (3) Support machine specific distro incarnations (incl. special feed=
s).
>>>>
>>>> May be some more. Option (1) would be really bad for us. I believe (=
2) would be bad for a lot of users because of a potential loss of functio=
nality.
>>>
>>> I'm still not convinced that requiring older headers is a good way to
>>> go. If applications are using new syscalls directly, they need to han=
dle
>>> ENOSYS. If the applications already contain code to be compatible acr=
oss
>>> various kernel versions at compile time, then it won't be that hard t=
o
>>> change those applications to detect available interfaces at runtime.
>>
>> At first i believe that practically it is not possible for us to guara=
ntee that all apps do this in the right way. But second i'm not sure if t=
his is the only problem.
>>
>> The kernel docu (what's the primary docu for me) itself says "but a pr=
ogram built against newer kernel headers may not work on an older kernel.=
" (see top of this post).
>>
>> This should be reason enough to avoid newer kernel headers (like all o=
ther linux distros do)!
>=20
> Well one way is to have kernel headers per machine which means you can
> not share target packages anymore since they have to build per machine
> but it would be much integrated solution and we could generate the
> kernel headers from the kernel recipe itself so we are sure that the
> .config of kernel headers match the .config of  kernel itself
> downside is it will defeat the multimachine sharing packages a bit.

That would definitely be my preferred solution. I hope the distro maintai=
ners can handle this.

> Second solution is to use the older or equal to oldest kernel of all
> multimachines for kernel headers. the problem Andreas described of
> differen defconfigs will still be there
> but it will work *mostly*

Just my second choice.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



