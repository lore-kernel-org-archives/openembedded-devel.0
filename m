Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q1XUG-0004J4-5a
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 06:17:04 +0100
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIE00DEO6KZLZ90@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	21 Mar 2011 00:15:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7C2F014AF6C; Mon,
	21 Mar 2011 01:14:59 -0400 (EDT)
Date: Mon, 21 Mar 2011 01:14:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110321051459.GA5575@denix.org>
References: <AANLkTik0yYB28d951apBxi9R0uVHHGFPcijtrjxsNpu6@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTik0yYB28d951apBxi9R0uVHHGFPcijtrjxsNpu6@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Triggering kgdb on linux-2.6.37 with ttyOx
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
X-List-Received-Date: Mon, 21 Mar 2011 05:17:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 18, 2011 at 09:33:13AM +0100, Tarjei Knapstad wrote:
> In recent kernels the omap serial consoles have been renamed from
> ttySx to ttyOx. This seems to be an issue for kgdb. Setting kernel
> boot parameters has no effect:
> 
> kgdb=ttyO2,115200n8 kgdboc=ttyO2,115200n8 kgdbwait
> 
> and attempting to trigger kgdb from the console also fails:
> 
> # echo ttyO2 > /sys/module/kgdboc/parameters/kgdboc
> -bash: echo: write error: No such device
> 
> Attempting to send 'g' to sysrequest also does nothing, not sure if
> there has been changes to the magic sysrq stuff as well?
> # echo g > /proc/sysrq-trigger
> [  120.267944] SysRq : HELP : loglevel(0-9) reBoot Crash
> terminate-all-tasks(E) memory-full-oom-kill(F) kill-all-tasks(I) t
> haw-filesystems(J) saK show-memory-usage(M) nice-all-RT-tasks(N)
> powerOff show-registers(P) show-all-timers(Q) unRaw Sync s
> how-task-states(T) Unmount show-blocked-tasks(W)
> 
> I've had a look at the kgdb code, but I can't figure out what to patch
> to make it understand that ttyO2 is a valid terminal. Any suggestions?

Have you tried asking on the linux-omap mailing list[1]?

[1] http://vger.kernel.org/vger-lists.html#linux-omap

-- 
Denys


