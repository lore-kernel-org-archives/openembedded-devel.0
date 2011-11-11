Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROqtb-00082O-Dw
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 14:11:51 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2011 05:05:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89104148"
Received: from unknown (HELO helios.localnet) ([10.252.121.97])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 05:05:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David Thomas <david.thomas@microbee-systems.com>
Date: Fri, 11 Nov 2011 13:05:30 +0000
Message-ID: <6416131.BOns2L3oYb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <833EEBB2-42FF-438F-A5F3-8B24DDD3964D@microbee-systems.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1320996619.7415.4.camel@mattotaupa>
	<833EEBB2-42FF-438F-A5F3-8B24DDD3964D@microbee-systems.com>
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
X-List-Received-Date: Fri, 11 Nov 2011 13:11:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 November 2011 06:11:14 David Thomas wrote:
> Well I checked this and the files where in this location... Still no dice.
> The manual states it first searches to see if they exist then downloads. I
> see the opposite, it fails to contact the server and then fails.

I don't think this is to do with those files (they are in the files subdir as 
you point out, and they will be found there via FILESPATH; this is automatic). 
If it's contacting the server and failing, it's the URI pointing to that 
server or some other problem relating to that operation. You're not behind 
some kind of firewall that blocks the git protocol are you?

Also, from one of your earlier emails:
> SRC_URI = "git:///home/twoods/local;protocol=file;branch=master"

I don't think this is what you want. Just use file://<full path> if you want to 
point it to a local location. But I'm not sure that's what you really want 
here either.

> git://git.yoctoproject.org/matchbox-keyboard;protocol=git;file://smallscreen
> -fontsize.patch;patch=1

That won't work - you have no space between the first URI and the next. Fix 
that, and assuming your network allows access to remote git repos, that should 
work.

You can double check what SRC_URI bitbake is going to use by running this:

bitbake -e matchbox-keyboard | grep ^SRC_URI

Could you also remind me what DISTRO you are using?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


