Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNzcq-0000TH-ES
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 03:09:59 +0100
Received: by pzk30 with SMTP id 30so5876329pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 18:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:mime-version:content-transfer-encoding:from:organization
	:date:message-id:in-reply-to:user-agent;
	bh=VvtefYwE7zTbv1uOAgd+/c6U/vm3HYERynZVMQKzYeU=;
	b=Nzg0ojHy92yFtrsKFfHE0IU9bAE2B0oIdVn4Q3w2oETqq7elco1DPQ+kz8o8A/qi/w
	I3IgZC8BFw9nvIaTTlNupUwdAsncC6ZfLkNlMBluz62JwID71Yf96HD0tHQSatj1s9S4
	lDs2Pf9cwnZU6lE+bUw2hmZcr637/pgxjDhq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:mime-version
	:content-transfer-encoding:from:organization:date:message-id
	:in-reply-to:user-agent;
	b=gOjc9gjoKyruR5D2F4lv9gLzcMGXjEkrjbDLKCLEpQg+tYTihjq/+J4kGo+kF6Q2WH
	9garhnfMmGODGXMGlQi1FodIVpZA6vnoAz5G7NVHkBEfYPZvY1BC3EBW6vs9Z4eNBNrg
	gWaczHXanE70CuA2Mos+AyGKJADVQZzhga8iU=
Received: by 10.142.3.3 with SMTP id 3mr8117031wfc.275.1261706881643;
	Thu, 24 Dec 2009 18:08:01 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.28])
	by mx.google.com with ESMTPS id 20sm8244313pzk.13.2009.12.24.18.07.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 18:08:01 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1261642620-16347-1-git-send-email-camelguo@gmail.com>
	<19c1b8a90912240945p53558860rd69b0ff980f076d@mail.gmail.com>
	<op.u5gzeecamn1qzu@guohr-laptop-ubuntu>
	<19c1b8a90912241758y335928e3r2e7b09f5be006051@mail.gmail.com>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Date: Fri, 25 Dec 2009 10:07:52 +0800
Message-ID: <op.u5g1jer6mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a90912241758y335928e3r2e7b09f5be006051@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix compilation error of events.c in ltrace on i386 target
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
X-List-Received-Date: Fri, 25 Dec 2009 02:09:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I am trying the glibc-2.10.1


=E5=9C=A8 Fri, 25 Dec 2009 09:58:41 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On Thu, Dec 24, 2009 at 5:21 PM, Guo Hongruan <camelguo@gmail.com> wro=
te:
>> Yes, you are right.
>>
>> In ubuntu-8.04, all PTRACE_EVENT* macroes are defined in
>> /usr/include/sys/ptrace.h. The version of glibc in ubuntu 8.04 is  =

>> 2.7.10.
>> But in glibc-2.6.1 of openembedded, sys/ptrace.h does not include
>> PTRACE_EVENT* macroes. So I believe it is a bug of glibc-2.6.10 or  =

