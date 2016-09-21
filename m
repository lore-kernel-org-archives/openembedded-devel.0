Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id D6F0D7197E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:38:14 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id v2so2169946ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=gb3G90X8YqxaHa3wVuW8l4WXXkpW4paRnHQbSdW8v0A=;
	b=VJEUljOxjQGKoC62ZZI43wH/7DQS1QY211oaXBJ+nGwQJvoFuDvlO/V4/+a58RoLPw
	8dPs+icRbQeXirdryPbbe+iiiMen2Y2EA4Goo7g11lKUpzblLMdE9b/kikoAYp6oeuno
	yo6cfY2QxuyTxVNSFnxx7xqIkzdIy4s95aLFqstw9D4ohD9mIFtRqSOb5Cej3vYyMyEp
	rF6Welo/ETVs+KBPmw5GfNDRR/Fn/gtmapTGNu2PuQI5y3xix/jhBD1zEuyGugjrdYkK
	Q1m0zdpI353XLY9YOO5r9yawXEd8/TMvbiFhEpF5L9HFKxF6bGAMYZq2KciRcf2d/XqO
	H1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=gb3G90X8YqxaHa3wVuW8l4WXXkpW4paRnHQbSdW8v0A=;
	b=lGeAJbf4kcTNEKKUyZNqg0t8OcR6yF1u1PzaSVSWW4WfW9xROBN90cnbvzo/6f4Owv
	Mx79TiM+HaPDj48tFT6uCv88uxJv40JA/J7/uxC+UMBiHXN8tU1EvK4sqvbMc2062mz+
	yosmBgg8noJpSvKU1FAtq1KMN1XN+HvH+cc0BXcCC73+HTddvxxM+VtSvvWmpDTp2QKB
	TisbQUerf9A60T3t16+BBwRvuvwnKMuzsgrBsfJHrw2FeKHuIQbWR5p8bHXJ9BlzKc8G
	lM9vO0pgyYQP0opWXPtvAF9e9iXDMDrU0li8I3UFvSC2cb0oE9rAiANBm2z7pSMZGGCb
	+0Nw==
X-Gm-Message-State: AE9vXwOXF1X0wzHhSowyeahRYZkeela3d2i+XUZkLhK3TJTGAKohQV5p9NCfU0bezQbG1u1GHHLV+ff3Bvplhw==
X-Received: by 10.129.105.139 with SMTP id e133mr24366815ywc.327.1474447095499;
	Wed, 21 Sep 2016 01:38:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 21 Sep 2016 01:38:15 -0700 (PDT)
In-Reply-To: <20160921073909.18711-1-jackie.huang@windriver.com>
References: <20160921073909.18711-1-jackie.huang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 21 Sep 2016 10:38:15 +0200
Message-ID: <CALbNGRSa9k2ws4viwiv+vL4un+TofNy7UGxn_9bjzGdONcBqmg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] samba: remove blacklist
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
X-List-Received-Date: Wed, 21 Sep 2016 08:38:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 21, 2016 at 9:39 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> * The libpam dependency issue is fixed by:
>
>   12a118989296d13e036d0daa9f9a3d45eee03ded
>   waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS
>
> * I can't never reproduce the issue with new binutils-2.27,
>   but it should be fixed by:
>
>   b60c60806e57f69233db582ef88d113867c2ecd1
>   samba: fix build by linking with bfd instead of gold
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index 7d7fa02..3686faa 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -317,8 +317,3 @@ FILES_${PN}-python-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.d
>
>  RDEPENDS_${PN}-pidl_append = " perl"
>  FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
> -
> -# http://errors.yoctoproject.org/Errors/Details/81004/
> -# before this issue it was also failing in do_package and
> -# autodetecting libpam dependency
> -PNBLACKLIST[samba] ?= "BROKEN: fails to build with new binutils-2.27"
> --
> 2.8.3
>
> --
Same patch from Joe MacDonald is in master-next and I assume it is
under Martin's world test currently.

Andreas

