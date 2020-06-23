Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.12352.1592933114701028018
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 10:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=U92CEXu1;
 spf=pass (domain: konsulko.com, ip: 209.85.219.66, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f66.google.com with SMTP id g7so10018479qvx.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2020 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=FF0SexIcNxSjztzU0eU2HK/OYts5yvZxKt3WtXe657c=;
        b=U92CEXu1Ho+CLVFeOQzwLJ1ZITlO53miaj0SBEidpePwv2DAat/lHjOzT9M8oqI6pX
         rLxYeN9hKSuDeXL7u66OKJShCvOxfiV2aMUR6AqBgb3Q6GWqtSezoj7eChwZXrBk6od+
         IgMUFJcPIe+/04SjfeHfSQj3BbJahzYCABAoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=FF0SexIcNxSjztzU0eU2HK/OYts5yvZxKt3WtXe657c=;
        b=OyE79VAQUb0sadv5GTmHaRogfRuF0RABeDMFpiiwYW9wPGjtWtHOAnOL7db+yGEIsH
         Z+lSYbrOrMRxilNaYSnwD0XbNZfLaxXeIuey0yQdSbsusHNEM+3xU2RcutZTkBVOSWum
         bFZ3O6yB3xO2KIo8dtXN0y3PXyjqC4/KvszLPiaptURokagcZ/wOStvCB/eVtvTpbQDx
         ISutZA877FQGtT5WClCZWOLncsRcUAAkfoBWhLgy5bXM20MizlftIv0QLY4RTSTSoB3z
         EsA1FFls8jOYb/SkH5eBABvLVGHRBvG9IHEjLz2ODgIVCQDsA7rl4Bk8aIy8xsMEu+UG
         2Y1g==
X-Gm-Message-State: AOAM53271FoPmb5S8KlKgG/Z5IEBE7m2nCXoXP3h+rbuk9EYwklV1cub
	sNnOTVR4c84RIXgxwNC3EO1chQ==
X-Google-Smtp-Source: ABdhPJy4MYZyAvz3rdS6Pu3LG5cYX6kxR1GYLeAE1jaghJTre++OwVQHgRcmp8UunCe2bySm7QjVhg==
X-Received: by 2002:ad4:57b2:: with SMTP id g18mr12119122qvx.207.1592933113838;
        Tue, 23 Jun 2020 10:25:13 -0700 (PDT)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id p125sm811287qke.78.2020.06.23.10.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 10:25:12 -0700 (PDT)
Date: Tue, 23 Jun 2020 13:24:50 -0400 (EDT)
From: "Scott Murray" <scott.murray@konsulko.com>
X-X-Sender: scottm@godzilla.spiteful.org
To: hongxu <hongxu.jia@windriver.com>
cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] multipath-tools: fix compiling parallel issue
In-Reply-To: <20200526062714.4000-1-hongxu.jia@windriver.com>
Message-ID: <alpine.LFD.2.22.394.2006231320130.2920@godzilla.spiteful.org>
References: <20200526062714.4000-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 May 2020, hongxu wrote:

> Add explicit dependency on libraries
> [snip]
> gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
> collect2: error: ld returned 1 exit status
> Makefile:36: recipe for target 'multipathd' failed
> make[1]: *** [multipathd] Error 1
> make[1]: Leaving directory 'git/multipathd'
> Makefile:29: recipe for target 'multipathd' failed
> make: *** [multipathd] Error 2
> ln -sf libmpathpersist.so.0 libmpathpersist.so
> [snip]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
[Snip]

Just a heads up, this change seems perhaps insufficient, in one of my
first test builds of AGL with latest dunfell meta-oe, I hit this failure:

/ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
err
or in libsg.o(.eh_frame); no .eh_frame_hdr table will be created
/ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
BFD
 (GNU Binutils) 2.34.0.20200220 internal error, aborting at
../../bfd/merge.c:933 in _bfd_merged_section_offset

/ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
Ple
ase report this bug.

collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:24: libcheckreadsector0.so] Error 1
make[1]: *** Waiting for unfinished jobs....

It built fine on a retry.  My guess is there's still a race between ld and
one of the inputs being generated.

Scott


