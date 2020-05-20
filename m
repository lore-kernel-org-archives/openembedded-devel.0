Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.15397.1589989067786813300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 08:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sZSLPamE;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id q9so1477570pjm.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2020 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=GbLTXh0wTQfuP4efElbO2txPmZpCLLFLmRSY00XGiww=;
        b=sZSLPamERk6cSdXmQX7TEUuTh8IhtcQCUng1mlq8irSdABWWqwAGQXMOaMVnIPZZoq
         B9h/8JIyRFCo0WxIPISTBhhPIthhsp8iwq2aL4YhvkeT422yYIFLJ5TqcQLXxaXbsRqR
         k4q0lYWT1UC5BUqHvOd+pLQHS/64mUmWEugKNUyc4oF/vQiPYdot6bE7n9Za2+P12+Gz
         sxt9oYhaphR+B0cTBgZUs3/tK9mTsO3620YYx928cqIsBoCdcI3+6OoD6ufQITm+otki
         JbNZd2SRFPjSyl0lSanLPQKYi727xxwp2ClUv+iDRJzRoYqjUEm6ksdFVWI5sYtTXDoP
         Im3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GbLTXh0wTQfuP4efElbO2txPmZpCLLFLmRSY00XGiww=;
        b=devVHSV3ePENZe2vgy9TpHsBFHqx9qZx7plRQsdlQWlX4J7hRnArsrWYMyP7TDxVeK
         hWYG9hnHuLYq0/J9ulLnSgB2rTJL32/BQM85x5vjQfQiukHqZe7ZFK2bhTPsmNq4CBZT
         ojv6gQcyYWcEPYsaWfgpFNPKjpIQU7NPPsm0acR4BxvYACVbndwvGPfV7ZMp7ThPnvyv
         YA5PsLa6xiY9q8bDSBrV3ihQMn1wUFhXkfaA1WV2N2jJMxJTTyJaD/We72JGnrZZJoBt
         eKRjGQRJs3omKMg0XPTMb78F3b8BlObskSMnU+tCmrLPcCgZwnyLkppy2WWwHZhn1CQo
         R3Jg==
X-Gm-Message-State: AOAM531dXuhl0T2zjfUi93d+qt6A7X5s8CXpk7Kd+xwgnCgm6Gh8Besk
	rtS5/aEbossaIY9pVS0XaI8ahID0jV0=
X-Google-Smtp-Source: ABdhPJxgAyMRYgHog13IWEIRfkI0/hf5RV271h4eWbJKWc957qWB0ZQRCzPEONAPiQ2uAe3CD70dEw==
X-Received: by 2002:a17:90a:ea84:: with SMTP id h4mr6165402pjz.8.1589989066497;
        Wed, 20 May 2020 08:37:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:2911:7230:fac5:7fd8? ([2601:646:9200:4e0:2911:7230:fac5:7fd8])
        by smtp.gmail.com with ESMTPSA id t188sm2406413pfb.185.2020.05.20.08.37.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 08:37:45 -0700 (PDT)
Subject: Re: [oe] error: unknown type name 'GLclampf'; did you mean 'GLclampx'?
To: openembedded-devel@lists.openembedded.org
References: <9nG7.1589968867410675396.U1GR@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <bec65992-a4dd-7bf0-afa0-15841012e9e9@gmail.com>
Date: Wed, 20 May 2020 08:37:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9nG7.1589968867410675396.U1GR@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

What graphics driver are you using, it should perhaps be in OpenGL 
implementation you are using.

