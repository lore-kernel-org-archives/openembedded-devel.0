Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPwZe-0006lE-5Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 17:04:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2013 07:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="225557421"
Received: from unknown (HELO helios.localnet) ([10.255.14.51])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Apr 2013 07:47:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
Date: Wed, 10 Apr 2013 15:47:09 +0100
Message-ID: <2302654.XPc2iUTDec@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <5165792D.9070200@nedap.com>
References: <51656126.2020505@nedap.com> <2047971.fHFQ1GD4mc@helios>
	<5165792D.9070200@nedap.com>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: dropbear
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
X-List-Received-Date: Wed, 10 Apr 2013 15:04:50 -0000
X-List-Received-Date: Wed, 10 Apr 2013 15:04:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 10 April 2013 16:37:33 Jaap de Jong wrote:
> On 04/10/2013 04:04 PM, Paul Eggleton wrote:
> > On Wednesday 10 April 2013 14:55:02 Jaap de Jong wrote:
> >> dropbear 2013.56 is currently the most recent version.
> >> Although not documented, they left out the functionality patched in with
> >> allow-nopw.patch in the 2013.56 release.
> > 
> > How did you find this out?
> 
> the patch fails and inspection of the code learns that it can't be applied.

Ah right - to explain what has happened, I developed a new patch to change 
dropbear so that the functionality is now controlled through a command-line 
switch, and that is now configured in the image using a script in 
/etc/default/; if you look at the dropbear recipe in master you can see how it 
works. This avoids the need to rebuild dropbear depending upon the value of 
IMAGE_FEATURES which was not really ideal.

If you want to use the latest version of dropbear with an older branch I'd 
suggest just taking the dropbear recipe in master, removing the nopw-option 
patch (which has been applied).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


