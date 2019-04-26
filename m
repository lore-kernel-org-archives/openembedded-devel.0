Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id F1E257DBAB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 17:38:55 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id b3so4959145qtc.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yYu3Pns2Ghh0tycwl1TlZhq9OLvz+EN08ATugEuAumc=;
	b=b4q76oMGN6zpRdnW/xcvWveIC3i1AQBgDbl7/RRLn3Fxk5Td49s/OcdHlwE5Lv10aJ
	Zu6au6q+j+DqQZsMQqoI37Wdh9S/ywyW1J2I34I/AreLzJOzbVGfZf67mu73RK1XuVrd
	3bSFl5ENjeBzR7IELbwVaUwx0B8Hhmgt8L+RxzU9/RfJ1vBPBIXgBGuG062nFhgHWQ50
	gbERD4JRTFEK5rG/3q2YkEpjEBJiK1bj7rPNXPtCC9tLHUnosc7cWC6WF4sbyDs/I6/5
	yc8Ctah74oj1bLOd/t8P02NntrgnfMGxE3VJuD28/8y7gQxHmVcX/24xLReKU+uw1cXF
	PF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yYu3Pns2Ghh0tycwl1TlZhq9OLvz+EN08ATugEuAumc=;
	b=CBwi18hO+L+Afa3g1+31DBq9ZDdHy2aJIIxGDA0fFaOqE/3MzY79SR2C5AhUiQufxT
	9nJsnEqoUcIJnFTq0wpgzIYeBlJ5p6CyaeNAO3vk4mC/DXjlzs2E1gWyYNTj1vK52fx3
	V/OnhzH/JyFMYcptaxISQheZoZXz/eZ+kUY0mv62Y4GkCpVizBPfdcPwpaXw0jitLvyN
	BCdeFjuujd0z80eNxlvHrA38/Lla6CQnkuNN3zzaJMK+h3jPw3fcQCoVEuHSOyywJV3O
	8xY4cRpYF0Rbu/GGti/1PCNaPQZ6zLvKKCJcZR1acjDUOkBMsCMR4zJtsYuIvxu5RBYt
	Pt+Q==
X-Gm-Message-State: APjAAAU090Ae+gL+a4NAxpN4hiWacIyWZUTGdndZkoj3l42Bf6SlZMI9
	3RrOj8f+xT3kp5OfnZfMB2DGuCCHAhBLgY9ZRNQQmhVj8HQ=
X-Google-Smtp-Source: APXvYqzyntz4V+wRYzQ1nuiFYCQ8mhhyzqi+LiW0A0oVM83UxOVsEM9+0ri7GpC2UvRpcYo5EGJ+Unsc2qYfqsZTqaE=
X-Received: by 2002:aed:3827:: with SMTP id j36mr37099671qte.196.1556300336525;
	Fri, 26 Apr 2019 10:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190424220849.17374-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190424220849.17374-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Apr 2019 10:38:30 -0700
Message-ID: <CAMKF1srDniOV4A4ziRBOXGOBa0HuhAb1umPRvvaRzuBVtTWuZg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] nopoll: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Fri, 26 Apr 2019 17:38:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 24, 2019 at 3:08 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-protocols/nopoll/nopoll_0.4.6.b400.bb           | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
> index 8c57d2949..84bd65618 100644
> --- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
> +++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
> @@ -11,8 +11,10 @@ LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
>                     "
>  DEPENDS = "openssl"
> -SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
> -          "
> +
> +UPSTREAM_CHECK_URI = "http://www.aspl.es/nopoll/downloads/"
> +
> +SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \          "

The escape is not needed if its not multiline string.

>  SRC_URI[md5sum] = "8d333f158b5d5a8975a6149e6ef8db63"
>  SRC_URI[sha256sum] = "7f1b20f1d0525f30cdd2a4fc386d328b4cf98c6d11cef51fe62cd9491ba19ad9"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

