Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5997776B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 11:02:43 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id j10so39757965wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 03:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jg6L31qbdgaIwhYOaILtI41cIPRtC2rAy2F5zbOGaCI=;
	b=KciTBZELa0Rg/X6U/aOonFD0f0X/r95A/ALwZrER6OoulftzrPRhSMhHsnhkY+O/2H
	ksiMpnGDYpeGCFMZu+sLuP7t+7Sbl+gMXwQWrE/cgOceltoMgIGGWpNfNyDzMqlEvGcj
	c5+efaFcKqReTyabbNexI2uTYpRa/aMrzjM25XfJUALFW02qQwy1R9bcXkP7kxd75aBX
	C1PTSgb10z9aR1h+69K0ceUXZarbbjtd1eZgLmLQRjTxY1VwyGkVcc0PB/zl9bCgQpvy
	j/ZZHeEEEjhWJlyELODGZaxY+JPDvYTV0+WOVE5EKmzu1I4HKUWZzgy2AXRt0t10aIg0
	gp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jg6L31qbdgaIwhYOaILtI41cIPRtC2rAy2F5zbOGaCI=;
	b=U0fdBv2Ob6Hf2c9yfRO/h0UJs5CobDkUnINC7mbpzbw4S/hLChMlzQU0x+b6MaM80y
	Oe9RHxm1T0MJzl9IkyKBRa3eT8pHxhOWBxVgyhTwHfzBqWjv9rpdoUOLvQ2XEjXrBYGm
	l/0zJDewFABV1kyQpC2r1daTEZ8zPiyFRc6fnQr9Gc3pi7Mb+0PvT5Qh+bwjXJOPVKkl
	pAEgZ0CxE49OHvvixwP8HPnAINzuqDPYon52rZdUinxs8HjlKKwtY+uk7fDOxfb1cXBM
	cc6LprlBOyI6Zq9k+sGdl4Vg/ubxgg8792hpJTo+K+PijTFMAoNrPBK/6/hJhXIywy1f
	bQWw==
X-Gm-Message-State: AIkVDXLSWyIaCa48FOtevCGM4ENXoQU8kfrhBjRwoq5eQUYnOlsQhiltLzudIKtqLA4xmRpWWe93I2zT8BP6UQ==
X-Received: by 10.194.141.239 with SMTP id rr15mr12518082wjb.144.1482490964179;
	Fri, 23 Dec 2016 03:02:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 23 Dec 2016 03:02:43 -0800 (PST)
In-Reply-To: <20161223102230.16697-1-marcel@ziswiler.com>
References: <20161223102230.16697-1-marcel@ziswiler.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Dec 2016 12:02:43 +0100
Message-ID: <CA+chaQfaiN=n5CFv63QR9mSvU7g4Zwj_z7Q=ToR8-7VXfpJujQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Jonathan David <jonathan.david@ni.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] xinput-calibrator: fix operation on multihead configuration
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
X-List-Received-Date: Fri, 23 Dec 2016 11:02:44 -0000
Content-Type: text/plain; charset=UTF-8

This belongs to openembedded-core ML.

On Fri, Dec 23, 2016 at 11:22 AM, Marcel Ziswiler <marcel@ziswiler.com>
wrote:

> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> As e.g. the Toradex Colibri T20, Apalis/Colibri T30 and Apalis TK1
> modules are multihead capable and if HDMI is plugged in while the xinput
> calibrator was run this led to the following error message:
>
> root@apalis-t30:~# xinput_calibrator_once.sh
> Unknown option: 640x480
>
> Fix this by just using the first detected heads geometry definition.
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> ---
>
>  .../add-geometry-input-when-calibrating.patch                 | 11
> +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-
> calibrator/add-geometry-input-when-calibrating.patch
> b/meta/recipes-graphics/xinput-calibrator/xinput-
> calibrator/add-geometry-input-when-calibrating.patch
> index 9dc94ae..296b075 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-
> calibrator/add-geometry-input-when-calibrating.patch
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-
> calibrator/add-geometry-input-when-calibrating.patch
> @@ -1,6 +1,6 @@
> -From 1cb83759632bb218559c4d0d65ff79f868c03dc5 Mon Sep 17 00:00:00 2001
> -From: "Maxin B. John" <maxin.john@intel.com>
> -Date: Tue, 9 Aug 2016 17:03:31 +0300
> +From d4699c60c773e75a68227f82afea0b607667a4c0 Mon Sep 17 00:00:00 2001
> +From: "Marcel Ziswiler" <marcel.ziswiler@toradex.com>>
> +Date: Thu, 22 Dec 2016 11:34:31 +0100
>  Subject: [PATCH] add geometry input when calibrating
>
>  Send monitor geometry to xinput_calibrator when running the script
> @@ -9,8 +9,11 @@ Update:
>
>  Upstream-Status: Inappropriate [no longer maintained]
>
> +Multihead capability update curtsy Toradex.
> +
>  Signed-off-by: Jonathan David <jonathan.david@ni.com>
>  Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>  ---
>   scripts/xinput_calibrator_pointercal.sh | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> @@ -24,7 +27,7 @@ index fccb197..fea7c2f 100755
>   fi
>
>  -CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '
> xinput set' | sed 's/^    //g; s/$/;/g'`
> -+RESOLUTION=$(xrandr | awk -F '[[:space:]+]' '/ connected/ { if ($3 !=
> "primary") print $3; if ($3 == "primary") print $4 }')
> ++RESOLUTION=$(xrandr | awk -F '[[:space:]+]' '/ connected/ { if ($3 !=
> "primary") print $3; if ($3 == "primary") print $4 }' | sed q)
>  +CALDATA=`$BINARY --geometry $RESOLUTION --output-type xinput -v | tee
> $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
>   if [ ! -z "$CALDATA" ] ; then
>     echo $CALDATA > $CALFILE
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

