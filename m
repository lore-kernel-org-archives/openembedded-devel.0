Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCywd-0000rz-1j
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 21:54:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Mar 2012 12:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147105645"
Received: from unknown (HELO helios.localnet) ([10.252.123.243])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2012 12:45:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 20:45:04 +0100
Message-ID: <2372633.2CZh3kKOpL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CACW_hTZ1Bu7X12=BLq+dfX-xHQzy829_w-fjwDX0VEeSTuBw7Q@mail.gmail.com>
References: <1332888458-15872-1-git-send-email-ajlennon@dynamicdevices.co.uk>
	<CACW_hTZ1Bu7X12=BLq+dfX-xHQzy829_w-fjwDX0VEeSTuBw7Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Alex J Lennon <ajlennon@gmail.com>
Subject: Re: [PATCH] Modified fetch() checksums to be correct for libpng 1.4.28 released 15/3/12 (current) instead of previous 8/3/12 release
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
X-List-Received-Date: Wed, 28 Mar 2012 19:54:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 March 2012 10:34:16 Frans Meulenbroeks wrote:
> PS: thinking of it: we might be able to resolve the latter issue by
> forcing the removal of a file from downloads (and trigger a refetch)
> if the .md5 does not match the md5 in the recipe.

FYI, I'm pretty sure that fetch2 from the version of bitbake we use with OE-
Core will skip to the next available option (mirror) if the downloaded file 
doesn't match the SRC_URI checksum. Of course that's assuming there is a 
mirror available.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


