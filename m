Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001D0C43217
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 19:41:20 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.3006.1668800480513897778
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 11:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aKZVNl+i;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id l127so6434948oia.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7KV1X/q0dUVq5F96VfoU+kwq51+XMqYH39fMM42f8Yc=;
        b=aKZVNl+i+u0iyc0tXEubnuiFX0BPKov08zkEqbwNCZDgqpmODgPiMYEFFXSELxwnp6
         GG5RXrR4RO/lCJZQXU41vIa3EIEZZ1extq4hCu/6in0D6eWX6WIhyG9T/t3avVr3xMVT
         xRCWofVz8zsNtB1XpUsSbbBdhv8uflIGFLlPaOWtc9RvF2fCmobHWwWEUbYBGvbQonnP
         er4/0Ztybr+YKcfm0b/0JqqCeuiPJEdgEBghR0ynMDIa9zvm6IooEYuqnIG0fOoUeXuX
         4NMUDqGMGhdUmRHOmj+/hlgVUcVi1guovMEs2GaiYjaHviqaWc7cKklnvz1Ec6XKGoFs
         X6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KV1X/q0dUVq5F96VfoU+kwq51+XMqYH39fMM42f8Yc=;
        b=n6SILeX8ZKyavnsoKLG8VR6aTML5K0WfLPgfeogDz1LSojKk+coouh1Pb6x1+IZ7wM
         HkQVL3ZZz6XfXKFfpAdFSMK0ygpEdQONrS4+6vzNjE/Om84AJoCanwujfpPi3qkZMr31
         xEa27+Z9vaJRZEBtegXDHaNV/AIYYVOahHewDlMNdI8hlRE/BCwmEN64SVA1yAmOGuy/
         +u/IAqebNHmhmV9Gc3oIK6pA/36EmrpzTLJNSI1Yxe0rF1ObsqSWMFUOHCEoSZTPwq0d
         ZHD+irIDuJvMRsO/QKnUHLDkARvoDkYL7QP0qvAEMJ7dtPip7ZDt9BubJFhAW8yabncy
         UYcQ==
X-Gm-Message-State: ANoB5pm73EreIJcN5qSjigINScYw92TLkkaD7Bv1Ou8457Te9NFTNnzC
	bhO3nucsZwX8ue2xFnWGWV1Wxf1izGZq4Htj1c0=
X-Google-Smtp-Source: AA0mqf7gSzBtwyfSZCKSehq9Sodb74nMnXDOaPR1ZWKA/fwoQ3TGxaBRkA1iXscBxJur3UfwUS85ZID2NK5Hu4jm9nY=
X-Received: by 2002:a54:4491:0:b0:359:d852:616d with SMTP id
 v17-20020a544491000000b00359d852616dmr6953219oiv.55.1668800479550; Fri, 18
 Nov 2022 11:41:19 -0800 (PST)
MIME-Version: 1.0
References: <17283AC183E85183.19660@lists.openembedded.org> <CANx9H-B=VEQSrUsdWjNK9YkN-fO54snSiPM55c66Zy2_rsyfqw@mail.gmail.com>
In-Reply-To: <CANx9H-B=VEQSrUsdWjNK9YkN-fO54snSiPM55c66Zy2_rsyfqw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Nov 2022 11:40:53 -0800
Message-ID: <CAMKF1srJbReDdRZOf8BqkMY42zRM1t5KYXZ_6=HusRK8NM1Z-w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libio-pty-perl: upgrade 1.16 -> 1.17;
 enable ptest
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 19:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99616

On Fri, Nov 18, 2022 at 10:20 AM Tim Orling <ticotimo@gmail.com> wrote:
>
> Ping. I think this one missed getting pulled in.
>

Thanks its on master-next now.

> On Wed, Nov 16, 2022 at 5:24 PM Tim Orling via lists.openembedded.org <ticotimo=gmail.com@lists.openembedded.org> wrote:
>>
>> * Fix RDEPENDS for a minimal image
>> * Inherit ptest-perl and add RDEPENDS
>>
>> 1.17 2022-11-11 Todd Rinaldo <toddr@cpan.org>
>>     * Switch changelog entries to metacpan friendly format
>>     * #29 - Fix printf format conversion specifiers in croak to support size_t on all platforms
>>     * #11,#30 - Tty.pm: pre-allocate buffer for ioctl but leave it length 0
>>     * #28 - Use $arg to match @ARGV in Makefile.PL
>>
>> https://metacpan.org/release/TODDR/IO-Tty-1.17
>>
>> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> ---
>>  ...o-pty-perl_1.16.bb => libio-pty-perl_1.17.bb} | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>  rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.16.bb => libio-pty-perl_1.17.bb} (60%)
>>
>> diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
>> similarity index 60%
>> rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
>> rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
>> index 0f1c71b70c..684788f199 100644
>> --- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
>> +++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
>> @@ -7,12 +7,22 @@ SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz \
>>             file://0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch \
>>             "
>>
>> -SRC_URI[md5sum] = "5ee30bf7c76f00cc69f92388ad776e2a"
>> -SRC_URI[sha256sum] = "8f1a09c070738adc695df903f2e7f74308dd8d991b914c0bc390a0e6021294dd"
>> +SRC_URI[sha256sum] = "a5f1a83020bc5b5dd6c1b570f48c7546e0a8f7fac10a068740b03925ad9e14e8"
>>
>>  S = "${WORKDIR}/IO-Tty-${PV}"
>>
>> -inherit cpan
>> +inherit cpan ptest-perl
>> +
>> +RDEPENDS:${PN} += "\
>> +    perl-module-carp \
>> +    perl-module-exporter \
>> +    perl-module-io-handle \
>> +    perl-module-posix \
>> +"
>> +
>> +RDEPENDS:${PN}-ptest += "\
>> +    perl-module-test-more \
>> +"
>>
>>  FILES:${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/IO/Tty/.debug/"
>>
>> --
>> 2.30.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99601): https://lists.openembedded.org/g/openembedded-devel/message/99601
>> Mute This Topic: https://lists.openembedded.org/mt/95081317/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ticotimo@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

