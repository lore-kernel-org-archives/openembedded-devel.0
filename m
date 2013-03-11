Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UF55K-0002ju-FL
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 16:56:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 08:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,824,1355126400"; d="scan'208";a="303961153"
Received: from unknown (HELO helios.localnet) ([10.255.13.37])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2013 08:39:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: wenzong.fan@windriver.com
Date: Mon, 11 Mar 2013 15:38:11 +0000
Message-ID: <1599644.gZKTPRS2fY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-25-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1362994719-12276-1-git-send-email-wenzong.fan@windriver.com>
References: <1362994719-12276-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: wfan@windriver.com, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] meta-networking: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Mon, 11 Mar 2013 15:56:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 March 2013 17:38:39 wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> Add LAYERVERSION and LAYERDEPENDS to layer.conf
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta-networking/conf/layer.conf |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-networking/conf/layer.conf
> b/meta-networking/conf/layer.conf index 1ea2bc2..f75080a 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -9,3 +9,8 @@ BBFILE_COLLECTIONS += "networking"
>  BBFILE_PATTERN_networking := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_networking = "5"
> 
> +# This should only be incremented on significant changes that will
> +# cause compatibility issues with other layers
> +LAYERVERSION_networking = "1"
> +
> +LAYERDEPENDS_networking = "core"

This is good, but it might be useful to also set a versioned dependency on the 
core - that way if you attempt to use the denzil branch of OE-Core with master 
of one of these layers, instead of an error about incorrect indentation in 
python functions you get one specifically about the version being incorrect.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


