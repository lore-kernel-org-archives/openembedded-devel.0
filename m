Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N5xfc-0000OM-GS
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 09:26:19 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N5xeD-0004im-GW
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 03:24:49 -0500
Date: Thu, 5 Nov 2009 03:24:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@openembedded.org
In-Reply-To: <4AF1A5E2.3020002@dresearch.de>
Message-ID: <alpine.LFD.2.00.0911050322460.17459@localhost>
References: <4AF1A5E2.3020002@dresearch.de>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qemu again :(
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
X-List-Received-Date: Thu, 05 Nov 2009 08:26:19 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 4 Nov 2009, Steffen Sledz wrote:

> Yesterday i tried to use OE at my new notebook for the first time. But
> i hit a qemu problem again:
>
> # bitbake emacs (clean build)
>
> ERROR: function do_compile failed
> ERROR: log data follows
> (/home/sledz/work/HydraIP/OE/tmp.4/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r1/temp/log.do_compile.8552)
> | NOTE: make -j 8 QEMU=qemu-arm  -s 1048576 -L
> /home/sledz/work/HydraIP/OE/tmp.4/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r1/qemu-treedir
> ...
> | mmap: Permission denied
> | make[1]: *** [test-distrib] Error 255
>
> All solutions for this problem i found see the cause in a wrong
> setting of mmap_min_addr (see e.g.
> <http://www.bugcommunity.com/wiki/index.php/Kernel_and_Rootfs_Build_System#Potential_Problems_.26_Their_Solutions:>).
>
> But this setting is correct at my notebook:
>
> # cat /proc/sys/vm/mmap_min_addr
> 0
>
> Hmmmm? What else could be the cause for this error?

  i suspect koen will hate me for this but i documented what it took
for me to build angstrom over at my wiki:

http://www.crashcourse.ca/wiki/index.php/Angstrom

and if you read carefully, you'll notice that even if that value is
correctly set to zero, you might still get an SELinux violation.  it's
just a suggestion.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


