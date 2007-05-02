Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1Hj6Gm-0007DX-GZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2007 06:16:48 +0200
Received: by py-out-1112.google.com with SMTP id n39so5934pyh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2007 21:07:26 -0700 (PDT)
Received: by 10.35.27.2 with SMTP id e2mr514165pyj.1178078845620;
	Tue, 01 May 2007 21:07:25 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id 40sm287445nzf.2007.05.01.21.07.24;
	Tue, 01 May 2007 21:07:24 -0700 (PDT)
Message-ID: <46380E26.6070303@gmail.com>
Date: Tue, 01 May 2007 23:05:58 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: Jamie Lenehan <lenehan@twibble.org>
References: <20070427105722.GA4340@twibble.org> <46359408.9060800@gmail.com>
	<20070430080044.GA15877@twibble.org> <4636CCC0.1010109@gmail.com>
	<20070502003641.GA5189@twibble.org>
In-Reply-To: <20070502003641.GA5189@twibble.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2007 04:16:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:
> On Tue, May 01, 2007 at 12:14:40AM -0500, Junqian Gordon Xu wrote:
>   
> This turns out to be an error on my part in perl 5.8.8 - I didn't
> tell bitbake that perl 5.8.8 was providing all the perl modules. So
> when something needed perl-modules (because of a DEPEND or RDEPEND)
> it found that perl 5.8.8 provided them while 5.8.8 didn't.
>
> If you had perl 5.8.7 already compiled and lying around you didn't
> notice this issue. Since I've been building and testing changes for
> both version I had 5.8.7 and 5.8.8 always compiled.
>
> Anyway, I just checked in a fix for this so it should be ok now.
>
>   
I can confirm with the latest mtn pull, perl-5.8.8 builds fine for me 
here except for some warning signs:

NOTE: package perl-5.8.8: started
NOTE: package perl-5.8.8-r10: task do_package: started
NOTE: perl-lib contains dangling symlink to /usr/lib/perl/5.8.8
NOTE: perl-lib contains dangling symlink to /usr/share/perl/5.8.8
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1

>> Besides, I noticed another issue:
>> I had linux-libc-headers-2.6.15.99 compiled (I think it's determined 
>> Machine and Distro) . But perl-5.8.8 wants linux-libc-headers-2.6.20. 
>> Will that cause problem?
>>     
>
> Perl shouldn't care about linux-libc-headers, I use 2.6.15.99 here at
> the moment.
However, this issue is still outstanding. I'm trying to understand where 
the 2.6.20 dependency is coming from. Is this a bitbake issue?

bitbake perl:

OE Build Configuration:
BB_VERSION     = "1.8.3"
OE_REVISION    = "3ea77972dcf422ed70f1a083c412f43ab519f474"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "tosa"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20070502"
TARGET_FPU     = "soft"

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item 
virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: Preparing Runqueue
NOTE: Executing runqueue
NOTE: Running task 115 of 294 (ID: 131, 
/home/OE/org.openembedded.dev/packages/linux-libc-headers/linux-libc-headers_2.6.20.bb, 
do_fetch)
NOTE: package linux-libc-headers-2.6.20: started


