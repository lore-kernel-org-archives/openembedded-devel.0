Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqSL2-0006R2-2I
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 16:33:44 +0100
Received: by fxm17 with SMTP id 17so3690403fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 07:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Z9DfmXwgvzRShNjj5fX3SxnJrZW/EfIhS1+rezsAJ1U=;
	b=MisptG/FHVWE7DQuQ0kN1y2XO7zthe9mJZ8uaNAz9moIvzqmqFWIt+8qVTL9YH5BRJ
	+gqh6DxhRkvr+8w0kl1sooRgRhszZFez9casHxy0y7wk88VOU59HJ6HFCqBJiEV3apLB
	EePHdz/LBtYhpHGvhAbCDpgw380wYZzOFrbb0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=D1qwIWrKrKmmWCKumgrjsU36utMrIyxoPtSV6J1zQW8pdb6XOYAxyehWMIxuz0kfW8
	M+/EJJ/AOLeKC1i5PhguzHOBJLIc+LCnDhiGKZV51QMnf+j7nCZBdyhmH1gqG77BgW/g
	WjYAEOURgqnI/KPu8KBIJITJVgFr410pJ//+Y=
Received: by 10.223.53.68 with SMTP id l4mr1146335fag.44.1298043088167; Fri,
	18 Feb 2011 07:31:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Fri, 18 Feb 2011 07:30:16 -0800 (PST)
In-Reply-To: <4D5E422B.3040703@dresearch.de>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Feb 2011 07:30:16 -0800
Message-ID: <AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: koen@openembedded.org
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
X-List-Received-Date: Fri, 18 Feb 2011 15:33:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>> "Kernel headers are backwards compatible, but not forwards compatible.=
 =C2=A0This
>>>> means that a program built against a C library using older kernel head=
ers
>>>> should run on a newer kernel (although it may not have access to new
>>>> features), but a program built against newer kernel headers may not wo=
rk on an
>>>> older kernel."[2]
>>>
>>> Isn't this what the variable OLDEST_KERNEL is good for, when compiling
>>> glibc?
>>
>> If i'm right this goes to the --enable-kernel=3DVERSION configure option=
 of glibc just to optimize the library.
>>
>> "the configure option --enable-kernel=3DX.Y.Z allows to strip out compat=
ibility for kernel versions before X.Y.Z."
>>
>> Imho it is not legitimately to follow that glibc has compatibility code =
for all kernels greater or equal X.Y.Z.
>>
>> Another question is the handling in other libc implementations.
>>
>> And finally there are a lot of programs using userland kernel headers di=
rectly.
>
> Ping!
>
> If i interpret responses from Tom and Phil right they agree with me (or a=
t least do not disagree). ;-)
>
> But i miss reactions from the distro maintainers (especially =C3=85ngstr=
=C3=B6m).
>

I think we should make sure that linux version chosen for a build is
equal or newer than linux-libc-headers for that build. Another option
is that linux-libc-headers are driven out
of selected virtual/kernel too but this may be a bit clunky since it
would mean that
every machine will have them different and we share sysroots e.g. two
armv5te may use
same sysroot


