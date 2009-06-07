Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1MDM3H-0004Ic-QV
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 19:20:59 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 8EE80547D3; Sun,  7 Jun 2009 19:11:34 +0200 (CEST)
Date: Sun, 7 Jun 2009 19:11:34 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090607171134.GA25357@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20090607132212.GA20762@fh-wedel.de>
	<Pine.LNX.4.64.0906071216430.27204@juice.ott.cti.com>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0906071216430.27204@juice.ott.cti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: glibc-initial-2.3.2 build failes (wrong patch)
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
X-List-Received-Date: Sun, 07 Jun 2009 17:20:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, June 07, 2009, Michael Smith wrote:

> I think the solution is to remove the FILESPATHPKG override from 
> glibc-initial.inc. After looking through the rest of the files again, it 
> looks like the glibc_2.[5-9]*.bb (not -initial) each add glibc-2.4 to the 
> search path one way or another, and they are included by -initial, so 
> there's no need to do it in the initial.inc. Can you give it a shot and 
> see if it fixes the build for 2.3.2?

Did so, and it looks good!

Cheers,

M'bert

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Chinese is a lousy language for scrabble
           -- Neal Stephenson


