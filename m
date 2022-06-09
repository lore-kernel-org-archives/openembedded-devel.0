Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144F9C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 14:14:03 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.13846.1654784034129620320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 07:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=osjiOPqS;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.42,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f42.google.com with SMTP id n10so47779082ejk.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b0b6aR1q34+6252+UytqVv8KoUF6tr0xlZ3hsGbpRyA=;
        b=osjiOPqS79VRRcVBMpSipA6xFnISpHsp1wcIKN+2Dw/JwiKIjWvvI9j/j9jaDiswPv
         P3dfN/Fg3bN8Xf1aSJkzUblQYOKsIqsSunTnBrSkH/lAk4eMMKLyJnriPE9lcN2t4v1K
         KeBJ6YAcpXfHgGG5Hp6XRH/OBeiPe3PpIsTpVZW2ApUaseZlCUjP0FIITfN7SC1quCG0
         xvQdGO/bmfDA/JvXy56bjiv1uHVK8bi9jRoFblYrFTsh01pyA8aWsA9h9rJctAoB7Ae0
         SkljOVuAoF5GkdDpYANthV8vPKiKkHTeO6Ky8hfUONZV/uuDOenQnO8YUAVPOoB0j5TM
         fNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b0b6aR1q34+6252+UytqVv8KoUF6tr0xlZ3hsGbpRyA=;
        b=rPlhLjN89K6mmOPILECLH0Md4Hy8Qrduw3E6jaacqvQyw9p3UwkiRRyV/SQe8bk6b2
         krIoRXQf3+h8O5EndjhJWOgjS6Mfx8cSlBJ1A36Dq9dkq+SWJJxzz4qTh6c1KJ0f5gzQ
         Te+6WPoBDqtl60haNhakYwZkkAd1VVIE9Xp+HhkA0j2D9u60sHVCdM9ljigp/9+F6jk6
         xhmdoah+Nxd7+VcdMq+ifKPkkGARejj++GWOQtRXZ9w8jR7aOgrnZowsZ4LLm11vRxmQ
         shhB6+JYKbeJ2PFNe/ZhL2RJFtuxpdWDFijT/6k5PBsKPZXUHvFu656PyLYLm/8EXCpF
         VBIA==
X-Gm-Message-State: AOAM533oG+OgjK2BxPZnWTGTnoP6Q2jEqO4Keefcr9Fm+4bGNS2/vkpq
	W9iQh43E+1UhIFQskqvea4pZmTT34jcw4qFtbs4BBw==
X-Google-Smtp-Source: 
 ABdhPJxGHcvLOD6CAS330oG0hTLmaZoIwootI1wZu7+xTbA6NhVBfcwfsIhDb74alaPaZ0C21ttjCEfJDElJSVNAczY=
X-Received: by 2002:a17:906:434f:b0:711:eb76:c320 with SMTP id
 z15-20020a170906434f00b00711eb76c320mr10634647ejm.636.1654784032005; Thu, 09
 Jun 2022 07:13:52 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=Md3LRW3OZ-AOkG5g1iNrH_k_gQdP3y03cKahgMN7aXF0A@mail.gmail.com>
 <CAGgRHJqubBN6mq6PxVMre98Xj5x_WnKZJywYwhM-0HA1ZdbiAA@mail.gmail.com>
In-Reply-To: 
 <CAGgRHJqubBN6mq6PxVMre98Xj5x_WnKZJywYwhM-0HA1ZdbiAA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Jun 2022 16:13:41 +0200
Message-ID: 
 <CAMRc=Mf9rbSTNHrx7SLJv-ZX1_ePSA65e-+o_an4NoNmtmZ0tQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-java] icedtea7-native build fails on kirkstone
 and in master
To: matt@madison.systems
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Henning Heinold <henning@itconsulting-heinold.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
	Richard Leitner <richard.leitner@skidata.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 14:14:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97467

