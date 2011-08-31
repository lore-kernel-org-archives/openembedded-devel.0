Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qyqem-0005aR-8s
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 21:41:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Aug 2011 12:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="44113066"
Received: from unknown (HELO [10.255.14.75]) ([10.255.14.75])
	by orsmga001.jf.intel.com with ESMTP; 31 Aug 2011 12:35:05 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 12:35:00 -0700
In-Reply-To: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
References: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1314819305.2284.2.camel@scimitar>
Mime-Version: 1.0
Subject: Re: How to prevent fetching?
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
X-List-Received-Date: Wed, 31 Aug 2011 19:41:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-31 at 11:25 -0600, Dave Beal wrote:
> My company is using OE to develop the embedded Linux infrastructure of a
> medical device.  The US government agency that approves such devices
> (FDA) requires that its source code be strictly controlled.  We would
> like to configure our OE installation to prevent the fetching of new
> source code except when we explicitly allow it.
> 
> Is there a way to accomplish this that doesn't require modifying all the
> individual .bb files?  Is there a global configuration option that would
> prevent fetching?  I've looked through the OE and Bitbake User Manuals,
> but haven't found an answer.

If you're using relatively recent BitBake and your metadata uses fetch2
(I don't know if oe.dev does, but oe-core is using fetch2) you can set
BB_NO_NETWORK="1" in a conf file somewhere.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



