Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Vma-0005nm-KK
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 11:20:16 +0100
Received: by lahc1 with SMTP id c1so1295584lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:11:55 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.129.69 as permitted sender)
	client-ip=10.152.129.69; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.129.69 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.129.69])
	by 10.152.129.69 with SMTP id nu5mr640538lab.9.1329991915489 (num_hops
	= 1); Thu, 23 Feb 2012 02:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kEKDOlKTM0fUAu36HqvOaBH3oltVCfIc3rm0WRNwhA0=;
	b=AP2l7BecpXnrXZmf02jf1MGm3PfmLsbmwKXh1FEn72msSaN2MczwtqlWFpccTyO/hf
	YO/Jf9x7DDtAYqG9MTNJFyv7Vk1sWrE9++IsAWqJUN2f5+9uhrhN3QD7n2QpSDJ+YuQA
	e+ItQZ/UAXOiNlLtDDGKjCbNi/nO/E/IHBNGo=
MIME-Version: 1.0
Received: by 10.152.129.69 with SMTP id nu5mr548823lab.9.1329991915312; Thu,
	23 Feb 2012 02:11:55 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 23 Feb 2012 02:11:55 -0800 (PST)
In-Reply-To: <CALbNGRS49UDHDMCS9=fePkuEXEd_fOJ0WSxcsSf2aeCstdNxKg@mail.gmail.com>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
	<CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
	<CALbNGRS49UDHDMCS9=fePkuEXEd_fOJ0WSxcsSf2aeCstdNxKg@mail.gmail.com>
Date: Thu, 23 Feb 2012 11:11:55 +0100
Message-ID: <CALbNGRT9MrCr9fUL1UfLWK+maCwu89PkEYr43Kk3X9gQXC8m5g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-cross-initial patching fails
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
X-List-Received-Date: Thu, 23 Feb 2012 10:20:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 10:39 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Feb 22, 2012 at 10:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Feb 22, 2012 at 12:15 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>>> Applying patch gcc45-no-add-needed.patch
>>>> patching file gcc/config/alpha/elf.h
>>>> patching file gcc/config/ia64/linux.h
>>>> patching file gcc/config/linux.h
>>>> Hunk #1 succeeded at 89 (offset -12 lines).
>>>> patching file gcc/config/rs6000/sysv4.h
>>>> Hunk #1 FAILED at 908.
>>>> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
>>>> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
>>>> ERROR: Function failed: patch_do_patch
>>>> ERROR: Logfile of failure stored in:
>>>> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/=
temp/log.do_patch.5367
>>>> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Fai=
led
>>>> ERROR: Task 2829
>>>> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipe=
s-devtools/gcc/gcc-cross-initial_4.5.bb,
>>>> do_patch) failed with exit code '1'
>>>>
>>>> git log does not help me much - =A0what goes wrong?
>>>
>>> Which actual patch is it failing on? Is there a conflict between
>>> oe-core and meta-oe patch set against gcc?
>>
>> gcc45-no-add-needed.patch is the patch in question. I dont see
>> anything wrong with it.
>> Can you do bitbake -ccleanall gcc-cross-initial and redo bitbake
>> gcc-cross-initial -cpatch ?
>>
> FYI: I removed the line which came in by the commits I mentioned above
>
> should_apply[vardepsexclude] +=3D "PN"
>
> in openembedded-core/meta/recipes-devtools/gcc/gcc-common.inc
>
> and build from scratch works without issues.
>
Strange: On my other build machine the described error does not occur...

Andreas


