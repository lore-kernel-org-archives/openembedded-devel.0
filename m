Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QgdrO-0000fR-Pt
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 16:22:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 07:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,521,1304319600"; d="scan'208";a="24910468"
Received: from unknown (HELO helios.localnet) ([10.255.17.183])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2011 07:18:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2011 15:18:50 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <0564089300001e7d@nedap.com>
	<201107121042.53976.paul.eggleton@linux.intel.com>
	<20110712140847.GA788@cverges-dev-lnx>
In-Reply-To: <20110712140847.GA788@cverges-dev-lnx>
MIME-Version: 1.0
Message-Id: <201107121518.51033.paul.eggleton@linux.intel.com>
Subject: Re: bbappend
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
X-List-Received-Date: Tue, 12 Jul 2011 14:22:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 12 July 2011 15:08:47 Chris Verges wrote:
> Thanks for clarifying and proposing a workaround.  It looks like PRINC
> is similar, where it is only available in oe-core.  It seems like the
> code related to incrementing the PR variable is a several-line fix, so
> is this something that can be abstracted into a class file in the
> local-overlay?

Possibly, however as a general suggestion I would recommend moving things over 
to being based on oe-core if at all possible. I realise this is not going to 
be practical for everyone in the short term, however OE classic will stop 
being maintained at some point in the near future, so the sooner you move the 
better - plus you get to take advantage of the additional features and 
cleanups in oe-core as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


