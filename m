Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8F827169F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 10:22:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 09 Jan 2015 02:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="438430428"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.186])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jan 2015 02:09:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 09 Jan 2015 10:22:24 +0000
Message-ID: <2856855.3vO02ToI4x@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <20150109093810.GB3137@jama>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
	<20150109093810.GB3137@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-webserver][PATCH v4 00/13] Merge modphp into php and upgrade
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jan 2015 10:22:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 January 2015 10:38:10 Martin Jansa wrote:
> On Wed, Jan 07, 2015 at 02:50:15PM +0000, Paul Eggleton wrote:
> > Finally resolve the overlap between the modphp and php recipes by
> > merging the former into the latter. Along the way I fixed a few minor
> > issues and upgraded related recipes.
> > 
> > I've taken a stepped approach to doing the php merge / upgrade so it's
> > easier to see what's going on and easier for me to test - first upgrade
> > php to the same version as modphp, then do the integration, then upgrade
> > to the latest 5.5 release. I would appreciate someone testing PHP in CGI
> > mode however since I don't have a convenient test setup for that (as I
> > do for mod_php).
> > 
> > Changes since v2/3:
> > * Fix phar script installation and packaging, which also resolves a QA
> >   warning
> 
> There is one more issue:
> 
> sstate-sysroot-crutf.sh script was whitelisting this entries:
> [^/]*/usr/lib/php/\.channels.*
> [^/]*/usr/lib/php/\.registry.*
> [^/]*/usr/lib/php/\.depdb.*
> [^/]*/usr/lib/php/\.filemap
> [^/]*/usr/lib/php/\.lock
> 
> No it's in php5 directory so it's easy to change the whitelist, can you
> please confirm that it's safe to ignore these files (that nobody will
> miss them if they aren't there after sstate reuse) or check if we can
> prevent creating them in first place?

I'll have to look into this, I know next to nothing about PEAR at this point. 
My gut feeling is that they could still be whitelisted without ill effect; 
perhaps they could just not be installed at all.

> And is "/usr/lib/php5/php" expected, shouldn't it be just
> "/usr/lib/php5"?

I agree this looks odd, but it seems it's how it ends up with libdir set in 
order to make the extensions directory be more sensible than the default 
/usr/lib/extensions (which is a worse alternative than the current state IMO). 
I couldn't immediately see how to fix this when I looked at it earlier.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

