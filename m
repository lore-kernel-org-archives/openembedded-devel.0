Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 768B16AE2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 17:29:05 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2013 10:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1003,1363158000"; d="scan'208";a="264528270"
Received: from unknown (HELO helios.localnet) ([10.252.122.22])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jul 2013 10:29:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 05 Jul 2013 18:29:04 +0100
Message-ID: <2710952.otpci6RPJ6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Fri, 05 Jul 2013 17:29:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 05 July 2013 14:01:16 Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend}        | 2
> -- 1 file changed, 2 deletions(-)
>  rename meta-oe/recipes-core/busybox/{busybox_1.20.2.bbappend =>
> busybox_1.21.1.bbappend} (91%)
> 
> diff --git a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> b/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend similarity index 91%
> rename from meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> rename to meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
> index 721ef19..7a2f0c3 100644
> --- a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> +++ b/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
> @@ -1,5 +1,3 @@
> -PRINC := "${@int(PRINC) + 1}"
> -
>  # look for files in the layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

Could someone *please* figure out what this bbappend is needed for and get it 
into OE-Core if it is still needed so we can drop it here?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

