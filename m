Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id A93BD7DA9D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 18:27:12 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d12so510851lfk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ifyFrCMmNRacEHfVw8mfL/paNGPUswuyVEE5BhBTOfY=;
	b=UT7TGEEoROYIgoxNdaN/ZyzuCqiUjaXOSWs9iWcq4QAPK96xuLCG57/9rUHxXsxeJg
	1Q1YKlBFNBujyD0wwaMNH/KDyqt3wduFbQjJC4gsMLfzlPH99b9T/B4raW+qQCrPVGvc
	FNR7dvfUT6LRhQTJmJw1j1Rdp3mf5oiWPNVdIdcKy6o186VIupxHYRpYB+Nro7Y/ZpFK
	jlbEBid3OjWZH2jfcuIzARz6/tVWnsnTFQDiSsBcfO2GCiSqx7oUTAX5LzucfoytCgmo
	xaEzBu7dM4cCWQ667jEEH+2qliXmyEqPur4njgPXq/7GX7ycytSxq6Vtl+uLfhd3cSv9
	R4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ifyFrCMmNRacEHfVw8mfL/paNGPUswuyVEE5BhBTOfY=;
	b=NHOV/ZlbGocvtrUPzWtj0GSKe1pPFDU4GZE6Lq7gRjIe0aUnKP5dDtCgUCYuYQ4whB
	4Bk6ErmXeWChlq6OYtB8peZDMhO6R2ahjNNtLcRnIizFvmQJOJdL3qPnKU2WW3AJDR/7
	E4rxZJ8MzkVLsRoGc3Xg+MzSLK+alNwSBDy7PjZnflLiSwJsjxPNmNTMDBlATxSPv6hp
	g+lv3CTZTPKM5tjKrtu40JiOcgKN1TZB6DoYiqx11gJ7DGyGkFp3AuyITICyoFJqCIHz
	09aDbrZ8U53Bx1Md7XY3xRmkAy4Dcql/L28hZUtZqZtYrPS2lkQhbFd0/I/BeggmqNgz
	ja3A==
X-Gm-Message-State: APjAAAUfQQSN6aK/3ZXh/rIW2SiwREZkn4zjRFFwU+Be/dC9tsCjNC5b
	Srap2C842wQtvbecFdMwe/pgm6Owp3aic1b28Sw2kwTa
X-Google-Smtp-Source: APXvYqzQDrOaFqQJbnvwl2DE/jVZvRGfluWxZmigNFFm30amNjcPUmdnMGJbt060Pats8rB8sCw7bRmThHNGVZKh41I=
X-Received: by 2002:a19:750e:: with SMTP id y14mr21458347lfe.74.1556216833399; 
	Thu, 25 Apr 2019 11:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190411213317.20935-1-alistair.francis@wdc.com>
In-Reply-To: <20190411213317.20935-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 Apr 2019 11:25:20 -0700
Message-ID: <CAKmqyKPqaiZprZwD6nPxpuUEMm6jh4UgJfyPLh+-Fxcu7ZXOtg@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] layer.conf: Mark warrior as supported
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
X-List-Received-Date: Thu, 25 Apr 2019 18:27:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 11, 2019 at 2:34 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Ping!

> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index b03a608..90236be 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "meta-java"
>  BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java = "10"
> -LAYERSERIES_COMPAT_meta-java = "thud"
> +LAYERSERIES_COMPAT_meta-java = "thud warrior"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> --
> 2.21.0
>

