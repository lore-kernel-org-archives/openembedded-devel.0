Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50FFC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 10:14:11 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.9339.1654769641506205086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 03:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=ZeMl2F5p;
 spf=pass (domain: madison.systems, ip: 209.85.208.175,
 mailfrom: matt@madison.systems)
Received: by mail-lj1-f175.google.com with SMTP id c30so9010774ljr.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 03:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j313MVm+1Q79YdvTv1UDyJZ+GprcsL5X35EU7xYu9rM=;
        b=ZeMl2F5pLxY3sw1z5b0B7qUOvhi6knIbIQrKFf3fVD1PIaoR1ymg2HpJTuA1knscUm
         Ff9PRWjWGlLL+5smiMbgqAPTxqSKPiLRlX+Bj4KP4xIdSkbooigNs1A2QngK5+A7jZ/2
         hZK8rBpjJDat/45OltNFqBP+uB8pbzXeLSHUhA0+Hxq6zieNcSaI/Cc9RBiR7mko0Y8T
         JqwpGUIPAPFwseEw6AlXgpHC6RI+VXewORPYSEZWlUcTbhoIxli2Mc2cHhb/1ofvmZ0z
         1HUYuwZXL+DjX/fd77C8NMC5tCePmuA0atv65GeuZRUfN/xf1SULudgA6A27CoT4K9q1
         76nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j313MVm+1Q79YdvTv1UDyJZ+GprcsL5X35EU7xYu9rM=;
        b=BmmBueUYDjRCTQi2EANoLrrBGZNHQ1wM4PQf4V6nJZN2MluGvff+QW+mgghlP3h1Ou
         JfSmWl53/n+1zDt7cXfPiLwwTNAObh/YQ8+8wlzV759VWfA6E52oW1nDjwZfZsSqRRAo
         fdHIdqq/z47VzjVCN0Q621XyMMdfHGpKr42+Sa5RUTiSbCbzW2vcdfAkLBFn/JdiX0we
         C8TIpFkbPqMtbSEM2UYmvYQzZjF4orroP9RkR/2sdzKtIw0YKNottzt2GbSLB8zMfkYi
         m75ufUA8pdgsRvSp2kV/mHFl3zc+MRVM6LHgH/PxrtgM4kc/zoccNh9LlqeMmxQjdPXH
         HteA==
X-Gm-Message-State: AOAM5322rrVL50t82SSOorhNGL6fOKx/V/haoamB713ABuELfvlW4zPq
	sOgjWLxFIuN+Zps5bC81rNvlwZX6E2RlD+8GDa8Dzg==
X-Google-Smtp-Source: 
 ABdhPJxzaVkNTZ6nbTltAcf3c8GZO0pokSesB6+UVBag9aeJMi+3QXt7oSjZl5rezn9YssSdGTU7sJ62cgTf+VG36CM=
X-Received: by 2002:a2e:9941:0:b0:247:dce8:b0ec with SMTP id
 r1-20020a2e9941000000b00247dce8b0ecmr60422013ljj.404.1654769639464; Thu, 09
 Jun 2022 03:13:59 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=Md3LRW3OZ-AOkG5g1iNrH_k_gQdP3y03cKahgMN7aXF0A@mail.gmail.com>
In-Reply-To: 
 <CAMRc=Md3LRW3OZ-AOkG5g1iNrH_k_gQdP3y03cKahgMN7aXF0A@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Thu, 9 Jun 2022 03:13:48 -0700
Message-ID: 
 <CAGgRHJqubBN6mq6PxVMre98Xj5x_WnKZJywYwhM-0HA1ZdbiAA@mail.gmail.com>
Subject: Re: [OE-core] [meta-java] icedtea7-native build fails on kirkstone
 and in master
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Henning Heinold <henning@itconsulting-heinold.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
	Richard Leitner <richard.leitner@skidata.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 10:14:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97465

(Dropping oe-core and leaving openembedded-devel, as that's the right
list for this)

On Thu, Jun 9, 2022 at 2:28 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Hi!
>
> I'm trying to build java support with the following configuration:
>
> Build Configuration:
> BB_VERSION           = "2.0.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "4.0.1"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky            = "kirkstone:45d7615dfef8093a2467d52ca1130e62db6a1187"
> meta-oe              = "kirkstone:fcc7d7eae82be4c180f2e8fa3db90a8ab3be07b7"
> meta-java            = "kirkstone:1a8059f6b257ebe6fcae6416e499784d976afd24"
>
> ---
>
> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
> PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
>
> ---
>
> The build fails for icedtea7-native but it's hard to tell why exactly
> from the logs. Here is the full output: https://pastebin.com/3dRt6J0Y

I ran into this recently, too, after upgrading Ubuntu to 22.04.  Near
as I can tell, there's a bug in the dynamic linker in glibc 2.35 that
causes a segfault when it's invoked through ldd in some cases. One of
my colleagues that uses Manjaro for his development host also saw
this, and it, too, had glibc 2.35, so I think that's the common
factor.

I worked around the problem by disabling the ldd checks with

EXTRA_OEMAKE:append = " LDD=:"

in a bbappend.  This isn't specific to kirkstone, btw; my builds have
been dunfell-based.

The ldd checks in the makefiles don't seem particularly useful except
to the JDK developers, so turning them off didn't seem too terrible.

I see at least one bug open in the glibc bugzilla for something that
looks similar to this problem, but apparently not easily reproducible
with a small test case. I haven't had time to look into it further.

-Matt

>
> It seems to be failing here:
>
> | Checking for mapfile use in:
> /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so
> | Library loads for:
> /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so
> | make[5]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/java/management'
> | make[5]: *** [../../common/Library.gmk:225:
> /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so]
> Error 1
> | make[4]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/java'
> | make[4]: *** [Makefile:63: all] Error 1
> | make[3]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make'
> | make[3]: *** [Makefile:247: all] Error 1
> | make[2]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot'
> | make[2]: *** [make/jdk-rules.gmk:79: jdk-build] Error 2
> | make[1]: Leaving directory
> '/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot'
> | make[1]: *** [Makefile:244: build_product_image] Error 2
> | make: *** [Makefile:2252: stamps/icedtea-boot.stamp] Error 2
>
> But not sure why.
>
> Thanks in advance for any help.
> Bart
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166766): https://lists.openembedded.org/g/openembedded-core/message/166766
> Mute This Topic: https://lists.openembedded.org/mt/91641852/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [matt@madison.systems]
> -=-=-=-=-=-=-=-=-=-=-=-
>

