Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 34D3C710C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 19:04:23 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id c11so418996lbj.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NHUfMvsn/9/ezDahARIlxjLaFzBYM4f+nUbFuS0DQQc=;
	b=MifSh9FE7Ya6psOhvgR8RbdZUunn+cajnI+5QaknMPs8wuyZxB9NLuGRPNLaK1LIr1
	Ck4SvZ4oShsl0DWH59hIze9aDR9kZvr2KBOVUsYDmBy6Aoaw8+ZULqWaRYxMygQzlRI1
	mxbTfb2Y+eq97bWNo5ZHWYw9SBhHfA/LYfYVgzU+gwfh5G16jaxsMjWJaI+7I/wUp7//
	3JNxXSg95IPr22iHLh3REu9gvUgkGCLW1j/TztuhzeDID9TwfM6WNvxvus5Wr8LyjfM2
	0ihhlxRhu/DMrBUBRszyxNWPzlD/NgPTCGLV8ag3JumMPXB2OkPAfxGfdQsef7XlauZq
	rwUg==
MIME-Version: 1.0
X-Received: by 10.152.9.132 with SMTP id z4mr31688725laa.8.1410894263235; Tue,
	16 Sep 2014 12:04:23 -0700 (PDT)
Received: by 10.112.189.38 with HTTP; Tue, 16 Sep 2014 12:04:23 -0700 (PDT)
In-Reply-To: <CAMKF1so5eBfgKzF+xoWzS=H656DM9L+MVGM+5mxUayTrXdS+uQ@mail.gmail.com>
References: <1409609700-13719-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1so5eBfgKzF+xoWzS=H656DM9L+MVGM+5mxUayTrXdS+uQ@mail.gmail.com>
Date: Tue, 16 Sep 2014 21:04:23 +0200
Message-ID: <CAAQYJAtg1QcpqmnvFVq2T2437jTM8VmHEzbCOt+o2GQewiF69g@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klibc: klcc: consider --sysroot option and override gcc-cross encoded sysroot
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
X-List-Received-Date: Tue, 16 Sep 2014 19:04:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 4, 2014 at 9:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Monday, September 1, 2014, Andrea Adami <andrea.adami@gmail.com> wrote:
>
>> For the recipes built with klcc-cross it is necessary to
>> pass --sysroot otherwise we default to the one encoded in gcc-cross which
>> actually is the 'first one' built.
>> The issue was revealed when building for armv4 after having built for
>> armv5te:
>> the produced binaries did contain Illegal Instruction (bx lr).
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com <javascript:;>>
>> ---
>>  meta-initramfs/classes/klibc.bbclass                       |  4 ++--
>>  .../klibc/klibc-2.0.4/klcc-consider-sysroot.patch          | 14
>> ++++++++++++++
>>  meta-initramfs/recipes-devtools/klibc/klibc.inc            |  1 +
>>  3 files changed, 17 insertions(+), 2 deletions(-)
>>  create mode 100644
>> meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
>>
>> diff --git a/meta-initramfs/classes/klibc.bbclass
>> b/meta-initramfs/classes/klibc.bbclass
>> index ca741cd..8690472 100644
>> --- a/meta-initramfs/classes/klibc.bbclass
>> +++ b/meta-initramfs/classes/klibc.bbclass
>> @@ -4,8 +4,8 @@ DEPENDS =+ "klcc-cross"
>>  # Default for klcc is to build static binaries.
>>  # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
>>
>> -export CC = "${TARGET_PREFIX}klcc"
>> -export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4
>> -mthumb-interwork"
>> +export CC = "${TARGET_PREFIX}klcc --sysroot=${STAGING_DIR_TARGET}"
>> +export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc
>> --sysroot=${STAGING_DIR_TARGET} -march=armv4 -mthumb-interwork"
>>
>> May be you can use TOOLCHAIN_OPTIONS
> here
>
Yes, if you advise I'd use that.

I am a bit scared looking at the mangling happening to TOOLCHAIN_OPTIONS...
http://cgit.openembedded.org/openembedded-core/log/?qt=grep&q=TOOLCHAIN_OPTIONS

Just few months ago klcc-cross recipe was inheriting cross so I can
imagine it would have fallen
(a195950 cross.bbclass: Set TOOLCHAIN_OPTIONS to an empty value
instead of duplicating...)

I can guess what will happen to klibc-bbclass if that value will be changed...

Thanks for reviewing
Cheers

Andrea

>
>  export CPP = "${CC} -E"
>>
>> diff --git
>> a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
>> new file mode 100644
>> index 0000000..9bc4835
>> --- /dev/null
>> +++
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
>> @@ -0,0 +1,14 @@
>> +diff --git a/klcc/klcc.in b/klcc/klcc.in
>> +index 43d0984..61e9385 100644
>> +--- a/klcc/klcc.in
>> ++++ b/klcc/klcc.in
>> +@@ -204,6 +204,9 @@ while ( defined($a = shift(@ARGV)) ) {
>> +       # Libraries
>> +       push(@libs, $a);
>> +       push(@libs, shift(@ARGV)) if ( $2 eq '' );
>> ++    } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
>> ++      # Override gcc encoded sysroot
>> ++      push(@ccopt, $a);
>> +     } else {
>> +       die "$0: unknown option: $a\n";
>> +     }
>> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> b/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> index 0209b20..f3e9972 100644
>> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> @@ -16,6 +16,7 @@ SRC_URI_append_linux-uclibceabi = "
>> file://klibc-config-eabi.patch \
>>                                      "
>>  SRC_URI += "file://klibc-linux-libc-dev.patch \
>>              file://staging.patch \
>> +            file://klcc-consider-sysroot.patch \
>>              "
>>
>>  S = "${WORKDIR}/git"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org <javascript:;>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

