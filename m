Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6784A7CFCD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 14:19:04 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id x12so10415893qts.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X75nktn5ZfpjIgO95YyLK+hhe+EuwkVHsfjAeZ3Lj1A=;
	b=f5uU5g0RgCX90tNHakq4GsUQhaJkyFyaIjMX23F23A0WhM4adcslG+lm1Sly/p7947
	FOfDkdoRtOCZwUXSAvon9uBNb2InlRqwAfVcvfmUzifqB31Or5KkH09SCf2Elvk4Pbae
	4xKpOETlVC99k7yTIaZB3U1U0Galy0hpxpAfPUA/sj5NK4yvV047Ake95m9px+r9rL3M
	R4KubtewdzENHP7ESrGIYjvMRQtWOLZQ+C01LJRk777BqWsWRF4jWx9M0nOIJjeEYqr+
	YMibLBg0JRZjuY2qt6AgIjRYufIRJDujyPnKBpO8PxswPf8LlIitVp2zAlv7Qqqk4jl4
	ZcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X75nktn5ZfpjIgO95YyLK+hhe+EuwkVHsfjAeZ3Lj1A=;
	b=VFg/gkBCiuxihbs/UejIXs6MUu5bsTnT6YonZ2FgwxQ39JODql86cWyLRXo9QOxsA2
	nIXuOR3x7V2Ax5endHSABcFd/g4fWmGY02X51ghKFSN8rtEBATubKYb6dPwPz2YJJs+d
	inYe+ma3A/Yu/iKmiFo7xUOH6ccZV09H3Z4cT/Gxh2ed2L/9NGXnyyOZ1iAE+LFJMHC7
	Xdb9nAeFmD4Z/Y557yfQQx2x++pHN6j3Ko5de5Yvnk0+fd1hWnFxoc0f9qC0sChVZEKU
	D1yIws8NDv2npcphh84Gc9dM4g4GEjtH6ou7zwOgAPuqFVLXdeLbQPjraOp+RGWuRfYi
	ow1w==
X-Gm-Message-State: APjAAAVvwxthcN4SGQoiHUeg/LU4tSc4sZsD3TY1Z/baGWFA7xaxwk14
	PlwYyo6VFntm3Ue7H7wXnlN41HcogmPAIRBs5PgDQw==
X-Google-Smtp-Source: APXvYqx13yjqZd1pG1Kb9nSORliRyTyW6/oXQcAa8eQL9bgNM3H+BeK6qTSewwxqYU3L7CvVHxYiNVDF7FHrti6J/Vo=
X-Received: by 2002:a0c:9561:: with SMTP id m30mr20285945qvm.224.1553523545070;
	Mon, 25 Mar 2019 07:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190325140526.12797-1-brgl@bgdev.pl>
In-Reply-To: <20190325140526.12797-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Mar 2019 07:18:54 -0700
Message-ID: <CAMKF1srKu+wFUc+PeAAiZidGBjA_5qR0VUZuK8dW2FXL5xt4PA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libgpiod: bump version to v1.3
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
X-List-Received-Date: Mon, 25 Mar 2019 14:19:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 25, 2019 at 7:05 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> There are several new features in this release. The one that impacts
> the recipe is the option to install the test executable to bindir using
> the new options (--enable-install-tests). This requires separate
> PACKAGECONFIG entries for 0.x and 1.x series.
>

Perhaps it will be good to enable this feature automatically when ptest is
enabled via distro features

>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb           | 2 ++
>  .../libgpiod/{libgpiod_1.2.1.bb => libgpiod_1.3.bb}          | 5 +++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libgpiod/{libgpiod_1.2.1.bb =>
> libgpiod_1.3.bb} (67%)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> index 09fb65a08..96615ebf2 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> @@ -1,4 +1,6 @@
>  require libgpiod.inc
>
> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> +
>  SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
>  SRC_URI[sha256sum] =
> "b773e557af1a497f786825462a776b7bf90168e67ee0a5bc5d2473a5674dc38c"
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
> b/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
> similarity index 67%
> rename from meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
> rename to meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
> index d7fd55d79..e513a33bd 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
> @@ -2,10 +2,11 @@ require libgpiod.inc
>
>  DEPENDS += "autoconf-archive-native"
>
> -SRC_URI[md5sum] = "e6c222512a0d1994a069ebfd2e0a56fd"
> -SRC_URI[sha256sum] =
> "736d8b511ad247c2acb01b592f2bbe5e757e14e1d8347b2d80683081ab4b31b8"
> +SRC_URI[md5sum] = "9f7530a5d56f070ba0af78d6ba077973"
> +SRC_URI[sha256sum] =
> "6ec837f23e8f2196e5976dec4ac81403170830075e7f33ede1394eaf67f2e962"
>
>  PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
> +PACKAGECONFIG[tests] = "--enable-tests
> --enable-install-tests,--disable-tests --disable-install-tests,kmod udev"
>
>  PACKAGECONFIG[python3] =
> "--enable-bindings-python,--disable-bindings-python,python3"
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native',
> '', d)}
> --
> 2.20.1
>
>

