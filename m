Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IXYfn-000685-9s
	for openembedded-devel@openembedded.org; Tue, 18 Sep 2007 10:43:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8I8dGux028741;
	Tue, 18 Sep 2007 09:39:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28503-06; Tue, 18 Sep 2007 09:39:12 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8I8dCki028734
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 18 Sep 2007 09:39:12 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1190061051.8742.20.camel@utx.utx.cz>
References: <1189985156.9658.38.camel@localhost.localdomain>
	<1190061051.8742.20.camel@utx.utx.cz>
Date: Tue, 18 Sep 2007 09:39:11 +0100
Message-Id: <1190104751.6159.23.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 18 Sep 2007 08:43:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-09-17 at 22:30 +0200, Stanislav Brabec wrote:
> Richard Purdie wrote:
> 
> > I'm interested in people's views on whether this would be a worthwhile
> > change or not? Should we change all staging layouts or leave say native
> > packages as they are?
> > 
> > As a first step I will investigate removing some of the hardcoded layout
> > assumptions I've found so far as I think they're good to remove
> > regardless of whether we change staging layout or not. In theory people
> > or distros could maybe then choose their own layout even!
> 
> Well, I proposed the systoot some time ago and you opposed with its
> disadvantages.

I was thinking about that when I wrote this email. Someone does need to
argue the opposite case as this is a fundamental change and it needs
discussion. I haven't made my mind up which approach is better to be
honest.

I didn't and don't like the added complexity of multiple lib and bin
directories...

> I tried the second way: Write a compiler wrapper.
> 
> Here is my first proof of concept wrapper. Now it hardcodes paths and
> some parts should be a subject of discussion (e. g. -nostdinc). It
> already compiled a small binary+library, but I did not try bootstrap
> with it yet (I don't know how to do a system-wide change of cross-CC
> etc.).

I noticed the first line of the wrapper is:

# Warning: Your local compilation builddir musr not be inside /usr!

which just broke some of my builds since I build in /usr on certain
machines :/.

> Advantages of gcwrap over -sysroot:
> - We can keep existing structure.
> - Save storage while building for more platforms at once.
>
> Advantages of -sysroot over gcwrap:
> - A bit better support (in gcc and libtool but not automake checks).
> - Simpler manipulation with one directory.
> 
> There is a particular question, whether overlay parts
> noarch-platform-machine should follow target system structure.
> I think that yes, even if it could break some recipes.
> 
> In all cases, I would propose a QA tool causing error of any package
> embedding any staging dir or DESTDIR into any file (except debug info).

Agreed, this is something I suspect the QA people are working towards?

> There is still a lot of stuff, which don't support any of mentioned
> concepts at all (e. g. AC_CHECK_FILE, AC_CHECK_PATH checks) and could
> cause bad assumption (see fileutils locate script). In these cases, one
> must provide a correct ac_ value to configure script or even patch the
> package.

In an ideal world, we'd rewrite these macros and have our own safer
versions even if they were to error out...

Cheers,

Richard




