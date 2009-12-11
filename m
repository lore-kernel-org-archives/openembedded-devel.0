Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NJ3k9-0004hL-HE
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 12:33:08 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nBBBRhJS009742 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 11:27:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k0eo2YIdJyFF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 11:27:43 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nBBBRddl009710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 11:27:41 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10912110229g30bb3a31gf501fbdd7b16d52f@mail.gmail.com>
References: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>
	<1260523507.6896.130.camel@lenovo.internal.reciva.com>
	<ac9c93b10912110229g30bb3a31gf501fbdd7b16d52f@mail.gmail.com>
Date: Fri, 11 Dec 2009 11:33:02 +0000
Message-Id: <1260531182.29252.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: multiple DISTRO's in tmp
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
X-List-Received-Date: Fri, 11 Dec 2009 11:33:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-12-11 at 11:29 +0100, Frans Meulenbroeks wrote:
> 2009/12/11 Phil Blundell <philb@gnu.org>:
> > On Fri, 2009-12-11 at 09:39 +0100, Frans Meulenbroeks wrote:
> >> However, I was wondering: wouldn't it be nice to allow multiple
> >> distro's in one tmp dir (so that e.g. if they share the same version
> >> of a recipe (like m4-native or os), this does not need to be
> >> recompiled?
> >
> > Even if the (PN, PV) tuple is the same for two DISTROs it doesn't
> > necessarily follow that the resulting packages will be the same.  They
> > might have selected different compilers, configuration options, or
> > versions of depended-on packages.  Or they might have a different
> > filesystem layout, or any number of other things.
> >
> > So, practically speaking, no: it isn't going to be feasible to make
> > multiple DISTROs coexist in a single TMPDIR.  This is a case where you
> > do need to create a separate TMPDIR.
> 
> I understand that. Then again it *is* possible for multiple machines
> in the same distro to co-exist, even though the machine config file
> could change some flags.
> 
> Rethinking it, I would expect that if things can be shared it would be
> in the native area (and perhaps some things in cross).
> 
> Actually just bumped into this because my tmp dir for angstrom was
> about 18 GB and ofc I didn't have sufficient free space for another
> tree (and also not really enough patience to wait out a build of the
> cross tools).
> 
> Since my main goal was a small filesystem for initramfs, maybe it
> would be better to make a recipe for a small package (e.g.
> minimal_console_image.bb)

Phil is right, its not intended to be able to share multiple DISTROs in
the same TMPDIR and it never will be. Yes, in some cases its possible
things might match but knowing when they do and when they don't is
difficult to tell.

You need separate tmp directories I'm afraid.

Cheers,

Richard




