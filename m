Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 32F447F7A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 07:52:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47hBQv0J35z4f;
	Mon, 23 Dec 2019 08:52:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577087559;
	bh=vZR3TtfmT7l5b8PYym0p4Bu+RZXabnc/YUMeTdbVwig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cl48WUwMDZcOpONHoAM2Z7XpBZC2QAmRa2xJVgFBZMW/e1BIWec/Q/hZ8QPxJdb5I
	rbfuPrq3zxsXdpwtMTozVpfug8wDYwXTkL1wr+UKrw5b1/5DWgVIXTW3ms4awQS7Xp
	i5PBT6/ESPc29c04UEMn+z9XBfigvvq0TfvCYIIMIp3wujyEIbLz/ehlrj2eaNiJHg
	lmLCkgyYMmF7wDgNeHOW38SQtO7jSFfRe0KIS2Tss4iwCC5amzmDNfVSgGxqvVYmKa
	j1Dc7Pl/N4aTPLsIlLYD87yLuAdMIteVYZj9I84cXc1kMrtm6lrlpf4A/GnuiRo3wj
	GHjtJkod9CEIWNsGABqV/wXDXtyv2Dt2/OXiY9bWXh5leWwfLc1ZqTIg3UEQRCSbYS
	RPE0c32H1HE6BC2tL5lzpY+QaXjYpFNElYNMWpy5NGSUW28x5qMInT8yEBcTnCDpUa
	2+/YgL3lwLo3rr9c46NynLEAUuALBpcf0F0vj5CD2z8tSLb7diQ+c0RY9EMpCQvOV5
	TILDBV5grYpe503YrxsJf+plUBH40LAMzE6hinTG+RkxKwyWdbBtorpwk5J3H2ew5q
	9olWz2zhypcBqgSU3zkNXk6dpGdvFNZC96++iIc8KAFouoFHFnstBdtm7PQUo0w9b4
	BVy2U1Ojsau571aOfbdrBmF8=
Date: Mon, 23 Dec 2019 09:52:36 +0200
From: Adrian Bunk <bunk@stusta.de>
To: quanyang.wang@windriver.com
Message-ID: <20191223075236.GA16532@localhost>
References: <20191223071421.24530-1-quanyang.wang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191223071421.24530-1-quanyang.wang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] glog: fix do_fetch error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Dec 2019 07:52:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 23, 2019 at 03:14:21PM +0800, quanyang.wang@windriver.com wrote:
> From: Quanyang Wang <quanyang.wang@windriver.com>
> 
> This fixes the build error as below:
> WARNING: glog-0.3.5-r0 do_fetch: Failed to fetch URL git://github.com/google/glog.git;branch=v035, attempting MIRRORS if available
> ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure: Unable to find revision a6a166db069520dbbd653c97c2e5b12e08a8bb26 in branch v035 even from upstream
> ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure for URL: 'git://github.com/google/glog.git;branch=v035'. Unable to fetch URL from any source.
>...
> --- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
> +++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
> @@ -9,14 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
>  DEPENDS = "libunwind"
>  
>  SRC_URI = " \
> -    git://github.com/google/glog.git;branch=v035 \
> +    git://github.com/google/glog.git;nobranch=1;tag=v0.3.5 \
>...
> -SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
>...

Please continue using SRCREV instead of tag.

Upstream could move a tag to a different commit, or someone could
do a man-in-the middle attack providing anything under this tag.

cu
Adrian

