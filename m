Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1D3D6D242
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 21:48:53 +0000 (UTC)
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
 by mx.groups.io with SMTP id smtpd.web10.82582.1732744128784809907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 13:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@g0hl1n.net header.s=key1 header.b=YvTAPxB4;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.177, mailfrom: dev@g0hl1n.net)
Date: Wed, 27 Nov 2024 22:48:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1732744126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1CGr7Moz3mZ/guzg+pEmvmXuMjT9MDy7RT0eLnhpdtg=;
	b=YvTAPxB4c5jvTyOkG8vHDMw8C4LBUAMHNLfEW8UNAh+g1jtQbGdTU+eTTLs7OZYnOjEShH
	bRb4ajdhMEk9869zT6XUKNfX2RdWaIIYIn7Y2ax0TOYSR6VxqLgIpgX4FM2YoVleEvIQiV
	8wvlm/X5psD85mxoHMv/RcdWLn8AWTg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org, leon.anavi@konsulko.com
Subject: Re: [oe] [meta-python] [PATCH 29/46] python3-moteus: upgrade 0.3.72
 -> 0.3.73
Message-ID: <kbwywvujpwobtcitjixqudv3nxgrsqoz5qu4jol7t3mijtdb7n@gf6o3adxdc7f>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
 <1730874660-2364-29-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1730874660-2364-29-git-send-email-wangmy@fujitsu.com>
X-Migadu-Flow: FLOW_OUT
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 21:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114099

Hi Wang, Hi Leon,

I just stubled across this patch as I was working on updating moteus
too. Leon, I've put you on CC as you also updated moteus once and therefore
may be interested in this topic.

Wang, unfortunately it seems you mixed up the subject and content of this
patch as it updates python3-marshmallow, but has python3-moteus in the
subject.

And another point I came across was that moteus python packages >=
0.3.73 are no longer providing source distributions on pypi.org or
pythonpackages.org. Therefore this patch would result in a broken
fetch for python3-moteus if it really was updating moteus.

As I found no references/reasoning for the missing source packages I
opened an issue upstream: https://github.com/mjbots/moteus/issues/77

regards;rl

On Wed, Nov 06, 2024 at 02:30:43PM +0800, wangmy@fujitsu.com wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...hon3-marshmallow_3.22.0.bb => python3-marshmallow_3.23.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-marshmallow_3.22.0.bb => python3-marshmallow_3.23.1.bb} (92%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb
> rename to meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
> index 269522dce..715439588 100644
> --- a/meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
>                      file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
>                      file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
>  
> -SRC_URI[sha256sum] = "4972f529104a220bb8637d595aa4c9762afbe7f7a77d82dc58c1615d70c5823e"
> +SRC_URI[sha256sum] = "3a8dfda6edd8dcdbf216c0ede1d1e78d230a6dc9c5a088f58c4083b974a0d468"
>  
>  inherit python_flit_core pypi ptest
>  
> -- 
> 2.34.1
> 
> 

