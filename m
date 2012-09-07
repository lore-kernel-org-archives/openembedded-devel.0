Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9zzx-0000UO-5F
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 16:57:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2012 07:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,387,1344236400"; d="scan'208";a="142616692"
Received: from unknown (HELO helios.localnet) ([10.252.121.175])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2012 07:45:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sander van Grieken <sander@outrightsolutions.nl>
Date: Fri, 07 Sep 2012 15:45:04 +0100
Message-ID: <10954300.mCDNzomlzm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <504A0641.7010403@outrightsolutions.nl>
References: <5049BEFD.9040003@outrightsolutions.nl> <1561903.1HycqArB5v@helios>
	<504A0641.7010403@outrightsolutions.nl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: linux-firmware
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
X-List-Received-Date: Fri, 07 Sep 2012 14:57:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 07 September 2012 16:35:45 Sander van Grieken wrote:
> On 09/07/2012 04:20 PM, Paul Eggleton wrote:
> > We should always be including the license file if present I believe.
> > 
> > As for the package splitting I would advocate some kind of automated
> > splitting using do_split_packages rather than manually packaging
> > everything if we can> 
> > avoid it. FYI I wrote something about the use of this here:
> >   https://wiki.yoctoproject.org/wiki/Handling_optional_module_packaging
> > 
> 
> Ok thanks, that looks promising. Although the requirement 'Must
> include %s' would mean that the naming follows firmware, and probably
> serious regexp juggling is needed if you want to match a list of
> firmware files for a single package.

I haven't looked closely at the structure of the firmware repo, but depending 
on that it could make things tricky yes. You only have to make sure that the 
first item in the regex (enclosed in parentheses) matches the name you want for 
the package, though. It's also possible to add additional files either with 
aux_files_pattern/aux_files_pattern_verbatim or on an individual basis using 
FILES_packagename += "path/to/file".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


