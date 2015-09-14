Return-Path: <prvs=692b5f1a6=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 0FEE46E26B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 19:37:07 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArkEAHEh91WsEApK/2dsb2JhbABdg3dpAQW/R4V1AoIIAQEBAQEBgQALhCMBAQEDATo/BQsCAQgNFRQQHxMlAQEEDg2IHg0Iy0MBAQEBAQUBAQEBHoZzhH2EXDEHgxiBFAWHL4Z3hzENhQCJPUaDbYMVkWqCdByBVHEBiXeBBQEBAQ
X-IPAS-Result: ArkEAHEh91WsEApK/2dsb2JhbABdg3dpAQW/R4V1AoIIAQEBAQEBgQALhCMBAQEDATo/BQsCAQgNFRQQHxMlAQEEDg2IHg0Iy0MBAQEBAQUBAQEBHoZzhH2EXDEHgxiBFAWHL4Z3hzENhQCJPUaDbYMVkWqCdByBVHEBiXeBBQEBAQ
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] bitbake openjdk-7-jre error
Thread-Index: AdDq91QlAOnyUBB0RV6dY3PX9UeO1QELJKhO
Date: Mon, 14 Sep 2015 19:37:03 +0000
Message-ID: <F7680723A1CA6840825A59020FA77064553DFDA0@sdexmbx1srv.skidata.net>
References: <C1B1B9E9EA41BF4D834E115E0FB06EAEECA596@TOP-EX01.TOPIC.LOCAL>
In-Reply-To: <C1B1B9E9EA41BF4D834E115E0FB06EAEECA596@TOP-EX01.TOPIC.LOCAL>
Accept-Language: en-US, de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.34.1]
MIME-Version: 1.0
Subject: Re: [meta-java] bitbake openjdk-7-jre error
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
X-List-Received-Date: Mon, 14 Sep 2015 19:37:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Rachana,=0A=
with which revision of the "meta-java" repository are you working?=0A=
It seems there are problems with dependencies (NSS)...=0A=
=0A=
Please try again with the current HEAD of the meta-java repository.=0A=
IMHO it would be best to follow the "Usage instructions" from the README fi=
le [1].=0A=
=0A=
regards,=0A=
Richard=0A=
=0A=
[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/README=0A=
=0A=
> Hi,=0A=
> =0A=
> I am pretty new to openembedded development. I am trying to get java work=
ing. I followed the steps given in the below link:=0A=
> http://icedtea.classpath.org/wiki/CrossCompileOECoreTutorial#Run_bitbake_=
openjdk-6_to_start_the_cross-compile_build.21=0A=
> =0A=
> But I am getting the following error:=0A=
> checking for system library directory... /usr/lib=0A=
> | checking whether to enable the NSS-based security provider... disabled =
by default (edit java.security to enable)=0A=
> | /home/topic/workspace/workshop_platform/zynq_platform/build/tmp-glibc/w=
ork/armv7a-vfp-neon-oe-linux-gnueabi/openjdk-7-jre/25b30-2.3.12-r5.1/icedte=
a-2.3.12/configure: line 8646: syntax error near unexpected token `NSS,'=0A=
> | /home/topic/workspace/workshop_platform/zynq_platform/build/tmp-glibc/w=
ork/armv7a-vfp-neon-oe-linux-gnueabi/openjdk-7-jre/25b30-2.3.12-r5.1/icedte=
a-2.3.12/configure: line 8646: `PKG_CHECK_MODULES(NSS, nss, NSS_FOUND=3Dyes=
, NSS_FOUND=3Dno)'=0A=
> | Configure failed. The contents of all config.log files follows to aid d=
ebugging=0A=
> | ERROR: oe_runconf failed=0A=
> | WARNING: /home/topic/workspace/workshop_platform/zynq_platform/build/tm=
p-glibc/work/armv7a-vfp-neon-oe-linux-gnueabi/openjdk-7-jre/25b30-2.3.12-r5=
.1/temp/run.do_configure.1003:1 exit 1 from=0A=
> |   exit 1=0A=
> | ERROR: Function failed: do_configure (log file is located at /home/topi=
c/workspace/workshop_platform/zynq_platform/build/tmp-glibc/work/armv7a-vfp=
-neon-oe-linux-gnueabi/openjdk-7-jre/25b30-2.3.12-r5.1/temp/log.do_configur=
e.1003)=0A=
> ERROR: Task 6 (/home/topic/workspace/workshop_platform/zynq_platform/meta=
-java/recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb, do_configure) failed =
with exit code '1'=0A=
> NOTE: Tasks Summary: Attempted 2719 tasks of which 2718 didn't need to be=
 rerun and 1 failed.=0A=
> No currently running tasks (2716 of 2733)=0A=
> =0A=
> Summary: 1 task failed:=0A=
>   /home/topic/workspace/workshop_platform/zynq_platform/meta-java/recipes=
-core/openjdk/openjdk-7_25b30-2.3.12.bb, do_configure=0A=
> Summary: There were 5 WARNING messages shown.=0A=
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.=
=0A=
> =0A=
> Kindly help! I am pretty much stuck at this point.=0A=
=0A=

