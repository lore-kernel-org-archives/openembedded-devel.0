Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NVrOD-00034N-Ve
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 19:59:25 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWA00NJMXYG2TE1@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	15 Jan 2010 12:56:46 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EAA3114AF60; Fri,
	15 Jan 2010 13:56:39 -0500 (EST)
Date: Fri, 15 Jan 2010 13:56:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100115185639.GA6194@denix.org>
References: <1262452243-8187-1-git-send-email-Martin.Jansa@gmail.com>
	<1262455806.2553.90.camel@lenovo.internal.reciva.com>
	<20100103005309.GA29588@denix.org>
	<201001151814.11153.marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <201001151814.11153.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] sanity.bbclass:	Reading?/proc/sys/vm/mmap_min_addr is not permitted with 2.6.33+ on	host
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
X-List-Received-Date: Fri, 15 Jan 2010 18:59:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 15, 2010 at 06:14:10PM +0100, Marcin Juszkiewicz wrote:
> Dnia niedziela, 3 stycznia 2010 o 01:53:09 Denys Dmytriyenko napisa??(a):
> 
> > BTW, wasn't the latest qemu "fixed" for this mmap() issue?
> 
> It was. I am running qemu 0.12.1 on my Debian host without problem. Did not 
> made recipe for it anyway.
> 
> Attached is cleaned version of Martin's patch which I use with stable/2009 and 
> OE.dev branches. Please Ack it.

Is there any way to remove the check altogether? Are there any other issues, 
besides backward compatibility with older QEMU?

-- 
Denys


> Regards, 
> -- 
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

> From 2c335c2bfba52b8a7672cec02159c9d8bba658a1 Mon Sep 17 00:00:00 2001
> From: Martin Jansa <martin.jansa@gmail.com>
> Date: Fri, 15 Jan 2010 18:10:29 +0100
> Subject: [PATCH] sanity.bbclass: handle lack of permission to read /proc/sys/vm/mmap_min_addr
> 
> * With 2.6.33-rc2-00252-ge9e5521 on my host I noticed that
>   "cat /proc/sys/vm/mmap_min_addr" returns now
>   "cat: /proc/sys/vm/mmap_min_addr: Operation not permitted"
>   Its probably becuse of
>   http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
>   But I'm not sure if checking CAP_SYS_RAWIO even for reading this value
>   is intentional or just bug which should be fixed in kernel.
> 
> This patch makes bitbake ignore reading error. Possible QEmu failure is not
> handled yet.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  classes/sanity.bbclass |   13 ++++++++-----
>  1 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> index f65df61..f57d8e4 100644
> --- a/classes/sanity.bbclass
> +++ b/classes/sanity.bbclass
> @@ -96,11 +96,14 @@ def check_sanity(e):
>  			if not check_app_exists("qemu-arm", e.data):
>  				messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
>  
> -		if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> -			f = file("/proc/sys/vm/mmap_min_addr", "r")
> -			if (f.read().strip() != "0"):
> -				messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
> -			f.close()
> +		try:
> +			if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> +				f = file("/proc/sys/vm/mmap_min_addr", "r")
> +				if (f.read().strip() != "0"):
> +					messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
> +				f.close()
> +		except:
> +			pass
>  
>  	for util in required_utilities.split():
>  		if not check_app_exists( util, e.data ):
> -- 
> 1.6.6
> 

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



