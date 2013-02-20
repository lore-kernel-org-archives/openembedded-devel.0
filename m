Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U8H40-0006QF-CV
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 22:18:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Feb 2013 13:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,703,1355126400"; d="scan'208";a="289779575"
Received: from unknown (HELO helios.localnet) ([10.252.120.139])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2013 13:02:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: eu@felipetonello.com
Date: Wed, 20 Feb 2013 21:02:32 +0000
Message-ID: <2925141.cvO3V2bK64@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1361386023-5046-1-git-send-email-ftonello@cercacor.com>
References: <1361386023-5046-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] macchanger: added 1.5.0 recipe
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
X-List-Received-Date: Wed, 20 Feb 2013 21:18:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 February 2013 10:47:03 eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
> 
> This is a useful utility to manipulate the mac address of a device.
> 
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  .../recipes-support/macchanger/macchanger_1.5.0.bb |   20
> ++++++++++++++++++++ 1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb
> 
> diff --git a/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb
> b/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb new file mode
> 100644
> index 0000000..21c8425
> --- /dev/null
> +++ b/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "macchanger"
> +DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address
> of network interfaces." 
> +HOMEPAGE = "http://www.alobbs.com/macchanger"
> +LICENSE  = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +PR = "r2"
> +
> +SRC_URI  = "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
> +SRC_URI[sha256sum] =
> "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe" +
> +FILES_${PN} = " \
> +  ${bindir}/${PN} \
> +  ${datadir}/${PN}/wireless.list \
> +  ${datadir}/${PN}/OUI.list \
> +"
> +
> +inherit autotools
> \ No newline at end of file

I think this should go in meta-networking rather than meta-oe. Also you should 
probably just do FILES_${PN} += "${datadir}/${PN}", remove PR, and set SUMMARY 
to something sensible e.g. "Tool to view/change network interface MAC 
addresses".

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


