Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQL2k-0002Fi-3b
	for openembedded-devel@openembedded.org; Sat, 16 Feb 2008 12:17:19 +0100
Received: by nf-out-0910.google.com with SMTP id c7so473412nfi.20
	for <openembedded-devel@openembedded.org>;
	Sat, 16 Feb 2008 03:16:55 -0800 (PST)
Received: by 10.78.184.2 with SMTP id h2mr5262306huf.59.1203160614700;
	Sat, 16 Feb 2008 03:16:54 -0800 (PST)
Received: from widy.localdomain ( [88.252.174.19])
	by mx.google.com with ESMTPS id 5sm10510576nfv.32.2008.02.16.03.16.51
	(version=SSLv3 cipher=OTHER); Sat, 16 Feb 2008 03:16:53 -0800 (PST)
Date: Sat, 16 Feb 2008 13:17:23 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080216131723.6dfc1e58@widy.localdomain>
In-Reply-To: <1203118816.8636.164.camel@dax.rpnet.com>
References: <1203118816.8636.164.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.182.188
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: initramfs generation with OE
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
X-List-Received-Date: Sat, 16 Feb 2008 11:17:20 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Fri, 15 Feb 2008 23:40:16 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> Hi,
> 
> So if recursive bitbake isn't an option (its not), how do we generate
> an initramfs with OE? I've had a think about this and I have an idea.
> Its totally untested but its also neat and simple so here goes.
> 
> We don't actually care if we generate a normal kernel as a side effect
> and Pauls code already does this. Its even really close to whats
> needed, it just misses some task dependency magic. My untested
> solution would be:
> 
> """
> 
> INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
> INITRAMFS_IMAGE_TARGET ?= "initramfs-image"
> 
> do_builtin_initramfs() {
>        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>        cp "${DEPLOY_DIR_IMAME}/${INITRAMFS_SYMLINK_NAME}"
> usr/initramfs_data.cpio.gz oe_runmake ${KERNEL_IMAGETYPE}
> CC="${KERNEL_CC}" LD="${KERNEL_LD}" install -d ${DEPLOY_DIR_IMAGE}
>        install -m 0644 ${KERNEL_OUTPUT}
> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}-initramfs.bin # Make
> sure to kill injected initramfs, in case someone will do "-c compile
> -f" rm usr/initramfs_data.cpio.gz }
> addtask builtin_initramfs after do_deploy before do_build
> do_builtin_initramfs[nostamp] = "1"
> do_builtin_initramfs[depends] = "${INITRAMFS_IMAGE_TARGET}:do_rootfs"
> 
> """
> 
> of which the last line is the magic key. From that, bitbake should be
> able to handle the rest. 

What would be really needed is:

do_builtin_initramfs[depends] = "${INITRAMFS_IMAGE_TARGET}:do_rootfs
(MACHINE=${INITRAMFS_MACHINE} SYSTYPE=${INITRAMFS_SYSTYPE} ...)"

Where stuff in braces after dependent task specification means: run
the task specified and all its subtasks with environment modified with
those settings (environment is restored after the task finishes).
Without that, it doesn't solve directly my usecase (need to build uclibc
initramfs for glibc-built kernel). My recursive bitbake invocation is
exactly attempt to emulate that at the OS level (and thanks to Unix
nature, where process recursion is first-class phenomena, the attempt
is very successful I would add, as it even works, even though bitbake
was not designed for such use ;-) ).

Well, back to pragmatics, there's of course no difference with
glibc-built kernel and uclibc-built kernel (and its kind of
inefficiency the same kernel is built twice). So, supposedly that can
be worked around with building just uclibc-kernel and then shuffling
deploy dirs.

> In addition to this you need to add something
> to initramfs-image that:
> 
> * symlinks from ${DEPLOY_DIR_IMAME}/${INITRAMFS_SYMLINK_NAME} to the
> initramfs image
> * makes sure IMAGE_FSTYPES has cpio.gz in it
> 
> Also note that task should move to a separate .bbclass since it is now
> added before do_build and not everything will want to build this.
> Alternatively, we can drop the "before do_build" bit and mean users
> manually run:
> 
> bitbake kernel -c builtin_initramfs
> 
> Anyhow, this is something we can discuss and find a way forward with
> if the basic idea works.

The most interesting thing with all this is package writing. That's
what took me lot of time to make it work, and still only "somehow".

[]

> 
> Cheers,
> 
> Richard
> 
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


