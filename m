Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QmOeZ-0005SO-Ss
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 13:21:24 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2011 04:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,281,1309762800"; d="scan'208";a="31188898"
Received: from unknown (HELO helios.localnet) ([10.255.17.244])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2011 04:17:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
Date: Thu, 28 Jul 2011 12:17:05 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <4E31324C.3030901@nedap.com>
	<201107281131.58174.paul.eggleton@linux.intel.com>
	<4E314453.8080107@nedap.com>
In-Reply-To: <4E314453.8080107@nedap.com>
MIME-Version: 1.0
Message-Id: <201107281217.05726.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: how to apply bbappend selectively
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
X-List-Received-Date: Thu, 28 Jul 2011 11:21:24 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 28 July 2011 12:13:23 Jaap de Jong wrote:
> But it will still create processor-related packages instead of
> machine-related.
> I probably need some magic flag set to get it machine-related (or
> perhaps better: image-related)?

Well, PACKAGE_ARCH_somemachine = "${MACHINE_ARCH}" will do that; although if 
you're manipulating SRC_URI then it's supposed to set that automatically.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


