Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id C85157F9C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:05:36 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k5so14514732iol.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=m32vd1woqLPeDdkyeQlIAkDACE01REVfM3Qqpx/aF4Q=;
	b=ZLouLpL1K4G6xv2Rve3Q6+BMQNFvlX9Cg8Tj+5EK/F3tVFKL6P19ymTQt4CzlkrdxM
	JDABej7e7Q2txKQ8nnbfmK33s1/3L8PFLkR2Eql2byEHx3OQfNYK7+AP0NdYyhO7TvpE
	v7bv17rXz4AzGV1lt+NWoGw4HmpoTLeGRWABeBMYtNueQMbBi38NNJYHFgExC2LW/K6P
	9DKuTbZ6mbQkvznsLe2jo7HKnJGhcf23Ot8NyPX5andPjUoQf881NcCPY3mtjCom7jHY
	CUdLponsJCrTGe6fttXzMT5tM4fSOsbIVcsDsea0mgMwa7iH3LmR87/1B2Y6YEXt00yF
	tWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=m32vd1woqLPeDdkyeQlIAkDACE01REVfM3Qqpx/aF4Q=;
	b=U+y1f9eFuMe38qYR7voFp5Jzzv9rIfKGa5wQzh0MS6yqaSNuKkOJvmYaJDpE2XMV1c
	ZsIuVw+7pKjc2bRgCGuOINinXWSu3lu44uTErQTmfRFJipRKX5Iw7Vuhb04J/9DZKeY/
	5zh7w14Abpvu6okc0y8/UfcS+uBYaCN13FmZzkJ1DIsT16L3iRPYpUVtlS7LYU1kXBXe
	OgvIHCMzv8l5/FEaweL4LU4C+ZeXM3KPTdp2qtD4ngSBsvyAkN7BrhReQclqG9ugqGrx
	uQzSAeKmThuUoC8Ium38D4CktLFfY1ee5esevEFUn3pTqcZFeBojmRby03Q8nX9wUfLp
	8edg==
X-Gm-Message-State: APjAAAXm8eEb0whnM/ttvi5XupWKk92x0kEu1qnyoDg5bI6VvJCzBWMp
	N5sggAYIXWTvpzLdu2wA8jkyl6RZJNuljR/yakbfVYMZ
X-Google-Smtp-Source: APXvYqzG9qmskBb9Qlh/z5X7BmnBEw8+v3x8ZP01ZSy0OiEhgsKPXSzP3Yjt6VFN5ZkZ0IQMyufCu9OlmHX2VI45IPg=
X-Received: by 2002:a6b:8bd8:: with SMTP id
	n207mr18066015iod.147.1568970337803; 
	Fri, 20 Sep 2019 02:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
	<20190817111825.GA2828@localhost>
	<CALbNGRSBQv22cpj+T+KBS-1oOhpUomXBN78FHhFw52=pGEOp9A@mail.gmail.com>
	<efd5c05c-1275-8077-84e1-f17fff05f8f6@gmail.com>
	<CALbNGRQnxLXFXoSkPxWnFZJHWWdDvVP_=i9-ybYOVGzirty6Uw@mail.gmail.com>
	<CALbNGRSp+UH2gaBe5QdUTU4R4kui4ny8TbVnqEt442-0pA8onQ@mail.gmail.com>
	<20190920063600.GA8562@localhost>
In-Reply-To: <20190920063600.GA8562@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 20 Sep 2019 11:05:26 +0200
Message-ID: <CALbNGRRPQh6Ey9WR+Zpzu71V1bgHW3kksufq+sVvFRFui4VsFA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][PATCH 0/4] vlc adjustments
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
X-List-Received-Date: Fri, 20 Sep 2019 09:05:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 8:36 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Sep 20, 2019 at 03:14:04AM +0200, Andreas M=C3=BCller wrote:
> > On Fri, Aug 30, 2019 at 10:51 AM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> > >
> > > On Thu, Aug 29, 2019 at 4:16 PM akuster808 <akuster808@gmail.com> wro=
te:
> > > > > Ping
> > > >
> > > > in stable/warrior-nmut for testing.
> > > >
> > > Thanks
> > >
> > Patch 3 was applied / 1,2,4 not. Shall I resend or is there a reason
> > not to apply them in warrior?
>
> 2 and 4 (written by me) were not applied since I recommended against.
>
> Patch 1 I don't have an opinion about here, but Armin might have
> misunderstood my comment as disapproval also for this one.
>
* OK let's forget 2 & 4
* Patch 1 is important (for me):
  1. Qt4 support is gone in vlc
  2. Without Qt5 backend vlc is more or less useless

Cheers

Andreas

