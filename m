Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNzTo-0000IF-0a
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 03:00:39 +0100
Received: by iwn32 with SMTP id 32so5590492iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 17:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=m7MlxNBslfoj0o7m+lJz1vyyAls/Q4KvMmp4CoK8Tlc=;
	b=uQe6dH5g4VOm+oAJaRKwj0UPbjATQAEd6NVn1qYQEHnIJFBXn2IQua7OVgQt3Tm6Oi
	AlaRRNblWuyIqTGBQDxuYcO7QBv1n4MdKV6AJPrWn1N6n5k309/r1HVcYlypUKzD9kEL
	wSHsv1nRM6QfIBtzP1NnBQzGrjjKwXS+gylTs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NnShIlVuYfkmXlzKVvEBq9IxX6cT8s36ZS5Crvjg+//ESz5NyUKNMIK3nt2kJy7aXo
	GYHFxv9oysfiEAqmOckG7l2NnuUNp56nI/tj8saHs2IRHY530fhN+hzVzQf4lRrezrDL
	l30ctUSMIBpo+Iip1IvOukSQrJ+2rLZnxts4E=
MIME-Version: 1.0
Received: by 10.231.125.19 with SMTP id w19mr747457ibr.8.1261706321317; Thu, 
	24 Dec 2009 17:58:41 -0800 (PST)
In-Reply-To: <op.u5gzeecamn1qzu@guohr-laptop-ubuntu>
References: <1261642620-16347-1-git-send-email-camelguo@gmail.com>
	<19c1b8a90912240945p53558860rd69b0ff980f076d@mail.gmail.com>
	<op.u5gzeecamn1qzu@guohr-laptop-ubuntu>
