Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A73AD78697;
	Wed, 15 Nov 2017 18:03:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z3so4719258wme.3;
	Wed, 15 Nov 2017 10:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BVofOp/bXBsNVbNK8+16dLl8sEbo44uVXXxMwi0JyqE=;
	b=HiI1P9OJ6DCtOh7VqYBcs7JTN09tSj8CxUXP45a0Q3MsEGzRNz+EwNmmxWI11ydHa7
	3U8+Emt7H8TLBWZQmSV/GyPe+/kyytXpvFmGuA09uBWUz4grUmFr+KlVVUjMe2NQ34qd
	MwKd6flnhYERAN+AqMrfF6Uy6d79MD7kOtHDTJ8DQSF/7zeX68xDAvLV9urxj6z/jnzF
	FVkDkl1nANrPyBcbo5G09cm0wmt+T4/e1NGY6/UlT1J4FKFei/08q9/kTKMqd6ucGgkB
	y1O19T8s67M9/FxK/YJyq8sd/cCV4vUr/Cro1B+S7yu4xKUcRWwJZGSxHZyeapi5Prde
	qrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BVofOp/bXBsNVbNK8+16dLl8sEbo44uVXXxMwi0JyqE=;
	b=uk9ftMzgKnY4bKZJO8WA7ieGNFigXqtXpk90KK6D8W6Po0u4ObweqdnttpFgtmeJdg
	zk0eeEdhp9o/UcY4nV3oyKXlvl/s0bl78b6ImbTg8yBtgsI+WvXTHvXobpQfOwb+iZCv
	KohDbEzgsvROPa51pn/kharl/Zs8VgpYqYN3eQeREX82FR623j0QcIf3FlXhJF9RmcrD
	s2mb4Gs+uHyW0JeMlpiq4ZY7fsz2fKzcxL/3Zx6cyEojAoVHyIu6loDTZdZk5xQrxRKj
	K2fZAvkmrFmt87ALE/fLwKqYOvxGth6hwFrW0C1VdXN7zwS3ytWyUkNTqr4sgIFqdMwE
	hQQw==
X-Gm-Message-State: AJaThX6oTl3wQZeVWFV8CpfbmnbmJeQ/HDTqpUMR5al7QgM6VcJ9mmjZ
	xTWKHPl/226XiYjTQO80DyfcRKdXzkWkYk0p0zA=
X-Google-Smtp-Source: AGs4zMbPmz/ywwZERiDlBLWSescgV49PCUtAT42HLbVjSeNL4VMacwn9sv/KCMgwiIbja4GrharrzcXB4uPFnhj/hBk=
X-Received: by 10.28.231.19 with SMTP id e19mr12429722wmh.1.1510768992051;
	Wed, 15 Nov 2017 10:03:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Wed, 15 Nov 2017 10:03:11 -0800 (PST)
In-Reply-To: <20171115173600.2DB4123487F@git.openembedded.org>
References: <151076735962.17716.13874149682187371186@git.openembedded.org>
	<20171115173600.2DB4123487F@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2017 19:03:11 +0100
Message-ID: <CA+chaQeO8N9B0o6s8QtdqrR7oWv1i=95afJsQpBXtxhwU_jA=g@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Chen Qi <Qi.Chen@windriver.com>, akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 05/84: gnome-common: add PACKAGECONFIG for autoconf-archive
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
X-List-Received-Date: Wed, 15 Nov 2017 18:03:12 -0000
Content-Type: text/plain; charset="UTF-8"

Please don't merge this one until autoconf-archive is changed in oe-core.

On Wed, Nov 15, 2017 at 6:36 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> armin_kuster pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit f852f042d60103de7fc7424e60b46aa0f24a7bd9
> Author: Chen Qi <Qi.Chen@windriver.com>
> AuthorDate: Tue Oct 24 16:19:44 2017 +0800
>
>     gnome-common: add PACKAGECONFIG for autoconf-archive
>
>     Add PACKAGECONFIG for autoconf-archive. Default to enable it to avoid
>     m4 file conflicts between gnome-common and autoconf-archive.
>
>     e.g.
>     IMAGE_INSTALL_append = " gnome-common autoconf-archive-dev"
>     bitbake <image>
>
>     We enable autoconf-archive PACKAGECONFIG to avoid the following error.
>
>     Error: Transaction check error:
>       file /usr/share/aclocal/ax_check_enable_debug.m4 conflicts between
> attempted installs of gnome-common-3.18.0-r0.noarch and
> autoconf-archive-dev-2016.09.16-r0.core2_64
>       file /usr/share/aclocal/ax_code_coverage.m4 conflicts between
> attempted installs of gnome-common-3.18.0-r0.noarch and
> autoconf-archive-dev-2016.09.16-r0.core2_64
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
> b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
> index 06f3bb3..d874164 100644
> --- a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
> +++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
> @@ -14,6 +14,10 @@ SRC_URI[archive.sha256sum] = "
> 22569e370ae755e04527b76328befc4c73b62bfd4a572499fd
>  EXTRA_AUTORECONF = ""
>  DEPENDS = ""
>
> +# Default to enable autoconf-archive to avoid conflicts
> +PACKAGECONFIG ??= "autoconf-archive"
> +PACKAGECONFIG[autoconf-archive] = "--with-autoconf-archive,
> --without-autoconf-archive, autoconf-archive"
> +
>  FILES_${PN} += "${datadir}/aclocal"
>  FILES_${PN}-dev = ""
>
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

