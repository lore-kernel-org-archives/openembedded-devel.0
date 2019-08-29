Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9693A7F395
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 18:47:20 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id n7so4843271qtb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fZh0w3WWgUIOdClrpb8yqe7Yqz76sV5YUXuJ/elmjuQ=;
	b=bsmj9zLaESUs0TCXBkgNjQUbbQDw84TuOmnXVeTQFlyViFjblMBGheFrwxIkMTkoew
	+gaBFMKXYblYJNaAkkDZBEWtJfonGpV2wrMQFdSRKMrqNgeeQwjiYqHZg5GJGpFSmjqa
	+mls8YQ+7EqR20jgNXsCfwiOaqMbFOe53SUklkk/tE/TVErlxKSqsXG732w1g5IqnlM4
	SX7yK3xdVktMHQjKZEyqaG2xgDvKQX31pOy7MZCi05NmfSd1NU0ms+sqbe/5exk1ZIzs
	VCvNeQUJaCPLjrf0kkYA0UlyCWUO2gIXEuQOQa0WdLY3kzmsfxZO+zgSnF5hVBMCuQ5B
	t41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fZh0w3WWgUIOdClrpb8yqe7Yqz76sV5YUXuJ/elmjuQ=;
	b=M85h5bHjeaC6W00OGPESvkEzIUzQOUF27lD0nO+sgB3WDUeZ2m6xbZbrJxH0MEQxPZ
	NOgP73mLx1Z6UyRv8NB4sWTHeOJoaxnccwrQ2E0+9sSo/XFW5ZHPYhLcUxF/+iDwZLKs
	QH7+rkJAPiXrTSC9d2qLBwMlVTEdLSvgMqOq6URjLYNNRzMSAUi1w+/m3KWrq79Z56yo
	7Use4Sleuarc9hq37NZ7+pzgZJWuXu/F3eohTKRml2015GpCz0upmqQC2APZX+xbdetf
	uw11iAP4SRYI4TGg/hfkJ4cKsLUdUTE1hPIsfCPgII9E7DgXaAUBcHLOktsurbkZu7MZ
	cn/g==
X-Gm-Message-State: APjAAAUMK5+AKaD2ncoD0dMhvJGBIqSZa1r2Qg+f+iv192O7zUzJz3Sp
	7Q8eRqwiFC3AKBWERYw2Zoz94vf1AXKfYQPV+fo=
X-Google-Smtp-Source: APXvYqzLXM8xluo/6V825Gdgr0j/1iCWzWI7xmMIL9AF+7hbg7cxiAsWwg+vpvK+zNosexJpCivzoU/Yqn380UV9nnA=
X-Received: by 2002:a0c:e485:: with SMTP id n5mr7706039qvl.175.1567104441133; 
	Thu, 29 Aug 2019 11:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190829103934.21804-1-bunk@stusta.de>
In-Reply-To: <20190829103934.21804-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2019 11:46:55 -0700
Message-ID: <CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libwebsockets: Fix the build with -Os
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
X-List-Received-Date: Thu, 29 Aug 2019 18:47:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 3:39 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
> lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     if (m)
>        ^
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb   | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> index 50620d99e..fcabeb902 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> @@ -28,3 +28,5 @@ EXTRA_OECMAKE += " \
>  PACKAGES =+ "${PN}-testapps"
>
>  FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> +
> +CFLAGS_append = " -Wno-error"

is it possible to fix the underlying problem? since Os is not default
it definitely could be a bug in upstream but
by disabling warnings for all kind of builds we are  painting with broad brush

> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

