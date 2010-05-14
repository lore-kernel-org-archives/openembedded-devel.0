Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OCs9R-00059E-Mb
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 12:29:58 +0200
Received: from host86-156-69-106.range86-156.btcentralplus.com
	([86.156.69.106] helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OCs5d-00058Y-Cz
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 11:25:58 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OCs5b-0002qr-74
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 11:25:55 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BED1EFC.7010905@dresearch.de>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273518881.22943.378.camel@trini-m4400>	<4BE90A56.3090605@dresearch.de>
	<1273588024.22943.391.camel@trini-m4400>	<4BEA448D.5060008@dresearch.de>
	<1273750831.18119.498.camel@mill.internal.reciva.com>
	<4BED1EFC.7010905@dresearch.de>
Date: Fri, 14 May 2010 11:25:54 +0100
Message-ID: <1273832754.18119.691.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Fri, 14 May 2010 10:29:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-05-14 at 11:59 +0200, Thilo Fromm wrote:
> I have no means of detecting a level of compatibility at runtime. How 
> could that work, anyway? I get ENOSYS when calling inotify_init1(), so, 
> well I *think* this interface is missing (although configure reported it 
> being available). Then I would have to dynamically fall back to 
> inotify_init() + fcntl().

Yes, precisely.  ENOSYS is indeed diagnostic of an unimplemented system
call, and what you have described is exactly what glibc does internally
for this kind of situation.  See for example the backwards compatibility
code for mmap2 vs mmap:

	DO_CALL (mmap2, 0)
	cmn	r0, $4096
# ifdef __ASSUME_MMAP2_SYSCALL
	ldr	r4, [sp], #4
	ldr	r5, [sp], #4
	RETINSTR(cc, lr)	
	b	PLTJMP(syscall_error)
# else
	ldrcc	r4, [sp], #4
	ldrcc	r5, [sp], #4
	RETINSTR(cc, lr)
	cmn	r0, $ENOSYS
	bne	.Lerror
	/* The current kernel does not support mmap2.  Fall back to plain
	   mmap if the offset is small enough.  */
	ldr	r5, [sp, $16]
	mov	r0, ip			@ first arg was clobbered
	teq	r5, $0
	ldreq	r4, [sp], #4
	ldreq	r5, [sp], #4
	beq	PLTJMP(__mmap)
#endif

> What if that returns ENOSYS? Fall back to dnotify?

If you wish to support kernels that don't have inotify at all, yes.
Obviously it's up to you how far back you want to go in terms of
compatibility, and I suspect most people would just give up at this
point.

> And repeat this dance every time I need to call inotify_init1()?

Yes.  Or, if this is performance critical code, you can cache the result
(since the kernel is unlikely to suddenly gain support for a syscall
that it didn't have last time) and go directly to the implementation
that works.

> Compatibility code would have to fumble for the interfaces 
> *really* available at runtime by using trial-and-error. I would not 
> expect anyone to provide this kind of compatibility.

Clearly you don't like the idea very much but yes, this is basically how
backwards compatibility code is done, and it is more or less an
inescapable consequence of the rather fluid nature of the Linux syscall
ABI.

Of course, you always have the option of simply writing to the lowest
common denominator and using inotify_init() directly rather than
inotify_init1().  Or, in the case of inotify, you have the option of
using a library which will hide this complexity for you and provide an
abstract userspace API which remains the same no matter what the
underlying implementation is doing.

This is not the only situation in which robust applications will adapt
themselves to the runtime environment in which they find themselves.  In
socket-based programs, a fairly common paradigm is something along the
lines of:

	fd = socket (PF_INET6, ...);
	if (fd < 0 && errno == EPFNOSUPPORT) {
		// IPv6 support is missing.  Use IPv4 instead.
		fd = socket (PF_INET, ...);
	}

in order that the application doesn't cease to work altogether for
people who have forgotten to load the ipv6 module.

p.




