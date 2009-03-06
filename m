Received: from [85.37.17.114] (helo=smtp-out114.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LfgjW-0000Pc-F8
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 21:33:26 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 6 Mar 2009 21:28:53 +0100
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 6 Mar 2009 21:28:53 +0100
Received: from [192.168.1.107] ([79.54.131.222]) by FBCMCL01B02.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 6 Mar 2009 21:28:53 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0903061047p33bb6052o28e3d9b73847f1bd@mail.gmail.com>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>
	<49A7BD17.2080407@dresearch.de>
	<432beae0902271228w2150a17fo79e5a76c8eb71b42@mail.gmail.com>
	<49AAA599.5070507@dresearch.de>
	<a7f8874a0903020942y65f55a90rec06b1bc87ac8702@mail.gmail.com>
	<432beae0903061047p33bb6052o28e3d9b73847f1bd@mail.gmail.com>
Date: Fri, 06 Mar 2009 21:27:56 +0100
Message-Id: <1236371276.8818.4.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 06 Mar 2009 20:28:53.0289 (UTC)
	FILETIME=[2A8E4990:01C99E9A]
Subject: Re: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Fri, 06 Mar 2009 20:33:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-03-06 at 10:47 -0800, Justin Patrin wrote:
> On 3/2/09, Hans Henry von Tresckow <hvontres@gmail.com> wrote:
> > On Sun, Mar 1, 2009 at 7:11 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> >  > Justin Patrin schrieb:
> >  >> Are the machines you're building on exactly the same? Do they perhaps
> >  >> have different architectures or distributions? Have you tried updating
> >  >> the systems?
> >  >
> >  > The machines are different.
> >  >
> >  > The one that works fine:
> >  >  Ubuntu 8.10
> >  >  Linux bfg9000 2.6.27-11-generic #1 SMP Thu Jan 29 19:28:32 UTC 2009 x86_64 GNU/Linux
> >  >
> >  > The one with the problem:
> >  >  openSUSE 11.1
> >  >  Linux recycler 2.6.27.19-3.2-default #1 SMP 2009-02-25 15:40:44 +0100 i686 athlon i386 GNU/Linux
> >  >
> >  >> This looks like a qemu failure to me.
> >  >
> >  > I agree. But i can't believe, that the different OS my be involved in that. Both are up-to-date. And i thought that all the tools needed to cross-build the packages are build by OE itself.
> >  >
> >  > Steffen
> >  >
> >
> >
> > I don't kow about openSuse, but I remember that Fedora used to have
> >  some kernel patches that did not play well with QEMU. But that was
> >  back on Ferora 7, since then I switched to ubuntu. I don't even
> >  rmember exactly what patch caused the problems, but IIRC it was
> >  security related.
> >
> >
> 
> Hmmm, good point it could be SELinux. Could you try disabling that, if
> you have it enabled?
> 
I have selinux but for now it is in enforcing=0 (I have some problem to
resolve before putting it in enforcing mode...but I'll try to disable it
totally)
Denis.




