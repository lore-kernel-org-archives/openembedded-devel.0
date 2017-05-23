Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f176.google.com (mail-yb0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 122CC77FB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 21:43:15 +0000 (UTC)
Received: by mail-yb0-f176.google.com with SMTP id 132so41263170ybq.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 14:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h6erPBy5KUu4kMSWnbCazsCkvFF/BqD7mfL2wAfh7PQ=;
	b=VJuaf+YdmRDA/LP/kBLeCfk+5JUurqRqCXW+nuFH4YjtTCve8ekwK9zX+52vn6enTe
	llXR6DjTm4TjWf1nqQAOD/I08gBrayWfhNuFssuZF/2gmgnFY/b75FYfDECm+RGDh9NR
	imvMBPUDDDGNCQ92o8gxYkaCbrhS1QdAF/HXZM5SqrfF5shfkp6e6wvOXP1NRV8JU08Z
	3xmN2Un4u1jVED+beNOMUIwoGaTEZtwUoiDAmre0uARnwvIX7AXa86aLkaxteDFOd10v
	iEV31oL6yLYihqp3GjPfFt9d+pwHHlFqdjQxSSIj49q4aplHH2N7rORHI2iC+n5N0VXj
	NNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h6erPBy5KUu4kMSWnbCazsCkvFF/BqD7mfL2wAfh7PQ=;
	b=r5H0lsPzw6wy4wuQhVU6quOgcmrL9ZHeDIvQywz/DWeeObp1fMdpMeHL2H98l+kxVq
	Fuqntp/dg59opVQiMEbNfYGWoIjSy+BWMFp21TFrLJdjltDn1erwXgAmGbrZibFU38Td
	FbOzuy4pQBhGwU0nRIRbbQARWzx9z4IdBP5GY4AJF8fYPJT5VE+8elSCStJxWmqq+mn0
	vyxLwrMVbCP/tGg+/Y0vajhuZITIFwJ3/HpQnRDWD6iFX/DH7UoKx+8/KFduzft7S9p8
	Y6HZTcjSUg/WBqbD4IDyVmLJnYCeNe7pfwgoJsGn2EfmG8rwKiuFjPnRB/Eac8E8nhb/
	8mLQ==
X-Gm-Message-State: AODbwcAgGgYwOW/QTortO+0r6VVmFAx8cO7Pa8/cXyrJB+oqk9bxBWVa
	Y685jxu9KzVg5V3SbtFSSL7AR5Q9MaZJ
X-Received: by 10.37.224.215 with SMTP id x206mr25473739ybg.101.1495575796926; 
	Tue, 23 May 2017 14:43:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Tue, 23 May 2017 14:43:16 -0700 (PDT)
In-Reply-To: <20170523123448.5051-1-daniel@zonque.org>
References: <20170523123448.5051-1-daniel@zonque.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 May 2017 23:43:16 +0200
Message-ID: <CA+chaQdXu3XRfDz0ALkaMZnZsunnm-nrH6+m2q1SyK_iTia9=A@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meson: update to version 0.40.1
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
X-List-Received-Date: Tue, 23 May 2017 21:43:16 -0000
Content-Type: text/plain; charset="UTF-8"

Please check 2 meson changes from Ricardo Ribalda Delgado sent few days
before yours and rebase your change on top of it.

One of those patches don't apply now on this version:
http://errors.yoctoproject.org/Errors/Details/143049/

On Tue, May 23, 2017 at 2:34 PM, Daniel Mack <daniel@zonque.org> wrote:

> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  meta-oe/recipes-devtools/meson/{meson_0.37.1.bb => meson_0.40.1.bb} | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/meson/{meson_0.37.1.bb => meson_0.40.1.bb}
> (87%)
>
> diff --git a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
> b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> similarity index 87%
> rename from meta-oe/recipes-devtools/meson/meson_0.37.1.bb
> rename to meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> index a83af77..2ba2fc8 100644
> --- a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
> +++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 3b83ef96387f14655fc854ddc3c6bd57"
>
>  SRC_URI = "git://github.com/mesonbuild/meson.git"
>
> -SRCREV = "3d4bfdcb22314ea7db45a5b075f8b2a9c1498aab"
> +SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.9.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

