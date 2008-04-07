Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JiwU0-0001j5-6O
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Apr 2008 20:54:20 +0200
X-ASG-Debug-ID: 1207594458-783100180000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP
	id 6196E3A820; Mon,  7 Apr 2008 13:54:18 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id E31FPHERWe7gwBa5; Mon, 07 Apr 2008 13:54:18 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Building multiple gdb-cross targets
Date: Mon, 7 Apr 2008 13:54:23 -0500
User-Agent: KMail/1.9.7
References: <200804071759.m37HxD8J010059@aiolos.otenet.gr>
In-Reply-To: <200804071759.m37HxD8J010059@aiolos.otenet.gr>
MIME-Version: 1.0
Message-Id: <200804071354.23859.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1207594458
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Cc: openembedded-devel@openembedded.org
Subject: Re: Building multiple gdb-cross targets
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
X-List-Received-Date: Mon, 07 Apr 2008 18:54:20 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 07 April 2008 12:58:42 pm Stelios Koroneos wrote:
> I think you are missing the point
>
> "bare-metal" gdb does not have any bindings with
> glibc/uclibc/eglibc/whatever-libc because its (usually) used to build a
> system with no OS (standalone apps).
> You also need a "bare-metal" toolchain i.e toolchain that generates code
> that can run on the board without any OS (this was the case in most
> embedded designs before linux become "embedded")

Yeah, needing a baremetal gdb to debug makes perfect sense when you stop and 
think about it.  A linux-glibc gdb might want to hook into things like 
libthread_db that don't exist when debugging a kernel.

You don't need a baremetal toolchain (binutils +gcc) to build Linux or u-boot 
in this case (AVR32), though.  Maybe on some platforms you do, but not here.  
Even baremetal compilers usually need a libc, though, like using newlib to 
build a baremetal arm-elf toolchain.  The whole build a bootstrap compiler, 
then the libc, then the final compiler routine.  The AVR (not AVR32) 
toolchain is the one exception I know of to this.  For the AVR, you build 
binutils, then gcc, then avr-libc, and then your done.

---
Geoffrey


