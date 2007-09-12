Received: from [194.158.229.25] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IVRat-00080M-Nt
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 14:45:23 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB8548003D1222 for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 14:42:15 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l8CCjLn09376;
	Wed, 12 Sep 2007 14:45:21 +0200
Sender: dv@vollmann.ch
Message-ID: <46E7DF61.2AEEA36E@vollmann.ch>
Date: Wed, 12 Sep 2007 14:45:21 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <HOECLKEKOHLAMMGDLLBHGENPMDAA.skoroneos@digital-opsis.com>
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Wed, 12 Sep 2007 12:45:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Stelios Koroneos wrote:
> > Same here, but I guess we are using OE for similar purposes. Using
> > OpenEmbedded for embedded applications you build a kernel, need a
> > *few* packages (say 10) and some custom stuff (say 20 packages).
This is one usage we have, for specific projects.

> As more people start to use OE and as these people would be mostly
> interested in "vertical" solutions (develop an app or add apps to an
> existing distro without having to rebuild everything) i think we need to
> have a closer look at the OE SDK vs build everything from scratch.
Actually, for projects that are in a stage where they start to
build (internal) releases (that go to some test procedures),
building from scratch is important to be able to reproduce
these releases and apply some minor bugfixes to them.
But that doesn't mean that everything should be built from
scratch for each release (see me other mail on binary packages).
For packages used in these project I have no problems to put
in some effort to provide the packages in my overlay and tweak
some until they contain exactly what I need.

But we have always a number of project that just start to develop
or are still exploring their development options.
For those projects I try to provide "mini-distros" based
on existing distros (angstrom).  For these mini-distros
I prepare a feed that contains everything that builds and makes
sense for their hardware (so I mask everything related to
graphics and multimedia).

My current approach is to start with a big list of packages
setup a BBMASK and see what builds.  Those that don't build
I simply remove from my list or (if I think the package is
interesing enough) I try to modify that package in my
overlay so that it builds.

For such packages (for which I don't know whether they are ever
really used in any project) I'm a bit reluctant to put in much
effort, so I'd appreciate everything that makes my job here
easier.

> Having a "standard" toolchain availiable (and the way to use it) for people
> that are not interested in developing distro's would IMHO provide additional
> "user friendliness" and make OE an even more attractive solution.
Definitely.  But even for people like me (who provide some
infrastructure to a number of projcets inside a company or for
a given hardware) it would be nice to make "distro building"
easier.

  Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


