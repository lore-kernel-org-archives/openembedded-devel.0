Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9Gaq-000833-E6
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 16:28:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Sep 2012 07:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,374,1344236400"; d="scan'208";a="218379145"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2012 07:16:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ml@communistcode.co.uk
Date: Wed, 05 Sep 2012 15:16:10 +0100
Message-ID: <4375690.RKMBt9Sfd5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1346853750-503-3-git-send-email-ml@communistcode.co.uk>
References: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
	<1346853750-503-3-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] libcec: update libcec to latest version (1.8.2) as to include RasPi support
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
X-List-Received-Date: Wed, 05 Sep 2012 14:28:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 September 2012 15:02:30 ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> - Now depends on liblockdev
> - Slight licence change - new md5sum
> 
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  meta-oe/recipes-extended/libcec/libcec_git.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb
> b/meta-oe/recipes-extended/libcec/libcec_git.bb index 142b2e2..f3cb39e
> 100644
> --- a/meta-oe/recipes-extended/libcec/libcec_git.bb
> +++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
> @@ -1,14 +1,14 @@
>  DESCRIPTION = "USB CEC Adaptor communication Library"
>  HOMEPAGE = "http://libcec.pulse-eight.com/"
> 
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=185ead350fec5fc223da0f65f9a802af"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
> 
> -DEPENDS = "udev"
> +DEPENDS = "udev liblockdev"
> 
>  PR = "r1"
> -PV = "1.4.0"
> -SRCREV = "2db8981f49fbd167ddbbf19c1fbadd064abc332a"
> +PV = "1.8.2"
> +SRCREV = "34a9cecdd92f6b2844f9c4054da202b152ab2217"
>  SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
> 
>  S = "${WORKDIR}/git"

It's not totally clear but it doesn't look like 1.8.2 has been released yet 
judging from their website; if that's the case then PV should be set to 
"1.8.1+git${SRCPV}".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


