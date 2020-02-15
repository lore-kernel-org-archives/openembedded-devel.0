Return-Path: <pjtexier@koncepto.io>
X-Greylist: delayed 359 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 15 Feb 2020 16:30:02 UTC
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 4630E613E1;
	Sat, 15 Feb 2020 16:30:02 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 7D5516024F;
	Sat, 15 Feb 2020 17:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1581783841;
	bh=0PDZ1bY4lGHAtw/qxFsCEp4unAl+9iNIgRuqwSFcuKo=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=vlg1VOnpvv0fpJ7A/OUTaChjcRN1bxVe9mm+1BdoapsH9yI09p/dbFdNVE0he3+OV
	ORqyqUP28kARiaopn/SzoJlxKi0/cdZduRJcqWrygDiGQb/Kn1KzyKn2xGdImb+OyK
	qzsc/r6uje5Ts6wZ1DJfaUv7+ZaFYi21WEh03KW8FPifa+CKtDXcIjkFhxC7lE6LSr
	6gyZvIqBvwWU31nnHLNv+3WVxcPPepkQldMnATUbNX0+EVrpERaJ3v/o6dow7F4ZdE
	RYu+LSNDHppZl/e6aolPP1dFOC1DvbRIDrZoNm7K9DOzC5GZgwv7tUO2lEb1upxKKi
	2vQ63Kn6RTOgw==
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <158176248670.31260.7654152103178704127@git.openembedded.org>
	<20200215102807.938B8232818@git.openembedded.org>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <65fcf6fa-6f55-b082-52fb-6d8a8ce2ef3c@koncepto.io>
Date: Sat, 15 Feb 2020 17:24:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200215102807.938B8232818@git.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 11/18: busybox: Backport patches to support removal of __NR_clock_gettime
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
X-List-Received-Date: Sat, 15 Feb 2020 16:30:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hello All,

Le 15/02/2020 à 11:28, git@git.openembedded.org a écrit :
>      busybox: Backport patches to support removal of __NR_clock_gettime
>      
>      This helps compiling with musl on 32bit arches now that musl has
>      switched to 64bit time_t
>      
>      Signed-off-by: Khem Raj<raj.khem@gmail.com>
>      Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
>   ...all-wrappers-around-clock_gettime-closes-.patch | 120 +++++++++++++++++++++
>   ...-date-Use-64-prefix-syscall-if-we-have-to.patch |  53 +++++++++
>   ...-time-Use-64-prefix-syscall-if-we-have-to.patch |  43 ++++++++
>   ...runsv-Use-64-prefix-syscall-if-we-have-to.patch |  46 ++++++++
>   meta/recipes-core/busybox/busybox_1.31.1.bb        |   4 +
>   5 files changed, 266 insertions(+)

this commit causes the following build issue :

  ERROR: busybox-1.31.1-r0 do_patch: Command Error: 'quilt --quiltrc 
/home/runner/work/kas-files/kas-files/build/tmp/work/cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi/busybox/1.31.1-r0/recipe-sysroot-native/etc/quiltrc 
push' exited with 0  Output:
Applying patch 
0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
patching file Makefile.flags
patching file coreutils/date.c
Hunk #2 FAILED at 270.
1 out of 2 hunks FAILED -- rejects in file coreutils/date.c
patching file libbb/time.c
patching file runit/runsv.c
Patch 0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch 
does not apply (enforce with -f)
ERROR: Logfile of failure stored in: 
/home/runner/work/kas-files/kas-files/build/tmp/work/cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi/busybox/1.31.1-r0/temp/log.do_patch.62122
ERROR: Task 
(/home/runner/work/kas-files/kas-files/poky/meta/recipes-core/busybox/busybox_1.31.1.bb:do_patch) 
failed with exit code '1'

Tested on top of poky master (commit 
7f2af8bd795ace46828952a7812f0bbdf26529a [1])

[1] - https://github.com/texierp/kas-files/runs/447729194

Thanks !

Regards
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io

