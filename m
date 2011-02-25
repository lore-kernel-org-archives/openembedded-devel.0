Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PssVZ-0005wl-Kd
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 08:54:37 +0100
Received: by fxm8 with SMTP id 8so1344561fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 23:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=nuwcAnNGw8ifdWYb99BjzsYht3/ImNJ7sU9P5LHYJVo=;
	b=j4RXs6k/TkNxtL0Qz7NidefMxvNmmZNxAtuL9S+KSFHVsV4W4hlmjZ7HaLSEol+bwP
	yeso6bf4zMPnFiaMsMfJBMWJJwTXG+aEGnOr/I0gEc7YNvziQS5O0wlndIpFPAg2zlwL
	wPsj7ca3XrNhQCgfvaX/V6CLkeuezDKW4f+N8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=jh1XgCR19w+QMs2qW/klHiw9P/GQhnkoyWrBOm9oGY6+DqOx0HogCTyy2sLN5i0rDD
	B1/T/ufhHsxTlXj5cNwKbPDIzx04E68hMNg2IZMuvS7fhaSQlMP/A4adGVxG7L69FNpz
	K0MUmhW3Beae80IOvdvCZEErx4NdX/c2BufUg=
Received: by 10.223.86.16 with SMTP id q16mr2232340fal.58.1298620333177; Thu,
	24 Feb 2011 23:52:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 24 Feb 2011 23:51:53 -0800 (PST)
In-Reply-To: <4D675D08.6050301@dresearch.de>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de> <4D6671C2.7060604@opendreambox.org>
	<4D675D08.6050301@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Feb 2011 23:51:53 -0800
Message-ID: <AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 25 Feb 2011 07:54:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2011 at 11:40 PM, Steffen Sledz <sledz@dresearch.de> wrote:
> On 02/24/2011 03:57 PM, Andreas Oberritter wrote:
>> On 02/24/2011 02:30 PM, Steffen Sledz wrote:
>>> On 02/18/2011 04:30 PM, Khem Raj wrote:
>>>> On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz <sledz@dresearch.de> wr=
ote:
>>>>> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>>>>>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>>>>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>>>>>> "Kernel headers are backwards compatible, but not forwards compati=
ble. =C2=A0This
>>>>>>>> means that a program built against a C library using older kernel =
headers
>>>>>>>> should run on a newer kernel (although it may not have access to n=
ew
>>>>>>>> features), but a program built against newer kernel headers may no=
t work on an
>>>>>>>> older kernel."[2]
>>>>>>>
>>>>>>> Isn't this what the variable OLDEST_KERNEL is good for, when compil=
ing
>>>>>>> glibc?
>>>>>>
>>>>>> If i'm right this goes to the --enable-kernel=3DVERSION configure op=
tion of glibc just to optimize the library.
>>>>>>
>>>>>> "the configure option --enable-kernel=3DX.Y.Z allows to strip out co=
mpatibility for kernel versions before X.Y.Z."
>>>>>>
>>>>>> Imho it is not legitimately to follow that glibc has compatibility c=
ode for all kernels greater or equal X.Y.Z.
>>>>>>
>>>>>> Another question is the handling in other libc implementations.
>>>>>>
>>>>>> And finally there are a lot of programs using userland kernel header=
s directly.
>>>>>
>>>>> Ping!
>>>>>
>>>>> If i interpret responses from Tom and Phil right they agree with me (=
or at least do not disagree). ;-)
>>>>>
>>>>> But i miss reactions from the distro maintainers (especially =C3=85ng=
str=C3=B6m).
>>>>>
>>>>
>>>> I think we should make sure that linux version chosen for a build is
>>>> equal or newer than linux-libc-headers for that build. Another option
>>>> is that linux-libc-headers are driven out
>>>> of selected virtual/kernel too but this may be a bit clunky since it
>>>> would mean that
>>>> every machine will have them different and we share sysroots e.g. two
>>>> armv5te may use
>>>> same sysroot
>>>
>>> I like to force the discussion/work/decision on this problem because we=
're one of the mourners (we're forced to use 2.6.24 kernel by out hardware =
vendor :( ).
>>>
>>> I also see the multi-machine problem (the shared sysroot at build time =
and the feed problem too).
>>>
>>> So what options do we (our =C3=85ngstr=C3=B6m) have?
>>>
>>> (1) Do not support kernel older than 2.6.31 (which is the current LINUX=
_LIBC_HEADERS_VERSION).
>>>
>>> (2) Set LINUX_LIBC_HEADERS_VERSION to 2.6.16 (which is the current OLDE=
ST_KERNEL).
>>>
>>> (3) Support machine specific distro incarnations (incl. special feeds).
>>>
>>> May be some more. Option (1) would be really bad for us. I believe (2) =
would be bad for a lot of users because of a potential loss of functionalit=
y.
>>
>> I'm still not convinced that requiring older headers is a good way to
>> go. If applications are using new syscalls directly, they need to handle
>> ENOSYS. If the applications already contain code to be compatible across
>> various kernel versions at compile time, then it won't be that hard to
>> change those applications to detect available interfaces at runtime.
>
> At first i believe that practically it is not possible for us to guarante=
e that all apps do this in the right way. But second i'm not sure if this i=
s the only problem.
>
> The kernel docu (what's the primary docu for me) itself says "but a progr=
am built against newer kernel headers may not work on an older kernel." (se=
e top of this post).
>
> This should be reason enough to avoid newer kernel headers (like all othe=
r linux distros do)!

Well one way is to have kernel headers per machine which means you can
not share target packages anymore since they have to build per machine
but it would be much integrated solution and we could generate the
kernel headers from the kernel recipe itself so we are sure that the
.config of kernel headers match the .config of  kernel itself
downside is it will defeat the multimachine sharing packages a bit.

Second solution is to use the older or equal to oldest kernel of all
multimachines for kernel headers. the problem Andreas described of
differen defconfigs will still be there
but it will work *mostly*


>
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@DResearch.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


