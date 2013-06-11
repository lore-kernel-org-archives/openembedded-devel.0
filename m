Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF8046A8DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:03:30 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id a13so5805029iee.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=T7rU5gK/wzeFTuhI6MuKO8YRQK/QMIQlT3namLqveNQ=;
	b=ATGox0vK7DLKkL4umPLYCyRXQgRTww45ctNBPOI1hv0Uf71OsG25lRTmX6w5x0SU1t
	Bkk16qg0DWA0sQnfYmlYs/r8MEvsN/E7zlYidT4nmfKtb6j+YxjmTQfEo/5KHl3JOTmZ
	9AfhltLfV8PdaHN+0/V1yEaSA1uy1BslcTzXffU6+Q5YCbSsET1VhcDq9G0WElLf1UYn
	lgODED3T86tJQtdzP5KQ6LBcS7kH9SXg43A/tHHdyb80pMxfUdH9S1uScr/fH9qMfD40
	yfWWpuTAHleh5I2kQjb7ky8NqaucBR0Btkd1wxXez+jeJae8qM6vJhOWDrAIi0w/fP83
	KChg==
X-Received: by 10.50.111.38 with SMTP id if6mr330804igb.74.1370937811667; Tue,
	11 Jun 2013 01:03:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 01:03:01 -0700 (PDT)
In-Reply-To: <51B6D7DA.1060609@juszkiewicz.com.pl>
References: <1370165592-15697-1-git-send-email-net147@gmail.com>
	<51AB1684.1080500@juszkiewicz.com.pl>
	<CAMKF1soSa-S9kUC1PH9pJYbnJsvRiubNxbgNvYEx8zs4XiwmLw@mail.gmail.com>
	<51B6D7DA.1060609@juszkiewicz.com.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 01:03:01 -0700
Message-ID: <CAMKF1sokFKxLAWEmSOMN15UODnWswpKRZbs79X=ggWvUW2Yepg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] llvm3.2: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 08:03:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 11, 2013 at 12:55 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> W dniu 11.06.2013 09:48, Khem Raj pisze:
>> On Sun, Jun 2, 2013 at 2:55 AM, Marcin Juszkiewicz
>> <marcin@juszkiewicz.com.pl> wrote:
>>> W dniu 02.06.2013 11:33, Jonathan Liu pisze:
>>>> +def get_llvm_arch(d):
>>>> +    import bb;
>>>> +
>>>> +    arch = bb.data.getVar('TARGET_ARCH', d, 1)
>>>> +
>>>> +    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
>>>> +        arch = "x86"
>>>> +    elif arch == "x86_64":
>>>> +        arch = "x86_64"
>>>> +    elif arch == "arm":
>>>> +        arch = "arm"
>>>> +    elif arch == "mipsel" or arch == "mips":
>>>> +        arch = "mips"
>>>> +    elif arch == "powerpc" or arch == "powerpc64":
>>>> +        arch = "powerpc"
>>>> +    else:
>>>> +        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
>>>> +
>>>> +    return arch
>>>
>>> Can we get rid of such blocks? They are worthless and only generate
>>> extra support questions when OE newbies use OE with 'not supported'
>>> architectures.
>
>> why do you think they are worthless ? when they give good information
>> instead of failing to build and then generating support question
>> which need more work to come to same conclusion
>
> $ MACHINE=genericarmv8 bitbake nano
> "llvm is not supported"
> "openjdk is not supported"
> "another-thing-you-do-not-care-for-this-build is not supported"
>

it could be said if you do not care for such recipes then BBMASK them
and message
well may be it could be make bb.note instead of bb.warn to make it
more of FYI kind of thing

> This is how your builds look for not supported architectures.
>
> OE has COMPATIBLE_HOST variable which can be used by recipe maintainers
> to mark which architectures are supported.

in this case arch does not map to what OE's target arch is so you have
to do it twice if you want
to use COMPATIBLE_HOST
and suppose a non supported arch becomes supported you have to change
both places.

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

