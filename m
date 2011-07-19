Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qj79U-0004Bz-O2
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 12:03:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2011 02:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,227,1309762800"; d="scan'208";a="27523588"
Received: from unknown (HELO helios.localnet) ([10.255.17.187])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2011 02:53:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jul 2011 10:53:35 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <4E248688.1030902@vollmann.ch>
	<CABcZANnmZwTK147Vwgv8j9omd7xNQQK5EKT99_UEctC2itw3Jw@mail.gmail.com>
	<4E253020.4050001@vollmann.ch>
In-Reply-To: <4E253020.4050001@vollmann.ch>
MIME-Version: 1.0
Message-Id: <201107191053.35867.paul.eggleton@linux.intel.com>
Subject: Re: preferred version not available
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
X-List-Received-Date: Tue, 19 Jul 2011 10:03:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 19 July 2011 08:20:00 Detlef Vollmann wrote:
> On 07/18/11 23:05, Chris Larson wrote:
> > All variables which are typically set by the filename can be
> > overridden. Those are simply defaults. See the definitions of PN, PV,
> > and PR in bitbake.conf.
> 
> Yes, I knew that (I actually wrote the line changing the PV myself).
> What surprised me (though it makes sense) that PREFERRED_VERSION
> refers to PV, and not directly to a part of the filename.
> It's probably still too much of 'make' history in my brain...

I wonder if it would make sense to add something to the error message that 
also lists the available versions? Then it would be a little more obvious what 
you need to set PREFERRED_VERSION to.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


