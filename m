Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PsceG-00061A-Vz
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 15:58:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id D2EDD314E0A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 15:57:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Y5lZ+JRKtMcz
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 15:57:07 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 25A2A314E0A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 15:57:07 +0100 (CET)
Message-ID: <4D6671C2.7060604@opendreambox.org>
Date: Thu, 24 Feb 2011 15:57:06 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5A5871.7000005@dresearch.de>
	<4D5A89CD.803@opendreambox.org>	<4D5A92BC.1010906@dresearch.de>
	<4D5E422B.3040703@dresearch.de>	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de>
In-Reply-To: <4D665D92.7000100@dresearch.de>
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
X-List-Received-Date: Thu, 24 Feb 2011 14:58:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/24/2011 02:30 PM, Steffen Sledz wrote:
> On 02/18/2011 04:30 PM, Khem Raj wrote:
>> On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz <sledz@dresearch.de> wr=
ote:
>>> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>>>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>>>> "Kernel headers are backwards compatible, but not forwards compati=
ble.  This
>>>>>> means that a program built against a C library using older kernel =
headers
>>>>>> should run on a newer kernel (although it may not have access to n=
ew
>>>>>> features), but a program built against newer kernel headers may no=
t work on an
>>>>>> older kernel."[2]
>>>>>
>>>>> Isn't this what the variable OLDEST_KERNEL is good for, when compil=
ing
>>>>> glibc?
>>>>
>>>> If i'm right this goes to the --enable-kernel=3DVERSION configure op=
tion of glibc just to optimize the library.
>>>>
>>>> "the configure option --enable-kernel=3DX.Y.Z allows to strip out co=
mpatibility for kernel versions before X.Y.Z."
>>>>
>>>> Imho it is not legitimately to follow that glibc has compatibility c=
ode for all kernels greater or equal X.Y.Z.
>>>>
>>>> Another question is the handling in other libc implementations.
>>>>
>>>> And finally there are a lot of programs using userland kernel header=
s directly.
>>>
>>> Ping!
>>>
>>> If i interpret responses from Tom and Phil right they agree with me (=
or at least do not disagree). ;-)
>>>
>>> But i miss reactions from the distro maintainers (especially =C3=85ng=
str=C3=B6m).
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
>=20
> I like to force the discussion/work/decision on this problem because we=
're one of the mourners (we're forced to use 2.6.24 kernel by out hardwar=
e vendor :( ).
>=20
> I also see the multi-machine problem (the shared sysroot at build time =
and the feed problem too).
>=20
> So what options do we (our =C3=85ngstr=C3=B6m) have?
>=20
> (1) Do not support kernel older than 2.6.31 (which is the current LINUX=
_LIBC_HEADERS_VERSION).
>=20
> (2) Set LINUX_LIBC_HEADERS_VERSION to 2.6.16 (which is the current OLDE=
ST_KERNEL).
>=20
> (3) Support machine specific distro incarnations (incl. special feeds).
>=20
> May be some more. Option (1) would be really bad for us. I believe (2) =
would be bad for a lot of users because of a potential loss of functional=
ity.

I'm still not convinced that requiring older headers is a good way to
go. If applications are using new syscalls directly, they need to handle
ENOSYS. If the applications already contain code to be compatible across
various kernel versions at compile time, then it won't be that hard to
change those applications to detect available interfaces at runtime.

IIRC, the kernel policy is to disallow incompatible changes to user
interfaces, so applications compiled against new headers generally don't
magically start to use new interfaces, unless their code gets adapted to
them.

Can you please shed some light on which kernel interfaces are actually
causing problems?

Btw.: The availability of syscalls not only depends on the kernel
version but on the kernel configuration, too. For example, if you
compile a kernel without CONFIG_EPOLL, epoll will still be available in
the kernel headers and will be found by autotools etc. But it will
alwyas return ENOSYS. We certainly can't provide matching
linux-libc-headers to avoid that.

Regards,
Andreas


