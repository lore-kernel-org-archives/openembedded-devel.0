Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id C18EB7D5BC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 19:04:18 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d13so11162525qth.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UsPcOVZqzRVDNMMx5zPqB/QE06tQM5JUMkXGbHIVBCc=;
	b=E24h+TdJOyzp7y8IM09WriuEbHpn76siH/Jx4ZaSs6vFDm79lJXDZfpYJkLvGWZ+XG
	Tuaa2B7cXVicSm9hV7G27byWTq0/eKeihUv4v2z7W5irnbusr5F8UG2oiYYXfAd/tpbV
	9SAPY9htBwe+OlyPrsKnV5eX/Xn07GfAZDPsCDjGa/EacfeTQL9w8MMqkWhNTs+IGUAW
	MsWdK2BB8QNQ+wuzJaQ/1iBOSCxFTTaOL2qnjWGtKC2NRNuJ/Mr37RvmwrNlUPMZNh5+
	0okbuJCIqIzCVoVqru7eCk+5fWHEv42rXqD8YfFYD9IP0Lmkr85WXpu6YwgzQ9zE+mVD
	X7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UsPcOVZqzRVDNMMx5zPqB/QE06tQM5JUMkXGbHIVBCc=;
	b=gIUwdxk4q9nQl43RctnRD1wEYn634yQ+Kl+eA7OX//H7zr4x54cIz70O9fwO52jq68
	dwu2V5VFT0DgpFNyqb/z2z496tPzn3d2GOygYa+Dz1lq4yx+gjQBWdko48uECW3lsrSX
	2D+QwjhWs25LA1aC0NVgyYDB1sqtFsEXYiQbefnC0X5W8hST2E6XY33lmlFp0ksLxsWE
	bI8WEbC8CYpHCbe1xoZseSCfkdNvakp1XZl6rOJ+q8tFvL2rVJbxTrVDdtIOW2/GNXSH
	pq0IwYMgHs1C+M84UbXU0QxxeOT/GXcaWlGZ4PiOufJIOyQjD8M43bKlgtAScq7Fu3WY
	8f9w==
X-Gm-Message-State: APjAAAUMfP+cjP4/lebYE7qoP2HuEUmEVT1ulhnAm+U+rKlF1YW8s6sB
	3GaomQZTw+LFhB+OukUfrhu/rCE8KI2rImczCjA=
X-Google-Smtp-Source: APXvYqxpQnYV6DJJUfFNPurDYWu3lxIui+73hafBMQAXovz+joLOYmOrR/UbvuzQJtndrgtDz8Kiv7BLUr76PbZrBPY=
X-Received: by 2002:ac8:1846:: with SMTP id n6mr16723123qtk.262.1554577459395; 
	Sat, 06 Apr 2019 12:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190406184223.28699-1-raj.khem@gmail.com>
	<CALbNGRSp_1Aji=iiFKkRGAiH+XKdMCLasA8FUwmc8B7HYtpz1Q@mail.gmail.com>
In-Reply-To: <CALbNGRSp_1Aji=iiFKkRGAiH+XKdMCLasA8FUwmc8B7HYtpz1Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Apr 2019 12:03:52 -0700
Message-ID: <CAMKF1soxcOryupYNJ0Pu=5dJGg8ZcCZM+wMj5PyXtK8C9nNAxA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Fix build with clang
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
X-List-Received-Date: Sat, 06 Apr 2019 19:04:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2019 at 11:53 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Apr 6, 2019 at 8:42 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Detecting libdl for dlopen when failed returns
> > "none required", which then gets added to linker commandline
> > and inturn fails to link with errors obviously because "-lnone required=
"
> > is no such library.
> >
> > This patch is not musl dependent, earlier patches clubbed it into musl
> > patch however this is needed with clang too regardless of the C library
> > the reason is clang automatically brings in libdl in OE and hence this
> > test is failing.
> >
> Seems I was a bit over enthusiastic - thanks
>
> Out of curiosity: If I remember correct similar is in musl patch.
> Doesn't this cause conflict with musl patch?
>

I have deleted that portion from cumulative musl patch

> Andreas

