Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id D87AC7D924
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 17:58:06 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id k2so8197280qtm.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 10:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ETGkwjHRebzflCS7OEXGIGtiI617I+R5c9KNzOhQPj0=;
	b=Q0C7mxgara8wj8U1GmmsJO0OIaJvZo+eBaPGcCXzzcdFKkpDgGj1a1+gY5eRIPEUZr
	vrMwo5MZJ2nY3reEJ1q00wsw4tZ91s5QSyYgMotsuI3Y2OAjndmBwaSFiCmGUElVbneI
	ztL5Ks6XeKiJNG3hXgUULYxPVGGPiV+ubkfHTPFmKcjfqbMvNOKyf5VKU9YPsZrbfwxu
	N1OpNzANdUsG2YW7SD3pQau3lhqFddsrWnDkg8S2c5ZzZLm6vjq+R+IBS5fgZOhq2wwp
	nH7yUIOeE/N9fiOABhivnnJ1si5rao6WOI1tY8nj3Vlji1G5sKiJsCV+WfczUxxZl7rR
	wR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ETGkwjHRebzflCS7OEXGIGtiI617I+R5c9KNzOhQPj0=;
	b=A1WRGz3pbE4XPxgqFURKmaaNbbUrvCk4Hh7eCeaXzNfFpgGZjbh3/a5Mlu6nGky5wh
	N7U/GNlNWa+qxKFb27AXnY3cSBfDIgjpglyC10jJxXEssazLuL4vR1NxOnLF06HZ2OG+
	pBdXXBd9z08KhNt/ZdeGc3PHDIJFt8kmih1vYEv2F3mJq7LMtvmViLjxL22UqdVqhd+8
	5+veBQP1VjRGyjz1F6mqfwZlEjJ1Tf97EEXMPg10NcBsMGuFiEO2vusftY6JIAUdWrfW
	rQXPtKiapVnFbe+uTb38+NWMyawvHO8Je2muML4f65LsCbjM+wN6iyE3jdxB61hjNpFx
	L9bw==
X-Gm-Message-State: APjAAAWH8eQyEUFPXqz20kFXQtKLfkOfE3nGAqhf+i84pW7I6OskpOGY
	cS5xNG0EEke08MXU/7HwHwTcWbvPtkR564+VS5Y=
X-Google-Smtp-Source: APXvYqzPneUxh3l7vgLMexcTXoA8igiGFGZXSFu0ohvhUQmPad3UmuEx/KCSEDmIs/bhn8IYCvyAzLvv0fN+BxxIpWc=
X-Received: by 2002:a0c:81a9:: with SMTP id 38mr40954109qvd.208.1555005487402; 
	Thu, 11 Apr 2019 10:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190410083634.7715-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190410083634.7715-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2019 10:57:41 -0700
Message-ID: <CAMKF1spDRESBupKYbsxQYTjDW+4R6yvmXgY_bAz9QoybFhrgGA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-beautifulsoup4: upgrade 4.6.0 -> 4.7.1
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
X-List-Received-Date: Thu, 11 Apr 2019 17:58:07 -0000
Content-Type: text/plain; charset="UTF-8"

Upgrade python3-beautifulsoup4 as well

On Wed, Apr 10, 2019 at 1:36 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-beautifulsoup4_4.6.0.bb to python-beautifulsoup4_4.7.1.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-beautifulsoup4.inc | 4 ++--
>  ...beautifulsoup4_4.6.0.bb => python-beautifulsoup4_4.7.1.bb} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-beautifulsoup4_4.6.0.bb => python-beautifulsoup4_4.7.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
> index d60d987ca..a33d8f4be 100644
> --- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
> +++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
> @@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
>
> -SRC_URI[md5sum] = "c17714d0f91a23b708a592cb3c697728"
> -SRC_URI[sha256sum] = "808b6ac932dccb0a4126558f7dfdcf41710dd44a4ef497a0bb59a77f9f078e89"
> +SRC_URI[md5sum] = "c71f53fcb2580c376ab7b010a9178983"
> +SRC_URI[sha256sum] = "945065979fb8529dd2f37dbb58f00b661bdbcbebf954f93b32fdf5263ef35348"
>
>  inherit pypi
>
> diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb b/meta-python/recipes-devtools/python/python-beautifulsoup4_4.7.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb
> rename to meta-python/recipes-devtools/python/python-beautifulsoup4_4.7.1.bb
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

