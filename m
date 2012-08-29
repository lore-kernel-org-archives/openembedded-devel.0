Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T6lrw-0002kT-SD
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 19:15:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2012 10:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="192899080"
Received: from unknown (HELO helios.localnet) ([10.252.121.163])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2012 10:03:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 18:03:40 +0100
Message-ID: <3308113.k2WOOcdOZr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAJTo0LbHYmWbomXPCWoc_q-Z+m0WvWZ6Aq1my190P7qdx=GPOg@mail.gmail.com>
References: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
	<k1lhde$fdj$1@ger.gmane.org>
	<CAJTo0LbHYmWbomXPCWoc_q-Z+m0WvWZ6Aq1my190P7qdx=GPOg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 17:15:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 August 2012 17:59:06 Burton, Ross wrote:
> On 29 August 2012 17:53, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Either take the distro stuff out or take the recipes out.
> > Meta-openembedded
> > is supposed to be a shining example of layer correctness.
> 
> I don't particularly want to maintain bbappends in meta-yocto for
> these as I'd prefer to see the recipes (well, contacts and dates, I
> still "maintain" tasks) gone.

The ideal option would be to turn these into PACKAGECONFIG options and then 
they can be set from anyone's distro config as desired (using pn- overrides) - 
no bbappends needed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


