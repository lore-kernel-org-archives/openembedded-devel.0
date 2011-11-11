Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROtWB-00040I-Ro
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 16:59:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2011 07:53:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,495,1315206000"; d="scan'208";a="84046796"
Received: from unknown (HELO helios.localnet) ([10.252.121.143])
	by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2011 07:53:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David Thomas <david.thomas@microbee-systems.com>
Date: Fri, 11 Nov 2011 15:53:29 +0000
Message-ID: <45554938.bbIM0h9DI3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <CALJpqJw_QkVCyD918ymd6=11VaFC1uj6kGy_XVkaL+-WJQ8jgw@mail.gmail.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1997795.hUxCJJ3qle@helios>
	<CALJpqJw_QkVCyD918ymd6=11VaFC1uj6kGy_XVkaL+-WJQ8jgw@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Nov 2011 15:59:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 November 2011 09:20:18 you wrote:
> Sorry, new to this system. We mostly design hardware and I go in and
> out of Linux development periodically and it is difficult to keep
> current for this reason.

No problem. I know you've been very patient with the frustrations you have, if 
you'll just bear with us I'm sure we can sort it out.

> DISTRO = "angstrom-2008.1"

OK. So it ought to have the approprate file in the mirror. What version of 
bitbake are you using? Also, could you run the following:

bitbake -e matchbox-native | grep ^PREMIRRORS

> Will I need to search any bb files using the dead SRC_URI and replace
> them with yoctoproject.org?

That's one way of fixing it, yes.

BTW I would suggest if you are starting a new project and you expect to keep 
it around for a while you should consider using something based on top of 
OpenEmbedded-Core, such as the Yocto Project or a newer version of Angstrom. 
That way issues like these (broken downloads) get taken care of, since OE-core 
is maintained.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


