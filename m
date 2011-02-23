Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1PsB6L-0008S4-H2
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 10:33:46 +0100
Received: (qmail 19274 invoked from network); 23 Feb 2011 10:32:23 +0100
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 23 Feb 2011 10:32:23 +0100
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id eDnXcLCcCMuw
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 10:32:18 +0100 (CET)
Received: (Qmail 19227 invoked from network); 23 Feb 2011 10:32:18 +0100
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 23 Feb 2011 09:32:18 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1PsB4z-0007lg-T6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 10:32:17 +0100
Date: Wed, 23 Feb 2011 10:32:17 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110223093217.GA28556@mi.fu-berlin.de>
References: <AANLkTimGuqfEAYzvk3+4aH=rPWHb=Q2gNY4zWLwhAuRi@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimGuqfEAYzvk3+4aH=rPWHb=Q2gNY4zWLwhAuRi@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: libcap2 build failure
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
X-List-Received-Date: Wed, 23 Feb 2011 09:33:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 23, 2011 at 02:54:02AM +0000, Otavio Salvador wrote:
> Hello,
> 
> Today I tryed to build from scratch with current OE and found this:
> 
> 
> | i586-oe-linux-gcc -march=pentium -fexpensive-optimizations
> -fomit-frame-pointer -frename-registers -Os
> -I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r3/libcap-2.16/libcap/include
> -Dlinux -fPIC -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual
> -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs
> -Winline -Wshadow -g
> -I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r3/libcap-2.16/libcap/include
> -I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r3/libcap-2.16/libcap/include
> -Dlinux -fPIC -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual
> -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs
> -Winline -Wshadow -g
> -I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r3/libcap-2.16/progs/../libcap/include
> -I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r3/libcap-2.16/progs/../libcap/include
> -c capsh.c -o capsh.o
> | In file included from
> /home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/include/bits/sigcontext.h:28:0,
> |                  from
> /home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/include/signal.h:339,
> |                  from
> /home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/include/sys/wait.h:31,
> |                  from capsh.c:19:
> | /home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/include/asm/sigcontext.h:28:2:
> error: expected specifier-qualifier-list before '__u64'
> | /home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/include/asm/sigcontext.h:191:2:
> error: expected specifier-qualifier-list before '__u64'
> | make[1]: *** [capsh.o] Error 1
> | make[1]: Leaving directory
> `/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r3/libcap-2.16/progs'
> 
> I am attaching the full log. Someone has any clue?

Hi,

gnutoo hitting this too. It's a problem with the kernelheaders, because libpcap includes a kernelheader
but some how not the types definition header. But dont know offhand if he solved it.

Bye Henning


