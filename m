Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RLi0t-0007EW-9F
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 22:06:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Nov 2011 14:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="70560391"
Received: from unknown (HELO helios.localnet) ([10.252.121.83])
	by orsmga001.jf.intel.com with ESMTP; 02 Nov 2011 14:00:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 02 Nov 2011 21:00:12 +0000
Message-ID: <2904446.7I7DN7edGu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <1318807611-16837-2-git-send-email-andrea.adami@gmail.com>
References: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
	<1318807611-16837-2-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 2/3] udev: add bbappend and disable device cache as default.
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
X-List-Received-Date: Wed, 02 Nov 2011 21:06:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 17 October 2011 01:26:50 Andrea Adami wrote:
> * For some reasons when the cache is created root can still be ro
> * and as solution you would be obliged to add 'rw' to your commandline.
> * There are patches in openembedded-classic to correct this
> * (and those are still pending for meta-oe).
> * Until a solution is found disable the creation of the device cache on
> boot.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-core/udev/udev/default      |    4 ++++
>  recipes-core/udev/udev_173.bbappend |    1 +
>  2 files changed, 5 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-core/udev/udev/default
>  create mode 100644 recipes-core/udev/udev_173.bbappend
> 
> diff --git a/recipes-core/udev/udev/default b/recipes-core/udev/udev/default
> new file mode 100644
> index 0000000..ba2867e
> --- /dev/null
> +++ b/recipes-core/udev/udev/default
> @@ -0,0 +1,4 @@
> +# Default for /etc/init.d/udev
> +
> +# Uncomment this out to enable device cache
> +#DEVCACHE="/etc/dev.tar"
> diff --git a/recipes-core/udev/udev_173.bbappend
> b/recipes-core/udev/udev_173.bbappend new file mode 100644
> index 0000000..72d991c
> --- /dev/null
> +++ b/recipes-core/udev/udev_173.bbappend
> @@ -0,0 +1 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

I think this is going to cause problems for distros such as Angstrom that 
enable this layer without always using it. Can we just disable the dev cache 
for the machines in meta-handheld?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


