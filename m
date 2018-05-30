Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 86F0374D87
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 15:16:09 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id q70-v6so6011337qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NnOPvjbezrt6XEgBUDqMIgFYKoSlY+hgPaxwUhKqRRE=;
	b=KlM/9oklMkNmyiw7LnETE/liBxHCM9bkgowP5jPf0WyJmmM2mCDFokf8gV3vxg93AJ
	Vo3x+nAIR4PkXOn5pAMRTACC3QsydZcE+AkfvcLtiS/iqvycDMvzRcmIvgbzx4TeJY9M
	vI2WSjg1TSO1UDIrGdMkcQO13XFKBhmdF+GVLUA/NZ+/6TGYInYiKTG/a/eWMor4ujTu
	jvpqgA5hAyJfZStaX7FUvMPYR1qV2iZpWqeApjPlHpyCVGKZ4bGuLzgQMzI6YayhBsbK
	pknYXfDSnF+Z3oYQDTVgYwV/CcmA7O9+Kf80KloAdhduA5XoKWR6q/dkFnlqgYxHuEFk
	V2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NnOPvjbezrt6XEgBUDqMIgFYKoSlY+hgPaxwUhKqRRE=;
	b=sPL/MFkLwDRLAbGuEjtGIltaHRsTqi97Qmdel2mcs4XnSVPCmg2a8v2WSLxn1s2cTO
	2g4dVvk7+e01MeUWpPHEPXKRWxzkI7RwYG2iwzp9gU1qYt8b7tmhH3gxhTCU0uCbdo23
	HnTzQMSkbVtDr+pHpEugFS9M7K3oAxqrYb5xFeXY22ecoR2dHMVkxa3RLK6XyxlTAfQf
	VdZLDRRRf260BGbX9GtQ2yVoMIPyF7A9kweIvG85odC/G2H4CVO6GNlpZnahAF78Kcy4
	Qyh+Bvh+y5W3kIZ/j+R8CVCA6g7SUVf3MfFJtD+e4z/V6XX0qMd1stg1tFJg393Oi8XJ
	ikXg==
X-Gm-Message-State: APt69E36Zf+VZAAC8K7eOxbwM5e/MyX1OV4RCy2CUiEA+mktfHoL5VPb
	HUW27b20+RHWBcAso46VMtwfSu5qOUn12ZnpfMs=
X-Google-Smtp-Source: ADUXVKKIm/TUIjND10w8EDLKJhfFHSA5JtfmK52EvRZ7Eysi09Eut0uU8WR4xSE8+Zv6qfUS2tG2Xidix2/JqLykeWI=
X-Received: by 2002:a37:95c6:: with SMTP id
	x189-v6mr2708505qkd.110.1527693370081; 
	Wed, 30 May 2018 08:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180530134741.29397-1-george.mccollister@gmail.com>
In-Reply-To: <20180530134741.29397-1-george.mccollister@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2018 08:15:59 -0700
Message-ID: <CAMKF1sqgQSZE9K36c3MOAEd_HCMoQAL5in8eRXSBdbbSe-+zrg@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org, mans.zigher@gmail.com
Subject: Re: [meta-oe][rocko][PATCH v2] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 15:16:09 -0000
Content-Type: text/plain; charset="UTF-8"

Can you try this patch with

Bitbake -cleanall recipe

And bake it again

On Wed, May 30, 2018 at 6:48 AM George McCollister <
george.mccollister@gmail.com> wrote:

> The 3.4.x branch was removed upstream but the commit referenced in
> SRC_REV is the 3.4.1 release and is still available:
> https://github.com/google/protobuf/releases/tag/v3.4.1
>
> Drop branch=3.4.x from SRC_URI and use commit specified in SRC_REV from
> the master branch.
>
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>
> v2:
>  - Correct commit message.
>
>  meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> index fae7c18a1..fe28f475a 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> @@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
>
>  PV = "3.4.1+git${SRCPV}"
>
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
> +SRC_URI = "git://github.com/google/protobuf.git"
>
>  EXTRA_OECONF += " --with-protoc=echo"
>
> --
> 2.11.0
>
>

