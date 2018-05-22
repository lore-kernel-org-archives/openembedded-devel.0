Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5B02A74889
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 15:53:19 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a8-v6so1052145wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CbgyPnjAsKYVtXvVVn5snfUkNG9vmel1Uug0omDS4kU=;
	b=SBYgzX9y/VdZF9kBQKsfpoOK0XiqONxd4d8RQIe+wqnVaP6kF3LdbTnqo5Rp+aqeb7
	evaQCoz8u9MK93bTXdy4CeqBzOdxsu1WmuBxwfgojXgRIrtmq4w2lTBDXJui2cUtnJB+
	n/OVXbkMeTNHLwwghrrMZCorq9cdBzPrbA81Td9BaKw5Y+yRzKMVJG3EdUt8EXMpzHqe
	pfiM4JaMe2Gpo4Yg7ehnqqX3QNIgBBBBa//NdQ5CV+qmhUI/1YyG1bjmpGexsRYCHs5Q
	KZxhMDMeGdnFH+bxwdnX4tjlAV2VExWGYZuDuPtj1oeeD/a7cLq23aplAMiI6+sEsIBq
	fsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CbgyPnjAsKYVtXvVVn5snfUkNG9vmel1Uug0omDS4kU=;
	b=MEVJwPZlHvj9YJti7u7ExZ7ItTvsjiWof4AKo+UW+DPUmQccLf6AXBrgLji+nnpKnB
	Ke///F61RU5pUFh0KW7CvxtOHKM3Mbm241X2GZNqih+K3qEE+hKW6enx4bzfskwba2mZ
	G1+aeKfKmHVkGoBlGo+bqnju6rP+dnZgqxCHVyM4lX+gU0HCpPNdvO3UWhElwQfSOzr0
	xLwQWEGyNEMFjne/wSjJM2+Y4IzogLJZ9ZQsbNldKcfYc2b86/Ul0bobkGPQ3vfsvei+
	NMQRoD5uSIGO+rs2PB4IzQswkAt/1MOwzs6OkLkjjFe7Yb+PkrubH9rSLfnRVQ6/Iffv
	/jlA==
X-Gm-Message-State: ALKqPwcqbJbEd9hNZDuM0asCBD4LL9V391DJMPB6YfHezJDMRnVtDpxp
	iWgOwJPftOsWagHsxTUML2ZhuOsOE6oQ0fh35DA=
X-Google-Smtp-Source: AB8JxZoVR5Kzkamqmr6n0WpyKMRHcdYUj8SkE6so0ZR/JRiu6AK9gNH7hgD/1UPE90pbLS9ub2zoFIw0K1Was7s2rSQ=
X-Received: by 2002:a50:a550:: with SMTP id
	z16-v6mr3013505edb.103.1527004400517; 
	Tue, 22 May 2018 08:53:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.72 with HTTP; Tue, 22 May 2018 08:53:20 -0700 (PDT)
In-Reply-To: <CAAQYJAsjrDxCzB7rd_9Dcg6MF5i1Q29oe5rNY8u3XnDV7qgjJA@mail.gmail.com>
References: <1526249791-5375-1-git-send-email-andrea.adami@gmail.com>
	<0bb5eeb2-a597-38bd-bfd6-99dbf8c786e9@gmail.com>
	<CAAQYJAvAyuatyYg6xn3Xw5-uLdY5NcCM8qCTz0D+KTRUAY745w@mail.gmail.com>
	<CAAQYJAvrQ9G0=+-4oDGsLX_HVFv_jPDAOiuPy+g9gSZvL5E9JQ@mail.gmail.com>
	<CAAQYJAsjrDxCzB7rd_9Dcg6MF5i1Q29oe5rNY8u3XnDV7qgjJA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 22 May 2018 17:53:20 +0200
Message-ID: <CAAQYJAugnP=1Nb=mdTkDy-T=vqHpNi-Uc_Nr_TPXcHdwd-cCQQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] ubi-utils-klibc: update from v. 1.5.2 to 2.0.2
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
X-List-Received-Date: Tue, 22 May 2018 15:53:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 17, 2018 at 10:44 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> </cut>
>
>>> This fails on qemuarm with the following error.
>>
>> >>
>> >> | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: No such
>> >> file or directory
>> >> |  #include <execinfo.h>
>> >> |           ^~~~~~~~~~~~
>> >> | compilation terminated.
>> >> | Makefile:2452: recipe for target 'ubi-utils/ubimkvol.o' failed
>> >> | make: *** [ubi-utils/ubimkvol.o] Error 1
>> >> | Makefile:2452: recipe for target 'ubi-utils/ubicrc32.o' failed
>> >> | make: *** [ubi-utils/ubicrc32.o] Error 1
>> >> | In file included from ../git/include/common.h:38:0,
>> >> |                  from ../git/ubi-utils/ubiupdatevol.c:40:
>> >> | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: No such
>> >> file or directory
>> >> |  #include <execinfo.h>
>> >> |           ^~~~~~~~~~~~
>> >> | compilation terminated.
>> >> | Makefile:2452: recipe for target 'ubi-utils/ubiupdatevol.o' failed
>> >> | make: *** [ubi-utils/ubiupdatevol.o] Error 1
>> >> | ERROR: oe_runmake failed
>> >>
>> >> http://errors.yoctoproject.org/Errors/Build/60410/
>> >>
>> >> - Armin
>> >
>> >
>> > Hi Armin,
>> > thanks for testing.
>> >
>> > Strange, I did cross-build for all archs, maybe some oe-core change.
>> > I'll compare with my log (attached the quemuarm).
>> >
>> > Cheers
>> > Andrea
>> >
>>
>> I see the issue is with execinfo.h.
>> As of last week ...musl did not have backtrace/execinfo so I think musl has been updated and now the HAVE_EXECINFO_H check fails.
>> I'll try to fix this in the recipe.
>>
>>
>> Cheers
>> Andrea
>>
> Armin,
>
> I can't reproduce this even after git-pull:
>
> Build Configuration:
> BB_VERSION           = "1.37.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "ubuntu-16.04"
> TARGET_SYS           = "arm-oe-linux-musleabi"
> MACHINE              = "qemuarm"
> DISTRO               = "nodistro"
> DISTRO_VERSION       = "nodistro.0"
> TUNE_FEATURES        = "arm armv5 thumb dsp"
> TARGET_FPU           = "soft"
> meta                 = "master:9611485bba03ef77ff31121e3b1da7cd57990c3e"
> meta-handheld        = "master:891fefa796ff3a12e4d9470f44597a375818acb6"
> meta-initramfs
> meta-oe              = "master:61576573e70f8c1d338ddb23d7b76044f68d1cd9"
>
> here logs of tosa (armv5te) and qemuarm (armv5e):
>
> https://pastebin.com/vNx4D14z
> https://pastebin.com/gw8vZvCf
>
>
> Please send me full configure and build logs.
> Andrea

Ok, after the post I realized it is happening only with glibc. Musl builds fine.

The cause is the backported patch I received from the upstream
maintainer: let say for the moment I will skip that patch and replace
getline() like it was before.
This should fix the glibc build so I plan to send a patch v2.

Please disregard this one, thanks.

Andrea