On Thu, Jun 9, 2022 at 12:14 PM Matt Madison <matt@madison.systems> wrote:
>
> (Dropping oe-core and leaving openembedded-devel, as that's the right
> list for this)
>
> On Thu, Jun 9, 2022 at 2:28 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > Hi!
> >
> > I'm trying to build java support with the following configuration:
> >
> > Build Configuration:
> > BB_VERSION           = "2.0.0"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "x86_64-poky-linux"
> > MACHINE              = "qemux86-64"
> > DISTRO               = "poky"
> > DISTRO_VERSION       = "4.0.1"
> > TUNE_FEATURES        = "m64 core2"
> > TARGET_FPU           = ""
> > meta
> > meta-poky            = "kirkstone:45d7615dfef8093a2467d52ca1130e62db6a1187"
> > meta-oe              = "kirkstone:fcc7d7eae82be4c180f2e8fa3db90a8ab3be07b7"
> > meta-java            = "kirkstone:1a8059f6b257ebe6fcae6416e499784d976afd24"
> >
> > ---
> >
> > PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
> > PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> > PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> >
> > ---
> >
> > The build fails for icedtea7-native but it's hard to tell why exactly
> > from the logs. Here is the full output: https://pastebin.com/3dRt6J0Y
>
> I ran into this recently, too, after upgrading Ubuntu to 22.04.  Near
> as I can tell, there's a bug in the dynamic linker in glibc 2.35 that
> causes a segfault when it's invoked through ldd in some cases. One of
> my colleagues that uses Manjaro for his development host also saw
> this, and it, too, had glibc 2.35, so I think that's the common
> factor.
>
> I worked around the problem by disabling the ldd checks with
>
> EXTRA_OEMAKE:append = " LDD=:"
>
> in a bbappend.  This isn't specific to kirkstone, btw; my builds have
> been dunfell-based.
>
> The ldd checks in the makefiles don't seem particularly useful except
> to the JDK developers, so turning them off didn't seem too terrible.
>
> I see at least one bug open in the glibc bugzilla for something that
> looks similar to this problem, but apparently not easily reproducible
> with a small test case. I haven't had time to look into it further.
>

Thanks! It does indeed help with this specific issue.

Unfortunately, it still fails in a different way for me:

| make[5]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/sun/awt'
| make[5]: Entering directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/sun/xawt'
| /bin/sh: 1: free: not found
| /bin/mkdir -p
/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/tmp/sun/sun.awt.X11/xawt/sun/awt/X11/generator
| rm -f /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/tmp/sun/sun.awt.X11/xawt/sun/awt/X11/generator/WrapperGenerator.class
| /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0/bin/javac
-J-XX:ThreadStackSize=1536 -J-XX:-PrintVMOptions
-J-XX:+UnlockDiagnosticVMOptions -J-XX:-LogVMOutput -J-Xmx384m
-Xlint:-path -encoding ascii -source 6 -target 6
-XDignore.symbol.file=true -bootclasspath
/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0/jre/lib/rt.jar
-d /home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/tmp/sun/sun.awt.X11/xawt/sun/awt/X11/generator
../../../src/solaris/classes/sun/awt/X11/generator/WrapperGenerator.java
| Annotation processing got disabled, since it requires a 1.6 compliant JVM
| ----------
| 1. ERROR in ../../../src/solaris/classes/sun/awt/X11/generator/WrapperGenerator.java
(at line 0)
| /*
| ^
| Inconsistent classfile encountered: The undefined type parameter E
is referenced from within Collection
| ----------
| 1 problem (1 error)make[5]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/sun/xawt'
| make[5]: *** [Makefile:280:
/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/tmp/sun/sun.awt.X11/xawt/sun/awt/X11/generator/WrapperGenerator.class]
Error 255
| make[4]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/sun'
| make[4]: *** [Makefile:94: all] Error 1
| make[3]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make'
| make[3]: *** [Makefile:247: all] Error 1
| make[2]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot'
| make[2]: *** [make/jdk-rules.gmk:79: jdk-build] Error 2
| make[1]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot'
| make[1]: *** [Makefile:244: build_product_image] Error 2
| make: *** [Makefile:2252: stamps/icedtea-boot.stamp] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

Bart

