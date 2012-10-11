Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMFsD-0003Bo-8M
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 12:20:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Oct 2012 03:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,571,1344236400"; d="scan'208";a="203195645"
Received: from unknown (HELO helios.localnet) ([10.252.122.70])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2012 03:07:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 11 Oct 2012 11:07 +0100
Message-ID: <7299613.urxqSG8krK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <k565ek$4pd$1@ger.gmane.org>
References: <cover.1349944125.git.paul.eggleton@linux.intel.com>
	<a6614039ee04605d4b5efe6b2c2942dc9d0aac4d.1349944125.git.paul.eggleton@linux.intel.com>
	<k565ek$4pd$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 2/2] apache2: reorganise packaging definitions
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
X-List-Received-Date: Thu, 11 Oct 2012 10:20:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 October 2012 12:02:06 Koen Kooi wrote:
> Op 11-10-12 10:29, Paul Eggleton schreef:
> > Move RDEPENDS to the end and PACKAGES before other packaging
> > definitions.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> ---
> > .../recipes-httpd/apache2/apache2_2.4.2.bb         |    7 ++++--- 1 file
> > changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
> > b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb index
> > 2c0fa6b..5857be7 100644 ---
> > a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb +++
> > b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
> > 
> > +RDEPENDS_${PN} += "openssl libgcc"
> 
> To make it clearer for future generations, could you add a commend why these
> aren't getting picked up by the shlib code?

I don't know without investigating and I'm afraid I have more pressing issues 
to solve at the moment. I will add it to my todo list though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


