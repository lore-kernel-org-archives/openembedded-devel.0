Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROuSC-0006q8-Nf
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 17:59:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Nov 2011 08:53:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="74180184"
Received: from unknown (HELO helios.localnet) ([10.252.121.143])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2011 08:53:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David Thomas <david.thomas@microbee-systems.com>
Date: Fri, 11 Nov 2011 16:53:16 +0000
Message-ID: <2307753.9BlijQWh4O@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <CALJpqJwNOLdF+3UGoYmeMPLbYBm9dvmit-hOjzF2YHHebF385Q@mail.gmail.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1580580.FyEQSKQZzU@helios>
	<CALJpqJwNOLdF+3UGoYmeMPLbYBm9dvmit-hOjzF2YHHebF385Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Fri, 11 Nov 2011 16:59:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 November 2011 10:34:56 you wrote:
> http://www.compulab.co.il/workspace/mediawiki/index.php5/CM-T3530:_Linux:_Bu
> ilding_images
> 
> Bad Idea?

Well, that's a positively ancient revision of OE (from 2009) and having to put 
a set of patches on top of it is rather ugly. It's not clear to me why they 
couldn't just point you to a revision with the appropriate support already in 
it if they wanted to pick a stable point.

It'll be dependent on what the patches do, but I think you'll probably be much 
better off with the OE 2011.03-maintenance branch or master (in the latter case 
you'll need to use DISTRO = "angstrom-2010.x" since there is no 2008.1, that's 
why I was asking previously) - both of which have a cm-t35 machine, but I 
can't speak to how good the support for it will be.
 
Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