>> ltrace.
>>
>> --- staging/i686-oe-linux/usr/include/sys/ptrace.h      2009-12-24
>> 19:21:47.000000000 +0800
>> +++ /usr/include/sys/ptrace.h   2009-08-18 09:02:45.000000000 +0800
>> @@ -1,5 +1,5 @@
>>  /* `ptrace' debugger support interface.  Linux version.
>> -   Copyright (C) 1996-1999,2000,2006 Free Software Foundation, Inc.
>> +   Copyright (C) 1996-1999,2000,2006,2007 Free Software Foundation, =
 =

>> Inc.
>>    This file is part of the GNU C Library.
>>
>>    The GNU C Library is free software; you can redistribute it and/or=

>> @@ -129,6 +129,29 @@
>>  #define PT_SETSIGINFO PTRACE_SETSIGINFO
>>  };
>>
>> +
>> +/* Options set using PTRACE_SETOPTIONS.  */
>> +enum __ptrace_setoptions {
>> +  PTRACE_O_TRACESYSGOOD        =3D 0x00000001,
>> +  PTRACE_O_TRACEFORK   =3D 0x00000002,
>> +  PTRACE_O_TRACEVFORK   =3D 0x00000004,
>> +  PTRACE_O_TRACECLONE  =3D 0x00000008,
>> +  PTRACE_O_TRACEEXEC   =3D 0x00000010,
>> +  PTRACE_O_TRACEVFORKDONE =3D 0x00000020,
>> +  PTRACE_O_TRACEEXIT   =3D 0x00000040,
>> +  PTRACE_O_MASK                =3D 0x0000007f
>> +};
>> +
>> +/* Wait extended result codes for the above trace options.  */
>> +enum __ptrace_eventcodes {
>> +  PTRACE_EVENT_FORK    =3D 1,
>> +  PTRACE_EVENT_VFORK   =3D 2,
>> +  PTRACE_EVENT_CLONE   =3D 3,
>> +  PTRACE_EVENT_EXEC    =3D 4,
>> +  PTRACE_EVENT_VFORK_DONE =3D 5,
>> +  PTRACE_EVENT_EXIT    =3D 6
>> +};
>> +
>>  /* Perform process tracing functions.  REQUEST is one of the values
>>    above, and determines the action to be taken.
>>    For all requests except PTRACE_TRACEME, PID specifies the process =
to  =

>> be
>
> the above could be patched into glibc 2.6.1 and if you are
> not specific I would recommend to use some later version
> of glibc.
>
>>
>> =E5=9C=A8 Fri, 25 Dec 2009 01:45:08 +0800=EF=BC=8CKhem Raj <raj.khem@=
gmail.com> =E5=86=99=E9=81=93:
>>
>>> On Thu, Dec 24, 2009 at 12:17 AM, Guo Hongruan <camelguo@gmail.com> =
 =

>>> wrote:
>>>>
>>>> on qemux86/minimal, the compilation of ltrace error reporting lack =
of
>>>> some macro started with PTRACE_EVENT, this patch fixes this problem=
.
>>>
>>> All PTRACE_EVENT* defines should come from sys/ptrace.h
>>> which it includes already. If these defines are not there then
>>> there seems to be a problem either in the libc headers that
>>> are installed or the way they are getting included.
>>>
>>> Can you post the preprocessed output of event.c ?
>>>
>>>> ---
>>>>  .../files/ltrace-fix-ptrace-event-macros.patch     |   12  =

>>>> ++++++++++++
>>>>  recipes/ltrace/ltrace_0.5.3.bb                     |    4 ++++
>>>>  2 files changed, 16 insertions(+), 0 deletions(-)
>>>>  create mode 100644
>>>> recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
>>>>
>>>> diff --git a/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.pa=
tch
>>>> b/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
>>>> new file mode 100644
>>>> index 0000000..7232ca8
>>>> --- /dev/null
>>>> +++ b/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
>>>> @@ -0,0 +1,12 @@
>>>> +Index: ltrace-0.5.3/sysdeps/linux-gnu/events.c
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +--- ltrace-0.5.3.orig/sysdeps/linux-gnu/events.c       2009-12-24
>>>> 15:58:24.000000000 +0800
>>>> ++++ ltrace-0.5.3/sysdeps/linux-gnu/events.c    2009-12-24
>>>> 15:58:41.000000000 +0800
>>>> +@@ -8,6 +8,7 @@
>>>> + #include <signal.h>
>>>> + #include <string.h>
>>>> + #include <sys/ptrace.h>
>>>> ++#include <linux/ptrace.h>
>>>> +
>>>> + #include "common.h"
>>>> +
>>>> diff --git a/recipes/ltrace/ltrace_0.5.3.bb
>>>> b/recipes/ltrace/ltrace_0.5.3.bb
>>>> index 4130c29..1f70878 100644
>>>> --- a/recipes/ltrace/ltrace_0.5.3.bb
>>>> +++ b/recipes/ltrace/ltrace_0.5.3.bb
>>>> @@ -4,6 +4,8 @@ SECTION =3D "devel"
>>>>  DEPENDS =3D "libelf"
>>>>  LICENSE =3D "GPLv2"
>>>>
>>>> +PR =3D "r2"
>>>> +
>>>>  SRC_URI =3D "\
>>>>  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz \
>>>>  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;patch=3D1 \
>>>> @@ -12,7 +14,9 @@ SRC_URI =3D "\
>>>>  file://ltrace-mips-remove-CP.patch;patch=3D1 \
>>>>  file://ltrace-mips.patch;patch=3D1 \
>>>>  file://ltrace-ppc.patch;patch=3D1 \
>>>> +  file://ltrace-fix-ptrace-event-macros.patch;patch=3D1 \
>>>>  "
>>>> +
>>>>  inherit autotools
>>>>
>>>>  export TARGET_CFLAGS =3D "${SELECTED_OPTIMIZATION} -isystem
>>>> ${STAGING_INCDIR}"
>>>> --
>>>> 1.5.4.3
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
>>
>>
>> --
>> Guo Hongruan, Embedded Linux Consultant
>> Skype: camelguo
>> Twitter: camelguo
>> http://www.gulessoft.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


