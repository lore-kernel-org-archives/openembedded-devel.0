Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 55771799B5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 18:21:25 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s14-v6so9574344wrw.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1j2VEGXW+rROF3+Q2UDY1T+JTSXLjrxYEsm7jYD0+Cw=;
	b=eiNrTeMSv1atRQ+Qq3LMPlz9YQcf3CRFsSifBLQMV0hCxp2ONrhAAR5Cep9/zMVgC7
	L8ozTHcHwqWqeee33+wMLWmtmtYDnK5ZeqlYik80LxwAkcu0HHxPDScf3ccaR7Z7Rg7p
	TAX+nSqDakJP1KokjmR7jQ2w/xK6JUwRvGIJ8FVqYcqC7BdfBvQtcFeNdXqzVVyVz0HK
	IaFZxorsXUXRiuZwxSLFBk1q03ZUWqcYX9lyFpAEZOlri5Bt07A1LTCeD+T6uvURDWht
	+PV8K9xI2FSo7kW4MXVJwWZj/Np2JJNxQ9d7BoDlfD81mdNzCMXBSDNFxfmPlsn4Oqby
	RPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1j2VEGXW+rROF3+Q2UDY1T+JTSXLjrxYEsm7jYD0+Cw=;
	b=rOd+XE2cJQloQs+gmpNc8JVlTaC46yrj25FbnBIi5UXACHp0EYW+RLCdi0/V6KR5zx
	R/2QNI23xyEq1sJEZiFywkAtuQLXcYa22sCGy1E9OuhWCUMcOcsiS3T6b9CdIlbXxx3i
	Jbkz8GUQd8c3YePq0juNDT4DnG5jffDqWCbU9t1au85qHBTaO2UekydYr5OKIZk5vHe3
	HLAdUhZd7S+/OV3WUVXZG6TtnHwlgPvahNvAsU7WCc+bTzV1wrrbbQogK/GBqCGl+4qe
	cuzGcMOOBB+qIYEpD1XwiMC+vy062KztdPz8QUfc5krs6aPJO6r5SKbiqlBEWqaU+cX5
	GTzQ==
X-Gm-Message-State: ABuFfogEou0neM2vBmbvXiTQKqbc28c+66lUXlit/LKQ3+RTBSfHa7Pk
	w6vx6CRS90whiEpiqYv3pUWL+hJ6JNrEJgLBQ1w=
X-Google-Smtp-Source: ACcGV61BI3sGrd0uPZk+3Y5r0yzE9aw+8XtScJ2ulBpYsfQX3ghxSgMtcNoVdVr0/2NU8BwE8b5dOcJbZCzTk7mG94M=
X-Received: by 2002:adf:e58e:: with SMTP id
	l14-v6mr2471485wrm.321.1538245285852; 
	Sat, 29 Sep 2018 11:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20180929181632.22446-1-akuster808@gmail.com>
In-Reply-To: <20180929181632.22446-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 29 Sep 2018 20:21:14 +0200
Message-ID: <CA+chaQdc5ys0dGsFWe5-x1ukYKnRcJihz278ru6YTq3meASW0g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] libldb: fix yocto-check-layer
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
X-List-Received-Date: Sat, 29 Sep 2018 18:21:25 -0000
Content-Type: text/plain; charset="UTF-8"

https://patchwork.openembedded.org/patch/155217/

On Sat, Sep 29, 2018 at 8:16 PM Armin Kuster <akuster808@gmail.com> wrote:

> ERROR: Nothing RPROVIDES 'samba' (but
> /home/akuster/oss/maint/meta-openembedded/meta-networking/recipes-support/libldb/
> libldb_1.4.1.bb RDEPENDS on or otherwise requires it)
> samba was skipped: missing required distro feature 'pam' (not in
> DISTRO_FEATURES)
>
> add ditrocheck for pam in libldb
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-networking/recipes-support/libldb/libldb_1.4.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> index 99e62f66b..3c7e5455e 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> @@ -35,7 +35,8 @@ LIC_FILES_CHKSUM =
> "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>  SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
>  SRC_URI[sha256sum] =
> "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
>
> -inherit waf-samba
> +inherit waf-samba distro_features_check
> +REQUIRED_DISTRO_FEATURES = "pam"
>
>  S = "${WORKDIR}/ldb-${PV}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

