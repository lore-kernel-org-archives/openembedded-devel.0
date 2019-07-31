Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 76BAF7F4B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 15:41:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d17so66916207qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Lg3oUq+G149/78ZRot3fQNvtW8rWvHYQRSKpua1v+vE=;
	b=NOO4QUijmjhsO62CjfMdeb2rkk8C42myKbHgb4s5JSe/S5otHqzTdytOzEI4i8pbjw
	1njQKKZXtblE17LIKI0AQodey3g8CneMHj7qJ1jcGv/9fLPsorOcLJA0X1Y/fJBW/+m9
	+36KWCoDQFugiBlzcy4GKJmixRJvZz/zPP80a7pdtAuP9HuKWsnAk12NtjJkSMAYeiNu
	9kuIL/gTLzyh7xb7oLU3/YpL4/MTCBPlEx+dNqZtu5GXvwh/8NzBHhYcUKeUVc7fEJS5
	+p2rX+tXx2cWAi5xv+ffGXSprhS5sZYBhwc/i2TpZR6Ac6oWTGiQr3LcEDGOJtwn5lcT
	2Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Lg3oUq+G149/78ZRot3fQNvtW8rWvHYQRSKpua1v+vE=;
	b=S+zrpRTv9fjCzJsq0TuqlOQOE05J5RCQfJdYTISW+RYlJKQAmpKGl+WH9hEEKZ2h1S
	Vlr9M9DE9vvkaxnkHxQmTcPsmKPw/uiqxm+RIe/KKCS71LjgVfRhXbJYNwseatHm/u0G
	cKhi5izbUSOYmegOeXrWR+Bv4Dz2n3KSMutuLzg1CfmqC+ZUkpG2zUu5WYQ7SJYPbrJj
	IYeIauUWiINVct1rU2Nu1LTwCWiOsDWO0i0vnbv3HnJyfrWta29+kU6fp/QhYZosDqd3
	B1YdWmYsZFyWf6wOhBRPcLwstPatSW190BlP9na73jd4XZJJW0XaLFz+DlQZNMZgnX8C
	Fu1Q==
X-Gm-Message-State: APjAAAUm1oXFH3ECHFnR1a4P8d0C1OY/BoPyaErjjaS/3y3S5qOMPiIU
	0VcDCAanzR5CrLYxF2S77asWaK/49yGLvC1eCTsiRGRb
X-Google-Smtp-Source: APXvYqy5xkTpyqE+N+mUy8sgqff7scb1aTGp12ojYqFJgRy5JMuOk4PF38HC5AnTty78B8U5qnzWLN2M7v60Gg89eCQ=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr89710252qvg.181.1564587696945;
	Wed, 31 Jul 2019 08:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190731060355.24511-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190731060355.24511-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jul 2019 08:41:09 -0700
Message-ID: <CAMKF1spnRZ8=OAWEDH-KonkMSH=qMYGM6EsTfgaJk7konVNsbw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] opensaf: upgrade 5.19.03 -> 5.19.07
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
X-List-Received-Date: Wed, 31 Jul 2019 15:41:36 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase it on master-next and resend

On Tue, Jul 30, 2019 at 11:05 PM Zang Ruochen
<zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../opensaf/{opensaf_5.19.03.bb => opensaf_5.19.07.bb}                | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-daemons/opensaf/{opensaf_5.19.03.bb => opensaf_5.19.07.bb} (95%)
>
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
> similarity index 95%
> rename from meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
> rename to meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
> index 0cccebd..0f2ba2f 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
> @@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
>             file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
>             file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
>             "
> -SRC_URI[md5sum] = "4dd1497ccd82d275735853bf0db5c510"
> -SRC_URI[sha256sum] = "de42c8dd850990716ca494ca598165cc7a23b5b7f2bc21af5d71a3d971ddd595"
> +SRC_URI[md5sum] = "e9ae9de803a99b7ab33757a49858542f"
> +SRC_URI[sha256sum] = "caed672d03ab1fe3f27d333429c7ca03022714e7c6350500208b7bd7349f03ce"
>
>  inherit autotools useradd systemd pkgconfig
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

