Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1HH8pO-0006EC-9v
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Feb 2007 02:20:59 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id D46EEE744A;
	Wed, 14 Feb 2007 12:20:56 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02724-01; Wed, 14 Feb 2007 12:20:55 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 38C15D333D;
	Wed, 14 Feb 2007 12:20:55 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 33457B701CA; Wed, 14 Feb 2007 12:21:59 +1100 (EST)
Date: Wed, 14 Feb 2007 12:21:59 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: Rod Whitby <rod@whitby.id.au>
Message-ID: <20070214012158.GA906@twibble.org>
References: <45D1574C.8090009@whitby.id.au>
MIME-Version: 1.0
In-Reply-To: <45D1574C.8090009@whitby.id.au>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: madwifi-ng patch rationalisation and version update
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
X-List-Received-Date: Wed, 14 Feb 2007 01:20:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 13, 2007 at 04:44:36PM +1030, Rod Whitby wrote:
[...]
> We also intend updating madwifi-ng to a later snapshot (e.g.
> r2100-20070210), cause the current version won't build against 2.6.20
> due to changes in the INIT_WORK kernel macro.

I've been waiting for them to fix this for a while now so I can move
forward to newer kernels - so I definitely want the newer verison.

I think it'd would be a good idea to remove all the older versions as
well, apart from perhaps r1844 which corrosponds to the last actual
madwifi release (0.9.2.1). This should help get us back to one set of
patches as well since in version r1844 they changed the file that arm
is patching, requiring different patches for r1844 and newer.

Actually looking at it now it appears as if someone patched the
version in the files directory for a newer version so the older
versions (prior to r1844) won't build anymore anyway (patching will
fail). So the older versions of madwifi-ng and all the version
specific subdirs can all go as well.

[...]
> If there are other people using the madwifi package, please contact me
> so we can get this change tested by you before applying it.  Note that

I only use it on wrap (i486) and titan (sh4). They won't be effected
by your changes (and I'll test and fix up any issues for these
targers anyway.) I currently use r1844 but will move to a later
version as soon as there's one that works with 2.6.20.

> we're referring to madwifi-ng (which I couldn't find any other reference
> to in OE other than slugos and openprotium), not madwifi-modules (which
> is used directly by a number of distros).

Is anyone actually using madwifi-modules? It looks like a really old
version and looks to be hacked to only work on mips targets.

-- 
 Jamie Lenehan <lenehan@twibble.org>


