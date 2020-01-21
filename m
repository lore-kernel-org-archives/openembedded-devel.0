Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 391A67FD53
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:13:15 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id x5so1553779ila.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 23:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u2nmB/OlNmSZ/geffDgiSzbuXkM/3mCRW7TqbHIzs70=;
	b=Z8eV9FYg5rXt3zmbprWwkfwifpJpcDuALDE8Vu1GYDtPakWsZg7zcarlkFD3fjYMNb
	AzN6wvBCgv3bLUqlr6ZxBTPnpa+fLWqbxwpIRsTVipqMC2IooOmaSomzuAnjnbFJEyI7
	PB9YtlvemGorEuwsp8KeVk7a6dUrVpDBZauzROlPGOsfHhpc2oYATJOgBuepDG9xIGj+
	Dg6Ey/UIF5ai2u7m3iW+D6/XiijHx2OTygQTaq61OZitmjwS0OWPA3gSkM9qZ6I71Pqp
	yOX4G6C4Zml/W2p+Azs5EWG4ATzQNAetZMRSGtTy65fExxRd8mAEDeAtlMkVhoPYUhAG
	J3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u2nmB/OlNmSZ/geffDgiSzbuXkM/3mCRW7TqbHIzs70=;
	b=OIIivOZmnqRlFevb9vvQEAM5apyD1aIbImdDXDFgO1sn2P9xHgPgdo9Eru0ANosW86
	F1LvqrvjOakb5iVz1DIiHAR+4m6jyBfIIydqkT04GYPUqPx+SBWuu1EgKk5mR7Uyw4hv
	wKdkTDwn+qkzTh5P7DmcY81AjY2Cr8byMgFbYn7SetxLo2CZlPWrinDkaLY9aMZvvnXm
	qWb9JJ91w+yBd9ALpMpRfw/YWyqPW0ip8yz04t2FnB9Xu2td0TzHhnnaJgygw1PTwp+r
	QSNbM4glSe/z6GNc5SZ23ju00F7b3wvAKVWhRY73PIik9DbasvY6KmUL3cBAdKeChOPd
	xKxg==
X-Gm-Message-State: APjAAAX+V9xLNnRtnFKGe31BUZVReaH5C+pZE+Eqh9VkfyJSZJGfWEM9
	ts0cj4CXZpOTfnz392jqOvldZB6e6wNKaOAPSb8=
X-Google-Smtp-Source: APXvYqyBjIWEGFE2YHhkxsNhzPj9CvzkRJ50RtFKY+BM8Z4ixUThgHKUg/pIzfI7dwmk5dB4pklV8X+OQmYolpCdCPI=
X-Received: by 2002:a92:405a:: with SMTP id n87mr2511201ila.299.1579590796086; 
	Mon, 20 Jan 2020 23:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20200121012416.544541-1-raj.khem@gmail.com>
In-Reply-To: <20200121012416.544541-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 21 Jan 2020 08:13:04 +0100
Message-ID: <CALbNGRTgzwTink2p8Ffxr4pnGJfVfpRsyrbbrV1QO68noVVi2g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: Upgrade to 60.9.0
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
X-List-Received-Date: Tue, 21 Jan 2020 07:13:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 21, 2020 at 2:24 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Use firefox ESR src_uri instead of gentoo pre-generated image
> Pre-generate old configure script
> Ask for python 2.7 specifically during build
^This is what configure.py already does

Although I wanted to finish python3 first (yes there is progress) I
sent  out similar with autoconf-2.13 and some clean-up. Are you
working on this either?  If yes I can do something else.

Andreas

