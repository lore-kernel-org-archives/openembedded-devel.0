Received: from [82.182.55.65] (helo=pcjr2.rosbacke.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mikael@rosbacke.org>) id 1L5LUK-0001zP-QQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 15:35:32 +0100
Received: from [192.168.0.199] by pcjr2.rosbacke.org with esmtp (Exim 4.63)
	(envelope-from <mikael@rosbacke.org>) id 1L5LRM-0005PW-Mh
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 15:32:29 +0100
From: Mikael Rosbacke <mikael@rosbacke.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90811251552w125189b5wc43cbb595d6fc3dc@mail.gmail.com>
References: <1227628013.10122.37.camel@akaza1>
	<19c1b8a90811251552w125189b5wc43cbb595d6fc3dc@mail.gmail.com>
Date: Wed, 26 Nov 2008 13:27:29 +0100
Message-Id: <1227702449.6790.9.camel@akaza1>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
X-SA-Exim-Connect-IP: 192.168.0.199
X-SA-Exim-Mail-From: mikael@rosbacke.org
X-SA-Exim-Scanned: No (on pcjr2.rosbacke.org); SAEximRunCond expanded to false
Subject: Re: uclibc support for x86
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
X-List-Received-Date: Wed, 26 Nov 2008 14:35:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I did:

rm -rf tmp
bitbake console-image

with this in my local.conf:

BBFILES = "/home/mikaelr/oe/openembedded/packages/*/*.bb"
CCACHE=""
DISTRO = "angstrom-2008.1"
MACHINE = "x86"
ANGSTROM_MODE = "uclibc"
BB_NUMBER_THREADS = "3"
IMAGE_FSTYPES += "tar.bz2"

There was 1 additional issue, as reported before. I had to insert:
'#include <limits.h>' in: 

tmp/work/x86-angstrom-linux-uclibc/linux-2.6.21-r12/linux-2.6.21/scripts/mod/sumversion.c

and restart the build process. This is the same for a glibc build and
should be unrelated to the uclibc change.

After the build finished, I made a bootable CF card and booted a SiS550
based system (x86 compatible). I got to the Angstrom login prompt.

With my initial test ucLibc seems to work so far.

tnx,

--- Mikael R 



tis 2008-11-25 klockan 15:52 -0800 skrev Khem Raj:
> Looks sane to me. Have you tried to build a distro with this change ?
> 
> Thx
> 
> -Khem
> 
> On Tue, Nov 25, 2008 at 7:46 AM, Mikael Rosbacke <mikael@rosbacke.org> wrote:
> > Hello!
> >
> > Seems I'm the only one crazy enough to try to run a uClibc based
> > distribution on x86. (I can see the response, What's the point?)
> >
> > Anyway, it turns out uClibc is currently lacking support for x86.
> > I've added the folder openembedded/packages/uclibc/uclibc-0.9.30/x86
> > and created the file uClibc.machine in this folder. (See attachment)
> >
> > Is there some way to get this into the git tree? Should I file a bug
> > report or could some maintainer give feedback on things to fix before
> > inclusion? I've tried to keep the config file in style with similar
> > config files for other machines.
> >
> > Thanks in advance,
> >
> >
> > --- Mikael Rosbacke
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



