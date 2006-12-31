Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H1AI5-0004Fu-IO
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Jan 2007 00:40:33 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H1AHB-0007V8-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jan 2007 10:39:37 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id 04F504B53B; Mon,  1 Jan 2007 10:39:33 +1100 (EST)
Date: Mon, 1 Jan 2007 10:39:33 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061231233933.GA29768@hezmatt.org>
References: <E1H19G7-0002Ph-6z@linuxtogo.org>
	<1167605141.5592.37.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1167605141.5592.37.camel@localhost.localdomain>
User-Agent: Mutt/1.5.11
Subject: Re: [oe-commits] org.oe.dev Split STAGING_BINDIR into CROSS and	NATIVE versions. This means there is no need to rename -config scripts and	multimachine won't break with binconfig.bbclass. ***NOTE: This change will	require staging to be rebuilt***
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
X-List-Received-Date: Sun, 31 Dec 2006 23:40:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 31, 2006 at 10:45:41PM +0000, Richard Purdie wrote:
> On Sun, 2006-12-31 at 23:34 +0100, rpurdie commit wrote:
> > Split STAGING_BINDIR into CROSS and NATIVE versions. This means there
> > is no need to rename -config scripts and multimachine won't break with
> > binconfig.bbclass. ***NOTE: This change will require staging to be
> > rebuilt***
> 
> Please note the above. Peoples staging are potentially broken now as all
> the *-config files have moved around and been renamed.

What's the easiest way to fix this?  Just rm -rf ${TMPDIR}/staging, and let
the system rebuild stuff as it needs to?  Do I need to delete all the
populate_staging stamps as well, perhaps?

- Matt


