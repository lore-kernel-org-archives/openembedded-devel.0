Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B19346AFFD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 10:04:06 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2013 03:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1001,1363158000"; d="scan'208";a="327126349"
Received: from unknown (HELO helios.localnet) ([10.252.122.22])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 03:04:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chunrong Guo <B40290@freescale.com>
Date: Fri, 05 Jul 2013 11:03:58 +0100
Message-ID: <1458787.tDvFv7sPWT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1373018084-5555-1-git-send-email-B40290@freescale.com>
References: <1373018084-5555-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, b40527@freescale.com
Subject: Re: [meta-oe][PATCH] samba:Add /run into package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2013 10:04:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 05 July 2013 17:54:44 Chunrong Guo wrote:
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-oe/recipes-connectivity/samba/samba-basic.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc
> b/meta-oe/recipes-connectivity/samba/samba-basic.inc index d0fa8e6..6cead01
> 100644
> --- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
> @@ -20,6 +20,7 @@ FILES_${PN} += "${libdir}/vfs/*.so \
>                  ${libdir}/*.dat \
>                  ${libdir}/auth/*.so \
>                  ${libdir}/security/pam_smbpass.so \
> +                /run \
>  "
> 
>  FILES_${PN}-dbg += "${libdir}/vfs/.debug/*.so \

Is this the correct solution? See:

http://article.gmane.org/gmane.comp.handhelds.openembedded/58530 

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

