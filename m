Received: from [209.85.128.187] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JPx4H-0006xf-7s
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 10:41:19 +0100
Received: by fk-out-0910.google.com with SMTP id 18so781153fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 01:41:02 -0800 (PST)
Received: by 10.82.140.20 with SMTP id n20mr4582829bud.24.1203068461995;
	Fri, 15 Feb 2008 01:41:01 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Fri, 15 Feb 2008 01:41:01 -0800 (PST)
Message-ID: <74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
Date: Fri, 15 Feb 2008 10:41:01 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Paul Sokolovsky" <pmiscml@gmail.com>
In-Reply-To: <20080215110230.526ea6a1@widy.localdomain>
MIME-Version: 1.0
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
X-SA-Exim-Connect-IP: 209.85.128.187
X-SA-Exim-Mail-From: philipp.zabel@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 15 Feb 2008 09:41:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Feb 15, 2008 at 10:02 AM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello,
>
>  On Thu, 14 Feb 2008 11:55:28 +0100
>  "pHilipp Zabel" <philipp.zabel@gmail.com> wrote:
>
>  > On Thu, Feb 14, 2008 at 3:54 AM, Paul Sokolovsky <pmiscml@gmail.com>
>  > wrote:
>  > > Hello,
>  > >
>  > >  Sometimes, it may be necessary to have a kernel with builtin
>  > > initramfs. Initramfs commonly kernel modules, so we have kernel
>  > > build recursion. Standard way to break this loop is to split
>  > > procedure causing recursion into independent steps, so we'd first
>  > > build kernel modules, then build initramfs, then build a kernel
>  > > image.
>  > >
>  > >  The question, is how to express this with bitbake and OE. Skipping
>  > >  various ideas, here's the one which promise viability:
>  > >
>  > >  1. Have a kernel-modules.bb, which will execute bitbake
>  > > recursively to build a PREFERRED_PROVIDER_virtual/kernel, and will
>  > > pass a special flag variable.
>  > >
>  > >  2. Detecting that flag, kernel.bbclass will build/package only
>  > > modules.
>
>  Ok, this is not going to work due to timestamps.

The problem is that this whole kernel/module issue is more like two
intertwined recipes. We'd need separate timestamps for modules and
kernel image. I'd prefer using the task dependency system to solve
this.

>  > >  3. Then, have a kernel-initramfs.bb (DEPENDS=kernel-modules) which
>  > > will take a variable defining which initramfs image to build, if
>  > > any, and execute bitbake recursively with IMAGE_FSTYPES=cpio.gz on
>  > > that.
>  > >
>  > >  4. Make a task in kernel.bbclass depend on kernel-initramfs.bb
>  > > (build task of it).
>  > >
>  > >
>  > >  Again, that appears to be something working, at least from 1st
>  > > look. However, it introduces new trick - recursive execution of
>  > > bitbake, what, as far as I know, never happened so far. Well, for
>  > > "make" such usage is commodity, and the fact that it is required 2
>  > > times in the above scenario show that it is useful ;-).
>  > >
>  > >
>  > >  Other ideas?
>  >
>  > Split the module generation out of the main compile/install/package
>  > tasks in kernel.bbclass and have kernel-initrmfs.bb's do_initramfs
>  > depend on that.
>
>  Well, that's of course how I started. So, in kernel.bbclass I have
>
>  do_compile_modules ()
>  addtask compile_modules after do_patch
>
>  do_install_modules()
>  addtask install_modules after do_compile_modules

Ok, that's what I was thinking about.

>  That works, but that's where I stopped: how to package just modules -
>  fork whole packaging class(es) like compile/install tasks forked above?

We could make the ${WORKDIR}/install and ${WORKDIR}/image directories
configurable and then call the original tasks from wrapper tasks setting those
variables.

do_package() {
    PACKAGE_INSTALL_DIR=${WORKDIR}/install-kernel
    PACKAGE_IMAGE_DIR=${WORKDIR}/image-kernel
    package_do_package
}

do_package_modules() {
    PACKAGE_INSTALL_DIR=${WORKDIR}/install-modules
    PACKAGE_IMAGE_DIR=${WORKDIR}/image-modules
    package_do_package
}

Could something like this work?

>  > Can we have conditional inter-task dependencies in bitbake recipes?
>
>  There're apparently many things bitbake can't, and is not going to do.
>  For example, running subset of tasks in different context. Consider for
>  example the fact that initramfs built for glibc-compiled kernel should
>  be built using uclibc, etc, etc. Recursive invocation is a kinda
>  meta-solution for such issues, modulo different constraints it
>  brings ;-). Nontheless, it works - I committed
>  initrdscripts/initramfs-image-ipk_1.0.bb yesterday.

Very good, I guess we won't get around recursive invocation in the
case of libc switching. Too many things depend on that.
Looking forward to more modular kernels soon.

regards
Philipp


