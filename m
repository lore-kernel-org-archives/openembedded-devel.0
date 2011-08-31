Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QytNV-0003di-Pv
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 00:35:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Aug 2011 15:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,309,1312182000"; d="scan'208";a="44475731"
Received: from unknown (HELO [10.255.14.75]) ([10.255.14.75])
	by azsmga001.ch.intel.com with ESMTP; 31 Aug 2011 15:30:29 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 15:30:24 -0700
In-Reply-To: <1314825521.1457.12.camel@DaveBeal-Ubuntu-laptop>
References: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
	<1314819305.2284.2.camel@scimitar>
	<1314825521.1457.12.camel@DaveBeal-Ubuntu-laptop>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1314829829.2284.12.camel@scimitar>
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
X-List-Received-Date: Wed, 31 Aug 2011 22:35:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-31 at 15:18 -0600, Dave Beal wrote:
> Thank you, Joshua.  I don't know what you mean by "if your metadata uses
> fetch2".  Is fetch2 some python function?  How would I know if I'm using
> it?

Fetch2 is a Python module that's part of BitBake. It's used from the
base_do_fetch() method of base.bbclass.

You can see that OE.dev isn't using  fetch2[1] but OE-Core is[2].

Joshua

1.
http://git.openembedded.org/cgit.cgi/openembedded/tree/classes/base.bbclass#n99
2.
http://git.openembedded.org/cgit.cgi/openembedded-core/tree/meta/classes/base.bbclass#n80
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



