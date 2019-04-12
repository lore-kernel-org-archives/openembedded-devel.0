Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F45C7DBC8;
	Fri, 12 Apr 2019 11:19:37 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id w15so10532993wmc.3;
	Fri, 12 Apr 2019 04:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GtzQJI7DUVF6yfLUSXP0pkGrZTHOPdRPyTDuMUiwYyo=;
	b=b+e97Ns0h1ez8u8ZOvvcaAdJWpHtLNuidgAEwMJJEW9wUxBCgnifS064R/nbpmtP5n
	NocwWs6QGlhv6FgS9cZW4kJ0NSIr8WnqWYv2CGgLBZPgQe95plZaJcOusZYIOTgEFErP
	t6rkQVep5qbQNdA5U9T59BT35QusUHlNNalVVNZeZO5COpyWKSCbONzGPaNZOSSXNCyg
	Gm6+QnBbVN+H+nCtjF90+O1FNiL69MvFc7bulanj+Dj8aN+aYVWA10i7SJDLlZRUV/ba
	4yVcNyIRE81zlbSOIUJ5f1cdErJ6qXQ7deoZ3fURZSOIPQeueeSlVYcw87b6mIMETmfK
	hrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GtzQJI7DUVF6yfLUSXP0pkGrZTHOPdRPyTDuMUiwYyo=;
	b=PNNbIVQ0DyuXZuTbnnewuNDmQam7fv6xnGTfOOpm4iYHQhNwCECUGo2hu5ttVQZE4f
	UPL6zTuqlPzfNo9N/qE4pKGsOjOgXjuGegX/fxGYtrFmcg+ZmRc5EXEb6mFEgI/6Ic/B
	k2sch7hayj9QmPujUQG/AyUWounax+E5mUyuW7PqsjHl9L+rdSGrV5Gt7Fe8yCwk+1jW
	CiiwdfClcgLWRDaCQW6y3XV6WDwFyLuLoDQx5lVcZHwlrdQ+Xl1pjw7B2D6wy03KvsGb
	l5s47oY52VKdIWjwLd30AJW3zxnXcKwEfX0UEt3fF/XZKQ4nkFXz9Fhjo6OhsU7ldDun
	x3Sg==
X-Gm-Message-State: APjAAAXat23UY4N0o+thl+uDScZ2gJplmlh2GdpAcVLiZzhS3au3oUKR
	I9LpBtUJkRBsMuj9jlkLkM4SzmsIX71+JbIuVDvQzw==
X-Google-Smtp-Source: APXvYqz1AouXghQQfWoRpeWDMIa9cWL0Rs20FxipyBul8VDimESuR3Zo2DEuqDZmEtmx1+lkMK49UZe2XbFyCENG+pk=
X-Received: by 2002:a7b:cf2c:: with SMTP id m12mr10941985wmg.21.1555067977749; 
	Fri, 12 Apr 2019 04:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <155361865233.22131.7759783180692598497@git.openembedded.org>
	<20190326164412.B8E17234232@git.openembedded.org>
In-Reply-To: <20190326164412.B8E17234232@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Apr 2019 13:19:33 +0200
Message-ID: <CA+chaQck72a4O43HByMksdWOKpxFKMKHWC5+N93ymPagT-_OHA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 03/04: libforms: has a depends on mesa so add DISTRO_CHECK
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
X-List-Received-Date: Fri, 12 Apr 2019 11:19:37 -0000
Content-Type: text/plain; charset="UTF-8"

It depends on libx11, x11 DISTRO_FEATURE is required as well.

On Tue, Mar 26, 2019 at 5:44 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> khem pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit a61246124dc225e7ae91ecc9958c42f315043740
> Author: Armin Kuster <akuster808@gmail.com>
> AuthorDate: Mon Mar 25 19:19:34 2019 -0700
>
>     libforms: has a depends on mesa so add DISTRO_CHECK
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> index 8a214d1..f86d7c1 100644
> --- a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> +++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> @@ -14,7 +14,9 @@ SRC_URI = "
> http://download.savannah.nongnu.org/releases/xforms/xforms-${PV}.tar.
>  SRC_URI[md5sum] = "235720a758a8b8d9e6e452dc67190e9b"
>  SRC_URI[sha256sum] =
> "7989b39598c769820ad451ad91e5cb0de29946940c8240aac94ca8238c2def61"
>
> -inherit autotools
> +inherit autotools distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "opengl"
>
>  S = "${WORKDIR}/xforms-${PV}"
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

