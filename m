Received: from [89.96.204.112] (helo=www-zirak-new.zirak.it)
	by linuxtogo.org with smtp (Exim 4.67) (envelope-from <phy@linux.it>)
	id 1IlV2J-0007Ak-Lo
	for openembedded-devel@openembedded.org; Fri, 26 Oct 2007 21:40:04 +0200
Received: (qmail 4518 invoked by uid 64017); 26 Oct 2007 19:26:03 -0000
Received: from 82.58.178.124 (filippo@zirak.it@82.58.178.124) by www-zirak-new
	(envelope-from <phy@linux.it>, uid 64011) with qmail-scanner-2.01 
	(uvscan: v5.1.00/v5052. bogofilter: 0.92.0. spamassassin: 3.0.4.  
	Clear:RC:1(82.58.178.124):. 
	Processed in 0.011754 secs); 26 Oct 2007 19:26:03 -0000
Received: from unknown (HELO ?192.168.1.6?) (filippo@zirak.it@82.58.178.124)
	by www-zirak-new.zirak.it with SMTP; 26 Oct 2007 19:26:03 -0000
Message-ID: <472240E2.3070107@linux.it>
Date: Fri, 26 Oct 2007 21:32:50 +0200
From: Filippo Basso <phy@linux.it>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <HOECLKEKOHLAMMGDLLBHIEEKMKAA.skoroneos@digital-opsis.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHIEEKMKAA.skoroneos@digital-opsis.com>
Subject: Re: different hosts, different OE images
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
X-List-Received-Date: Fri, 26 Oct 2007 19:40:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Stelios Koroneos ha scritto:
> Well to answer your question in a quick way
> it should not be happening
>
> We have seen from time to time differences between 32bit hosts and 64bit
> hosts but not anything like the thing you mention.
>
> Could you prvide some additional info (what distro, machine, host tools
> versions etc)
>   
Thank you Stelios for the answer!!!
    I was trying to better understand OE, writing a small doc called "OE
Journey" and try to go a little deeper in my personal understanding of
this very interesting tool...

So, after some time I was  playing successfully with it, I tried to
analyze better a simple:
    DISTRO = "angstrom-2007.1"
    MACHINE = "qemux86"

with 3 hosts:
    1) my debian-testing (lenny)
    * gcc version 4.2.3

    2) vmware debian-stable (etch)
    * gcc version 4.1.1

    3) vmware ubuntu
    * gcc version 4.1.2

    Same for the 3 distros:
    * GNU Make 3.81
    * BitBake Build Tool Core version 1.8.9, bitbake version 1.8.9
    * monotone 0.36  (with OE at the same fixed revision 1c938b19)
    * GNU Awk 3.1.5
    * patch 2.5.9
    * ccache version 2.4
    * perl, v5.8.8 built for i486-linux-gnu-thread-multi
    * Python 2.4.4

I've noticed differences in the 3 distro, that I tried to setup
identically, so I begun to investigate. At the moment I've not yet found
a nice way to see differences, I just make md5 on logfiles and from that
I analyze manually 20-30 non-matching logfiles. (log.do_compile). Any
better idea?

Say that host1 create a nice image, while host3 has strange behaviour at
login (after login immediately exits and show again the login form).
host2 seems like host1, but if I try to add the "minimo" package, it
compiles on host1 and not on host2..... :-(

Seems something strange... 3 hosts, 3 behaviours...
So I was reading the log.do_compile files manually (after choosing
different md5) and at the moment I found:
* the order of gcc arguments is not always fixed, depends on the machine
(es: ipkg, perl)
* in many packages the make[n] is make[n+1] (one more "Make"), sometimes
there is a duplicated chdir, or there is a duplicated message like "OE:
Not hardcoding..."
* in many packages on lenny is present in the options for "ccache
i586-angstrom-linux-gcc" a -L/usr/lib (isn't that potentially dangerous???)

..................................

so, now I really want to understand it well, and help to fix the
problem. If somebody has some nice idea on how I should proceed, I'll
devote my laptop to this work next nights.

thank you!
    phy



