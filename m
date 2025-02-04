Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1695C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 15:55:08 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.119503.1738684505192837626
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 07:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBAEw3dX;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2b7cd4d784dso273165fac.3
        for <Openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 07:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738684504; x=1739289304; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=USUMeHtVEmVNZOT+7UsjG91TOEj2jBfWIUhRdvOK1bM=;
        b=KBAEw3dX0TBYqAkoyalm2qQTFSybNaqxsqFvV3muYAE68/iwTCHeabG0hZGd1nmu+G
         KpJOBFdfPN+kKpjACLEjm7y9FLb56ldJl8JZT8AVakfk0mfoeKQRA2o9iOXsfs0NUkQj
         uwYdkzIedvRm2/ftO1sO6zTefG5NTJbGPtSlf7e/mfejpEhTNNWDHpnhfJJL8yDOUYjZ
         P5BOI2jWZB3zoGqfvKKRm6RJ3WBNSVq41SZpLmUcVIUs0rh364wKoNvTeBggupf3X7/g
         gm3v2v8TKVb2Iw7Z7001/34TgEVLvcre3SAbRRlymVEWbZXG2UNvPfFF3HOSaDJ9pGIH
         kxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684504; x=1739289304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USUMeHtVEmVNZOT+7UsjG91TOEj2jBfWIUhRdvOK1bM=;
        b=I1QZVDI6Ryoi3YhvCvJ+EBES/qsek6+F5KoZLavyzg/hbQVx+YcXdUG3BST7I+ovJI
         pevMXvKV0Wr4xr86BQs2rXfGpu5cp/7iu95UK4aoG1w9+2RlvltqTz0IZDMj+qAQIfDn
         ndp44wRdsAyh3oiDjWOZaQBxdGiOoaWH66GmpDUQSiMq9AT+btIrsGxpvpzT08MlPdFe
         5Ecdt2Uv0XoPIQu5HV1XM/whIpMNnsogTPUazaq2lFEMedFAa1lZM8ZwEkvuv3NaoQqA
         LDi5oGvZG7hS/N70WwuxVQIui6hJAfwkndQUTTqzPivwd2wgKwzzMOhhbxmj+nRpYWxq
         C/XA==
X-Forwarded-Encrypted: i=1; AJvYcCXtV761Ss1V87pD2VWIMKbcK3jS8EhmZoWPe8rsR53VJfChvvw3zeba1nJ8mHTLOkj65dp6yYGovW309JkZ3OGeQzY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw2WrouKwi7IdQM8klEAuE+QOyrx5J20yPJqa6pgVhn+3pG7b5Z
	vLIFfTvBvPYOgQFj+EkmYVwwbOtruGZrw1/8sgpdt1yJhnmQXtxvAOrG3QF74gehRZL1aJBz8dx
	rZXQ8XCDNKh5pm9Y8jLQcCQD9Q64=
X-Gm-Gg: ASbGncvuPRENSjBOxfmQu3wNYsC70a5dy5f8sn2JrxWmYhSn2OGo1mtcPYdKhlw7T79
	fINv2+wv+uvWw751L97N0bkGGsFpx//npTT5rDnzonUdFsfuzm961aOZuyHXc/wOAPbd4jBlhRw
	XYxUkZUm1bLwBBUfrENr8JUZo+McZowQ==
X-Google-Smtp-Source: AGHT+IEtvee5jlVrpAmg7WPEIUnvTdLXjC+UhNlJAbgNekzW2NRGMaHMhLPq5EsJQ7wmbOma/UD0LlZFKPAllSa9sGM=
X-Received: by 2002:a05:6870:414b:b0:29e:6f32:6da1 with SMTP id
 586e51a60fabf-2b32f3c333emr17561030fac.31.1738684504329; Tue, 04 Feb 2025
 07:55:04 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1soU+KeFrAxhanq=ysnHkg5v8ZBCGY8i6AenE52dD8jeaw@mail.gmail.com>
 <CAMRc=Mdn436ofF=LfsOxqU_rDsLHjryPZWPNXcSzeuW8AOfN6w@mail.gmail.com>
In-Reply-To: <CAMRc=Mdn436ofF=LfsOxqU_rDsLHjryPZWPNXcSzeuW8AOfN6w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Feb 2025 07:54:53 -0800
X-Gm-Features: AWEUYZlvcSs4c_XLQnolrizT3Tm9n0jBwHiP7HXTbMcpLFZO9gMR6rqbvygf_zc
Message-ID: <CAMKF1soCXuW4x2P4R1Z_vyqkGSXQn=yQJPgVoqWJxyo=ogW=2Q@mail.gmail.com>
Subject: Re: [oe] python3-gpiod ptest failures
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000041d59a062d5308c9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 15:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115273

--00000000000041d59a062d5308c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 12:49=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> On Tue, Feb 4, 2025 at 5:36=E2=80=AFAM Khem Raj via lists.openembedded.or=
g
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hi Bartosz
> >
> > I have been observing ptest failing on qemux86-64 lately. Here is log
> output
> >
> > https://0x0.st/8K2Y.out
> >
> > enable ptest in distro features and then for MACHINE=3Dqemux86-64
> > bitbake meta-python-image-ptest-python3-gpiod
> >
> > will show the problem.
> >
> > Do you have some insights into this?
> >
>
> Hi Khem!
>
> I just sent out two fixes (for this and C++ bindings which also fail).
> It's a correct fix in the kernel for the gpio-sim module that
> uncovered bugs in libgpiod.
>
> The patches will be part of the next libgpiod release.
>

Thanks for quick turnaround

>
> Bart
>

--00000000000041d59a062d5308c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 4, 2025 at 12:49=E2=80=AFAM Bartosz Golasz=
ewski &lt;<a href=3D"mailto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Tue, Feb 4, 2025 at 5:36=E2=80=AFAM=
 Khem Raj via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" =
target=3D"_blank">lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Bartosz<br>
&gt;<br>
&gt; I have been observing ptest failing on qemux86-64 lately. Here is log =
output<br>
&gt;<br>
&gt; <a href=3D"https://0x0.st/8K2Y.out" rel=3D"noreferrer" target=3D"_blan=
k">https://0x0.st/8K2Y.out</a><br>
&gt;<br>
&gt; enable ptest in distro features and then for MACHINE=3Dqemux86-64<br>
&gt; bitbake meta-python-image-ptest-python3-gpiod<br>
&gt;<br>
&gt; will show the problem.<br>
&gt;<br>
&gt; Do you have some insights into this?<br>
&gt;<br>
<br>
Hi Khem!<br>
<br>
I just sent out two fixes (for this and C++ bindings which also fail).<br>
It&#39;s a correct fix in the kernel for the gpio-sim module that<br>
uncovered bugs in libgpiod.<br>
<br>
The patches will be part of the next libgpiod release.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for quick=
 turnaround=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Bart<br>
</blockquote></div></div>

--00000000000041d59a062d5308c9--

