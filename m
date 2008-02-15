Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JPwSk-0005i2-6W
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 10:02:41 +0100
Received: by ug-out-1314.google.com with SMTP id i24so1483431ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 01:02:13 -0800 (PST)
Received: by 10.66.233.10 with SMTP id f10mr1372980ugh.25.1203066133497;
	Fri, 15 Feb 2008 01:02:13 -0800 (PST)
Received: from widy.localdomain ( [88.252.162.97])
	by mx.google.com with ESMTPS id k28sm16765106ugd.77.2008.02.15.01.02.11
	(version=SSLv3 cipher=OTHER); Fri, 15 Feb 2008 01:02:12 -0800 (PST)
Date: Fri, 15 Feb 2008 11:02:30 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080215110230.526ea6a1@widy.localdomain>
In-Reply-To: <74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.170
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building a kernel with builtin initramfs
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
X-List-Received-Date: Fri, 15 Feb 2008 09:02:42 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 14 Feb 2008 11:55:28 +0100
"pHilipp Zabel" <philipp.zabel@gmail.com> wrote:

> On Thu, Feb 14, 2008 at 3:54 AM, Paul Sokolovsky <pmiscml@gmail.com>
> wrote:
> > Hello,
> >
> >  Sometimes, it may be necessary to have a kernel with builtin
> > initramfs. Initramfs commonly kernel modules, so we have kernel
> > build recursion. Standard way to break this loop is to split
> > procedure causing recursion into independent steps, so we'd first
> > build kernel modules, then build initramfs, then build a kernel
> > image.
> >
> >  The question, is how to express this with bitbake and OE. Skipping
> >  various ideas, here's the one which promise viability:
> >
> >  1. Have a kernel-modules.bb, which will execute bitbake
> > recursively to build a PREFERRED_PROVIDER_virtual/kernel, and will
> > pass a special flag variable.
> >
> >  2. Detecting that flag, kernel.bbclass will build/package only
> > modules.

Ok, this is not going to work due to timestamps.

> >
> >  3. Then, have a kernel-initramfs.bb (DEPENDS=kernel-modules) which
> > will take a variable defining which initramfs image to build, if
> > any, and execute bitbake recursively with IMAGE_FSTYPES=cpio.gz on
> > that.
> >
> >  4. Make a task in kernel.bbclass depend on kernel-initramfs.bb
> > (build task of it).
> >
> >
> >  Again, that appears to be something working, at least from 1st
> > look. However, it introduces new trick - recursive execution of
> > bitbake, what, as far as I know, never happened so far. Well, for
> > "make" such usage is commodity, and the fact that it is required 2
> > times in the above scenario show that it is useful ;-).
> >
> >
> >  Other ideas?
> 
> Split the module generation out of the main compile/install/package
> tasks in kernel.bbclass and have kernel-initrmfs.bb's do_initramfs
> depend on that.

Well, that's of course how I started. So, in kernel.bbclass I have

do_compile_modules ()
addtask compile_modules after do_patch

do_install_modules()
addtask install_modules after do_compile_modules

That works, but that's where I stopped: how to package just modules -
fork whole packaging class(es) like compile/install tasks forked above?

> Can we have conditional inter-task dependencies in bitbake recipes?

There're apparently many things bitbake can't, and is not going to do.
For example, running subset of tasks in different context. Consider for
example the fact that initramfs built for glibc-compiled kernel should
be built using uclibc, etc, etc. Recursive invocation is a kinda
meta-solution for such issues, modulo different constraints it
brings ;-). Nontheless, it works - I committed
initrdscripts/initramfs-image-ipk_1.0.bb yesterday.

> 
> regards
> Philipp
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


