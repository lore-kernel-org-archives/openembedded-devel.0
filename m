Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D37D0766FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 02:06:40 +0000 (UTC)
Received: by ioii16 with SMTP id i16so99350263ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2015 19:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ukDQul9QzKISVaP+Y9x/7S5aXy81zAIq2205vNaFiw0=;
	b=RdZcKsRAQcq4RTVgf9JPs19F0kpbuwMKtbOboQflyYxwK7YsAPI4jWgiFKcRG3TFo0
	IUZWSYsET93WYYBcc1kEApClYF6jpfZO8QJEW7w67cSruqoduCS/I6PglxRyuYI5vPz3
	zcC8ndD4zmDkZN0WQuqn9BO4zpmB3aINUZfuJXERWIdlmkKfWS88XAzimS0i6pPFDr+z
	P24IK905f3iofJs766KdOvx+SaBrNRt6OO60GSl+ZH2hEPtQ+yUP9w/z2MmqSomM7ND7
	3sPcfCuiob6HhHl4FJ+6jv3hkrb7/PLX+9LNDoviOAnO9HfeCZKIX5WD2TjAM43NVAQP
	if5g==
X-Received: by 10.107.14.203 with SMTP id 194mr6134981ioo.195.1438913200696;
	Thu, 06 Aug 2015 19:06:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 19:06:11 -0700 (PDT)
In-Reply-To: <B399646F8CA055479BEC55F6B065A04A3703F1FD@FMSMSX108.amr.corp.intel.com>
References: <B399646F8CA055479BEC55F6B065A04A3703F105@FMSMSX108.amr.corp.intel.com>
	<CAMKF1soC4=mMLfhgSXEhd318AiHuAj+YF+otJ6fGtgE4+jy7gw@mail.gmail.com>
	<B399646F8CA055479BEC55F6B065A04A3703F1FD@FMSMSX108.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 19:06:11 -0700
Message-ID: <CAMKF1sr-uvPLyO_4BgPBH53WnRg7HfKTB36qSMxhJqD1QHRW0Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java] [Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
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
X-List-Received-Date: Fri, 07 Aug 2015 02:06:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 6:59 PM, Awasthi, Vinay K
<vinay.k.awasthi@intel.com> wrote:
> Hotspot build for arm is not stable... I see various error related  (see below)
>
> One can try building it by returning False in should_build_zero function for non x86 case in openjdk-8-common.inc...
>

thanks for clarifying

> Thanks,
> Vinay
>
> INFO: ENABLE_FULL_DEBUG_SYMBOLS=1
> | INFO: ALT_OBJCOPY=/home/vinay/YOCTO/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-objcopy
> | INFO: /home/vinay/YOCTO/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-objcopy cmd found so will create .debuginfo files.
> | INFO: STRIP_POLICY=min_strip
> | INFO: ZIP_DEBUGINFO_FILES=1
> | Creating Makefile ...
> | Creating flags.make ...
> | Creating flags_vm.make ...
> | Creating vm.make ...
> | Creating adlc.make ...
> | Creating jvmti.make ...
> | Creating trace.make ...
> | Creating sa.make ...
> | make[6]: *** No rule to make target `/home/vinay/YOCTO/openembedded-core/build/tmp-glibc/work/armv5e-oe-linux-gnueabi/openjdk-8-jre/8u40b27-2.5.4-r5.1/build/openjdk/hotspot/src/cpu/arm/vm/arm.ad', needed by `../generated/adfiles/linux_arm.ad'.  Stop.
> | make[6]: *** Waiting for unfinished jobs....
> | make[5]: *** [ad_stuff] Error 2
> | make[4]: *** [product] Error 2
> | make[3]: *** [generic_build2] Error 2
> | make[2]: *** [product] Error 2
> | make[1]: *** [/home/vinay/YOCTO/openembedded-core/build/tmp-glibc/work/armv5e-oe-linux-gnueabi/openjdk-8-jre/8u40b27-2.5.4-r5.1/build/openjdk/build/linux-arm-normal-server-release/hotspot/_hotspot.timestamp] Error 2
> | make: *** [hotspot-only] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/vinay/YOCTO/openembedded-core/build/tmp-glibc/work/armv5e-oe-linux-gnueabi/openjdk-8-jre/8u40b27-2.5.4-r5.1/temp/log.do_compile.6657)
> ERROR: Task 7 (/home/vinay/YOCTO/openembedded-core/meta-java/recipes-core/openjdk/openjdk-8_8u40b27-2.5.4.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2014 tasks of which 2012 didn't need to be rerun and 1 failed.
> No currently running tasks (2014 of 2023)
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Thursday, August 6, 2015 6:48 PM
> To: openembeded-devel
> Cc: otavio@ossystems.com.br; mario@ossystems.com.br
> Subject: Re: [oe] [meta-java] [Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
>
> On Thu, Aug 6, 2015 at 6:31 PM, Awasthi, Vinay K <vinay.k.awasthi@intel.com> wrote:
>> This patch enables zero VM for arm. It is tested on openembedded-core.
>> This patch compiles are components for arm including NASHORN (java
>> script over java)
>
> why zerovm, why not hotspot for arm as well ?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