Date: Thu, 24 Dec 2009 17:58:41 -0800
Message-ID: <19c1b8a90912241758y335928e3r2e7b09f5be006051@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Fri, 25 Dec 2009 02:00:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2009 at 5:21 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Yes, you are right.
>
> In ubuntu-8.04, all PTRACE_EVENT* macroes are defined in
> /usr/include/sys/ptrace.h. The version of glibc in ubuntu 8.04 is 2.7.10.
> But in glibc-2.6.1 of openembedded, sys/ptrace.h does not include
> PTRACE_EVENT* macroes. So I believe it is a bug of glibc-2.6.10 or ltrace=
.
>
> --- staging/i686-oe-linux/usr/include/sys/ptrace.h =C2=A0 =C2=A0 =C2=A020=
09-12-24
> 19:21:47.000000000 +0800
> +++ /usr/include/sys/ptrace.h =C2=A0 2009-08-18 09:02:45.000000000 +0800
> @@ -1,5 +1,5 @@
> =C2=A0/* `ptrace' debugger support interface. =C2=A0Linux version.
> - =C2=A0 Copyright (C) 1996-1999,2000,2006 Free Software Foundation, Inc.
> + =C2=A0 Copyright (C) 1996-1999,2000,2006,2007 Free Software Foundation,=
 Inc.
> =C2=A0 =C2=A0This file is part of the GNU C Library.
>
> =C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or
> @@ -129,6 +129,29 @@
> =C2=A0#define PT_SETSIGINFO PTRACE_SETSIGINFO
> =C2=A0};
>
> +
> +/* Options set using PTRACE_SETOPTIONS. =C2=A0*/
> +enum __ptrace_setoptions {
> + =C2=A0PTRACE_O_TRACESYSGOOD =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x00000001,
> + =C2=A0PTRACE_O_TRACEFORK =C2=A0 =3D 0x00000002,
> + =C2=A0PTRACE_O_TRACEVFORK =C2=A0 =3D 0x00000004,
> + =C2=A0PTRACE_O_TRACECLONE =C2=A0=3D 0x00000008,
> + =C2=A0PTRACE_O_TRACEEXEC =C2=A0 =3D 0x00000010,
> + =C2=A0PTRACE_O_TRACEVFORKDONE =3D 0x00000020,
> + =C2=A0PTRACE_O_TRACEEXIT =C2=A0 =3D 0x00000040,
> + =C2=A0PTRACE_O_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 0x0000007f
> +};
> +
> +/* Wait extended result codes for the above trace options. =C2=A0*/
> +enum __ptrace_eventcodes {
> + =C2=A0PTRACE_EVENT_FORK =C2=A0 =C2=A0=3D 1,
> + =C2=A0PTRACE_EVENT_VFORK =C2=A0 =3D 2,
> + =C2=A0PTRACE_EVENT_CLONE =C2=A0 =3D 3,
> + =C2=A0PTRACE_EVENT_EXEC =C2=A0 =C2=A0=3D 4,
> + =C2=A0PTRACE_EVENT_VFORK_DONE =3D 5,
> + =C2=A0PTRACE_EVENT_EXIT =C2=A0 =C2=A0=3D 6
> +};
> +
> =C2=A0/* Perform process tracing functions. =C2=A0REQUEST is one of the v=
alues
> =C2=A0 =C2=A0above, and determines the action to be taken.
> =C2=A0 =C2=A0For all requests except PTRACE_TRACEME, PID specifies the pr=
ocess to be

the above could be patched into glibc 2.6.1 and if you are
not specific I would recommend to use some later version
of glibc.

>
> =E5=9C=A8 Fri, 25 Dec 2009 01:45:08 +0800=EF=BC=8CKhem Raj <raj.khem@gmai=
l.com> =E5=86=99=E9=81=93:
>
>> On Thu, Dec 24, 2009 at 12:17 AM, Guo Hongruan <camelguo@gmail.com> wrot=
e:
>>>
>>> on qemux86/minimal, the compilation of ltrace error reporting lack of
>>> some macro started with PTRACE_EVENT, this patch fixes this problem.
>>
>> All PTRACE_EVENT* defines should come from sys/ptrace.h
>> which it includes already. If these defines are not there then
>> there seems to be a problem either in the libc headers that
>> are installed or the way they are getting included.
>>
>> Can you post the preprocessed output of event.c ?
>>
>>> ---
>>> =C2=A0.../files/ltrace-fix-ptrace-event-macros.patch =C2=A0 =C2=A0 | =
=C2=A0 12 ++++++++++++
>>> =C2=A0recipes/ltrace/ltrace_0.5.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++++
>>> =C2=A02 files changed, 16 insertions(+), 0 deletions(-)
>>> =C2=A0create mode 100644
>>> recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
>>>
>>> diff --git a/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
>>> b/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
>>> new file mode 100644
>>> index 0000000..7232ca8
>>> --- /dev/null
>>> +++ b/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
>>> @@ -0,0 +1,12 @@
>>> +Index: ltrace-0.5.3/sysdeps/linux-gnu/events.c
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +--- ltrace-0.5.3.orig/sysdeps/linux-gnu/events.c =C2=A0 =C2=A0 =C2=A0 =
2009-12-24
>>> 15:58:24.000000000 +0800
>>> ++++ ltrace-0.5.3/sysdeps/linux-gnu/events.c =C2=A0 =C2=A02009-12-24
>>> 15:58:41.000000000 +0800
>>> +@@ -8,6 +8,7 @@
>>> + #include <signal.h>
>>> + #include <string.h>
>>> + #include <sys/ptrace.h>
>>> ++#include <linux/ptrace.h>
>>> +
>>> + #include "common.h"
>>> +
>>> diff --git a/recipes/ltrace/ltrace_0.5.3.bb
>>> b/recipes/ltrace/ltrace_0.5.3.bb
>>> index 4130c29..1f70878 100644
>>> --- a/recipes/ltrace/ltrace_0.5.3.bb
>>> +++ b/recipes/ltrace/ltrace_0.5.3.bb
>>> @@ -4,6 +4,8 @@ SECTION =3D "devel"
>>> =C2=A0DEPENDS =3D "libelf"
>>> =C2=A0LICENSE =3D "GPLv2"
>>>
>>> +PR =3D "r2"
>>> +
>>> =C2=A0SRC_URI =3D "\
>>> =C2=A0${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz \
>>> =C2=A0${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;patch=3D1 \
>>> @@ -12,7 +14,9 @@ SRC_URI =3D "\
>>> =C2=A0file://ltrace-mips-remove-CP.patch;patch=3D1 \
>>> =C2=A0file://ltrace-mips.patch;patch=3D1 \
>>> =C2=A0file://ltrace-ppc.patch;patch=3D1 \
>>> + =C2=A0file://ltrace-fix-ptrace-event-macros.patch;patch=3D1 \
>>> =C2=A0"
>>> +
>>> =C2=A0inherit autotools
>>>
>>> =C2=A0export TARGET_CFLAGS =3D "${SELECTED_OPTIMIZATION} -isystem
>>> ${STAGING_INCDIR}"
>>> --
>>> 1.5.4.3
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


