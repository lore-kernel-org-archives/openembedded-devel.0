Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US4Cv-0001ZG-Qs
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:37:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2013 04:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="295619878"
Received: from unknown (HELO helios.localnet) ([10.255.14.4])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2013 04:19:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Apr 2013 12:19:58 +0100
Message-ID: <1561352.OujRcMfYWi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <kkjbhk$h9r$1@ger.gmane.org>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<kkjbhk$h9r$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
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
X-List-Received-Date: Tue, 16 Apr 2013 11:37:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 April 2013 13:09:46 Koen Kooi wrote:
> These look good to me, but
> 
> > iw: move to meta-networking and update
> 
> This is receferenced by a packagegroup in meta-oe:
> 
> 	meta-oe/recipes-core/packagegroups/packagegroup-basic.bb:
> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)} \
> 
> 
> With the 'meta-oe shall only depend on oe-core' rule, 

Are you sure nothing in meta-oe depends on anything in other layers within 
meta-openembedded already?

> iw can't get moved to meta-networking. Since iw is replacing wireless-tools
> I think it should move to OE-core instead.

Maybe; we can look at that for 1.5. I'd argue that package group shouldn't 
really be in meta-oe though; some time ought to be spent getting us to a state 
where we don't need another package group named "packagegroup*-base". Your 
help would be appreciated there.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


