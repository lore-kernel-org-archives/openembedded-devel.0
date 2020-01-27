Return-Path: <prvs=288f39d4d=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8F87FD37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580119404; x=1611655404;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=I2KqyJpmA7KZGn4fus5lbYaExe3yLfFOxIXR09il3lk=;
	b=S28wz4lGk8sS24SJfQtZWAe7jK1ZN2iHaWDn7/Tx/MbKCi596o30eudb
	FbpQgp4pMyaRPdNqd8DUlQtErKdyZzx8ygfPDaUWUExxKDk4AVzvVcT99
	Yqg9Ke+R932OcAK4NVRuHXIZB/1s4v/6xPQQkcpy1mcJJJ0WFXtLkNYxP
	Vhf446S2uj+N1InqokOE65yqSj+2yW03YM5UnJygGqnZojDpjCwU1Uvho
	Rkw+ncEBdMbKV5/k8S/rsAsM2v/Hnuw2pqQcdmLRXVdsJJbkSFfp6Vhi9
	CkGDS+L5xNvoR92YYGie+dHTSYiJgFjAxR2UCSH/0K24eNuH7YVtNTHam w==;
IronPort-SDR: Y7ov4CDBAXIyhm2gS1PFBbvbd8M1UQgUSr8YiFh5/Eu3m1fQb+3WY/Xod9Z+3QmuGos2Abu1Gd
	KkWoGamofabfxnJXxHpCUh9j8o7fL2/FgLKulCPUH7QqHsZONjv0mm2KLPrwgH48877HN1F2R4
	N96Vjrd1dm4JmLcwSsd1J2TNDvpi4ha986WZXzxNjogRvFyJ+BcXXQdpZad5jQtoLUBCKRYW3f
	/glAoiS5qYWJM/cZ95cPqXBOw5zrWDTWAAy3ZvzdBke0KfB2Ufsiho3InKdaVNHYeON+5yLt50
	47s=
X-IronPort-AV: E=Sophos;i="5.70,369,1574118000"; d="scan'208";a="22273521"
Date: Mon, 27 Jan 2020 11:03:23 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Kraag Gorim <kraaggorim@gmail.com>
Message-ID: <20200127100323.GC2982185@pcleri>
References: <CACc3Zv5viBSLrGYNsumrn9xt8Aq+aXHGz0BWH6w5sAs0MMAHjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACc3Zv5viBSLrGYNsumrn9xt8Aq+aXHGz0BWH6w5sAs0MMAHjg@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] [meta-java] java-library: inherit python native
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
X-List-Received-Date: Mon, 27 Jan 2020 10:03:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
     git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

Please note that this patch wasn't formatted correctly as some extra
linebreaks were inserted.
To avoid this in the future please fix your mail program or use
git-send-email. Thanks!

regards;rl

On Fri, Jan 24, 2020 at 05:22:14PM +0100, Kraag Gorim wrote:
> Several components make use of python in their build process. To not
> rely on python being part of the HOSTTOOLS python should be inherited.
> 
> Signed-off-by: Kraag Gorim <kraaggorim@gmail.com>
> ---
>  classes/java-library.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
> index e0159ba..496be33 100644
> --- a/classes/java-library.bbclass
> +++ b/classes/java-library.bbclass
> @@ -17,6 +17,7 @@ PACKAGE_ARCH ?= "all"
>  # Fully expanded - so it applies the overrides as well
>  PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
>  inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED') == 'all',
> 'allarch', '')}
> +inherit python3native
> 
>  # use java_stage for native packages
>  JAVA_NATIVE_STAGE_INSTALL = "1"
> -- 
> 2.24.0
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

