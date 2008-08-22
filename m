Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KWakS-00089G-Qg; Fri, 22 Aug 2008 19:48:32 +0200
Received: from 79-71-229-11.dynamic.dsl.as9105.com ([79.71.229.11]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KWajF-0007G5-Km; Fri, 22 Aug 2008 18:47:17 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080822172731.GA8514@gmail.com>
References: <19c1b8a90808211825v497fc98jaf9aa6af3a2881d0@mail.gmail.com>
	<1219396099.21890.20.camel@mill.internal.reciva.com>
	<20080822172731.GA8514@gmail.com>
Date: Fri, 22 Aug 2008 18:47:23 +0100
Message-Id: <1219427243.9935.38.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Cc: openembedded-devel@openembedded.org
Subject: Re: provide libc-dev in glibc eglibc
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
X-List-Received-Date: Fri, 22 Aug 2008 17:48:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-08-22 at 10:27 -0700, Khem Raj wrote:
> On (22/08/08 10:08), Phil Blundell wrote:
> > On Thu, 2008-08-21 at 18:25 -0700, Khem Raj wrote:
> > > This patch makes an alias for libc-dev which points to libc6-dev in
> > > glibc and eglibc. This makes this package have same name like uclibc.
> > > This helps in writing recipes which uses these dev packages to use
> > > just one name and do not worry about what system library is in use.
> > 
> > Is the existing libc-dev package (i.e. the one from uclibc) concrete or
> > virtual?  If the former then you should call this new alias something
> > like "virtual-libc-dev" and make uclibc's libc-dev provide it as well.
> > If libc-dev is already a pure virtual then I guess adding a direct
> > RPROVIDES for glibc is harmless enough, though it might still be a good
> > idea to use the "virtual-libc-dev" naming for clarity and to avoid any
> > future imbroglio with other libraries.
> 
> libc-dev is not virtual in uclibc, it is concrete package name. So as you suggest I used a different name virtual-libc-dev in the attached patch. 

OK, great.  This new patch looks good to me.

For what it's worth, it is almost never the right thing to have a single
package name with both virtual and concrete instantiations.  Doing this
can make it difficult or impossible to persuade ipkg/opkg to install the
concrete package that is being shadowed by the virtual one.  The only
time it is appropriate for one package to Provide: the name of another
concrete package is when one package is being replaced by or subsumed
into another one.

> > By the way, your diffs always seem to come out with MIME-type
> > "application/octet-stream" which makes them a bit tedious to view.
> > Could you send them as something like text/diff or text/plain in future?
> 
> sometimes I use the webclient and that hoses things up. I hope its
> better this time

Yes, thanks, that time it was fine.

p.



