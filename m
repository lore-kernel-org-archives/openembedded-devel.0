Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IXaWN-00033W-BG
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2007 12:41:37 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id A7A326284B1;
	Tue, 18 Sep 2007 12:37:53 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1190104751.6159.23.camel@localhost.localdomain>
References: <1189985156.9658.38.camel@localhost.localdomain>
	<1190061051.8742.20.camel@utx.utx.cz>
	<1190104751.6159.23.camel@localhost.localdomain>
Date: Tue, 18 Sep 2007 12:38:32 +0200
Message-Id: <1190111912.3638.26.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.11.91 
Cc: Ross Burton <ross@openedhand.com>
Subject: Re: RFC: Staging layout and pkgconfig sysroot support
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
X-List-Received-Date: Tue, 18 Sep 2007 10:41:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Mon, 2007-09-17 at 22:30 +0200, Stanislav Brabec wrote:
> > Well, I proposed the systoot some time ago and you opposed with its
> > disadvantages.
> 
> I was thinking about that when I wrote this email. Someone does need to
> argue the opposite case as this is a fundamental change and it needs
> discussion. I haven't made my mind up which approach is better to be
> honest.
> 
> I didn't and don't like the added complexity of multiple lib and bin
> directories...

But there is still a chance to formalize such approach by defining a new
feature request for gcc, libtool,... as an extension of -sysroot:

-target-root-map=/OE/foo1=/usr,/OE/foo2=/usr,/OE/foo3=/usr

Or a bit simpler version, which expects all sub-roots containing full
target paths (ie. /OE/foo1/usr/include instead of /OE/foo1/include).

-target-root=/OE/foo1,/OE/foo2,/OE/foo3

Target root map is a bit more complicated for implementation - wherever
sysroot has only one string, target root map has an array and needs to
rewrite strings and enlarge arraysto see, that /usr/include/freetype
should be expanded to triple lookup:
/OE/foo1/include/freetype, /OE/foo2/include/freetype, /OE/foo3/include/freetype

> I noticed the first line of the wrapper is:
> 
> # Warning: Your local compilation builddir musr not be inside /usr!
> 
> which just broke some of my builds since I build in /usr on certain
> machines :/.

My current wrapper is a hack, which rewrites all /usr/foo paths. If it
will be accepted, it needs rewrite (maybe to C or so) and properly check
for possible recursion.

> > There is still a lot of stuff, which don't support any of mentioned
> > concepts at all (e. g. AC_CHECK_FILE, AC_CHECK_PATH checks) and could
> > cause bad assumption (see fileutils locate script). In these cases, one
> > must provide a correct ac_ value to configure script or even patch the
> > package.
> 
> In an ideal world, we'd rewrite these macros and have our own safer
> versions even if they were to error out...

In an ideal world, all changes should be upstreamed, not depending
whether we will reuse sysroot or propose a new target root mapping.

Several years later, changes from automake could appear in the default
configure scripts of projects and calling autoreconf would not be
needed.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



