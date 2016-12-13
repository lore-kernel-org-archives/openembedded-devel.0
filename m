Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 03E8371E41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:26:11 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id p9so8782926vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G9utjEKUNkNXAPTe90ai7AS5oqRzHnb/OixOrv/3NdU=;
	b=Hg/UkyuLfJOgSIt7Alwjr3ttPXE6kHn2fNl3OJV+y2voQlVdfEm56QTVzao8V4um1c
	21gbb8hTTZm5T6GGKZN2SF43LbsNw5pNyQJTEyVluh/vEykccM39Pgbhkid/tFmtnpXf
	7s5udDHS6DAOmDw8OjYXGCv7M4TSWxVA9UHiAiTzJ/rGDpFvinE7Y7Qj3I+BnV5EyCEl
	XtJRHVog0Ni4f3+lrzopaPo5yB276qPgntgi2ebT21ygW9kURYkpQqm7vmwNAdg3x9ln
	d2+jilTl1IxeBqwCn3XU00Mh7YtEiOdF7WtSINEPfe45BGzKqciTf41NdXmcv/h3/4+v
	qPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G9utjEKUNkNXAPTe90ai7AS5oqRzHnb/OixOrv/3NdU=;
	b=H14CjUhnGgTsmRklKR5F0+hN8pvuRIp6TBCd1VMm7euq3QQyiYEF6ljPAhBBtL+hd5
	1qf894vywKPHKMDayLxMzxepFtuWsn6wq4IhiWNUIe5iMvtI2LVeqFD9oBnwNmUSUhjw
	zBEkgh6cVyb3uep5DPX7YtK1OZm765S/SguuBa7YtHA+akkjaqLrihu3lMxUmHD5PMtJ
	xxvxYMbcvn98HpfN5SFjbcNsp/P0R6Snoq1LE8ktFAqLH5ka8rxWYSmULusO8EzxWlcf
	bzx4Xw+mFRjw1DkGJ0M1qT7z/KoO9p05n5KQrZr0Rtnm5sxnonhXiCq63k2vWnUAEY6o
	sO/Q==
X-Gm-Message-State: AKaTC00wiOXCd39WJt8RiShO6HvqlX1uNkr0NHxKz5Ge41y6NDaxvq0DXXr4H6DDfWDUfXj5E+Yb30jYbcta8Q==
X-Received: by 10.176.1.17 with SMTP id 17mr69114900uak.143.1481664372895;
	Tue, 13 Dec 2016 13:26:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 13 Dec 2016 13:25:42 -0800 (PST)
In-Reply-To: <20161213210404.6940-7-ricardo.ribalda@gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
	<20161213210404.6940-7-ricardo.ribalda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2016 13:25:42 -0800
Message-ID: <CAMKF1soyeu_47SQ3GyjOCOEiuOX=NxzahEAd+d2GOwdaiUj0Wg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 7/8] opencv: Add new PACKAGECONFIG lapack
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
X-List-Received-Date: Tue, 13 Dec 2016 21:26:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 13, 2016 at 1:04 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> If lapack is detected there are some extra OpenCV modules that can be
> built. Unfortunately they cannot be selected with -DWIDH ...
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> index 8cab3b87ea95..f1a3ff55009c 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -70,6 +70,7 @@ PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUI
>  PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
>  PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
>  PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
> +PACKAGECONFIG[lapack] = ",,lapack,"

not that this problem does not exist right now but this is a dangling dependency
what happens if I  dont have lapack in PACKAGECONFIG but lapack
package is staged
already may be via other deps

>
>  inherit pkgconfig cmake
>
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

