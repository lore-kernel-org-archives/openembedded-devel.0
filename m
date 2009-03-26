Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1Lmdy1-00047O-VS
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 02:01:10 +0100
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id D2636547D9; Thu, 26 Mar 2009 01:59:30 +0100 (CET)
Date: Thu, 26 Mar 2009 01:59:30 +0100
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090326005930.GA23052@fh-wedel.de>
References: <20090324233009.GC9461@fh-wedel.de>
	<19c1b8a90903242057v4873c28if94f14f5631ecd6d@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90903242057v4873c28if94f14f5631ecd6d@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Strange name for cross binutils binaries
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
X-List-Received-Date: Thu, 26 Mar 2009 01:01:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, March 24, 2009, Khem Raj wrote:

> Well nylon distro is using quite old tools and I dont think anybody
> has been using
> gcc 3.3 binutils 2.14 and glibc 2.3.3 combo.

It seems like I found the culprit; in binutils 2.14 there is a
double --program-prefix=.... argument in the configure options.
This resulted in two consecutive sed substitutions for the
executable program's prefixes.
I call this a bug regardless how old version 2.14 is. Actually,
binutils have always had target-arch-related issues, I thus do
not like the idea of upgrading just because the recipes are
broken.

I hope I can come up with a set of patches soon.

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Was ist ein Cluster?
Wenn vier Bratscher unisono spielen.


