Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D8F2D6CE6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 17:10:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Oct 2013 10:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1064,1371106800"; d="scan'208";a="414399214"
Received: from unknown (HELO helios.localnet) ([10.252.120.216])
	by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2013 10:10:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 09 Oct 2013 18:10:03 +0100
Message-ID: <3268244.aCmzNLyDMJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1381275653-25949-1-git-send-email-andrea.adami@gmail.com>
References: <1381275653-25949-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 1/3] ipaq-boot-params: h3600: use ttySA0 as default param
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
X-List-Received-Date: Wed, 09 Oct 2013 17:10:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 09 October 2013 01:40:51 Andrea Adami wrote:
> These machines use ttySA0,115200n8 (SA1100).
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-bsp/ipaq-boot-params/files/h3600/params | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 recipes-bsp/ipaq-boot-params/files/h3600/params
> 
> diff --git a/recipes-bsp/ipaq-boot-params/files/h3600/params
> b/recipes-bsp/ipaq-boot-params/files/h3600/params new file mode 100644
> index 0000000..edb83ac
> --- /dev/null
> +++ b/recipes-bsp/ipaq-boot-params/files/h3600/params
> @@ -0,0 +1 @@
> +set linuxargs "root=mtd1 noinitrd console=ttySA0,115200n8 console=tty0"

These three patches and the other one they depended on have been merged. Hope 
to get a moment to try this stuff out on my h3600 soon.

Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

