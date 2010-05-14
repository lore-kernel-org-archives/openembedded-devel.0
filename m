Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OCuDY-0002i7-53
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 14:42:17 +0200
Received: from host86-156-69-106.range86-156.btcentralplus.com
	([86.156.69.106] helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OCu9l-0006PN-MO
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 13:38:21 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OCu9l-0003wT-Bb
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 13:38:21 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BED36A8.6070602@dresearch.de>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273518881.22943.378.camel@trini-m4400>	<4BE90A56.3090605@dresearch.de>
	<1273588024.22943.391.camel@trini-m4400>	<4BEA448D.5060008@dresearch.de>
	<1273750831.18119.498.camel@mill.internal.reciva.com>
	<4BED1EFC.7010905@dresearch.de>
	<1273832754.18119.691.camel@mill.internal.reciva.com>
	<4BED36A8.6070602@dresearch.de>
Date: Fri, 14 May 2010 13:38:20 +0100
Message-ID: <1273840700.18119.750.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Fri, 14 May 2010 12:42:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-05-14 at 13:40 +0200, Thilo Fromm wrote:
> This would mean that checking for kernel features (e.g. inotify_init1()) 
> at compile time via an application's configure.ac is pointless, right?

Not entirely pointless: the feature set that you determine at configure
time is the maximum set that you can expect to be available.  That is,
if you determine at configure time that __NR_inotify_init1 is not
defined, you clearly should not even attempt to use this syscall.

> Code like this
> 
> #ifdef HAVE_INOTIFY_INIT1
> 	fd = inotify_init1(O_NONBLOCK);
> #else
> 	fd = inotify_init();
> 	flags = fcntl(fd, F_GETFL, 0);
> 	fcntl(ret, F_SETFL, flags | O_NONBLOCK);
> #endif
> 
> will break at runtime even though everything was OK at compile time, and 
> you are proposing that I should expect it to break.

Correct.  In this particular case you would probably be better off just
using the "else" block at all times.

> Well, what to do _if_ a feature is not present is a whole different 
> story. But for figuring out _whether_ it is present or not you propose 
> (blind) runtime probing while I would like to rely on configure output, 

I'm not quite sure why you describe this as "blind" probing.  There is
nothing blind about it; the semantics of unimplemented syscalls are
quite well-defined.

In the general case, there simply isn't any way to determine statically
at compile time what features will be available at run time.  Some
features might require modules that aren't loaded, or might be disabled
by kernel commandline options, or might not be supported on the
particular CPU that the kernel finds itself running on, or any number of
other things.  As I have mentioned before, this is exactly what glibc
itself does internally in order to cope with multiple different kernel
versions.

If you are going to rely on nonstandard and volatile Linux-specific
programming interfaces then the onus is definitely on you as the
application developer to ensure that your application behaves sensibly
under all conditions that it is likely to encounter.  You simply have to
decide which features are mandatory for your program and which are
optional.  If a mandatory feature is not available then the program will
simply not run: you might choose to produce a "kernel too old" kind of
diagnostic, like glibc does if you configure it with --enable-kernel=X
and then try to run on an older version, or you might just let it crash
with ENOSYS or some such.  If an optional feature is unavailable then
you have to provide some suitable fallback action.

> As at least some of the 
> applications integrated by openembedded do not share your views, so 
> they'll do weird things at runtime. This is a severe quality issue. And 
> we have only a small chance of noticing any application runtime 
> misbehaviour. The syscall in question might only rarely be used, it 
> might be some corner-case of an application that is executed e.g. only 
> once in a month.

If you can't tolerate the risk of applications breaking in this way
then, as a distro maintainer, you can simply set and document an
appropriate policy that avoids the situation arising (e.g. compile all
applications against the lowest common denominator headers, or lock the
versions together so that the runtime kernel version always precisely
matches the compile time header version).  That would be a perfectly
acceptable way to proceed.  

p.



