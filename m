Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RORg1-0007aG-KN
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 11:16:09 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Nov 2011 02:09:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83404739"
Received: from unknown (HELO helios.localnet) ([10.252.121.140])
	by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2011 02:09:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David Thomas <david.thomas@microbee-systems.com>
Date: Thu, 10 Nov 2011 09:58:31 +0000
Message-ID: <1389840.j5gWQFZ9u1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 Nov 2011 10:16:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 09 November 2011 16:32:48 David Thomas wrote:
> Since svn.o-hand.com is dead does anyone have a different repository?

Most if not all o-hand repositories have been converted to git and moved to 
git.yoctoproject.org. A list of what's available:

 http://git.yoctoproject.org/cgit/cgit.cgi/
 
> SRC_URI = "git://git.yoctoproject.org/matchbox-keyboard;protocol=git \

This works for me... ?

> I am unable to find any source for these. It sure seems to me that OE
> is overly dependent upon links that come and go.

It is if you don't use a mirror. Realistically with the wide range of software 
from hundreds of different providers built in OE there's no way you can expect 
all of them to not change their download locations, remove old versions, etc. 
over time. That's why we have mirror support, and both Angstrom and the Yocto 
Project provide mirrors already.

If you really want to ensure long-term support you may want to consider 
setting up your own local mirror; it's fairly easy to do.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


