Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PKhen-0002Ml-0k
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 02:26:53 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PKhdc-0002ca-GL from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 17:25:40 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 22 Nov 2010 17:25:40 -0800
Received: from [172.30.80.10] ([172.30.80.10]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 22 Nov 2010 18:25:39 -0700
Message-ID: <4CEB1810.40707@mentor.com>
Date: Mon, 22 Nov 2010 18:25:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <87y68kx2l3.fsf@gmail.com>
In-Reply-To: <87y68kx2l3.fsf@gmail.com>
X-OriginalArrivalTime: 23 Nov 2010 01:25:39.0455 (UTC)
	FILETIME=[567318F0:01CB8AAD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel build under meta-toolchain SDK fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Nov 2010 01:26:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/2010 06:15 PM, Ben Gamari wrote:
> Hey all,
>
> Recently I tried updating our openembedded environment for an embedded
> application built around the BeagleBoard. Unfortunately, the build
> failed while configuring the kernel with an inexplicable bus error. To
> trace down the issue I installed the latest meta-toolchain sdk and tried
> building a kernel. This resulted in an identical failure,
>
> $ make
>    HOSTCC  scripts/basic/fixdep
> In file included from /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/include/stdlib.h:903,
>                   from scripts/basic/fixdep.c:112:
> /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/include/bits/stdlib.h:65: warning: no previous prototype for ‘ptsname_r’
> /bin/sh: line 1:  4192 Bus error               scripts/basic/fixdep scripts/basic/.fixdep.d scripts/basic/fixdep 'gcc -Wp,-MD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer     -o scripts/basic/fixdep scripts/basic/fixdep.c  '>  scripts/basic/.fixdep.tmp
> make[2]: *** [scripts/basic/fixdep] Error 135
> make[1]: *** [scripts_basic] Error 2
> make: *** No rule to make target `include/config/auto.conf', needed by `include/config/kernel.release'.  Stop.
>
> The problem is quite early in the build since even make oldconfig fails
> in this way. I tried tracking down the bug on the LKML[1] but after some
> discussion it seems very likely the problem is a toolchain issue. At
> least part of the problem seems to be in fixdep, which fails very
> strangely in fstat[2]. I've done quite a bit of debugging[2], but it
> seems to be a bit of a heisenbug.
>
> Interestingly enough, I can reproduce the issue both on my personal
> laptop (running Ubuntu 10.10, gcc 4.4.5) and our build server (running
> Ubuntu 10.04, gcc 4.4.3). It would be great if someone could try
> building a kernel from master using openembedded master. Otherwise, any
> ideas would be greatly appreciated.

What's your kernel config or env look like?  It looks like you're trying 
to use the cross compiler as the host compiler and that won't fly :)

-- 
Tom Rini
Mentor Graphics Corporation


