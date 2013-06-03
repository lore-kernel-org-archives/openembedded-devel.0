Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 73EE4621EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 22:33:46 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Jun 2013 15:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,795,1363158000"; d="scan'208";a="311768890"
Received: from unknown (HELO helios.localnet) ([10.252.121.198])
	by azsmga001.ch.intel.com with ESMTP; 03 Jun 2013 15:33:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: danismostlikely@gmail.com
Date: Mon, 03 Jun 2013 23:33:44 +0100
Message-ID: <3117017.MfZg7kr1Wt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-23-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1370297534-9882-2-git-send-email-danismostlikely@gmail.com>
References: <1370297534-9882-1-git-send-email-danismostlikely@gmail.com>
	<1370297534-9882-2-git-send-email-danismostlikely@gmail.com>
MIME-Version: 1.0
Cc: Dan McGregor <dan.mcgregor@usask.ca>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core][PATCH] Make Python IPv6 aware
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
X-List-Received-Date: Mon, 03 Jun 2013 22:33:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Dan,

On Monday 03 June 2013 16:12:14 danismostlikely@gmail.com wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> Wrap this around DISTRO_FEATURES, because we don't want it
> unconditionally enabled.
> ---
>  meta/recipes-devtools/python/python.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python.inc
> b/meta/recipes-devtools/python/python.inc index d0ed55b..4618eb3 100644
> --- a/meta/recipes-devtools/python/python.inc
> +++ b/meta/recipes-devtools/python/python.inc
> @@ -19,6 +19,7 @@ inherit autotools
>  PYTHONLSBOPTS = "--with-wctype-functions"
>  PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"
> 
> +ENABLE_IPV6 = "--enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6',
> 'yes', 'no', d)}" EXTRA_OECONF = "\
>    --with-threads \
>    --with-pymalloc \
> @@ -27,5 +28,6 @@ EXTRA_OECONF = "\
>    --with-signal-module \
>    --with-wctype-functions \
>    --enable-shared \
> +  ${ENABLE_IPV6} \
>    ${PYTHONLSBOPTS} \
>  "

OE-Core patches need to go to openembedded-core@lists.openembedded.org rather 
than this list. Also, the shortlog (first line of the commit message) should 
start with the recipe / component being changed, so in this case it should be 
something like "python: enable IPv6 based on DISTRO_FEATURES". Additionally, 
do you need to use an additional ENABLE_IPV6 variable here or can you just 
include the expression within the EXTRA_OECONF expression?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

