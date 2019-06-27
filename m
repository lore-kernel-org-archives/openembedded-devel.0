Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id D0CD27E9B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:06:03 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k8so7599859eds.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J/Fi1m9kbNT88DOklFEFTDZzpl2vaPdhRwqlaXIcogk=;
	b=jFe2k+iCqYPdrLiRR2vB4CaRfShKstzqO4z98ViMN5nYv+zB10Ml+IfZpGOJ2dEDCC
	PBu+knsEyiC1SV4YIOfmaGgIkrBGmSqGEr5Agtvvb6YTcwjSriAiuOj9xsoYDX7XsTxg
	nQ8DEYYRCFhVAXN3kjJ65ZfErHju7CFCk6huIPe5dRclLv6eumcfhk0h4wHzn2/2EmGe
	Zc7mc1iwhwgk2IsXrQf18JdMLPi3fNJWvf/rPHCeC37m3KK8Mf6DknDymj94UpYd0JSQ
	wu7v67ABsAgA5Z2o1iIN3iuK8LzsSneZ9BmywVNO7DhbofsLsK0tEIhQiosWvYw+0dY8
	j+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J/Fi1m9kbNT88DOklFEFTDZzpl2vaPdhRwqlaXIcogk=;
	b=qJG08S7EDQaOHN5r0WAVRAXu8TUU9ArW/hiq5nxWi/sZG3vFsdfSbQqevTRYyKUcfs
	Rr5ajPE6J3c9sTw1Gqflt8+eADZtQ3vvvtjW5FMclsLwxsD8QqV1CLo1e9TC8BoJWQJ+
	1dbDFlbTP41ahrdlpOIY2uq5u4x3hTbojbcmnnPKyAzzzXWYclx4wUrl08F+dXOJ581C
	pBT7M0ZUkdAcglWmzfIP/hRH3+GRJ5+CuYatk6+zyc6sTvGJwhH2Ycv3KGg2P8Faz8AG
	4biZDCOKQPuQcCHxxtmdkh0fGTD1uqMVpOv06j3IKAzME9Rdwpol0bIvTeHVHMFYcJG5
	rBUA==
X-Gm-Message-State: APjAAAVvoan9A+X/7CUecZkzTLajem4pc3KH+MXE79ymuzSCurj0pvQo
	HxX1MkbfoTCUlFn5jMvKXUpwA9cFt38awdBHHASV7Ytd
X-Google-Smtp-Source: APXvYqyeUAfXrnZywnr3Fh6CrJDmQqsjZSXlN4q00+TtgIiN8aH7AwU7uVMyEAAkSlepegnWc55HtNMEdKPYBq7UE5Q=
X-Received: by 2002:a17:906:1841:: with SMTP id
	w1mr3938117eje.205.1561651564556; 
	Thu, 27 Jun 2019 09:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <1561651356-12247-1-git-send-email-hongxu.jia@windriver.com>
	<1561651356-12247-3-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1561651356-12247-3-git-send-email-hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Jun 2019 18:05:53 +0200
Message-ID: <CA+chaQcTNR-mZvh=qbGe_mWFFmeLpdeJOPwjm=YUy_ypWuYcdg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH V3 3/3] tvheadend: do not inherit gitpkgv
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
X-List-Received-Date: Thu, 27 Jun 2019 16:06:04 -0000
Content-Type: text/plain; charset="UTF-8"

> After the fix:
> tvheadend-4.3+git20+bdc2ae9e19-r0.core2_64.rpm

This is no longer matching the code with the PE bump.

On Thu, Jun 27, 2019 at 6:03 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Do not inherit gitpkgv in meta-oe, since meta-multimedia
> does not depends on meta-oe.
>
> The pkg version will be minor changed
>
> Before the fix:
> tvheadend-4.3+git10478+bdc2ae9-r0.core2_64.rpm
>
> After the fix:
> tvheadend-4.3+git20+bdc2ae9e19-r0.core2_64.rpm
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> index dc6cd46..e3875a2 100644
> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Tvheadend: TV streaming server and recorder"
>  HOMEPAGE = "https://tvheadend.org/"
>
> -inherit autotools-brokensep gettext gitpkgv pkgconfig
> +inherit autotools-brokensep gettext pkgconfig
>
>  DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl
> uriparser zlib"
>
> @@ -11,8 +11,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
>  SRC_URI = "git://github.com/tvheadend/tvheadend.git"
>
>  SRCREV = "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
> -PV = "4.3+git${SRCPV}"
> -PKGV = "4.3+git${GITPKGV}"
> +PV = "4.3+git2${SRCPV}"
> +PE = "1"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

