Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYLoC-000588-Nq for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 17:57:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYLnv-0007d8-Kt for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 17:56:43 +0100
Received: from ua-83-227-238-68.cust.bredbandsbolaget.se ([83.227.238.68])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 17:56:43 +0100
Received: from a.tqvist by ua-83-227-238-68.cust.bredbandsbolaget.se with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 17:56:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Anders =?utf-8?b?VMO2cm5xdmlzdA==?= <a.tqvist@gmail.com>
Date: Thu, 30 Dec 2010 16:56:31 +0000 (UTC)
Message-ID: <loom.20101230T174744-823@post.gmane.org>
References: <loom.20101124T090626-312@post.gmane.org>
	<AANLkTi=gaij=zue+LuXxr-bv7LHfYE_Nqo7xu1+QBzWS@mail.gmail.com>
	<20101216050818.GA18068@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 83.227.238.68 (Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.3) Gecko/20100423 Ubuntu/10.04 (lucid) Firefox/3.6.3)
Subject: Re: Source distribution broken?
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
X-List-Received-Date: Thu, 30 Dec 2010 16:57:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Khem Raj <raj.khem <at> gmail.com> writes:

> 
> On (15/12/10 23:35), Michael Poole wrote:
> > 2010/11/24 Anders Törnqvist <a.tqvist <at> gmail.com>:
> > > Hi,
> > >
> > > Is the source distribution functionality broken?
> > >
> > > This is set in local.conf:
> > > SRC_DIST_LOCAL = "copy"
> > > INHERIT += "src_distribute_local"
> > >
> > > New checkout of OE from git.
> > > Have tried different builds for MACHINE=beagleboard and images
minimal-image and
> > > base-image.
> > >
> > > The only thing that is stored in the TMPDIR/deploy/glibc/sources is a MIT
> > > directory with the minimal-image/minimal-image.bb file.
> 
> hmm I get it properly populated for console-image, do_build is added in
> base.bbclass I think it should be there for all recipes
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel <at> lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

Hmm. I do not get the TMPDIR/deploy/glibc/sources populated by any other sources
than the console-image.bb file in a MIT directory.

I have tested several builds with different images (micro, minimal, console,
base) in combination with DISTRO set to "angstrom-2008.1".
These combinations have I build based on release 2010.12 from tar file as well
as a GIT dev-branch dated christmas.

The result is always that the TMPDIR/deploy/glibc/sources is not populated.

On the other hand is the  TMPDIR/deploy/glibc/sources always populated if I add
"-c buildall" in all combinations (image, distro, and branch) mentioned above.

"-c distribute_sources_all" also always work to get TMPDIR/deploy/glibc/sources
populated.

Isn't the idea that TMPDIR/deploy/glibc/sources should be populated
automatically without having to add "-c buildall"?

/Anders Törnqvist





