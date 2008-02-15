Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JPyo6-000300-CH
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 12:32:44 +0100
Received: by wa-out-1112.google.com with SMTP id l24so1178023waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 03:32:26 -0800 (PST)
Received: by 10.114.177.1 with SMTP id z1mr2803746wae.7.1203075145945;
	Fri, 15 Feb 2008 03:32:25 -0800 (PST)
Received: from widy.localdomain ( [88.252.162.97])
	by mx.google.com with ESMTPS id c4sm2920804nfi.4.2008.02.15.03.32.22
	(version=SSLv3 cipher=OTHER); Fri, 15 Feb 2008 03:32:24 -0800 (PST)
Date: Fri, 15 Feb 2008 13:32:38 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: "pHilipp Zabel" <philipp.zabel@gmail.com>
Message-ID: <20080215133238.7d8f7887@widy.localdomain>
In-Reply-To: <74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.146.181
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Fri, 15 Feb 2008 11:32:44 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Fri, 15 Feb 2008 10:41:01 +0100
"pHilipp Zabel" <philipp.zabel@gmail.com> wrote:

> On Fri, Feb 15, 2008 at 10:02 AM, Paul Sokolovsky <pmiscml@gmail.com>
> wrote:
> > Hello,
> >
> >  On Thu, 14 Feb 2008 11:55:28 +0100
> >  "pHilipp Zabel" <philipp.zabel@gmail.com> wrote:
> >
> >  > On Thu, Feb 14, 2008 at 3:54 AM, Paul Sokolovsky
> >  > <pmiscml@gmail.com> wrote:
> >  > > Hello,
> >  > >
> >  > >  Sometimes, it may be necessary to have a kernel with builtin
> >  > > initramfs. Initramfs commonly kernel modules, so we have kernel
> >  > > build recursion. Standard way to break this loop is to split
> >  > > procedure causing recursion into independent steps, so we'd
> >  > > first build kernel modules, then build initramfs, then build a
> >  > > kernel image.
> >  > >
> >  > >  The question, is how to express this with bitbake and OE.
> >  > > Skipping various ideas, here's the one which promise viability:
> >  > >
> >  > >  1. Have a kernel-modules.bb, which will execute bitbake
> >  > > recursively to build a PREFERRED_PROVIDER_virtual/kernel, and
> >  > > will pass a special flag variable.
> >  > >
> >  > >  2. Detecting that flag, kernel.bbclass will build/package only
> >  > > modules.
> >
> >  Ok, this is not going to work due to timestamps.
> 
> The problem is that this whole kernel/module issue is more like two
> intertwined recipes. We'd need separate timestamps for modules and
> kernel image. I'd prefer using the task dependency system to solve
> this.
> 
> >  > >  3. Then, have a kernel-initramfs.bb (DEPENDS=kernel-modules)
> >  > > which will take a variable defining which initramfs image to
> >  > > build, if any, and execute bitbake recursively with
> >  > > IMAGE_FSTYPES=cpio.gz on that.
> >  > >
> >  > >  4. Make a task in kernel.bbclass depend on kernel-initramfs.bb
> >  > > (build task of it).
> >  > >
> >  > >
> >  > >  Again, that appears to be something working, at least from 1st
> >  > > look. However, it introduces new trick - recursive execution of
> >  > > bitbake, what, as far as I know, never happened so far. Well,
> >  > > for "make" such usage is commodity, and the fact that it is
> >  > > required 2 times in the above scenario show that it is
> >  > > useful ;-).
> >  > >
> >  > >
> >  > >  Other ideas?
> >  >
> >  > Split the module generation out of the main
> >  > compile/install/package tasks in kernel.bbclass and have
> >  > kernel-initrmfs.bb's do_initramfs depend on that.
> >
> >  Well, that's of course how I started. So, in kernel.bbclass I have
> >
> >  do_compile_modules ()
> >  addtask compile_modules after do_patch
> >
> >  do_install_modules()
> >  addtask install_modules after do_compile_modules
> 
> Ok, that's what I was thinking about.
> 
> >  That works, but that's where I stopped: how to package just
> > modules - fork whole packaging class(es) like compile/install tasks
> > forked above?
> 
> We could make the ${WORKDIR}/install and ${WORKDIR}/image directories
> configurable and then call the original tasks from wrapper tasks
> setting those variables.
> 
> do_package() {
>     PACKAGE_INSTALL_DIR=${WORKDIR}/install-kernel
>     PACKAGE_IMAGE_DIR=${WORKDIR}/image-kernel
>     package_do_package
> }
> 
> do_package_modules() {
>     PACKAGE_INSTALL_DIR=${WORKDIR}/install-modules
>     PACKAGE_IMAGE_DIR=${WORKDIR}/image-modules
>     package_do_package
> }
> 
> Could something like this work?

python package_do_package () {
[]
}
do_package[dirs] = "${D}"

Note sure how such declarative stuff can be converted to imperative
style like above. Also, do_package is only part of the picture.
Important thing is package_write. And the way it is implemented now,
do_package_write is just a dummy anchor task. Subclasses do not
implement it, but instead anchor using it in task sequence:

addtask package_write_ipk before do_package_write after do_package

This is weird. Richard, was it done this way? It makes impossible to
imperatively call package writeout task ;-((.


Otherwise, regarding producing initramfs'ed kernel, I switched to the
solution a-la initramfs-image-ipk - instead of trying to plug into
existing kernel.bbclass task sequence, I made a separate task which
builds kernel with initramfs included. Of course, that's not ideal -
package with non-initramfsed kernel already written by that time, so
new package would need to overwrite it ;-\. If package writing were
possible at all, but it's not due to the above.

My current idea is to write package in separate recipe at all, stealing
PV from the file.


[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


