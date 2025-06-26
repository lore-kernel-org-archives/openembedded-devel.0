Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D81C7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 14:50:53 +0000 (UTC)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
 by mx.groups.io with SMTP id smtpd.web11.9938.1750949443010286428
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 07:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@g0hl1n.net header.s=key1 header.b=NS08eSLM;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.173, mailfrom: dev@g0hl1n.net)
Date: Thu, 26 Jun 2025 16:50:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1750949441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nM836ZtruNdh5gP9XNstdWmigVYy8MH5ZQsyuDmteic=;
	b=NS08eSLMJWCu+BgMPfOt1zfRv/kOrK4CqS72CmFW5Mjpzkcx842LBaif0JyDT2w5pZmJ+F
	Hcm3HhatE/dMHKMXEPnRDCrs6JX8iyjlZUJvwGZwW4PwrVOG4/AzV/LuIqK877OY2jMAdu
	laA1e8irlJUc05IgqBQ/42OsVtsNBk0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <richard.leitner@advastore.com>
Subject: Re: [meta-python][PATCH] python3-can: upgrade 4.4.2 -> 4.5.0
Message-ID: <t4jv2rovok75x6zdlbeuzrvg44upmwlh6c2odbvxywlm4hgbvu@lvxwmbuhcnhi>
References: <20250626144740.3775245-1-dev@g0hl1n.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626144740.3775245-1-dev@g0hl1n.net>
X-Migadu-Flow: FLOW_OUT
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 14:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118129

Hi,

please ignore this one.

v2 is out already.

Thanks :-)

regards;rl

On Thu, Jun 26, 2025 at 04:47:40PM +0200, Richard Leitner wrote:
> python3-can 4.4.y requires msgpack~=1.0.0, but openembedded-core
> versions newer than scarthgap provide msgpack 1.1.0 [1], causing
> "pip check" to fail with the following error:
> 
>     python-can 4.4.2 has requirement msgpack~=1.0.0; platform_system != "Windows", but you have msgpack 1.1.0.
> 
> This patch resolves the issue by updating python3-can to 4.5.0.
> 
> [1] https://layers.openembedded.org/layerindex/recipe/66997/
> Signed-off-by: Richard Leitner <richard.leitner@advastore.com>
> ---
>  .../python/{python3-can_4.4.2.bb => python3-can_4.5.0.bb}    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-can_4.4.2.bb => python3-can_4.5.0.bb} (83%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-can_4.4.2.bb b/meta-python/recipes-devtools/python/python3-can_4.5.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-can_4.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-can_4.5.0.bb
> index 31190a9f1d..8e32cee622 100644
> --- a/meta-python/recipes-devtools/python/python3-can_4.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-can_4.5.0.bb
> @@ -4,13 +4,15 @@ SECTION = "devel/python"
>  LICENSE = "LGPL-3.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
>  
> -SRC_URI[sha256sum] = "1c46c0935f39f7a9c3e76b03249af0580689ebf7a1844195e92f87257f009df5"
> +SRC_URI[sha256sum] = "d3684cebe5b028a148c1742b3a45cec4fcaf83a7f7c52d0680b2eaeaf52f8eb7"
>  
>  PYPI_PACKAGE = "python_can"
>  UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>  
>  inherit pypi python_setuptools_build_meta
>  
> +DEPENDS += "python3-setuptools-scm-native"
> +
>  RDEPENDS:${PN} += "\
>      python3-aenum \
>      python3-asyncio \
> @@ -21,6 +23,7 @@ RDEPENDS:${PN} += "\
>      python3-json \
>      python3-logging \
>      python3-misc \
> +    python3-msgpack \
>      python3-netserver \
>      python3-packaging \
>      python3-pkg-resources \
> -- 
> 2.47.2
> 

