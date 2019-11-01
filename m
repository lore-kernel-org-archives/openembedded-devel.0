Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 476527FC1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 10:45:22 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p6so10428957iod.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Mr9PTnA0nciut6M/veuq7cuOCcNvebIUsEDrD0FJcUk=;
	b=LGPnD9TwQmiHMbspB5ToEaE5L0tIfxszpebWFQDrvBfHyKGf/HZ4KVxEqMon7zb//d
	w24/is8Un7eXgGJ54tminKKXRifscpq/rLoQhDz3uwScpTClg3Du392ksUGZrBK4vbdM
	fzcmAXhMrBSzMGQ8kU0vf5KfIe4nO8BkUYxH4uDVJcLlZeLVznSKHRweNBWxRNrQxdVP
	qB/xRXIIYmg7pjA2ziRlypzhgH2XB+dU7bmGNGhw9u1OsakudPnPQGwzp3ibG9CQ56wH
	2AWtKucJCVXEuBg8BWXEkqb1/v4aQ/+Oy18jDlQkKKs30+VvA+zoD/BBZ6alvLG+uqMp
	QGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Mr9PTnA0nciut6M/veuq7cuOCcNvebIUsEDrD0FJcUk=;
	b=OEC52i+prKL3qh7uU9OVfrrH/MIsg8GqfxJquPna1ozt8KFQbbLV6NzL1itLlbfIVY
	TdUKj13yStWVmm1GnRxoe+hq4UCQkVTowDA27bGSxnBtiC66e2QOdS7l3Y9I+TDLhXLT
	eoiQBPstrGcDSPu2TdE3Rkm7DGUh6aZX8pTBG7dkDKBdXTwHunttTrfgeh0Mnw1fRnO3
	A5aIKnn9ZbfdwwxKuHC9lDYabcc5G7qb9SaiKcSHqSFWbWnl1S//fM62U4hOq4Rrsfj3
	aWbz73/N6sUEbXpgyYNhUtz3iWlsiBFVMo4+BNJ/CK81n8qZz95dcTjeTlZjkzB6swqq
	ApMQ==
X-Gm-Message-State: APjAAAV3AA6FacUHKJVzdp0HaFnmS9/zyNNxF350+siUkiOLTh+MoW04
	FgPqu7V3aXheOsgElZ3qojKZKYHVZ1ps2RtMOQX8JOrC
X-Google-Smtp-Source: APXvYqygnEJpRxn2KB6f9TPL3pFQ/jC9Rhs+WgZjga+mCPu36MhuY21jx4VGlQXG9MBPneYawxHxlVKMOyGjtc5YX00=
X-Received: by 2002:a5d:81c3:: with SMTP id t3mr9914651iol.300.1572605122931; 
	Fri, 01 Nov 2019 03:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191011212120.11453-1-alistair.francis@wdc.com>
In-Reply-To: <20191011212120.11453-1-alistair.francis@wdc.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 1 Nov 2019 11:44:45 +0100
Message-ID: <CAB2nKc8MA7uLUxbJrzh-a48AHe66XoghYaGLxF0PRH7y45RiWQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: "Maxin B. John" <maxin.john@intel.com>,
	Otavio Salvador <otavio.salvador@gmail.com>
Subject: Re: [meta-java][PATCH] layer.conf: Mark as compatible with zeus
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
X-List-Received-Date: Fri, 01 Nov 2019 10:45:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Would it be possible to create Zeus branch for meta-java?
By the way, master branch didn't move since April, any issue
maintaining this layer?

Kind regards,
Vincent

Le ven. 11 oct. 2019 =C3=A0 23:26, Alistair Francis
<alistair.francis@wdc.com> a =C3=A9crit :
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> Also, can the master-next branch be pushed to master?
>
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 90236be..cdba2cd 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/rec=
ipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "meta-java"
>  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java =3D "10"
> -LAYERSERIES_COMPAT_meta-java =3D "thud warrior"
> +LAYERSERIES_COMPAT_meta-java =3D "thud warrior zeus"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

