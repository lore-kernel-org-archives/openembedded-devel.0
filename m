Return-Path: <brgl@bgdev.pl>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 393866D59D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2018 20:11:01 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id v11so22102969itj.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2018 12:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5TI+aGRKtC/8voyrMdQ61hkLWEqd5BW2XhtxHDGJfRI=;
	b=P3fi7G2fC3DNTvGAsca1jYG/EkpxqIwipztV5W22FqNPJ335TeyCtHLXt7Re/oEi7O
	KCvDbcOg0QpVDJghsmcpSPMSdvlT9riUIcQmlbktAFCejRY3oz7D51AHgEPXCSCQ7B8O
	ufCiImV9g2hJm3tgZBrZoQW0rgy7/pj2arKvsBwnpxS8vk9mZjBCc220vdqVexhYsrbN
	SwitoBePJsls95PvtYQ8NO+j0j4+2RumKwaaAfLf8kSkD9ci/AHDhCgchwIdzQQiw5yl
	zpSW5vyL2njq8Cut4mj9eylMMjzeqOV0KanKJzQDi+z2hjL94Jvhm8o/J1v+puGFXCYc
	CK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5TI+aGRKtC/8voyrMdQ61hkLWEqd5BW2XhtxHDGJfRI=;
	b=LZApksLSVn4FAnCHHd+Xk1ZXjNAzyIG29ZjB/wvXlEJBiIzJrJ5XfaOBsyk46jzDy5
	F3reG9ViT+/WFaWwlpjkbvLBWLNyO0Iocz1T0w9hfNMhEOyVCfj3TJKI1CVoVN3LAP3v
	EMTvGVi2CgKpSvnNmEHWCzW6GlNHxPuAYV9mGBeFqqdEm9No7kEDxno9Tjh7SlAb3oJ+
	R0nquFY4QmPA+ukSLlzmh+f2XU8FwtuH2vkjGFz5aujxhXn5Ng8rrMZv57UksRCUsQva
	XwdF/a1yfQDSOrJTV4qiTcvSDE901f/LED2pyNDf3AMbVuyK/fGCZa6CHX01XD4nZwNM
	zKsg==
X-Gm-Message-State: AA+aEWaNZGrCwIV0uCSUfxWcP2930790vqfqOQ+2/3pvk19miz6pbhh5
	3mpRl8pJrmVKpBGULrTz5QnnW8Rl3KZ6oL/Nd9VfwQ==
X-Google-Smtp-Source: AJdET5dkkC8IMVbSBno+IBn5uMDTYsaLbolT4NCApNSZx7yojlkbrHbGYlFAlOI9qbKCZI+hwjQqpDtMXTx9UICuDXY=
X-Received: by 2002:a24:f909:: with SMTP id l9mr17080490ith.74.1543090262226; 
	Sat, 24 Nov 2018 12:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
In-Reply-To: <CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 24 Nov 2018 21:10:51 +0100
Message-ID: <CAMRc=MdVJYYBcB0NkQpE2O3qQ=c+mnj6+ktsxRMdjBpPALOgZw@mail.gmail.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/6] sigrok: set of new packages
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
X-List-Received-Date: Sat, 24 Nov 2018 20:11:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 23 lis 2018 o 22:00 Andreas M=C3=BCller <schnitzeltony@gmail.com> napi=
sa=C5=82(a):
>
> On Fri, Nov 23, 2018 at 4:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> >
> > This series adds recipes for libsigrok and accompanying libraries and
> > tools. The eventual goal is to add pulseview - the graphical interface
> > for sigrok - to meta-qt5-extra.
> I had started this at meta-qt5-extra but... Did you prepare already
> something for sigrok? If yes: Would be happy to receive your patches -
> if no I can try the recipe already started together with the recipes
> you sent here.
>
> Andreas

I'm not sure I understood you - do you mean if I prepared something
for pulseview for meta-qt5-extra or if I want to put libsigrok
packages in meta-qt5-extra? For the latter: I think that the right
place for those packages in meta-openembedded and only pulseview
should go into meta-qt5-extra. For the former: I'll be creating the
recipe for pulseview on Monday probably.

Bart

