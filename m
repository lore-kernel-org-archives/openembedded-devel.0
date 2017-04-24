Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF84606CA;
	Mon, 24 Apr 2017 00:31:51 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id m36so102255141qtb.0;
	Sun, 23 Apr 2017 17:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GR8Ik0+c8NDSndl1zEP6ULDuWt2YOlgH+CJl3LQBJjw=;
	b=R7gMWskJ0eqQpDOh4z3qhFbf4ziRr9SPIXwRXMVSWiVQFGqdJnC/iLihcLfZKRi+3N
	6kzIBS6FOihwgGcTK9pzHTeGvUNXfA/4NqmKOJ/Yr+krPwbbT4NxY/QhH3bgzrpeVCtB
	56EyjacxQYquygBbJdMya3d0u/PpxbVSoOKrd23UbFgG5wWJaam38MkW+q6Dzw9QdKgf
	tlrGt6xHbYUPD4nnT3ptwXM8FPVYfbZWg7y/Ky5B+rZ9D3eqSkid5MiQu35WmqK7HXBB
	uLCKybaZCbSEmnqt/r+dAVuGKH2so739WD0I1tnOE+TGPt8er/7jzr944N0ytt9JmrL4
	W6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GR8Ik0+c8NDSndl1zEP6ULDuWt2YOlgH+CJl3LQBJjw=;
	b=Ojz21FqRm7lChBbLEWFb1D0FZVsDnM25iAx4FbuU/+BQHKYzAyPlXPqvEqdiiYIoTT
	1uO0jsQ6iXE8FuWmGKJF5fSeNrwrGqkRCCiui80qYZd82yq+dgk0oSgR4EaO96b44Udz
	Rr0kVGn4xiJKjCluefB7rxrYV9Hgjqzmr/9YL+TUd3baumctWp/kvgMiDOtFb1Mrlg1I
	CQ722p6/jXJfQTeBzzYbGaZteicWY/8LF11vl2d05dAbPRT3ljRZJtbNo0bcxYWG4ed1
	pC62Io/acWCzJED3jD1JVqM5nuKvnfbA9kzYJJhdqG+swrK47N7ekQ0SLgGd/XuHqDBc
	fCow==
X-Gm-Message-State: AN3rC/4e1YL9iXoEszinTy3B0TIjS3FcA/GqkrIe3I5uIG/9kMWBdc6p
	A/BYstlRm245FIUQkcJKKCDmFZjZOw==
X-Received: by 10.200.54.136 with SMTP id a8mr26223339qtc.87.1492993912487;
	Sun, 23 Apr 2017 17:31:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Sun, 23 Apr 2017 17:31:52 -0700 (PDT)
In-Reply-To: <CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 23 Apr 2017 20:31:52 -0400
Message-ID: <CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] gcc7 and glibc-2.26 recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Apr 2017 00:31:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 23, 2017 at 8:30 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Sun, Apr 23, 2017 at 6:04 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> On 16 April 2017 at 16:50, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > I have put together recipes for upcoming gcc-7 major release as well
>> > as glibc 2.26 release, which we would target for next release ( 2.4 )
>> >
>>
>> I threw these at the autobuilder and the errors are starting to appear:
>>
>> http://errors.yoctoproject.org/Errors/Latest/?filter=
>> eddf6362e17899113f10cf53ed0db8a4b13ff3fc&type=commit
>>
>> Repeated diffutils and rpcbind failures, but linux-yocto and grub too (I
>> have your grub fix already).
>>
>
> I wasn't able to bring up the linux-yocto one .. but the 4.10 linux Yocto
> should be at a high enough stable
> release to build with gcc7. So if there's a direct link to that error, I
> can take a closer look.
>

And sure enough, after I sent that the error page with linux-yocto finally
wheezed in.

I see that it was the 4.1 kernel, which is expected to fail. I haven't
looked into backporting gcc7 fixes
that far, but if there's demand, it is something we can consider/look into.

Bruce


>
> Bruce
>
>
>>
>> Ross
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

