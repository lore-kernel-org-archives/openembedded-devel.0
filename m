Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8TJZ-0006jO-Mt
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 07:37:58 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8TIK-0006vl-K8 for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 01:36:36 -0500
Date: Thu, 12 Nov 2009 01:36:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911120722.09166.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.0911120125380.1977@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 06:38:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 12 Nov 2009, Holger Hans Peter Freyther wrote:

> On Thursday 12 November 2009 06:56:41 Holger Hans Peter Freyther wrote:
> > On Thursday 12 November 2009 06:47:22 Robert P. J. Day wrote:
> > >   seriously, either the build of xterm_207 should be fixed, or that
> > > package should be dropped in its entirety.  it's been at least three
> > > weeks since i pointed out that it doesn't build, and even explained in
> > > detail *why* it doesn't build and how to fix it.  to no avail.
> > >
> > >   so, a humble suggestion -- either fix it, or remove it from OE
> > > entirely.
> >
> > Did you attempt to create a patch?
>
> and on top of that it...it builds here... creates a ipk with the
> xterm binary in it. So I don't see the need to remove the recipe.

  philip balister confirmed some time back that he's reproduced the
error, but i'll be happy to explain one more time what the problem is.

  in the work directory for xterm_207, you can find the install script
sinstall.sh, which contains the snippet:

  case ".$cf_mode" in #(vi
        .???s??s*) #(vi
                PROG_SUID=4000
                PROG_SGID=2000
                ;;
        .???s*) #(vi
                PROG_SUID=4000
                PROG_GRP=
                ;;
        .??????s*)
                PROG_SGID=2000
                PROG_USR=
                ;;
        esac
        PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g' -e 's/--[sxt]/1/g'`

the above is switching on a symbolic mode, and that final line is
using sed to convert the symbolic mode to the corresponding numeric
mode for installation.

  that worked fine a few years back, but it fails on newer linux
distros for which the long listing might have a trailing period, as
does my fedora 11 system:

$ ls -l /etc/passwd
-rw-r--r--. 1 root root 2474 2009-11-09 14:59 /etc/passwd
          ^ there

  that collection of sed operations doesn't take that into account,
and ends up converting a symbolic mode to something like "755.",
*also* with a trailing period, which causes the eventual install
operation to fail thusly (from the log file):

checking for presumed installation-mode
... if "/usr/bin/xterm" is null, try the ls -g option
... if "/usr/bin/xterm" is null, we do not look for group
... if we have date in proper columns (Sep 29 05:41), "" is null
... derived user "root", group "root" of previously-installed xterm
... see if mode "-rwxr-xr-x." has s-bit set
... installing xterm as user "rpjday", group "rpjday"
/usr/bin/install -c -m 755.   xterm
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xterm-207-r0/image/usr/bin/xterm
/usr/bin/install: invalid mode `755.'
make: *** [install] Error 1
FATAL: oe_runmake failed

  notice how the install command is complaining about an invalid mode
of "755.", as well it should.  a simple (albeit hacky) fix is to
simply add the line

  PROG_MODE=${PROG_MODE%\.}

to whack off a possible trailing period after that last line above.
i've verified that this in fact works.  perhaps a cleaner option is to
delete that trailing period from $cf_mode right up front.  either way
would work fine, but it's clear that the period needs to go.  why
*your* build works is a mystery, unless you're doing this on a system
that somehow doesn't display that period with a long listing, or
something like that.

  anyway, this is about the fourth time i've explained this, either
here or on the angstrom-devel list.  that's the error, and it's
entirely reproducible on my f11 system.  at this point, i'm leaving it
with the powers that be, and you're free to deal with it or totally
ignore it.  whatever suits you.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


