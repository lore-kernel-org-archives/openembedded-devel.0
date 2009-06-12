Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1MFDiE-000116-Ov
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2009 22:50:59 +0200
Received: from p5b03474e.dip.t-dialin.net ([91.3.71.78] helo=dodger)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1MFDYX-0002uM-O2 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2009 22:41:00 +0200
Received: from stefan by dodger with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1MFDZ2-00028l-A8 for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2009 22:41:28 +0200
Date: Fri, 12 Jun 2009 22:41:28 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090612204128.GD12863@dodger.lab.datenfreihafen.org>
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
	<1244838263.5958.34.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1244838263.5958.34.camel@dax.rpnet.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.19 (2009-01-05)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove	spurious assignments
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
X-List-Received-Date: Fri, 12 Jun 2009 20:50:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2009-06-12 at 21:24, Richard Purdie wrote:
> On Fri, 2009-06-12 at 20:55 +0100, Phil Blundell wrote:
> > I'd like to propose changing the bitbake.conf default for
> > BUILD_OPTIMIZATION from "-O2" to "-O2 -g".  There seems no harm in
> > building debuggable binaries for host-side utilities and it makes life
> > somewhat easier when things go wrong.
> > 
> > Also, while investigating why assignments to this variable from
> > local.conf didn't do what I was expecting, I discovered that a whole lot
> > of files inside conf/, notably all of the sane-toolchain-*.inc files,
> > contain their own assignments to BUILD_OPTIMIZATION for no good reason
> > that I can see.  I would also propose to delete the assignments from
> > those files.  (There are a few other assignments in files that are
> > either DISTRO or MACHINE specific but I intend to leave those alone.)
> 
> Acked-by: Richard Purdie <rpurdie@linux.intel.com>
> 
> Poky actually uses -ggdb now which makes the -dbg packages useful (if
> huge).

Perhaps go directly for -ggdb3? (There is always magic to learn if you hack some
time with zecke. :))

regards
Stefan Schmidt