On 5/20/20 3:01 AM, dima.szevczenko@gmail.com wrote:
> Hello, I'm try build linux fo stm32mp1. But i have 1 error:
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 2
> | Making all in src
> | make[1]: Entering directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src'
> | Making all in util
> | make[2]: Entering directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/util'
> | make[2]: Nothing to be done for 'all'.
> | make[2]: Leaving directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/util'
> | Making all in data
> | make[2]: Entering directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/data'
> | make[2]: Nothing to be done for 'all'.
> | make[2]: Leaving directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/data'
> | Making all in demos
> | make[2]: Entering directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/demos'
> | make[2]: Nothing to be done for 'all'.
> | make[2]: Leaving directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/demos'
> | Making all in egl
> | make[2]: Entering directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/egl'
> | Making all in eglut
> | make[3]: Entering directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/egl/eglut'
> | make[3]: Nothing to be done for 'all'.
> | make[3]: Leaving directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/egl/eglut'
> | Making all in opengles1
> | make[3]: Entering directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/egl/opengles1'
> | arm-ostl-linux-gnueabi-gcc  -march=armv7ve -mthumb -mfpu=neon-vfpv4 
> -mfloat-abi=hard -mcpu=cortex-a7 
> --sysroot=/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/recipe-sysroot 
> -DPACKAGE_NAME=\"mesa-demos\" -DPACKAGE_TARNAME=\"mesa-demos\" 
> -DPACKAGE_VERSION=\"8.3.0\" -DPACKAGE_STRING=\"mesa-demos\ 8.3.0\" 
> -DPACKAGE_BUGREPORT=\"https://bugs.freedesktop.org/enter_bug.cgi\?product=Mesa\&component=Demos\ 
> <https://bugs.freedesktop.org/enter_bug.cgi%5C?product=Mesa%5C&component=Demos%5C>" 
> -DPACKAGE_URL=\"\" -DPACKAGE=\"mesa-demos\" -DVERSION=\"8.3.0\" 
> -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 
> -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 
> -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 
> -DLT_OBJDIR=\".libs/\" -DDEMOS_DATA_DIR=\"/usr/share/mesa-demos/\" 
> -DDEMOS_DATA_DIR=\"/usr/share/mesa-demos/\" -I. 
> -I../../../../mesa-demos-8.3.0/src/egl/opengles1       
> -I../../../../mesa-demos-8.3.0/src/egl/eglut -O2 -pipe -g 
> -feliminate-unused-debug-types 
> -fdebug-prefix-map=/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0=/usr/src/debug/mesa-demos/8.3.0-r0 
> -fdebug-prefix-map=/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/recipe-sysroot= 
> -fdebug-prefix-map=/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/recipe-sysroot-native= 
>   -c -o clear.o ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c
> | arm-ostl-linux-gnueabi-gcc  -march=armv7ve -mthumb -mfpu=neon-vfpv4 
> -mfloat-abi=hard -mcpu=cortex-a7 
> --sysroot=/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/recipe-sysroot 
> -DPACKAGE_NAME=\"mesa-demos\" -DPACKAGE_TARNAME=\"mesa-demos\" 
> -DPACKAGE_VERSION=\"8.3.0\" -DPACKAGE_STRING=\"mesa-demos\ 8.3.0\" 
> -DPACKAGE_BUGREPORT=\"https://bugs.freedesktop.org/enter_bug.cgi\?product=Mesa\&component=Demos\ 
> <https://bugs.freedesktop.org/enter_bug.cgi%5C?product=Mesa%5C&component=Demos%5C>" 
> -DPACKAGE_URL=\"\" -DPACKAGE=\"mesa-demos\" -DVERSION=\"8.3.0\" 
> -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 
> -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 
> -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 
> -DLT_OBJDIR=\".libs/\" -DDEMOS_DATA_DIR=\"/usr/share/mesa-demos/\" 
> -DDEMOS_DATA_DIR=\"/usr/share/mesa-demos/\" -I. 
> -I../../../../mesa-demos-8.3.0/src/egl/opengles1       
> -I../../../../mesa-demos-8.3.0/src/egl/eglut -O2 -pipe -g 
> -feliminate-unused-debug-types 
> -fdebug-prefix-map=/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0=/usr/src/debug/mesa-demos/8.3.0-r0 
> -fdebug-prefix-map=/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/recipe-sysroot= 
> -fdebug-prefix-map=/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/recipe-sysroot-native= 
>   -c -o drawtex.o ../../../../mesa-demos-8.3.0/src/egl/opengles1/drawtex.c
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:40:45: error: 
> unknown type name 'GLclampf'; did you mean 'GLclampx'?
> |  typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf 
> green, GLclampf blue, GLclampf alpha);
> |                                              ^~~~~~~~
> |                                              GLclampx
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:40:59: error: 
> unknown type name 'GLclampf'; did you mean 'GLclampx'?
> |  typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf 
> green, GLclampf blue, GLclampf alpha);
> |                                                            ^~~~~~~~
> |                                                            GLclampx
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:40:75: error: 
> unknown type name 'GLclampf'; did you mean 'GLclampx'?
> |  typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf 
> green, GLclampf blue, GLclampf alpha);
> |                                                                       
>       ^~~~~~~~
> |                                                                       
>       GLclampx
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:40:90: error: 
> unknown type name 'GLclampf'; did you mean 'GLclampx'?
> |  typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf 
> green, GLclampf blue, GLclampf alpha);
> |                                                                       
>                      ^~~~~~~~
> |                                                                       
>                      GLclampx
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:43:8: error: 
> unknown type name 'type_ClearColor'
> |  static type_ClearColor fn_ClearColor;
> |         ^~~~~~~~~~~~~~~
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c: In function 
> 'init':
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:73:21: error: 
> 'type_ClearColor' undeclared (first use in this function); did you mean 
> 'fn_ClearColor'?
> |     fn_ClearColor = (type_ClearColor) get_proc("glClearColor");
> |                      ^~~~~~~~~~~~~~~
> |                      fn_ClearColor
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:73:21: note: 
> each undeclared identifier is reported only once for each function it 
> appears in
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:73:37: error: 
> expected ';' before 'get_proc'
> |     fn_ClearColor = (type_ClearColor) get_proc("glClearColor");
> |                                      ^~~~~~~~~
> |                                      ;
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:76:4: error: 
> called object 'fn_ClearColor' is not a function or function pointer
> |     fn_ClearColor(1.0, 0.4, 0.4, 0.0);
> |     ^~~~~~~~~~~~~
> | ../../../../mesa-demos-8.3.0/src/egl/opengles1/clear.c:43:24: note: 
> declared here
> |  static type_ClearColor fn_ClearColor;
> |                         ^~~~~~~~~~~~~
> | Makefile:634: recipe for target 'clear.o' failed
> | make[3]: *** [clear.o] Error 1
> | make[3]: *** Waiting for unfinished jobs....
> | make[3]: Leaving directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/egl/opengles1'
> | Makefile:413: recipe for target 'all-recursive' failed
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src/egl'
> | Makefile:422: recipe for target 'all-recursive' failed
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory 
> '/home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/build/src'
> | Makefile:439: recipe for target 'all-recursive' failed
> | make: *** [all-recursive] Error 1
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at 
> /home/demetriusz/Developer-Package/openst-linux/build-openstlinuxweston-stm32mp1/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/mesa-demos/8.3.0-r0/temp/log.do_compile.7265)
> ERROR: Task 
> (/home/demetriusz/Developer-Package/openst-linux/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb:do_compile) 
> failed with exit code '1'
> 
> 
> 
> 
> 
