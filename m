Received: from einhorn.in-berlin.de ([192.109.42.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>)
	id 1Psw0B-0001VQ-Jy; Fri, 25 Feb 2011 12:38:27 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A20011.dip0.t-ipconnect.de [87.162.0.17]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1PBb0h7008219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 25 Feb 2011 12:37:00 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id E908323930;
	Fri, 25 Feb 2011 12:37:00 +0100 (CET)
Message-ID: <4D67945C.40507@dresearch.de>
Date: Fri, 25 Feb 2011 12:37:00 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5A5871.7000005@dresearch.de>
	<4D5A89CD.803@opendreambox.org>	<4D5A92BC.1010906@dresearch.de>
	<4D5E422B.3040703@dresearch.de>	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>	<4D665D92.7000100@dresearch.de>
	<4D6671C2.7060604@opendreambox.org>	<4D675D08.6050301@dresearch.de>	<AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
	<AANLkTik2sen3UtHwr1Rai5nQmr9MzpUg-YuuqdRgyfjC@mail.gmail.com>
In-Reply-To: <AANLkTik2sen3UtHwr1Rai5nQmr9MzpUg-YuuqdRgyfjC@mail.gmail.com>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1PBb0h7008219
Cc: Koen Kooi <koen@openembedded.org>
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
X-List-Received-Date: Fri, 25 Feb 2011 11:38:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/25/2011 11:22 AM, Frans Meulenbroeks wrote:
> 2011/2/25 Khem Raj <raj.khem@gmail.com>:
>> On Thu, Feb 24, 2011 at 11:40 PM, Steffen Sledz <sledz@dresearch.de> w=
rote:
>>> On 02/24/2011 03:57 PM, Andreas Oberritter wrote:
>>>> On 02/24/2011 02:30 PM, Steffen Sledz wrote:
>>>>> On 02/18/2011 04:30 PM, Khem Raj wrote:
>>>>>> On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz <sledz@dresearch.de=
> wrote:
>>>>>>> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>>>>>>>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>>>>>>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>>>>>>>> "Kernel headers are backwards compatible, but not forwards com=
patible.  This
>>>>>>>>>> means that a program built against a C library using older ker=
nel headers
>>>>>>>>>> should run on a newer kernel (although it may not have access =
to new
>>>>>>>>>> features), but a program built against newer kernel headers ma=
y not work on an
>>>>>>>>>> older kernel."[2]
>>>>>>>>>
>>>>>>>>> Isn't this what the variable OLDEST_KERNEL is good for, when co=
mpiling
>>>>>>>>> glibc?
>>>>>>>>
>>>>>>>> If i'm right this goes to the --enable-kernel=3DVERSION configur=
e option of glibc just to optimize the library.
>>>>>>>>
>>>>>>>> "the configure option --enable-kernel=3DX.Y.Z allows to strip ou=
t compatibility for kernel versions before X.Y.Z."
>>>>>>>>
>>>>>>>> Imho it is not legitimately to follow that glibc has compatibili=
ty code for all kernels greater or equal X.Y.Z.
>>>>>>>>
>>>>>>>> Another question is the handling in other libc implementations.
>>>>>>>>
>>>>>>>> And finally there are a lot of programs using userland kernel he=
aders directly.
>>>>>>>
>>>>>>> Ping!
>>>>>>>
>>>>>>> If i interpret responses from Tom and Phil right they agree with =
me (or at least do not disagree). ;-)
>>>>>>>
>>>>>>> But i miss reactions from the distro maintainers (especially =C3=85=
ngstr=C3=B6m).
>>>>>>>
>>>>>>
>>>>>> I think we should make sure that linux version chosen for a build =
is
>>>>>> equal or newer than linux-libc-headers for that build. Another opt=
ion
>>>>>> is that linux-libc-headers are driven out
>>>>>> of selected virtual/kernel too but this may be a bit clunky since =
it
>>>>>> would mean that
>>>>>> every machine will have them different and we share sysroots e.g. =
two
>>>>>> armv5te may use
>>>>>> same sysroot
>>>>>
>>>>> I like to force the discussion/work/decision on this problem becaus=
e we're one of the mourners (we're forced to use 2.6.24 kernel by out har=
dware vendor :( ).
>>>>>
>>>>> I also see the multi-machine problem (the shared sysroot at build t=
ime and the feed problem too).
>>>>>
>>>>> So what options do we (our =C3=85ngstr=C3=B6m) have?
>>>>>
>>>>> (1) Do not support kernel older than 2.6.31 (which is the current L=
INUX_LIBC_HEADERS_VERSION).
>>>>>
>>>>> (2) Set LINUX_LIBC_HEADERS_VERSION to 2.6.16 (which is the current =
OLDEST_KERNEL).
>>>>>
>>>>> (3) Support machine specific distro incarnations (incl. special fee=
ds).
>>>>>
>>>>> May be some more. Option (1) would be really bad for us. I believe =
(2) would be bad for a lot of users because of a potential loss of functi=
onality.
>>>>
>>>> I'm still not convinced that requiring older headers is a good way t=
o
>>>> go. If applications are using new syscalls directly, they need to ha=
ndle
>>>> ENOSYS. If the applications already contain code to be compatible ac=
ross
>>>> various kernel versions at compile time, then it won't be that hard =
to
>>>> change those applications to detect available interfaces at runtime.
>>>
>>> At first i believe that practically it is not possible for us to guar=
antee that all apps do this in the right way. But second i'm not sure if =
this is the only problem.
>>>
>>> The kernel docu (what's the primary docu for me) itself says "but a p=
rogram built against newer kernel headers may not work on an older kernel=
." (see top of this post).
>>>
>>> This should be reason enough to avoid newer kernel headers (like all =
other linux distros do)!
>>
>> Well one way is to have kernel headers per machine which means you can
>> not share target packages anymore since they have to build per machine
>> but it would be much integrated solution and we could generate the
>> kernel headers from the kernel recipe itself so we are sure that the
>> .config of kernel headers match the .config of  kernel itself
>> downside is it will defeat the multimachine sharing packages a bit.
>=20
> Maybe an intermediate is to have kernel headers per kernel recipe.
> That still allows multimachine sharing of packages between systems
> that use the same arch and kernel recipe.

Sounds good to me.

> (and I feel sharing packages between machines with different kernels
> is somewhat risky anyway as there might be differences between e.g.
> the stock kernel and a kernel pulled from a vendor git or so).
>=20
> Frans
>>
>> Second solution is to use the older or equal to oldest kernel of all
>> multimachines for kernel headers. the problem Andreas described of
>> differen defconfigs will still be there
>> but it will work *mostly*

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


