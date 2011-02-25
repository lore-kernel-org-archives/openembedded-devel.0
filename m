Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Psuq9-00046Z-Jy
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 11:24:01 +0100
Received: by iwn10 with SMTP id 10so1010211iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 02:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=T58lwYra9FsY/Qh3GtCnANsp6tcxxOdQqEU0PpIhqXg=;
	b=j4An9DBkFl4gF5NReYPhCwZwSH+Ry3qtQTO/3JuyumEoe4WkNpQj6Tyx7ZiBnb9rV6
	u7AaZ4I3itKTMv/jyNlPHbDN4cYlBgWqDLqEnLe2eIh1UxAFPx/BJxBpXBNPAel4Nrl3
	pf5Z5YpXEX7X1AGyqKN3yypakHvPQXFu/Q5a8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pLmtJdsRFuukznzDyoUWAzvBdfOD3yIyMqJXNV+4FHRw54LrT4R18/NjiJLnTl8LDJ
	2S/wBC7zKgGEuoVTEfFgODGrQ8Dd+CZoLBhDpU2VQn0pmIgYvUsElJlyRQlIOO63/0Xo
	BnxoZ5gcdBXNLnWjQBZmGzor1/JI/42mc2wvU=
MIME-Version: 1.0
Received: by 10.231.19.195 with SMTP id c3mr1849528ibb.176.1298629333898; Fri,
	25 Feb 2011 02:22:13 -0800 (PST)
Received: by 10.231.11.201 with HTTP; Fri, 25 Feb 2011 02:22:13 -0800 (PST)
In-Reply-To: <AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de> <4D6671C2.7060604@opendreambox.org>
	<4D675D08.6050301@dresearch.de>
	<AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
Date: Fri, 25 Feb 2011 11:22:13 +0100
Message-ID: <AANLkTik2sen3UtHwr1Rai5nQmr9MzpUg-YuuqdRgyfjC@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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
X-List-Received-Date: Fri, 25 Feb 2011 10:24:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/25 Khem Raj <raj.khem@gmail.com>:
> On Thu, Feb 24, 2011 at 11:40 PM, Steffen Sledz <sledz@dresearch.de> wrot=
e:
>> On 02/24/2011 03:57 PM, Andreas Oberritter wrote:
>>> On 02/24/2011 02:30 PM, Steffen Sledz wrote:
>>>> On 02/18/2011 04:30 PM, Khem Raj wrote:
>>>>> On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz <sledz@dresearch.de> w=
rote:
>>>>>> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>>>>>>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>>>>>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>>>>>>> "Kernel headers are backwards compatible, but not forwards compat=
ible. =A0This
>>>>>>>>> means that a program built against a C library using older kernel=
 headers
>>>>>>>>> should run on a newer kernel (although it may not have access to =
new
>>>>>>>>> features), but a program built against newer kernel headers may n=
ot work on an
>>>>>>>>> older kernel."[2]
>>>>>>>>
>>>>>>>> Isn't this what the variable OLDEST_KERNEL is good for, when compi=
ling
>>>>>>>> glibc?
>>>>>>>
>>>>>>> If i'm right this goes to the --enable-kernel=3DVERSION configure o=
ption of glibc just to optimize the library.
>>>>>>>
>>>>>>> "the configure option --enable-kernel=3DX.Y.Z allows to strip out c=
ompatibility for kernel versions before X.Y.Z."
>>>>>>>
>>>>>>> Imho it is not legitimately to follow that glibc has compatibility =
code for all kernels greater or equal X.Y.Z.
>>>>>>>
>>>>>>> Another question is the handling in other libc implementations.
>>>>>>>
>>>>>>> And finally there are a lot of programs using userland kernel heade=
rs directly.
>>>>>>
>>>>>> Ping!
>>>>>>
>>>>>> If i interpret responses from Tom and Phil right they agree with me =
(or at least do not disagree). ;-)
>>>>>>
>>>>>> But i miss reactions from the distro maintainers (especially =C5ngst=
r=F6m).
>>>>>>
>>>>>
>>>>> I think we should make sure that linux version chosen for a build is
>>>>> equal or newer than linux-libc-headers for that build. Another option
>>>>> is that linux-libc-headers are driven out
>>>>> of selected virtual/kernel too but this may be a bit clunky since it
>>>>> would mean that
>>>>> every machine will have them different and we share sysroots e.g. two
>>>>> armv5te may use
>>>>> same sysroot
>>>>
>>>> I like to force the discussion/work/decision on this problem because w=
e're one of the mourners (we're forced to use 2.6.24 kernel by out hardware=
 vendor :( ).
>>>>
>>>> I also see the multi-machine problem (the shared sysroot at build time=
 and the feed problem too).
>>>>
>>>> So what options do we (our =C5ngstr=F6m) have?
>>>>
>>>> (1) Do not support kernel older than 2.6.31 (which is the current LINU=
X_LIBC_HEADERS_VERSION).
>>>>
>>>> (2) Set LINUX_LIBC_HEADERS_VERSION to 2.6.16 (which is the current OLD=
EST_KERNEL).
>>>>
>>>> (3) Support machine specific distro incarnations (incl. special feeds)=
.
>>>>
>>>> May be some more. Option (1) would be really bad for us. I believe (2)=
 would be bad for a lot of users because of a potential loss of functionali=
ty.
>>>
>>> I'm still not convinced that requiring older headers is a good way to
>>> go. If applications are using new syscalls directly, they need to handl=
e
>>> ENOSYS. If the applications already contain code to be compatible acros=
s
>>> various kernel versions at compile time, then it won't be that hard to
>>> change those applications to detect available interfaces at runtime.
>>
>> At first i believe that practically it is not possible for us to guarant=
ee that all apps do this in the right way. But second i'm not sure if this =
is the only problem.
>>
>> The kernel docu (what's the primary docu for me) itself says "but a prog=
ram built against newer kernel headers may not work on an older kernel." (s=
ee top of this post).
>>
>> This should be reason enough to avoid newer kernel headers (like all oth=
er linux distros do)!
>
> Well one way is to have kernel headers per machine which means you can
> not share target packages anymore since they have to build per machine
> but it would be much integrated solution and we could generate the
> kernel headers from the kernel recipe itself so we are sure that the
> .config of kernel headers match the .config of =A0kernel itself
> downside is it will defeat the multimachine sharing packages a bit.

Maybe an intermediate is to have kernel headers per kernel recipe.
That still allows multimachine sharing of packages between systems
that use the same arch and kernel recipe.

(and I feel sharing packages between machines with different kernels
is somewhat risky anyway as there might be differences between e.g.
the stock kernel and a kernel pulled from a vendor git or so).

Frans
>
> Second solution is to use the older or equal to oldest kernel of all
> multimachines for kernel headers. the problem Andreas described of
> differen defconfigs will still be there
> but it will work *mostly*
>
>


