Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1131C7805C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 15:42:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b84so32232425wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d20/pDHk/+cNZ0eHlxz7MG56v9o72pqp3HKWjx/FUJk=;
	b=thnaX2/iAc9EqjDgtEFMyZEdnOPxXbOg3lmltG7AO/zloGwLIz+w62ZDaKQOR0KhP6
	RcChtEMFjv5pcTrxgvsHDJpVbvOuv5ajZiznFNzNqwlCWSIdx2B6RTbvtMcIfHJLuWil
	Y8SrCOU1bvSHXW12xBdAM/fAQLhuxoo3q6/xynDgcshxqXncsqn/yLYWeZoqtcfPiuPL
	I8TeHMKP7Cn/NVZitluGEGr1b+YHH7bkBd20xio4JcGDXdxev7zpjaLwBV3kuJ3JhaZK
	h+aDUAWcKy5Spf1JXJyFVoPfI9RK+BWZNauA84dv29EpKlSpoIpfPfEBjiO9PqxO3n+3
	IuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d20/pDHk/+cNZ0eHlxz7MG56v9o72pqp3HKWjx/FUJk=;
	b=UCNBkXFmdR1kIEp71Sit2tnWrqNd0ifNpLEwyz+f36p6ACB0n44XxJe2TphkqOG3Z0
	yPZuCJKq2/hU+wTYGmDyt3SlhhJIo4FkBwiD6g/6UNpXmpFFKqJhDXoOQd/IgAyBuHAO
	PqlPGKRwgHLkg7ByN7vwlW6HHLgjQr+Tw5UzosIeDYxlG0Dgt36aQ7GjU+UWMiaJOr3V
	zX4tbLF09GXVa2AqhRwurIjOUfB7we01kl6ZpWAc/8QybimyRuII9bNpWBEfWt7mORS5
	yE4gJ76M1Vu7QSz17uz3K6BNKSzImutGvvat5FAlN0H4xjzvZU+Mu1ZTQc5oqVxXUpZj
	IR3w==
X-Gm-Message-State: AODbwcAX01ecgUzs3+wDg5yO3p+rszWiRGkQoK1Q8KNV4BgZcMoGwHae
	DiESFnnSezqVFT+hNrNsn53znpdmFQ==
X-Received: by 10.80.151.5 with SMTP id c5mr25989427edb.30.1495640533428; Wed,
	24 May 2017 08:42:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Wed, 24 May 2017 08:41:42 -0700 (PDT)
In-Reply-To: <20170524153407.22969-1-dl9pf@gmx.de>
References: <20170524153407.22969-1-dl9pf@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 May 2017 08:41:42 -0700
Message-ID: <CAMKF1spe_4B86YGpY-SmNw6K-deJqnT5j1mDDSn7bqtiB1SpLg@mail.gmail.com>
To: =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-oe][master, morty] sg3-utils upstream SRC_URI unavailable
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
X-List-Received-Date: Wed, 24 May 2017 15:42:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2017 at 8:34 AM,  <dl9pf@gmx.de> wrote:
> From: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
>
> This patch temporarily fixes the unavailable upstream URL for sg3-utils
> with an bbappend that redirects the SRC_URI to a mirror.
> Checksums match.
>
> Signed-off-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
> ---
>  meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbap=
pend
>
> diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend b/=
meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> new file mode 100644
> index 000000000..aeef696cf
> --- /dev/null
> +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> @@ -0,0 +1,2 @@
> +# Upstream URL currently unavailable. Use mirror:
> +SRC_URI =3D "https://fossies.org/linux/misc/sg3_utils-${PV}.tgz"

Can we also host it on sources.openembedded.org please ?

> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

