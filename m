Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JPUBJ-0006ql-Qo
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2008 03:50:39 +0100
Received: by ug-out-1314.google.com with SMTP id i24so1106010ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2008 18:50:33 -0800 (PST)
Received: by 10.78.151.3 with SMTP id y3mr1359916hud.65.1202957432753;
	Wed, 13 Feb 2008 18:50:32 -0800 (PST)
Received: from widy.localdomain ( [88.252.162.97])
	by mx.google.com with ESMTPS id c4sm885107nfi.4.2008.02.13.18.50.30
	(version=SSLv3 cipher=OTHER); Wed, 13 Feb 2008 18:50:31 -0800 (PST)
Date: Thu, 14 Feb 2008 04:54:33 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20080214045433.02de68cd@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Building a kernel with builtin initramfs
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
X-List-Received-Date: Thu, 14 Feb 2008 02:50:40 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

Sometimes, it may be necessary to have a kernel with builtin initramfs.
Initramfs commonly kernel modules, so we have kernel build recursion.
Standard way to break this loop is to split procedure causing recursion
into independent steps, so we'd first build kernel modules, then build
initramfs, then build a kernel image.

The question, is how to express this with bitbake and OE. Skipping
various ideas, here's the one which promise viability:

1. Have a kernel-modules.bb, which will execute bitbake recursively to
build a PREFERRED_PROVIDER_virtual/kernel, and will pass a special flag
variable.

2. Detecting that flag, kernel.bbclass will build/package only modules.

3. Then, have a kernel-initramfs.bb (DEPENDS=kernel-modules) which will
take a variable defining which initramfs image to build, if any, and
execute bitbake recursively with IMAGE_FSTYPES=cpio.gz on that.

4. Make a task in kernel.bbclass depend on kernel-initramfs.bb (build
task of it).


Again, that appears to be something working, at least from 1st look.
However, it introduces new trick - recursive execution of bitbake,
what, as far as I know, never happened so far. Well, for "make" such
usage is commodity, and the fact that it is required 2 times in the
above scenario show that it is useful ;-).


Other ideas?


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


