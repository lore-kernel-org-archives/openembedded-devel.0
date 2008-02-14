Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JPbkg-0001CO-Cm
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2008 11:55:38 +0100
Received: by nf-out-0910.google.com with SMTP id h3so215583nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2008 02:55:29 -0800 (PST)
Received: by 10.82.112.3 with SMTP id k3mr2143282buc.15.1202986528589;
	Thu, 14 Feb 2008 02:55:28 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Thu, 14 Feb 2008 02:55:28 -0800 (PST)
Message-ID: <74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
Date: Thu, 14 Feb 2008 11:55:28 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080214045433.02de68cd@widy.localdomain>
MIME-Version: 1.0
References: <20080214045433.02de68cd@widy.localdomain>
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
X-List-Received-Date: Thu, 14 Feb 2008 10:55:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 14, 2008 at 3:54 AM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello,
>
>  Sometimes, it may be necessary to have a kernel with builtin initramfs.
>  Initramfs commonly kernel modules, so we have kernel build recursion.
>  Standard way to break this loop is to split procedure causing recursion
>  into independent steps, so we'd first build kernel modules, then build
>  initramfs, then build a kernel image.
>
>  The question, is how to express this with bitbake and OE. Skipping
>  various ideas, here's the one which promise viability:
>
>  1. Have a kernel-modules.bb, which will execute bitbake recursively to
>  build a PREFERRED_PROVIDER_virtual/kernel, and will pass a special flag
>  variable.
>
>  2. Detecting that flag, kernel.bbclass will build/package only modules.
>
>  3. Then, have a kernel-initramfs.bb (DEPENDS=kernel-modules) which will
>  take a variable defining which initramfs image to build, if any, and
>  execute bitbake recursively with IMAGE_FSTYPES=cpio.gz on that.
>
>  4. Make a task in kernel.bbclass depend on kernel-initramfs.bb (build
>  task of it).
>
>
>  Again, that appears to be something working, at least from 1st look.
>  However, it introduces new trick - recursive execution of bitbake,
>  what, as far as I know, never happened so far. Well, for "make" such
>  usage is commodity, and the fact that it is required 2 times in the
>  above scenario show that it is useful ;-).
>
>
>  Other ideas?

Split the module generation out of the main compile/install/package
tasks in kernel.bbclass and have kernel-initrmfs.bb's do_initramfs
depend on that.
Can we have conditional inter-task dependencies in bitbake recipes?

regards
Philipp


