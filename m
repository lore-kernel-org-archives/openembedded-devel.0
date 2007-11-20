Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1Iuc8g-0004AT-EP
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 00:04:20 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2840837waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 15:02:06 -0800 (PST)
Received: by 10.115.32.1 with SMTP id k1mr533122waj.1195588826141;
	Tue, 20 Nov 2007 12:00:26 -0800 (PST)
Received: by 10.114.254.11 with HTTP; Tue, 20 Nov 2007 12:00:26 -0800 (PST)
Message-ID: <f96d234e0711201200w48dc169fr339df525bcd1f5cf@mail.gmail.com>
Date: Tue, 20 Nov 2007 15:00:26 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4743201F.8000202@am.sony.com>
MIME-Version: 1.0
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl> <4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com>
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 23:04:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 20, 2007 12:57 PM, Tim Bird <tim.bird@am.sony.com> wrote:
> pHilipp Zabel wrote:
> > $ cat ~/bin/bitbake
> > #!/bin/sh
> > export OEDIR=${OEDIR:-$PWD}
> > export BBPATH=${BBPATH:-$OEDIR/build:$OEDIR/openembedded}
> > /usr/local/bin/bitbake $*
>
> This is nice.  Can someone tell me why this isn't
> the default behavior of bitbake now?  (I'm honestly
> not trolling :-)   There must be some good reason
> to allow bitbake to be used outside of a build
> directory.  Make (which bitbake resembles
> in some aspects), is sensitive to it's starting
> directory.  Why not bitbake?

One problem is bitbake is typically run from a svn co directory, so
you need to modify the path anyway.  Once you are stuck with
source'ing a script, it is not a lot more work to add BBPATH.

It might be a good idea to have defaults.  I'm sure with a few lines
of Python, the above script could be implemented directly in bitbake,
so why not -- if the variables are not defined, then use the defaults.
 But often something a little different is required.

For, example, most of my builds use the following setup:

export OEDIR="/build/svs_oe_update/oe2"
export TOPDIR="${OEDIR}/build/angstrom-2007.1"
export BBPATH="${OEDIR}/oe/custom:${TOPDIR}:${OEDIR}/oe/org.openembedded.dev"
export PATH="${OEDIR}/bitbake/bin:${PATH}"

The defaults might be useful for many people, but people who really
use OE often need something a little different.  My setup allows for
OE overlays, target multiple distributions (2007.1, or 2008.1, etc).
Also, defaults might get in the way of people who forget to source
their setup-env script and lead to confusing error messages, etc.  Too
much magic can be confusing too ...

I mostly use OE to help customers build vertical embedded systems.  I
use Makefiles, but as mentioned by others, it is mainly just for setup
so that I can quickly switch machines, changes distributions, glibc vs
uclibc, etc.  After that, I run bitbake.  I think of a Makefile as
documentation so when I come back to a project in 1 year, I don't have
to remember how to set up a build and what targets need to be built.
My customers seem to like a Makefile.  They rarely get into the doing
OE development, but being able to run a complete build gives them some
level of comfort if I would get hit by a truck, they would at least
have the build system and could pick up where I left off.  So for my
usage, Makefiles (or shell scripts, or whatever you want to use) are
project specific, and typically need customized for what you are
doing.  As an example, as much as I like Rod's Makefile wizardry, I
prefer to do a few things differently and ending up writing my own
version.  So there is probably no one Makefile or setup script or way
of doing things that is going to work for most people -- which is fine
IMO.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


