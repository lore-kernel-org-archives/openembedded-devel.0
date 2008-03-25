Received: from [212.227.126.179] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1Je6mT-0002Xr-LO
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2008 11:53:25 +0100
Received: from [172.16.0.13] (p549B847E.dip0.t-ipconnect.de [84.155.132.126])
	by mrelayeu.kundenserver.de (node=mrelayeu3) with ESMTP (Nemesis)
	id 0MKxQS-1Je6mO13mX-0002OK; Tue, 25 Mar 2008 11:53:21 +0100
Message-ID: <47E8D99B.8060701@linuxdevelopment.de>
Date: Tue, 25 Mar 2008 11:53:15 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080226)
MIME-Version: 1.0
To: Geoffrey Wossum <geoffrey@pager.net>
References: <47E7757A.6080807@linuxdevelopment.de>
	<47E7E283.8050903@linuxdevelopment.de>
	<200803241321.48929.geoffrey@pager.net>
	<200803241439.20503.geoffrey@pager.net>
In-Reply-To: <200803241439.20503.geoffrey@pager.net>
X-Provags-ID: V01U2FsdGVkX194PWhCEfqw7TA6WjxWFCXhYXb4023FIGzRHLt
	ASXhqurL/sTcYmVrYJ7YT1Uw4blxlwmtO+CK0YFD2vrrcuxI7i
	+poOPIxjzW9yPkSJ4FOdG3SDOO5KUR07uYpB1FkPIk=
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: AVR32 - stops at gcc-cross-4.2.1 configure GCC_NO_EXECUTABLES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Mar 2008 10:53:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Okay, figured that one out. Don't use TARGET_FPU_avr32 = "soft". The AVR32
> target in gcc doesn't like that.  I added that because I thought I needed it 
> to get libmad to compile, but that wasn't the issue with libmad anyway.  I 
> needed some sort of optimizations turned on.  angstrom-uclibc.inc was turning 
> off all optimizations for the AVR32, which was unnecessary.
>
> Waiting for a full rebuild right now.
>
>   
I had a succes now on my intel core 2 duo laptop ..  that build the 
current oe chain nice ( beside some bzero() problems which can be easly 
replaced by memset() )

But the opteron server x86_64 as host still fails to build ..  on 
gcc-cross configure ..
so seems we need some site.conf entry `s for it !!

Robert



