Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SSqAt-0007Dw-0c
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 15:46:27 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 May 2012 06:36:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98954504"
Received: from unknown (HELO helios.localnet) ([10.252.120.104])
	by AZSMGA002.ch.intel.com with ESMTP; 11 May 2012 06:36:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bob Cochran <openembedded@mindchasers.com>
Date: Fri, 11 May 2012 14:36:28 +0100
Message-ID: <2029099.DHpnAMYj1i@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-19-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4FAD09FE.4040101@mindchasers.com>
References: <4FAD09FE.4040101@mindchasers.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: finding mime-support in multiple oe trees?
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
X-List-Received-Date: Fri, 11 May 2012 13:46:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 May 2012 08:45:50 Bob Cochran wrote:
> I can find recipes for mime-support in both meta-openembedded and
> meta-openembedded-contrib under meta-oe/recipes-support.  The former has
> a 3.48 recipe and the latter has a 3.44 recipe.
> 
> Is finding the same recipe in multiple trees (not including classic) a
> glitch or the norm?
> 
> I'm going on the assumption that a production image is best off pulling
> a recipe from a non contrib layer (when available) unless the contrib
> layer / recipe solves a specific need.

In OE, the contrib repos are used for staging and submitting changes (via pull 
requests) and get cleared out regularly. People shouldn't be using them for 
anything permanent, so unless someone points you to a branch in the contrib 
repo to test something you probably shouldn't use anything in it as it could 
be unfinished and/or vanish at any time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


