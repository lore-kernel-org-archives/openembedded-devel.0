Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.58671.1629311004142139200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 11:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IPofzIKH;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id bu14so2189308qvb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Aug 2021 11:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZAXWHmkJo695OfEt9v69+RbdYP/WExp9qOHSlNNplq0=;
        b=IPofzIKHkmPG8TthsCzIOvSKXWf42glkKN7i3pY8BMBy7iRhEDUSeundEpR5xKt9LD
         Gjea7Ubcv1RvyXpNT+MsAWjYSpPcjTV1jCJH3d/Bw48DrUwBmM7wa55EA/s8v1NpU3yl
         dS2Whs1veFn/9Lu1UzUChC7lltVVmzTNLzUYoKn2D3mHs+FQiHe8j+o82+wLpGeMrLt6
         wC/Bo9UfchxY5pBjWK9qPXf/H8sL/xt8fd1vL+k+JI9x54W9Ge/WbMVWsDDb1seLg59f
         evCF3JqiN50S10+sr2gKcpI/sntcz2qjEhzSKcia2wKh/aQxahfjJyvq+dPS1dH/qltc
         ylGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZAXWHmkJo695OfEt9v69+RbdYP/WExp9qOHSlNNplq0=;
        b=dRRpFpn5fnWH6AltrNs8zRZpjIi9coZ/Q+A+bcDKm+vAtzWjxSBkKNIdHBtLLrsGcg
         z7HrjdAdgxL9S1noBWrfYiJ04hKm68PQoG7HYzQ25x6+hN4iGZ6miEtP7h2bltTPIRGL
         EkIlFfUlvIg2/7kNcVe70dfpRee+7cIMH7nrbVpj4sSKCdUK5XX/dC4K7+vq7pjJ5Q6W
         XdRDc/txu+7Qq9bkOqR0xt+j472kaQVWOqWnnOxSTA+KDZx1A3mTZy8cUEieq8nPJJJ/
         Cqg4kC4YS5MTzavkBQVgcrGB4Uc6g/2xAWMNcm5xlsOa7UZRVoZ7BbN+VGT9qSvJKWbh
         o8LQ==
X-Gm-Message-State: AOAM530BfFj1A9BM2XIWvjaKvYD/yJyTY/AIlPyhfcTh7r2SjqtFoWaR
	HUC4P4wKWbuYMeIuh4VtSAeZzjiv/P3GqVnXXz8=
X-Google-Smtp-Source: ABdhPJy8fK/GSCHJoh/W7KC0tp6PC1XLyHJoaoqWY4QdqiTLKGJAJ/Cb5COIdsH4S+26Vz1rIzIR4xlFRrHjo2NpYuc=
X-Received: by 2002:a05:6214:291:: with SMTP id l17mr10464333qvv.50.1629311003304;
 Wed, 18 Aug 2021 11:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 18 Aug 2021 11:22:57 -0700
Message-ID: <CAMKF1sqL1aaJrNr4Fj1kkSb0+Ctd5sC8sUkDYiqKMYvJ3cyLUA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] image_types_sparse: stop using ext2simg
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 8:39 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
> Under some conditions ext2simg can corrupt the file system (see
> https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGWK36JkEd-i05YcAu4jeY6GFjsk6TS=Mtg@mail.gmail.com/).
> This has been reproduced with the ext2simg currently found meta-oe's
> android-tools-native). Stop using ext2simg and always use img2simg. This
> results in bigger images, but without the risk of image corruption.

how big are the images ?

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta-oe/classes/image_types_sparse.bbclass | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
> index 65d980fd913f..4263593a8dd1 100644
> --- a/meta-oe/classes/image_types_sparse.bbclass
> +++ b/meta-oe/classes/image_types_sparse.bbclass
> @@ -2,15 +2,7 @@ inherit image_types
>
>  CONVERSIONTYPES += "sparse"
>  CONVERSION_CMD:sparse = " \
> -    case "${type}" in \
> -        ext*) \
> -            ext2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
> -            ;; \
> -        *) \
> -            img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
> -            ;; \
> -    esac \
> +    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> +             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
>  "
>  CONVERSION_DEPENDS_sparse = "android-tools-native"
> --
> 2.30.2
>
>
> 
>
