Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 297C176703
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:59:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 06 Aug 2015 18:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,626,1432623600"; d="scan'208";a="620880174"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by orsmga003.jf.intel.com with ESMTP; 06 Aug 2015 18:59:58 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 6 Aug 2015 18:59:58 -0700
Received: from fmsmsx106.amr.corp.intel.com (10.18.124.204) by
	ORSMSX156.amr.corp.intel.com (10.22.240.22) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 6 Aug 2015 18:59:57 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.23]) by
	FMSMSX106.amr.corp.intel.com ([169.254.5.70]) with mapi id
	14.03.0224.002; Thu, 6 Aug 2015 18:59:57 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java]
	[Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
Thread-Index: AQHQ0LM/pIfQSRhkTEqSP5paxhNxMJ3/xmEA
Date: Fri, 7 Aug 2015 01:59:56 +0000
Message-ID: <B399646F8CA055479BEC55F6B065A04A3703F1FD@FMSMSX108.amr.corp.intel.com>
References: <B399646F8CA055479BEC55F6B065A04A3703F105@FMSMSX108.amr.corp.intel.com>
	<CAMKF1soC4=mMLfhgSXEhd318AiHuAj+YF+otJ6fGtgE4+jy7gw@mail.gmail.com>
In-Reply-To: <CAMKF1soC4=mMLfhgSXEhd318AiHuAj+YF+otJ6fGtgE4+jy7gw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java]	[Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
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
X-List-Received-Date: Fri, 07 Aug 2015 01:59:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hotspot build for arm is not stable... I see various error related  (see be=
low)

One can try building it by returning False in should_build_zero function fo=
r non x86 case in openjdk-8-common.inc...

Thanks,
Vinay

INFO: ENABLE_FULL_DEBUG_SYMBOLS=3D1
| INFO: ALT_OBJCOPY=3D/home/vinay/YOCTO/openembedded-core/build/tmp-glibc/s=
ysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-objc=
opy
| INFO: /home/vinay/YOCTO/openembedded-core/build/tmp-glibc/sysroots/x86_64=
-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-objcopy cmd found =
so will create .debuginfo files.
| INFO: STRIP_POLICY=3Dmin_strip
| INFO: ZIP_DEBUGINFO_FILES=3D1
| Creating Makefile ...
| Creating flags.make ...
| Creating flags_vm.make ...
| Creating vm.make ...
| Creating adlc.make ...
| Creating jvmti.make ...
| Creating trace.make ...
| Creating sa.make ...
| make[6]: *** No rule to make target `/home/vinay/YOCTO/openembedded-core/=
build/tmp-glibc/work/armv5e-oe-linux-gnueabi/openjdk-8-jre/8u40b27-2.5.4-r5=
.1/build/openjdk/hotspot/src/cpu/arm/vm/arm.ad', needed by `../generated/ad=
files/linux_arm.ad'.  Stop.
| make[6]: *** Waiting for unfinished jobs....
| make[5]: *** [ad_stuff] Error 2
| make[4]: *** [product] Error 2
| make[3]: *** [generic_build2] Error 2
| make[2]: *** [product] Error 2
| make[1]: *** [/home/vinay/YOCTO/openembedded-core/build/tmp-glibc/work/ar=
mv5e-oe-linux-gnueabi/openjdk-8-jre/8u40b27-2.5.4-r5.1/build/openjdk/build/=
linux-arm-normal-server-release/hotspot/_hotspot.timestamp] Error 2
| make: *** [hotspot-only] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/vinay/YO=
CTO/openembedded-core/build/tmp-glibc/work/armv5e-oe-linux-gnueabi/openjdk-=
8-jre/8u40b27-2.5.4-r5.1/temp/log.do_compile.6657)
ERROR: Task 7 (/home/vinay/YOCTO/openembedded-core/meta-java/recipes-core/o=
penjdk/openjdk-8_8u40b27-2.5.4.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2014 tasks of which 2012 didn't need to be r=
erun and 1 failed.
No currently running tasks (2014 of 2023)

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Thursday, August 6, 2015 6:48 PM
To: openembeded-devel
Cc: otavio@ossystems.com.br; mario@ossystems.com.br
Subject: Re: [oe] [meta-java] [Enabling-Openjdk-8-for-x86-hotspot-vm-and-ar=
m-zero-vm]

On Thu, Aug 6, 2015 at 6:31 PM, Awasthi, Vinay K <vinay.k.awasthi@intel.com=
> wrote:
> This patch enables zero VM for arm. It is tested on openembedded-core.=20
> This patch compiles are components for arm including NASHORN (java=20
> script over java)

why zerovm, why not hotspot for arm as well ?
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

