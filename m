Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id D20737E3B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 22:17:07 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id n7so1458719uap.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 15:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yz44u4GjL2RYFmCCSCvnLrosWEkc2Dz627sM9pUhMf4=;
	b=h75peHj/gPUF9pEppvBRKski1iHWxQmMhSKfj884rK+GW24f2PanrQXiES/hBNnJ+5
	TK2rZ6I/UhlDgWwYhReDYPEb295qrS7D25nVdKA8pLhGKWrPn41mNWvOjVZS3BcZXZqC
	oYUiSjBjccNJZK3v4xBZE+ivnx3vIwADEDaZMYsv8xGFNlPyCTJz2VLFnxoBx2V9h2O3
	Mp+S+jlnTy/mr+qr18D5W5PG03p9ixjrNPinyffMEiKvKQyZlXmjuAiEp4psMpPw+Kkz
	mc/yCKV9isGMIMmfr5/dwYcdwpgaA+VmFMHLTW2b22bbEnnfVvqP1fNAQHJGKCKUyC4D
	IAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yz44u4GjL2RYFmCCSCvnLrosWEkc2Dz627sM9pUhMf4=;
	b=tFQdtUpPYwdSC+RFMlDk9C3cPNFehJCAqUpODoYlXxo/wmbvP8H7NVSw8wKiodhYfW
	RC63epafYYwECo0uez3+ucKuoyzd5oXMnpmP7IGMuvvxiil4E5J1w+djCp7PLc3LkvO3
	6rnvt0MG3B/8ISAxvyFk/7u+kBoTC11oXhx+fut4bHXATbb3eLD5Do2A7Ds8qgcXmaxX
	y1kF8KOaFWURJyg67hQPFQpqZX5uBMeLW3WycUavwBTGqv1I6vfKFlR0H4UbOlXVyvar
	U1vahJs7BtAGIF7ff47s9uIa4HH3gwzcAuFZkKj25W6WK3GKO0xBo833AtsDOW/dpBE5
	AgZw==
X-Gm-Message-State: APjAAAVmf1Cdh1xzyT/APOhNy1naXKc/Ef3c0J4DlA3ChGmsmOZtIn0P
	StLcgQ7Gnset/0rOYgKy+sJh0VCpIn1FH82DyBE=
X-Google-Smtp-Source: APXvYqyYHYM3yPkRt6H0+DoLZa7WSHvOD5zMbhkaIAZaS6vZgiM4KoMYeHLk+oLUpHUjzp1hwHUWTvsNGmof9hsjBns=
X-Received: by 2002:ab0:670c:: with SMTP id q12mr22510115uam.106.1558563428604;
	Wed, 22 May 2019 15:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190424190038.19593-1-Martin.Jansa@gmail.com>
	<20190426052056.GB26023@localhost>
	<CAMKF1sq3J1pjWp-sBijwi4VzGVAZWQCk8uznx0VbtODixTFY4A@mail.gmail.com>
	<CA+chaQfZE7kZHown5xfxZQf+yQoB_iqtuH=LFKJhhoqJ7tVF0w@mail.gmail.com>
	<CALbNGRS7ceuKHHZL-EZ6VcprbpXUFS8k7coeVL9RKQMT2G_7hw@mail.gmail.com>
In-Reply-To: <CALbNGRS7ceuKHHZL-EZ6VcprbpXUFS8k7coeVL9RKQMT2G_7hw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 May 2019 15:16:57 -0700
Message-ID: <CAJ86T=V8DsNKUgyBrhuwa_w4bgbqpnRK3jX5HGtX+vGUtJL_YA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] ne10: set NE10_TARGET_ARCH with an override instead of anonymous python
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
X-List-Received-Date: Wed, 22 May 2019 22:17:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 1:34 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Fri, Apr 26, 2019 at 9:27 PM Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >
> > I'm not using ne10 or libopus anywhere, it was just breaking
> > sstate-diff-machines.sh script by adding that unjustifiable dependency
> > based on TUNE_FEATURES.
> >
> > I was going to send v2 with the armv7ve entries as requested by Andreas=
 (I
> > forgot that armv7ve tunes no longer include armv7a in overrides), but i=
f
> > someone wants to rework it to test for neon in TUNE_FEATURES feel free =
to
> > do so.
> >
> > It didn't check for neon before, so at least this change didn't make it
> > worse.
> Yeah - you fix something you are not interested in and people (either
> not using it) open up wishlists..

This got merged and backported to warrior without the _armv7ve
over-ride, so Cortex-A15 etc targets are going to see some regression.

