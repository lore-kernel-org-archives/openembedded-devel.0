Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P1jDx-0002em-T9
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 19:17:48 +0200
Received: by iwn2 with SMTP id 2so4083077iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=KkeAYitmsVqSnbnMu6ULhi4vMM42/6Or8ccFXuZ51EI=;
	b=dfMDNDDHLI8RGzCxB10pcWQf3TZcLIKQC5f/rKHxuN7hdqTQKawgc7DfUBMKU6bpPF
	Vb4JUqmf5gRUQilCKDlelApnr/+kpvLvA+A8+XttoeNYSjpoKbcYVWg5OztsTWBoMn6l
	HnqlRYpwbKOhIUSxlbVehqKFqxG4hTLvcT4YA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=nUNnscb9EHNpS5vX4ncpwZZ2zQfN3xPvUfUPnEiu2iloJ/+9ARRRcv4Sj4BdwucQ/h
	daqUfaGFCnnFVZOq+caj1DMj+bBpivSfHFr1fCHh9g0FqGrn8QcH8Uq8RZm1hSo4xdOi
	JAUTbZNEWGWh0XzGtcVjXj9icbOr+dgCFu4lk=
Received: by 10.231.172.205 with SMTP id m13mr6021712ibz.35.1285953391749;
	Fri, 01 Oct 2010 10:16:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 1 Oct 2010 10:16:00 -0700 (PDT)
In-Reply-To: <4CA5B348.1000404@dresearch.de>
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>
	<4CA46AD8.2070205@dresearch.de>
	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>
	<4CA5B348.1000404@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Oct 2010 10:16:00 -0700
Message-ID: <AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>
To: Thilo Fromm <t.fromm@dresearch.de>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Fri, 01 Oct 2010 17:18:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 1, 2010 at 3:09 AM, Thilo Fromm <t.fromm@dresearch.de> wrote:
> Hello Frans, hello Khem,
>
>>>>> It looks like libunwind provides header files that are named
>>>>> identically to gcc header files. gcc then confuses these headers when
>>>>> it
>>>>> is built, causing a break of the build.
>>>>>
>>>>> This patch makes libunwind depend on gcc which resolves the build
>>>>> issue.
>>>>> Both
>>>>> build nicely when gcc is built first.
>>>>
>>>> Hm. Ideally this should be patched in gcc.
>>>
>>> I don't think this is a gcc issue. It's a reasonable point of view,
>>> right,
>>> but pushing the header file issue back to libunwind is a valid POV, too=
.
>>> I
>>> think it's rather a problem between those two packages.
>>
>> Well I don't know the exact cause:
>> if libunwind publishes a header X.h and gcc has an internal header
>> file X.h and picks the wrong one then clearly the way it searches the
>> include dirs is wrong.
>> if both publish X.h and they are incompatible then there is a
>> conflict, and some other package could pick up the wrong X.h too.
>>
>> (and it could also be the case that libunwind does publish a file
>> which it should not publish as it is an internal file)
>
> They both provide unwind.h. For the library this is a "public" header fil=
e,
> though, describing the interface to libunwind. It's exported by libunwind=
.
> For some reason the libunwind version is used by gcc when gcc is compiled=
.
>
>>>> Now I feel that if someone
>>>>
>>>> does a bitbake libunwind; bitbake -cclean gcc; bitbake gcc things
>>>> still fail.
>>>
>>> Did you give this a try? I'll check it as soon as I can.
>>
>> I haven't; I'm not behind my build system atm.
>>
>> The issue that I see is that the last gcc build still may pick up the
>> libunwind header.
>
> OK, I see. I ran a test build, and you're right, this is what happens. We=
ll,
> at least a clean build works with my small patch.
>
> However, it looks like the maintainer of the gcc recipe needs to lake a l=
ook
> at this. I CCed this mal directly to Khem to get some attention to this
> issue.
>
>>>> Btw what include files are we talking about?
>>>
>>> I took word from Steffen (Sledz) about the cause of the problem, so I
>>> didn't
>>> investigate any further. Introducing the dependency seemed to fix the
>>> problem, so why bother. However, I feel like this kind of problem is
>>> better
>>> fixed (the way you're proposing it) by the package maintainer, if there
>>> is
>>> one.
>>
>> I'd rather know the root cause.
>> A fix without the root cause being known, often ends up to be
>> something that just masks the problem.
>> No idea if there is a libunwind maintainer.
>> gcc maintainer is Khem Raj.
>
> I tracked it down - libunwind publishes unwind.h, and gcc uses an interna=
l
> file of the same name while being built.

Yes gcc has its own version of libunwind which it used unless
configured with --with-system-libunwind
IIUC the problem happens with target gcc not with cross-gcc. target
gcc is built using cross-gcc and
<sysroot>/use/include could be preferred over the location of
libunwind.h which is in gcc sources
If thats the case then we need to fix gcc build to not look into
standard sysroot/usr/include but prefer
the local unwind.h when its using internal libunwind. The problem
would not show up if the libunwind versions
were matching but that may not be the case always and I dont know of
hand how we can fix the gcc configury/build
to ignore installed unwind.h

You workaround would only work if build sequence was followed if some
one just cleaned gcc and rebuild it
the problem will resurface.

>
> Regards,
> Thilo
>
> --
> Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
> DResearch Digital Media Systems GmbH
> Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
> Tel: +49 (30) 515 932 228 =C2=A0 mailto:t.fromm@dresearch.de
> Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
> Amtsgericht: Berlin Charlottenburg, HRB:54412
> Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642
> Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle
>


