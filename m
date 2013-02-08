Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kbd-0002FR-8i
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 10:50:55 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Feb 2013 01:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="200038411"
Received: from unknown (HELO helios.localnet) ([10.252.120.51])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Feb 2013 01:34:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 08 Feb 2013 09:34:49 +0000
Message-ID: <1419614.dDVzLBbgHh@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Some recipes from my work on HipHopVM
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
X-List-Received-Date: Fri, 08 Feb 2013 09:50:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 07 February 2013 11:50:55 Marcin Juszkiewicz wrote:
> Some time ago I started working on porting HipHopVM for AArch64
> platform. My job was to identify and build all dependencies. Effect of
> it is in this patchset.
> 
> I added them to meta-oe/recipes-support/ just to show them and get
> suggestions where to move them. Some may be useful for people outside of
> HHVM (which is 64bit only and (iirc) supports x86-64 now).
> 
> For most of them I will have updates during next months.

Thanks. I'm willing to be contradicted, but I would think (lib)memcached might 
be best placed in meta-webserver.

Also, it would be great if generally people could start including SUMMARY as 
well as DESCRIPTION in their recipes if they aren't already doing so.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


