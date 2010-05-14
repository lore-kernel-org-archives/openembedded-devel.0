Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OCudX-0004kf-94
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 15:09:07 +0200
Received: from host86-156-69-106.range86-156.btcentralplus.com
	([86.156.69.106] helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OCuZj-0006bF-Ek
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 14:05:12 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OCuZj-00049a-5R
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 14:05:11 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BED170A.1070907@dresearch.de>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273510550.22943.298.camel@trini-m4400>
	<20100510190024.GA12534@gmail.com> <4BED170A.1070907@dresearch.de>
Date: Fri, 14 May 2010 14:05:10 +0100
Message-ID: <1273842310.18119.770.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Fri, 14 May 2010 13:09:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-05-14 at 11:25 +0200, Thilo Fromm wrote:
> No it isn't. --enable-kernel=VERSION provides kernel ABI backwards 
> compatibility to applications. *At least* the kernel ABI described in 
> the headers provided to glibc during compile time must be present at 
> runtime.

This is incorrect.  The glibc policy for a long time has been that it
should be compiled against the most recent available headers, and that
it will adapt at run time to older kernels.  See for example the FAQ:

-- 8< --

1.8.	What version of the Linux kernel headers should be used?

{AJ,UD} The headers from the most recent Linux kernel should be used.  The
headers used while compiling the GNU C library and the kernel binary used
when using the library do not need to match.  The GNU C library runs without
problems on kernels that are older than the kernel headers used.  The other
way round (compiling the GNU C library with old kernel headers and running
on a recent kernel) does not necessarily work.  For example you can't use
new kernel features if you used old kernel headers to compile the GNU C
library.

{ZW} Even if you are using a 2.0 kernel on your machine, we recommend you
compile GNU libc with 2.2 kernel headers.  That way you won't have to
recompile libc if you ever upgrade to kernel 2.2.  To tell libc which
headers to use, give configure the --with-headers switch
(e.g. --with-headers=/usr/src/linux-2.2.0/include).

Note that you must configure the 2.2 kernel if you do this, otherwise libc
will be unable to find <linux/version.h>.  Just change the current directory
to the root of the 2.2 tree and do `make include/linux/version.h'.

-- >8 --

The function of the --enable-kernel option is to eliminate backwards
compatibility code for older versions: this gives you a slightly smaller
and faster library.  For example, the mmap2 syscall was introduced on
ARM at some point around kernel 2.3.35: so, if you configure glibc with
--enable-kernel=2.3.36, it knows that mmap2 must always be available and
there is no need to build the backwards compatibility logic that I
mentioned in my last email.

p.




