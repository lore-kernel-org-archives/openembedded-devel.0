Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTPNl-0003ia-8U
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 03:49:49 +0100
Received: by faat2 with SMTP id t2so2492201faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 18:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=YjpsVUVPczFz9ZTPcEYix88ZcWrziTDTZY8hiOKttBE=;
	b=hcGYwOIlU8jIRIiX0p1ILyUdYpVhdFqzotMpA614YJ7SPM6Qf9es1hu4BYJGYh2eHB
	m2Ln2HcXbe1hssBdX9qxMrcMbS8d6MteOpmiQy+Vj52i4Vd08qVJw03Z7Ll56ncFV+uq
	zssqZT0j54SDMFGvVqZ3Cn4ZXB+codlpBE1vE=
Received: by 10.152.134.77 with SMTP id pi13mr16464576lab.21.1322102596089;
	Wed, 23 Nov 2011 18:43:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 18:42:45 -0800 (PST)
In-Reply-To: <6523650A-975B-4F60-A56D-59FC87F3F24E@microbee-systems.com>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
	<CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
	<CALJpqJy6gZG2w6PmptOV0tzV9wzQr5zdPZKeJbzn02PrAb__Uw@mail.gmail.com>
	<20111114232852.GB3600@jama.jama.net>
	<6523650A-975B-4F60-A56D-59FC87F3F24E@microbee-systems.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 18:42:45 -0800
Message-ID: <CAMKF1sqY=vp0tsUVZ8yEExK65qj_SrE0CPO=qtW9Af8EvovJYw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: GCC Error
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
X-List-Received-Date: Thu, 24 Nov 2011 02:49:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 4:11 PM, David Thomas
<david.thomas@microbee-systems.com> wrote:
> Well not everyone works this day in and day out now do they? Show me wher=
e it states you have to use gcc.4.6 and for that matter, I specifically cho=
ose a LTS platform to avoid having to play latest and greatest.


you are confusing cross-gcc with gcc on your build host here. The
issue is that the recipe assumes that it will be compiled with minimum
gcc version 4.6 which is a wrong assumption since angstrom stable is
still using gcc 4.5

>
> So I ask, what is gained by forcing the user to have to use the absolute =
latest version?
>
> In addition, it is not necessarily clear to a OE newby how all this is pi=
eced together? It is a hackers paradise, I am not a hacker, I have a schedu=
le to meet.
> Perhaps
>
> In any event, it is moot, were dumping the cm-t35 and using a beagleboard=
 for product demonstration as it is a dead end.

you should follow angstrom's getting started directions here
http://www.angstrom-distribution.org/building-angstrom

and

http://sakrah.homelinux.org/blog/2011/03/using-openembedded-core-to-build-a=
ngstrom-for-qemu/

is basically an explanation of how the above instructions are used for
oe-core based angstrom.

>
> "The toolchain problems wouldn't have been there if people had used an ex=
isting, working distro like angstrom, the kernel issues mentioned above are=
 all handled automagically by linux.inc."
>
> Really?
>
> On Nov 14, 2011, at 5:28 PM, Martin Jansa wrote:
>
>> On Mon, Nov 14, 2011 at 04:23:30PM -0600, David Thomas wrote:
>>> OK, so I fight a install of gcc-4.6 onto ubuntu lts and same error. I
>>> first tried for weeks to get Compulab CM-T35 stuff to work per their
>>> instructions. Then I get the scripts and all seems well, now this. I
>>> have spent a month on trying to build a cm-t35 so I can then add in
>>> additional functionality. At ever turn it fails. =C2=A04 weeks and noth=
ing.
>>>
>>> I mean, how hard can this be?
>>
>> How hard is to find out that
>> meta-smartphone/meta-palm/recipes-kernel/linux/linux-hpveer_git.bb
>> probably is not best kernel for CM-T35 as the hpveer in name suggests?
>>
>> And how hard is to open that recipe and read:
>> # Workaround default -Werror setting and some warnings in kernel compila=
tion
>> TARGET_CC_KERNEL_ARCH +=3D " -Wno-error=3Dunused-but-set-variable -Wno-e=
rror=3Darray-bounds"
>>
>> which is needed for newer gcc to not fail with -Wall -Werror.
>>
>> Regards,
>>
>>>
>>>
>>> On Mon, Nov 14, 2011 at 12:59 PM, McClintock Matthew-B29882
>>> <B29882@freescale.com> wrote:
>>>> On Mon, Nov 14, 2011 at 12:55 PM, David Thomas
>>>> <david.thomas@microbee-systems.com> wrote:
>>>>> I am getting a gcc error
>>>>>
>>>>> cc1: error: -Werror=3Dunused-but-set-variable: No option -Wunused-but=
-set-variable
>>>>>
>>>>> Using the Angstrom scripts I can run machine=3Dbeagleboard and comple=
te.
>>>>> However, machine=3Dcm-t35 with a cm-t35.conf file throws this error.
>>>>>
>>>>> I am having to guess that the machine file is all that was required,
>>>>> it seems to pich all the right arch, etc.
>>>>>
>>>>> I had asked on Angstrom for any CM-T35 related info to no avail...
>>>>
>>>> This error is on by default for the compiler for OE now. You can get
>>>> around it by
>>>>
>>>> 1) Fixing the (potential) errors in the source code
>>>> 2) Turning off the error in the build (EXTRA_CFLAGS =3D
>>>> "-Wno-error=3Dunused-but-set-variable" or something similiar)
>>>>
>>>> -M
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>>
>>>
>>> --
>>> Dave Thomas
>>> MicroBee Systems, Inc
>>> 1429 Weatherly Road, Suite G
>>> Huntsville, AL 35803-1187
>>> 256-489-6671 (Voice)
>>> 256-426-2431 (Mobile)
>>> 256-489-6673 (FAX)
>>> www.microbee-systems.com
>>> "Innovative Solutions for an Embedded World"
>>>
>>> This message is intended for the sole use of the addressee, and may
>>> contain information that is privileged, confidential and exempt from
>>> disclosure under applicable law. If you are not the addressee you are
>>> hereby notified that you may not use, copy, disclose, or distribute to
>>> anyone the message or any information contained in the message. If you
>>> have received this message in error, please immediately advise the
>>> sender by reply email and delete this message.
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


