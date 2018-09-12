Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0C29360269
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:19:06 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id r37-v6so2024552qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+qwJJgVK/3+V+oqW3Y1cEPgpeTkAiduzJh7OGPdYh+0=;
	b=nAgnTahR4SRotuIwJ2AAOuDgc/mlaP+kv1EWuUeU30bLDxOOVwv7gViy+aBwTvt4XY
	+vvFGcjpquXuRVVN6QyYv+pgjVIWqITexcfa0VNM5Za1M3AAY7D44F2fWb4kg9iMtBoT
	07xqikl0t2k3AKE2qj5gaxgzcc49bxTokFldq/BFRPwFbG/sPfLAaTqr9w55viwYA3/+
	mEW7auIL69y8Xc4RKzA3EybuROHSiXFBo4wMZ86ltXvchEQEBfJSoQebjRLEtgXO7Bd8
	VH2GAV4nQDigb8slSZ8dkS6RJMZ3v1Pb+jJyTa9dvhLPgZHLd1+FNoN6KX28XBj8s27a
	HfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+qwJJgVK/3+V+oqW3Y1cEPgpeTkAiduzJh7OGPdYh+0=;
	b=WAGntwB2kVBBOD7BcOCZovut2kqrxGE8Zd3XEjs2mp2Yh2ewUCC9LyVHNHDHvws0t/
	Ic2LAxNZmA5+w2jsQNwN4w3W1ES7payjhhB0bfWEdViiAwy3vSfOJkS3/BFJgyIxAX95
	wg6KEEG0yxwz2Z1JsX+N2mIP6HNAYaWsgLo0m4cbXLs30zQFc1/flkCfR8JsC8BBdpWn
	num7yv2MuIIJTTakqFztqCY7828U2Nlg55L5RQczdVMc4v+RndCm53F9ITDsOC5RXwfP
	Zi6b74RprTYHdqMJHz7pzW3rPi98INjchjy5I1tbfZa+eP91ic8/qq6PsG4zKv298RqG
	Gm8Q==
X-Gm-Message-State: APzg51Cy3SbgrIIcpy03x07cXBO6qIIeVFI2sG2NjECi/0zqntYvpazB
	E0lYBddoPDQANRqcBJF9yje1wbac/Wzykgv5xRR/qQ==
X-Google-Smtp-Source: ANB0VdammeyPXPpfjMInVww6k0Cycd75nHlLtfxWcf0LYHBVwHQ7cNskHg/YVlNZGXh8q527Grv+pzIbx61kbcgkG80=
X-Received: by 2002:ac8:4649:: with SMTP id f9-v6mr1678808qto.34.1536761947894;
	Wed, 12 Sep 2018 07:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20180912082642.35624-1-hongxu.jia@windriver.com>
	<8a566f88-4b87-b0a4-228f-dbc2bbb8981b@windriver.com>
	<CAMKF1so5pxbk84E+cjXbzbmVJfg=dDzjJ1Ubnkw2yUk4_E_xDQ@mail.gmail.com>
	<425aaced-f337-89a0-d659-6754460f2e57@windriver.com>
In-Reply-To: <425aaced-f337-89a0-d659-6754460f2e57@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 07:18:41 -0700
Message-ID: <CAMKF1soodAQ05RgCSoG+qt3pVZ40UF8_2HYYSH-sio3gpCPuDQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] cyrus-sasl: use autotools-brokensep to build in sources
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
X-List-Received-Date: Wed, 12 Sep 2018 14:19:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2018 at 7:17 AM Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
> On 2018=E5=B9=B409=E6=9C=8812=E6=97=A5 22:12, Khem Raj wrote:
>
> The crypto-compat.h locates in git/common/, it should be
> `-I../../git/common'
>
> this should b fixable in source Makefile.am to use $(srcdir) in that
> -I spec it might be either missing or ignoring the fact that S can be
> different then B
>
> Yes, I will try send the fix on Makefile.am to upstream and wait their re=
ply
>

thanks

> This patch is a quick fix to OE
>

I will wait for real fix

> //Hongxu

