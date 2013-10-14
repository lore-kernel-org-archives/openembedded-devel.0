Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8276B6BF59
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:17:55 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Oct 2013 06:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,492,1378882800"; d="scan'208";a="374451418"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by azsmga001.ch.intel.com with ESMTP; 14 Oct 2013 06:17:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Oct 2013 14:17:54 +0100
Message-ID: <4361531.hClRJC4flL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1310120729440.21801@oneiric>
References: <alpine.DEB.2.02.1310120729440.21801@oneiric>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] core-image.bbclass: Fix comment to refer to packagegroup-base-extended.
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
X-List-Received-Date: Mon, 14 Oct 2013 13:17:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Saturday 12 October 2013 07:33:46 Robert P. J. Day wrote:
> Fix the comment to match the actual inclusion further down in that
> file, which is:
> 
> CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   feel free to ignore this if there are any other changes i can add to
> this to make a larger single patch out of it.
> 
> diff --git a/meta/classes/core-image.bbclass
> b/meta/classes/core-image.bbclass index e7c34e2..2982ff6 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
> 
>  # IMAGE_FEATURES control content of the core reference images
>  #
> -# By default we install packagegroup-core-boot and packagegroup-base
> packages - this gives us -# working (console only) rootfs.
> +# By default we install packagegroup-core-boot and
> packagegroup-base-extended packages - +# this gives us working (console
> only) rootfs.
>  #
>  # Available IMAGE_FEATURES:
>  #

This patch needs to go to the OE-Core list.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

