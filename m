Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OQl3l-0007j4-4w
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 19:45:28 +0200
Received: by iwn42 with SMTP id 42so277061iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 10:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=obfpWbjXoIroBZUxJznBFpgc3z327kH5Acr8K7W9LSc=;
	b=lw7rysMxYaCMPXV1qyHLLt1h8eIfmbLxnKacJmN7wsffefckgE768JxCDCyWBzFu+5
	o8KfOW3uu66Uo9X01mblYRGzvubR6lWRzV6PYrgAjg+1gDkLhajxWVR+uYvLWMNUtkOY
	N5/RGjtAWALy5GPSasN5SoKZNA1ZdDTYcF1BQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=E8HQxAcPuGQQKpOlxYjH+6v44aQkgcES/vPMwM28IsfY1r1PQBtvpbnFkX76hOTnQz
	bNia281XMnJXYO3pBs4/770q1Wcdodat1zTkd/RmrqimrbxRat0SYB+RaRWjQVH2f8bX
	ITqN114cX07XMfbNHuL+j2puwCCn500H/7oJo=
Received: by 10.231.196.221 with SMTP id eh29mr6244874ibb.180.1277142046885; 
	Mon, 21 Jun 2010 10:40:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Mon, 21 Jun 2010 10:40:25 -0700 (PDT)
In-Reply-To: <AANLkTilEChqx75xF5OTrvvom3aX9-3oLR9oCg7-AO2Yc@mail.gmail.com>
References: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com> 
	<AANLkTimOqdguwX_c_wTR3mhBBVfjhSjf245UlWWTHOIA@mail.gmail.com> 
	<AANLkTilEChqx75xF5OTrvvom3aX9-3oLR9oCg7-AO2Yc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Jun 2010 10:40:25 -0700
Message-ID: <AANLkTilyrnZu9IcGaSVCx4-q1NPE-r-olkt2rjNs_MPF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-libc-headers-native, gcc-cross issue
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
X-List-Received-Date: Mon, 21 Jun 2010 17:45:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2010 at 6:01 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/6/21 Khem Raj <raj.khem@gmail.com>:
>> On Sun, Jun 20, 2010 at 1:51 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> Dear all,
>>>
>>> After the introduction of linux-libc-headers-native I've bumped into
>>> the following issue.
>>> linux-libc-headers-native installs unistd.h in sysroots
>>> This causes other recipes to pick up the x86 files instead of the targe=
t ones.
>>> I've seen this happen for both unistd.h and sigcontext.h
>>>
>>> One of the recipes suffering from this is gcc-cross (for some architect=
ures).
>>> Reason is that files are compiled with
>>> -I/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/include whereas
>>> the target specific includes are added with -isystem.
>>> This causes the -I to win.
>>
>> right. gcc-cross is a special case where its not building purely cross
>> binaries but
>> also making libraries and objects that will run on the target. This
>> problem probaly
>> is seen when building startup objects =A0(crt*.o). This path is added by
>> gcc build
>> machinery as a path where it finds gmp headers. I suspect that gcc build=
 should
>> not be passing this in the incudes when building target stuff.
>>
>> I think with sysroot using -isystem<target_headers> should not be needed=
.
>
> It is not the -isystem that is the problem. as stated above there is
> an explicit -I to sysroots/i686-linux that is causing the problem.

Yes and I explained also why this -I is coming into gcc compilation.
it was a side note to remove
the isystems although it may not solve your problem.

> This dir used to be unpopulated (or maybe even non-existing), butwith
> linux-libc-headers-native it became populated and as it got precedence
> the dir wins.
> I have no idea how to remove the -I dir (and also no idea if it is ok).
>
> The problem only occurs in .../gcc/config/${ARCH}/
> typical issue where this happens is linux_unwind.h This includes
> <signal.h> to get <sigcontext.h> and eventually the typedef for
> sigcontext.
> However sigcontext is of course archtecture specific so if one picks
> up the wrong signal.h it does not work.
>
> The unistd.h problem is probably specific for the nios2 variant, in
> which an additional system call is defined, which of course is not
> present in the x86 unistd.h
>
> Frans
>
>>
>>
>>>
>>> In the past sysroots/i686-linux/usr/include was empty, but with
>>> linux-libc-headers-native it gets populated causing the files in there
>>> to be used instead of the ones in the target ones.
>>> By setting linux-libc-headers-native to ASSUME-PROVIDED and cleaning
>>> and rebuilding TMPDIR I was able to avoid the problem.
>>
>> yeah this masked the problem as it has been masked till now.
>>
>>>
>>> However, I think this needs a more structural solution.
>>> Suggestions are appreciated.
>>
>> We should explore if passing this isystem in CFLAGS is needed at all.
>> if not then we should remove it.
>>
>>>
>>> Frans.
>>>
>>> PS: it might also be that other files suffer from this, but until now
>>> I only had problems with gcc-cross
>>
>> could be but I doubt.
>>
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
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


