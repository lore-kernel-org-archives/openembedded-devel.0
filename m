Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N1hHU-0006Iz-0Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 16:07:49 +0200
Received: from 88-109-185-146.dynamic.dsl.as9105.com ([88.109.185.146]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N1hGF-0005zL-At
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 15:06:29 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hbuf0m$esa$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>
	<hbru1e$m80$1@ger.gmane.org> <1256296026.9503.26.camel@hammer.suse.cz>
	<200910231334.13581.holger+oe@freyther.de>
	<1256337084.9460.9.camel@utx.utx.cz>  <hbuf0m$esa$1@ger.gmane.org>
Date: Sat, 24 Oct 2009 15:06:04 +0100
Message-ID: <1256393164.15214.46.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 14:07:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2009-10-24 at 10:48 +0200, Koen Kooi wrote:
> On 24-10-09 00:31, Stanislav Brabec wrote:
> > alsa-oss-1.0.17-r0: /usr/lib/libossredir.a
> > binutils-2.18-r8.1: /usr/lib/libiberty.a

I'm not convinced you really want to be shipping libiberty at all.
Every project that uses this library tends to bundle a local copy in
with its source code.

> > bison-2.3-r0: /usr/lib/liby.a

That one is a special case: it wants to stay in the main bison package,
since bison itself is a development tool.  I'm not sure why it is a
static-only library; that might be an error.

> > bridge-utils-1.4-r0: /usr/lib/libbridge.a

I think this is an internal convenience library, not intended for
external use.  Debian doesn't seem to package it at all and I suspect OE
probably shouldn't either.

> > flex-2.5.31-r4: /usr/lib/libfl.a

This is like bison.

> > gcc-4.3.3-r7.1: /usr/lib/libstdc++_pic.a
> > gcc-4.3.3-r7.1: /usr/lib/libssp_nonshared.a

Those are probably special.  I'm not quite sure what the deal is with
libstdc++_pic, that would need some further investigation.

> > gdb-7.0-r0: /usr/lib/libbfd.a
> > gdb-7.0-r0: /usr/lib/libopcodes.a
> > gdb-7.0-r0: /usr/lib/libiberty.a

As for libiberty above.

> > glibc-2.9-r35.2: /usr/lib/libc_nonshared.a
> > glibc-2.9-r35.2: /usr/lib/libmcheck.a
> > glibc-2.9-r35.2: /usr/lib/libg.a
> > glibc-2.9-r35.2: /usr/lib/libbsd-compat.a
> > glibc-2.9-r35.2: /usr/lib/libieee.a
> > glibc-2.9-r35.2: /usr/lib/libpthread_nonshared.a

The nonshared ones are special.  The others belong in the -static
package.

> > mysql-4.1.22-r3: /usr/lib/libmysys.a
> > mysql-4.1.22-r3: /usr/lib/libdbug.a
> > mysql-4.1.22-r3: /usr/lib/libvio.a
> > mysql-4.1.22-r3: /usr/lib/libheap.a
> > mysql-4.1.22-r3: /usr/lib/libmerge.a
> > mysql-4.1.22-r3: /usr/lib/libnisam.a
> > mysql-4.1.22-r3: /usr/lib/libmysqld.a
> > mysql-4.1.22-r3: /usr/lib/libmyisam.a
> > mysql-4.1.22-r3: /usr/lib/libmyisammrg.a
> > mysql-4.1.22-r3: /usr/lib/libmystrings.a

I think those are all internal convenience libraries and should probably
not be packaged.

p.



