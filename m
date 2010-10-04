Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P2sHo-0000hX-It
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 23:09:30 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9S00GYMAQTMI23@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	04 Oct 2010 16:08:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E2D3914AF64; Mon,
	04 Oct 2010 17:08:52 -0400 (EDT)
Date: Mon, 04 Oct 2010 17:08:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101004210852.GA12282@denix.org>
References: <4CA719E0.7050409@freyther.de> <i89b3v$g4g$1@dough.gmane.org>
	<4CA83188.7010203@freyther.de> <i89bro$g4g$2@dough.gmane.org>
	<AANLkTi=Bv3pZwMwJ20MNipgMtW7S4rb=r+zxPqc9NGDQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTi=Bv3pZwMwJ20MNipgMtW7S4rb=r+zxPqc9NGDQ@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RPATH in many modules
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
X-List-Received-Date: Mon, 04 Oct 2010 21:09:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Oct 03, 2010 at 01:46:41PM -0700, Khem Raj wrote:
> On Sun, Oct 3, 2010 at 12:37 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 03-10-10 09:32, Holger Freyther wrote:
> >> On 10/03/2010 03:24 PM, Koen Kooi wrote:
> >>
> >>> Could you fix the patch to say to which (wrong) sysroot it points to?
> >>>
> >>> MACHINE=beagleboard bitbake libcdio
> >>>
> >>> rpath -> sysroots/x86 or rpath -> sysroots/armv7a or both?
> >>
> >> ERROR: QA Issue with libgettextlib: package libgettextlib contains bad RPATH
> >> /home/ich/build/arm/xscale/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
> >> in file
> >> /home/ich/build/arm/xscale/tmp/work/armv5te-angstrom-linux-gnueabi/gettext-0.18-r3/packages-split/libgettextlib/usr/lib/libgettextlib-0.18.so
> >>
> >> Can you propose a better wording? From the above I try to indicate that
> >> /home/ich/build/arm/xscale/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
> >> is the bad RPATH and that it is inside the libgettextlib-0.18.so
> >
> > "Target libs and apps contain a bad RPATH to the target sysroot e.g.
> > /tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib" ?
> 
> I am working on libtool 2.4 upgrade which has sysroot support. I am
> hoping it will help us in fixing this kind
> of problems.

Whoa, libtool with sysroot support! Sweet. I'm very interested in -sdk version 
of it... :)

-- 
Denys


