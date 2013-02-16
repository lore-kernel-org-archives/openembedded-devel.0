Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U6oQW-0000TW-MA
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 21:32:05 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Feb 2013 12:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,678,1355126400"; d="scan'208";a="203134252"
Received: from unknown (HELO helios.localnet) ([10.252.120.76])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Feb 2013 12:15:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Amy Fong <amy.fong@windriver.com>
Date: Sat, 16 Feb 2013 20:15:56 +0000
Message-ID: <6456139.EfBreeO2R8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <20130215185826.GA873@windriver.com>
References: <20130215185826.GA873@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-webserver] apache2 multilib issues
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
X-List-Received-Date: Sat, 16 Feb 2013 20:32:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Amy,

On Friday 15 February 2013 13:58:26 Amy Fong wrote:
> apache2: multilib issues
> 
> Building a multilib version of apache2 results in many packages
> being installed but not packaged, resulting in apache2 being
> unable to run.
> 
> We fix this by modifying the FILES*${PN} to specify BPN instead of PN
> where required. (Also make he required change for CONFFILES_${PN})
> 
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> --
>  apache2_2.4.2.bb |   26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/recipes-httpd/apache2/apache2_2.4.2.bb
> b/recipes-httpd/apache2/apache2_2.4.2.bb index af8c4ca..1ed189b 100644
> --- a/recipes-httpd/apache2/apache2_2.4.2.bb
> +++ b/recipes-httpd/apache2/apache2_2.4.2.bb

This patch is effectively against the danny branch; master has moved on to 
version 2.4.3. I was about to rebase it on top of master and then I noticed 
that there are still some PN references in the value of EXTRA_OECONF that 
might be problematic for the multilib case. This patch will certainly fix the 
warnings, but has it been tested at runtime?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


