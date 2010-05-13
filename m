Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OCWq2-0000kQ-NN
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 13:44:28 +0200
Received: from host86-156-69-106.range86-156.btcentralplus.com
	([86.156.69.106] helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OCWmG-0003xJ-NE
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:40:32 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OCWmG-0006A2-Bk
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:40:32 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BEA448D.5060008@dresearch.de>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273518881.22943.378.camel@trini-m4400>	<4BE90A56.3090605@dresearch.de>
	<1273588024.22943.391.camel@trini-m4400>
	<4BEA448D.5060008@dresearch.de>
Date: Thu, 13 May 2010 12:40:31 +0100
Message-ID: <1273750831.18119.498.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel Headers Quality Issue
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
X-List-Received-Date: Thu, 13 May 2010 11:44:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-05-12 at 08:02 +0200, Steffen Sledz wrote:
> linux-libc-headers may be newer than kernel version
> -> autotools report availability of some syscalls (e.g. inotify_init1 or epoll_create1)
> -> apps can use them
> -> if called on older kernels glibc will handle this "gracefully"
> -> fine
> 
> But tests showed that glibc did not handle syscalls this way.

It sounds like we have, perhaps, been talking at slight cross purposes.

It is true that you can build glibc against a different version of
linux-libc-headers than the version of the kernel that will be used at
runtime.  So long as the runtime kernel version is newer than the
minimum kernel version that glibc was configured for (either via
--enable-kernel=XXX, or via an architecture-specific static definition)
then everything should still work fine, and glibc will use internal
fallbacks if it discovers that certain system calls are not available at
runtime.

Similarly, glibc will make some efforts to provide a backwards
compatible emulation for user-visible interfaces which might not be
available in all kernel versions.  However, what it doesn't attempt to
do is provide a completely virtualised ABI which would insulate the
application entirely from the details of the running kernel.  There are
some kernel features which simply aren't feasible to emulate in user
space.

In the specific case of epoll_create1() and inotify_init1(), it would be
reasonable for glibc to do something similar to the way that, say,
mmap64() is handled.  That is, if the kernel doesn't have
epoll_create1() but does have epoll_create(), and the behaviour that the
user has requested is something that epoll_create() can do (i.e. none of
the flag bits are set) then use epoll_create().  But if the user has
asked for EPOLL_CLOEXEC then epoll_create() is not a suitable
replacement and you are going to get ENOSYS: it's then up to the
application to take some suitable recovery action.

p.




