Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7461E7E3B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 18:54:33 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k10so15103314qtq.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 11:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uVhw7xvbltoBMN+eLUyvKiOO/QyeVIxYXrtGr7hHi3U=;
	b=Fgn4OG24wdt+Bi45YoxtCDmT+femgBV21AWMdEx0uHNWCTADvWqXs0Kac0XF1/ACB7
	A+mfciCnnHt9ztxB9eDZMN9d/byKoc2+JVgzeBM/MfAIkvBC7Sx+ddQbuHlipR5BCrVF
	aIMl4gAjCCJjRNoOTJ0bBmgz0ygmX985f+EXs6tnD7V36HUJzSsL/1QaBPhVw0OzSS0A
	WMiqepN2wuCXCXLACuMFhMl40S2sev4kr4PKb7sHpr3uCxoaJ36itm+gTqE7DX3BEcX2
	g3XB2MevjtfHvPCI6I1HUJws1+Xa/t1+DPPlh4lmgbrnXwdZkPIiDhVeR930yoRtc6lx
	jZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uVhw7xvbltoBMN+eLUyvKiOO/QyeVIxYXrtGr7hHi3U=;
	b=iEGqTH3o6mYBxmHLJvEh4K5n0tb3M9N3dVjB2HUH8VPjBL3QZEVxdM4sLLjYIv8N2v
	TRfqLJeyspyY6x02X4oNUDcj3MEcaoBKUvy2O9d105c8P/rDiJ8ReRyrd9zdUuNDVdFE
	/OYTjwTdqOISUdANhUo4mONFowhxEVIRl4TP1OX9j5ub4A1bYR7kd+JkL1x9M2DD+KSw
	EJklghF7AZc2br7CtPS16NntQdiEMBIeXCRLIUrQsIuWn7CKYM1AHz7VBzWogi3+MvKR
	keUndHb0zSjJfXQbM9Xp8YpqlBS9KG2I/jju2Cbxj2Z0Cs9olSIoXUGAwFhbpoqE78LO
	t62w==
X-Gm-Message-State: APjAAAWZs/Pss+eQjgIx/J/d7jVOSBO1GYvpchCiStBDVAQUrcbbwwho
	AMPX/feNzil0QN6TvZloxDQmUJg1UbqmR3nT8do6H9Rs
X-Google-Smtp-Source: APXvYqzOCpj6IYazTKI07UHpcY2gfqix6F+yw/7Mr5XsnvO3mjZxQBmz0ABF4NOk67irhMvElBNNV0TrKEtCNjUjKcY=
X-Received: by 2002:aed:3644:: with SMTP id e62mr19526343qtb.80.1562698474151; 
	Tue, 09 Jul 2019 11:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190709172623.26073-1-bunk@stusta.de>
In-Reply-To: <20190709172623.26073-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 11:54:19 -0700
Message-ID: <CAMKF1sp_S44k9HRapQiOLps3ZCbR6c6xPsjW3vOdhniU5nZ6DA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gpsd: Don't build without optimization
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
X-List-Received-Date: Tue, 09 Jul 2019 18:54:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 10:26 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> The upstream build system adds -O0 when debug is enabled.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> index 6716f402a..43bf25a93 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> @@ -36,8 +36,8 @@ PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
>  EXTRA_OESCONS = " \
>      sysroot=${STAGING_DIR_TARGET} \
>      libQgpsmm='false' \
> -    debug='true' \
> -    strip='false' \
> +    debug='false' \
> +    nostrip='true' \

I think this change is improvement over what we have, however it will
be nicer if it was knobbed with
DEBUG_BUILD flag, then we can get proper debug info when doing a debug
build as user will expect.

>      chrpath='yes' \
>      systemd='${SYSTEMD_OESCONS}' \
>      libdir='${libdir}' \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

