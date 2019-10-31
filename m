Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 75DAD7F998
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 22:07:41 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y10so3830369qto.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 15:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+VYL6IMHXQ1urih25HhiZdfy9hUXM9z8gMIqc0Xoq9E=;
	b=b0QXSKyKXfeBXeaZ6ZGbLm9LuDtw970KvKt1WorHVdYILqUvu2VkfOJQcfe/kGSY3t
	lBF3tLoJ8AVHjbcHfQSUS7rcO25WkC57/4hkU0SQyV96WKpVf8g9XzMyDHsLiTpjYfT+
	OTsL+1ZomBgQKxbAwNS2fRYytsVeUETYVc0Kf7PIBS0hBV1sMgAmsPoFMN5ved8Q6bRD
	1xFyoANeWECAOjqqbaGILu0O6QD5V2q0yKipl096TaNAI7/6qI6IAxbbZXn4JQc6LrbH
	hBjZtvZWh17berSICw/B+oRvQmGezun6ZDTft3Nhz1CcjOt18rf6gaLN2plVXXv+ZEOC
	1K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+VYL6IMHXQ1urih25HhiZdfy9hUXM9z8gMIqc0Xoq9E=;
	b=OvTG2Lc47jMnYiGwgwjd1THwsHyD5P3OLeUxPHsUDRH1v8m/gXmt+UnIJS2JCY9dRs
	DennVjOkPrKCwMhpTn6AWflfvVdM1RvTi6elwPIxDDtJzQX/zaAk9CN0EgY0eCQtkb4d
	HoH/Ml6D/gQTFlWvx47zzyvNLOLPJYhLGfcAtYHwOol/91lr6utObuwmod6RKaDSbox/
	Q6sYNOAewHkeM+mgBPOJHhPvI2kmLh8OoxNGIruxhAN6CCIUD68hxuSrzKCkG7hPA1/f
	H+bvCVxMxF41lU1wEyAQiNT5e96DTq+T5TDmtWYmCis7/TmCJnKOa8M2AficHCoaXufM
	1c6A==
X-Gm-Message-State: APjAAAW882LpzlfPAnrzRu9cMTFRmnNwylBB8YMWEKKz60ObsiNKWIE7
	8Yq+mfWNYiZPByOY9J4xqpFKF1CyBp5b4T4gvQA=
X-Google-Smtp-Source: APXvYqyqofhS/f/MuoSewYAndXpb0xvyfQDwoyEy6WyZYekbAZr7Qf7PjerRBhp7PEWWnobYiFA8juSym2Z9F391Tbc=
X-Received: by 2002:ac8:2476:: with SMTP id d51mr2795498qtd.378.1572559661896; 
	Thu, 31 Oct 2019 15:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191031161616.5855-1-peter.kolbus@garmin.com>
In-Reply-To: <20191031161616.5855-1-peter.kolbus@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Oct 2019 15:07:30 -0700
Message-ID: <CAMKF1sqj0LQzhcihWj1TMEcG4EdaLiU7Btte6AY=gs2HkJUdGQ@mail.gmail.com>
To: Peter Kolbus <peter.kolbus@garmin.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][morty][PATCH] python-markupsafe: Extend to build native version too
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
X-List-Received-Date: Thu, 31 Oct 2019 22:07:41 -0000
Content-Type: text/plain; charset="UTF-8"

Morty is not maintained anymore

On Thu, Oct 31, 2019 at 9:16 AM Peter Kolbus <peter.kolbus@garmin.com>
wrote:

> From: Khem Raj <raj.khem@gmail.com>
>
> chromium-60+ will need it
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> (cherry picked from commit b28aa7fac9631c228bee98cfd2a0edea3c163916)
>
> Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
> ---
>  meta-python/recipes-devtools/python/python-markupsafe_0.23.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
> b/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
> index 396eff102..5c9884b9f 100644
> --- a/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
> +++ b/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
> @@ -1,2 +1,4 @@
>  inherit setuptools
>  require python-markupsafe.inc
> +
> +BBCLASSEXTEND = "native"
> --
> 2.23.0
>
>

