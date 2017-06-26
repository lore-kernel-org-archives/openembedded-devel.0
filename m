Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D6E1F77E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 14:22:44 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id i127so2915480wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QPJLzHuMvE9Ct4OWOSkd0959/+OGMwnl8J+3mq/57Pg=;
	b=eDHB+WM2mIcmyA96T4tXl7LSDnfH/djIGty55U66YMW6YL0/75gOaHVKjy36BEZun7
	M1+5dz5oCpnOQoW2BlRWHM1tk1hH3yZYmS1Pasb4zlXeDzrTNhjRxzWEijUwSc/VFtce
	bWU0fxcuTKyqvVM19sZ6GI9WkhsSH5RrDr5qYehI1wYMZkDUMogDJdAjMOnlUnWg4oFC
	Y5F/eoP7y4+vaPHPTHT3Wj5f9V0jrQJ1acZKOOqw64JrF6d4I5Z+g0IcnSTAK9qIc7Lv
	IVNKYN26bKoJuH+R39JCEkDklHI/5LLa8fgVKcSmIZ8eZRyM4vIGLaEePxhpLP3xk3k5
	ZoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QPJLzHuMvE9Ct4OWOSkd0959/+OGMwnl8J+3mq/57Pg=;
	b=oZvGEelkcc3Nl/oJwdpUFxR7Y/kEKkZaVNiq5wox9oKhQ/VgYY0NPjeOAoEdQBcgdn
	HcTQYLDMk6pTmwcvaIBkJHwO39ypoPimS2bLDFKpJihq/rfTzu0vaTiGa3fD7g6HG7u5
	qe/4e+1dTnIYJZ/XluXFB0lgBN3COyujZLEasLqz1S8kLtZe4wh2NUznlmBKW/GsS0Ux
	hOoYunIYYhs7wARkKA3EcTl5PRGoXsxf/K+nr8cyfCCv+cHJsAbMk0GK6aNpOqB2ggpd
	tAptu++NEX9XeZcF+Xv3pvV7CAoD5A+LFqb935Lf7hf5CLo4l1qogWXTyOwgwrXHIUjv
	30sw==
X-Gm-Message-State: AKS2vOzqGLUgyfk4FqL01N/DoxUu+XABtkqRQXnT+zAbruGHMlwV9KiO
	HoK9SJ7sfRv0bJnjH9H1v2u2jmRsmg==
X-Received: by 10.80.131.6 with SMTP id 6mr317285edh.178.1498486965150; Mon,
	26 Jun 2017 07:22:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Mon, 26 Jun 2017 07:22:14 -0700 (PDT)
In-Reply-To: <20170626053446.37959-5-raj.khem@gmail.com>
References: <20170626053446.37959-1-raj.khem@gmail.com>
	<20170626053446.37959-5-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jun 2017 07:22:14 -0700
Message-ID: <CAMKF1sq6vXcOZDA7+4vaV5ixhFUPRs72fzssa0h6i6VkNu+iDw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/7] hwloc: Inherit pkgconfig
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
X-List-Received-Date: Mon, 26 Jun 2017 14:22:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Martin


I see that you did not pick this into master-next but this patch is independent
of the other patch where you have comments to address. Although they
address same package this patch is not depening on that patch, however
that patch does depend on this one. So you can cherry pick this one regardless.

On Sun, Jun 25, 2017 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes
> | checking for LIBXML2... cannot check without pkg-config
> | configure: WARNING: --enable-libxml2 requested, but libxml2 was not found
> | configure: error: Cannot continue
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> index 16cd507e6..1194af0d2 100644
> --- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> @@ -11,7 +11,7 @@ SRC_URI = "https://www.open-mpi.org/software/${PN}/v1.11/downloads/${BP}.tar.bz2
>  SRC_URI[md5sum] = "96c34136ff416d2b13a7821c27477bed"
>  SRC_URI[sha256sum] = "95d80286dfe658a3f79e2ac90698782bb36e5504f4bac1bba2394ba14dbbad24"
>
> -inherit autotools
> +inherit autotools pkgconfig
>
>  DEPENDS += "ncurses udev zlib"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
> --
> 2.13.1
>

