Received: from [66.249.82.228] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <sdgvulpes@gmail.com>) id 1JFcyk-00048i-43
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 23:12:54 +0100
Received: by wx-out-0506.google.com with SMTP id h27so585905wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 14:12:53 -0800 (PST)
Received: by 10.142.229.4 with SMTP id b4mr1639590wfh.125.1200607972569;
	Thu, 17 Jan 2008 14:12:52 -0800 (PST)
Received: by 10.142.136.1 with HTTP; Thu, 17 Jan 2008 14:12:52 -0800 (PST)
Message-ID: <f34f85580801171412k6bd02663l51402bf4fcdba413@mail.gmail.com>
Date: Thu, 17 Jan 2008 17:12:52 -0500
From: "SDG Systems" <sdgvulpes@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1903197593.20080117200025@gmail.com>
MIME-Version: 1.0
References: <20080117171654.GA23313@rainbow>
	<1903197593.20080117200025@gmail.com>
Cc: angstrom-distro-users@linuxtogo.org, Mobile-linux-discuss@linuxtogo.org,
	Dmitry Artamonow <mad_soft@inbox.ru>
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
X-List-Received-Date: Thu, 17 Jan 2008 22:12:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Jan 17, 2008 1:00 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello Dmitry,
>
>       Great analysis. Let's see what we can do.
>
>
> Thursday, January 17, 2008, 7:16:54 PM, you wrote:
>
> > After making gpsdrive-ipaq compile for Angstrom[1] , I tried to test in
> > a real life on my iPAQ h2200 and suddenly found, that I can't.
> > Needed kernel module for my CompactFash GPS card, serial_cs wasn't in
> > the feeds. Oops.
>
> > I filed a bug[2], then changed OE's defconfig to include
> > CONFIG_SERIAL_8250_CS=m , rebuild kernel and installed missing modules
> > on PDA. Still no luck. On modprobe serial_cs I got this:
> []
>
> > Well, what choices do we have:
> > 1) Downgrade kernel to -hh17 (may cause some regressions)
>
> Nak.
>
> > 2) Reapply old hack to hh.org kernel locally in OE and then upgrade to it.
>
> We can reapply it to the tree too.
>
> > 3) Switch hh.org kernel to scheme suggested by RMK (renaming PXA serial
> >    ports from ttyS* to ttySA*) [4] and then fix (a lot of?)  broken
> >    userspace programs.
>
>      Well, if RMK himself "suggests" such fix, then it would be
> apparently the way to go (because it the most clean and consistent
> solution too). The best course of action would be to feed this patch
> back into LAKML and make sure Eric Miao saw it - he did many changes
> to PXA code RMK couldn't make before.

For what it's worth, we (SDG Systems) have been patching the hh.org
kernels to use the ttySA namespace for serial/pxa.c. We also make the
related changes in OE. We just always felt like it was an uphill
battle with getting mainline to do the same (ttySA).

However, the ttySA approach has worked well, and our users are happy with it.
--
Todd Blumer
SDG Systems


