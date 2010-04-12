Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1O1Mpu-0003j3-8n
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 18:50:14 +0200
Received: from [10.250.128.186] (unknown [158.43.2.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 59D3512EC012
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 12:11:30 -0500 (CDT)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1271087957.29304.86.camel@trini-m4400>
References: <1270135981.4993.128.camel@rex>  <hpum4g$18m$1@dough.gmane.org>
	<1271087957.29304.86.camel@trini-m4400>
Date: Mon, 12 Apr 2010 17:46:39 +0100
Message-ID: <1271090799.14344.19.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Mon, 12 Apr 2010 16:50:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-04-12 at 08:59 -0700, Tom Rini wrote:
> On Mon, 2010-04-12 at 10:37 +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > On 01-04-10 17:33, Richard Purdie wrote:
> > > I've been aware that Poky and OE have been diverging slightly and I'd
> > > like to correct this. There are some patches that I've promised for a
> > > while too such as the rename from do_populate_staging ->
> > > do_populate_sysroot.
> > > 
> > > With some help from Joshua Lock, I have a branch I'd like to propose be
> > > merged into OE.dev:
> > > 
> > > http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress
> > 
> > Joshuas last 3 commits to poky seem to fix Toms issue with binconfig and
> > my issue with chrpath, which only leaves the cross staging lamangler
> > stuff to get fixed.
> 
> Actually (and I'm OK with binconfig stuff being broken in the first
> merge) the problem with binconfig junk isn't the file contents, but the
> file location.  staging-target-pkg will contain
> staging/<host>/usr/bin/<target>/foo-config.  Which means using pstaging
> for a target pkg built on 32bit Linux fails when used on 64bit Linux.
> Not that I wouldn't mind seeing the binconfig stuff die, just saying
> it's a problem today :)

Ah, hmm... yes. That is a problem.

FWIW I don't think you'll get any arguments from the Poky team where the
binconfig stuff to suffer an untimely demise!

Cheers,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre



