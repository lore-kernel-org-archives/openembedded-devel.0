Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1N8uqz-0005UG-Dk
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 13:02:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5B2973C81D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 07:00:54 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13812-04 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 13 Nov 2009 07:00:54 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 2A6613C73BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 07:00:54 -0500 (EST)
Date: Fri, 13 Nov 2009 07:00:54 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258110604.5799.10.camel@dax.rpnet.com>
Message-ID: <Pine.LNX.4.64.0911130657000.4186@juice.ott.cti.com>
References: <alpine.LFD.2.00.0911130555020.3622@localhost>
	<1258110604.5799.10.camel@dax.rpnet.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to remove all traces of a previous package build?
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
X-List-Received-Date: Fri, 13 Nov 2009 12:02:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 13 Nov 2009, Richard Purdie wrote:

> On Fri, 2009-11-13 at 05:56 -0500, Robert P. J. Day wrote:
> > surely a dumb question, but what's the recipe for deleting every
> > trace of a single previous package build, so i know i'm rebuilding it
> > absolutely from step one?  i'll use that to test a rebuild of the
> > packages that are failing for me.
> 
> bitbake X -c clean

Then remove all packages under tmp/deploy; also tmp/pkgdata/*/X and
tmp/pkgdata/*/runtime/X*; and tmp/staging/*/*/shlibs/X*. Otherwise you may 
get problems if you've switched PACKAGE_ARCH in a recipe, or switched 
between packages that provide the same shared library.

I don't think there's a way to remove files from the staging directory. 
Maybe with packaged staging?

Mike


