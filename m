Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id D08356011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 07:29:34 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id z70so4437192qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=+eR9x5bBEjYvXh7QZve23BinXJA0G5TWK6PLeGBHF+8=;
	b=n+ja/mzJV0sRlBb2DVzy2+Ig+bYdrSu6y7SfQUtBiRh2ZoIufTWTIjBidRyWe3lXe3
	BXng+mjIcfg7vp8Uhg5bQ0jz4a6Bu6oEui9S2w4cnLFkRmbas1sY4ctQtz7kFzKjdyJL
	uAQIa7Pr2uETRdQqe7a5+Xc2gxs/XKyt9BXYT7HoCfp120G51YSQa+fPTMGSIvmkT+id
	GmbyS+ButJfhwB21BVz8F0fHjDCWetfxlzd22IQQeqWFggaU/OLS5H4zbXTu6drz1z6Y
	0GVMvsnWjLmkHIa9+9uL0YHj3ocatg5Nyi+2yS1L/0/G++uW9N4V78nX2RWKDmknTHZd
	6w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=+eR9x5bBEjYvXh7QZve23BinXJA0G5TWK6PLeGBHF+8=;
	b=MTN7x5KLQXus4hnwhrKEdYghTBa0MecDW0a3GM62wL5pjv9EQMQsfr78K3mDqTYfV0
	fl8EYDBh9EWRhcoFN9SJ6Gx8myzsA2TFC2A2pIp0rpgS3xptdqJAoo427xCD1Z1MZsTe
	2xOTnesMkfZZipioSeZ21wwqKYsYBQk3gZAKWFHGVkHxtyYE9oNJIiJmddKC5qqXHTwh
	Xk2/FDVfK25UoHwjzzAsUwf5+2qlsTDI6PbUQPfzSQa0kN5RlB2oANU/kE1w8i14HkKG
	VW+v8ReQlMhAOOITOW6xXQM6ik4Y42cBGYm67rIhTGuc39OaBU5h23hYjMDjSrbn8Pyt
	8AjQ==
X-Gm-Message-State: AOPr4FVFLyrp7QXebTHnDdOc6sbjVynyKKMYlyCek4BeUlQ78UvU995ExI2YpCevxPtZzVx3YvP8+PaFVhH7Wg==
X-Received: by 10.140.91.117 with SMTP id y108mr1264128qgd.104.1463729375007; 
	Fri, 20 May 2016 00:29:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 20 May 2016 00:29:05 -0700 (PDT)
In-Reply-To: <1456615592-11508-1-git-send-email-daicy.fnst@cn.fujitsu.com>
References: <1456615592-11508-1-git-send-email-daicy.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 May 2016 00:29:05 -0700
Message-ID: <CAMKF1sq2xzoS11ngO_U5zL14U_f3NkcRnT5rarXyzygma=78tA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openct: Fix rootfs creation errors
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
X-List-Received-Date: Fri, 20 May 2016 07:29:35 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 27, 2016 at 3:26 PM, Dai Caiyun <daicy.fnst@cn.fujitsu.com> wrote:
> To fix error as following:
>     file /var/run from install of openct-0.6.20-r0
>     conflicts with file from package base-files-3.0.14
>
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/openct/openct_0.6.20.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
> index bf1ff57..d4ad9c1 100644
> --- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
> +++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
> @@ -55,6 +55,9 @@ FILES_${PN}-dbg += " \
>
>  INSANE_SKIP_${PN} += "dev-deps"
>
> +do_install_append() {
> +    rm -r ${D}/${localstatedir}/run
> +}

This is ok, however, there might be some files being created in that
directory, it will be good to create them at runtime when this service
starts
so may be adding it to systemd unit file or init file would be good.

>
>  do_install () {
>      rm -rf ${D}
> --
> 1.8.4.2
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

