Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 920B77E686
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:40:12 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id p10so44686qkg.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=duyyAcX6Pnl4Nu8YEueX3H7hopxLBiLbeGLN9w+L+og=;
	b=LzLj4xHF6eoR+r0XKl0QTlNHE6bIAdYc/7uvXEsiOPpaPl7jc2ieHQPv8UDv0jb0mR
	Z9vprGuyDHsdr/joNJo/j5dE6YzbvbzAkSOvfqYnxl9Nl9hUICpNAzI30FhYWjwuUy6K
	N4nIrag2IoGz+GHfN4GPcngE+WsgYe+7yuf9OR/7js2TOX8fVjofMf9h6jZ7l/LKezjN
	O0Y7zMxhU+UaiJOihFW3jHeuupCHmaxlS+aozYukFXHTvq5cvQQj6bnWz/XsyNPU6o37
	calV6YEnUIcca62zIAXa1HWFVB2i2C3Vuj162djDxLJncEn9EhcfhBf4qLN5kG03IrWL
	zRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=duyyAcX6Pnl4Nu8YEueX3H7hopxLBiLbeGLN9w+L+og=;
	b=NDCJeeKgWsuAtYONAowGZLaAqy5XhQUdVeA5Y3/7Lpn1P7kCFjCuetKFcmM98bYt6c
	K7wX+mD0fu/LOwgnuby7B/d6FSl3IHl8P5Fac5j/P7lMg/Q36z8EaDIcEU5B3zaCe7/y
	SdOsnlvm1xgW6Frzd8GK2FKYjRQVTvwdNX+9VSgvJu8qXz2H2tvou0ze4ss6tugsqnVw
	qGpS8LtLmq4MbsjSUE1ITuK3m+b9tVp0atouTJ8xgD7hw4UVoMBuKkyoiyDNlJ+O5aJ0
	R1QbEI6l77XyY4cUIXk/feD/g5zC1yA0ggv8+KlZn8IyLK291UBO69qFL7TPCdRG8qGD
	N+Sg==
X-Gm-Message-State: APjAAAWTIuBfdUxWoDq/InnhVSsxI7jDeNnJS6PlcJdMp1U/w95REcg8
	wrfKgiNS+qDjo58uzEZ04GQDINHMeLrqEPHXhEQ4Pecl
X-Google-Smtp-Source: APXvYqxtJYMZ0rYdHzUe3CSfyTnlPVt3yLWkXUSNtvlI/mVQWx9EfqLVxINDM+XWlRvmD9X05w8uY8hagV7xVaSZNtA=
X-Received: by 2002:a05:620a:653:: with SMTP id
	a19mr45410qka.337.1569447613176; 
	Wed, 25 Sep 2019 14:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190925213619.18725-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190925213619.18725-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2019 14:39:46 -0700
Message-ID: <CAMKF1sprQXkEUoG0iDnvNWZddztn9yW9oBnjpC+rJO3FuAcohA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 1/2] tesseract: update to 4.1.0
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
X-List-Received-Date: Wed, 25 Sep 2019 21:40:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 2:36 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{tesseract_git.bb => tesseract_4.1.0.bb}          | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-graphics/tesseract/{tesseract_git.bb => tesseract_4.1.0.bb} (57%)
>
> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
> similarity index 57%
> rename from meta-oe/recipes-graphics/tesseract/tesseract_git.bb
> rename to meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
> index 89d09a0f5..fde3bc180 100644
> --- a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
> +++ b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
> @@ -1,19 +1,20 @@
>  SUMMARY = "A commercial quality OCR engine "
> +HOMEPAGE = "https://github.com/tesseract-ocr/tesseract"
> +BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
>
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7ea4f9a43aba9d3c849fe5c203a0ed40"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>

what changed ?

> -BRANCH = "3.05"
> -PV = "${BRANCH}.01+git${SRCPV}"
> -SRCREV = "215866151e774972c9502282111b998d7a053562"
> +BRANCH = "4.1"
> +SRCREV = "5280bbcade4e2dec5eef439a6e189504c2eadcd9"
>  SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH}"
> +
>  S = "${WORKDIR}/git"
>
>  DEPENDS = "leptonica"
>
>  EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
>
> -
>  inherit autotools pkgconfig
>
>  FILES_${PN} += "${datadir}/tessdata"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

