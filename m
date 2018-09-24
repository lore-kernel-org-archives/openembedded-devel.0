Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A651678881
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 20:27:09 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id m15-v6so4832147qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SBVe2niBj2zmZa9ZgERs6cBVH0fUJuiKj8H3LipBE4I=;
	b=CNBlEufmoK6wvosLRKYxuGpMerQ4SOU0DISnq+QM+AHVE6eMgKrbU4SQixKNZwirpa
	YZ2eiMhDeMf7LqdSgaFw0Uo5DOuWfHxHYC6+y6IK1OrDRwbugoGLPbttuLaKWW5fv9I3
	mebgV4Bt8TjmZsslvhpQyU345Fhd2qoy4S/pJE0fzv9cnWSBsVqRKCbnmF3IoAbV9FBr
	OkOCEh6pRC6CqOM1nHkZcRs+jQoMXQ8VS2trUyvr5DrChuvQcOu3b7PElcLlG7aF+MAD
	ObgdFcPhouWnUlgorq/ehIVV46dNq06wWATZT/ktXFkLSv2XI8O6JTGHua4cz7COudAe
	hJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SBVe2niBj2zmZa9ZgERs6cBVH0fUJuiKj8H3LipBE4I=;
	b=kX48Ni/WJFn76yQ2bK5UklKCQ7MqVWR2TRnn4P68G5W2FXdXlcKtiMpMsMDdW3xrn8
	mwUv1mRxM/9UyiqRJhTrWEQXf8Mi8clHGtPPqwBuVqL+tan1b43pm/pstxwNJQlrmopT
	NpH2UaC6izN2LR+Ojb05I3hdzZpFAtBzAQzLLI6co0LJt/+gG7nRHTYOOVrNwOYMH4xy
	yzLHK3Yg1AZT0D6okwtaiVlYunMbWeMQdJifj1EefwN8v7/WtjMkvxkjvUUCf68nrXj1
	ceUybrWpXb7ami/3QLB67S588Oe/6H+JnbPDbaDCwrPWrZxul5evY8Il+pfEVhMImkAx
	L7VA==
X-Gm-Message-State: ABuFfoiPptJVFtoXGJzRU/vhPiCxp09bkLnh8CP6RQubab4pkIOG8KAm
	f3nyrKyVjMesdP/NJTukHWEabZWQeBSIW+S++Ao=
X-Google-Smtp-Source: ACcGV63KijlLZ+WJB7htzWi8zNxQIBotWjkF3x81VAVEAIaAJQbOQu0q1mP+7NeHYiZFxfEwHZVaFBPY4Gibj2TZRPU=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr420715qtq.161.1537820830288; 
	Mon, 24 Sep 2018 13:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180924201705.30209-1-nicolas.dechesne@linaro.org>
In-Reply-To: <20180924201705.30209-1-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2018 13:26:59 -0700
Message-ID: <CAMKF1sqg6-DnQE7MGuxe4RnScu_uoXW6iker022pW6Q7FRS5dg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] meta-multimedia: fixup LAYERDEPENDS
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
X-List-Received-Date: Mon, 24 Sep 2018 20:27:09 -0000
Content-Type: text/plain; charset="UTF-8"

Dos2unix is in oe-core now please try with master

On Mon, Sep 24, 2018 at 1:19 PM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> libebml depends on dos2unix classe since 26dafa0f3542 (libebml: inherit
> dos2unix), so LAYERDEPENDS needs to be updated accordingly, otherwise we
> are
> getting a ParseError:
>
> ERROR: ParseError at
> /srv/work/oe/meta-openembedded/meta-multimedia/recipes-mkv/libebml/
> libebml_1.3.0.bb:13:
> Could not inherit file classes/dos2unix.bbclass
>
> It was initially found with yocto-check-layer script.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta-multimedia/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/conf/layer.conf
> b/meta-multimedia/conf/layer.conf
> index cfedf2f6b..a1dfed4e9 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -27,6 +27,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
>  # cause compatibility issues with other layers
>  LAYERVERSION_multimedia-layer = "1"
>
> -LAYERDEPENDS_multimedia-layer = "core"
> +LAYERDEPENDS_multimedia-layer = "core openembedded-layer"
>
>  LAYERSERIES_COMPAT_multimedia-layer = "sumo"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

