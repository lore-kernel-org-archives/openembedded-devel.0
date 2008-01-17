Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JFYuv-0005AD-8K
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 18:52:41 +0100
Received: by ug-out-1314.google.com with SMTP id i24so389508ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 09:52:41 -0800 (PST)
Received: by 10.66.254.19 with SMTP id b19mr3646598ugi.7.1200592360882;
	Thu, 17 Jan 2008 09:52:40 -0800 (PST)
Received: from ?89.252.38.142? ( [89.252.38.142])
	by mx.google.com with ESMTPS id 27sm8334157ugp.19.2008.01.17.09.52.39
	(version=SSLv3 cipher=OTHER); Thu, 17 Jan 2008 09:52:40 -0800 (PST)
Date: Thu, 17 Jan 2008 20:00:25 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1903197593.20080117200025@gmail.com>
To: Dmitry Artamonow <mad_soft@inbox.ru>
In-Reply-To: <20080117171654.GA23313@rainbow>
References: <20080117171654.GA23313@rainbow>
MIME-Version: 1.0
Cc: angstrom-distro-users@linuxtogo.org,
	openembedded-devel@lists.openembedded.org,
	Mobile-linux-discuss@linuxtogo.org
Subject: Re: [Angstrom-distro-users] PXA/8250 serial clash strikes back
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
X-List-Received-Date: Thu, 17 Jan 2008 17:52:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Dmitry,

      Great analysis. Let's see what we can do.


Thursday, January 17, 2008, 7:16:54 PM, you wrote:

> After making gpsdrive-ipaq compile for Angstrom[1] , I tried to test in
> a real life on my iPAQ h2200 and suddenly found, that I can't. 
> Needed kernel module for my CompactFash GPS card, serial_cs wasn't in 
> the feeds. Oops. 

> I filed a bug[2], then changed OE's defconfig to include
> CONFIG_SERIAL_8250_CS=m , rebuild kernel and installed missing modules
> on PDA. Still no luck. On modprobe serial_cs I got this:
[]

> Well, what choices do we have:
> 1) Downgrade kernel to -hh17 (may cause some regressions)

Nak.

> 2) Reapply old hack to hh.org kernel locally in OE and then upgrade to it.

We can reapply it to the tree too.

> 3) Switch hh.org kernel to scheme suggested by RMK (renaming PXA serial
>    ports from ttyS* to ttySA*) [4] and then fix (a lot of?)  broken
>    userspace programs.

     Well, if RMK himself "suggests" such fix, then it would be
apparently the way to go (because it the most clean and consistent
solution too). The best course of action would be to feed this patch
back into LAKML and make sure Eric Miao saw it - he did many changes
to PXA code RMK couldn't make before.

     If we talk local OE change, then we'd need to cooperate with
Zaurus people at least, because doing it for one kernel recipe only
would be pretty, ... well, adhoc. I don't think that would be lot to
fix, but something to fix for sure. I cc: wider audience to get more
feedback.

> Oh, hell. Nothing of this seems to be perfect. The sad thing also is that
> mainline kernel still doesn't solve this problem itself. 
> Any ideas, comments, suggestions? 


> Dmitry 'MAD' Artamonow

> [1]
> http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2008-January/001587.html
> [2] http://bugs.openembedded.org/show_bug.cgi?id=3682

  Thanks for submitting this. We should create a ticket to track
requested/pending changes on the kernel level for next kernel
subrelease, I already have bunch of such in my mind (and don't want to
haste to not burden users with kernel upgrade). As soon as bugtracker
is up, I'll post such.

> [3] http://www.handhelds.org/hypermail/kernel-discuss/14/1419.html
> [4]
> http://lists.arm.linux.org.uk/lurker/message/20070702.162054.91fc79ce.html

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



