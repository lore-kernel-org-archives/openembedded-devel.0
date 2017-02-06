Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5C00A60766
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 17:56:37 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b65so131268221wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 09:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZhRcAHGJqcplv1ZuusFD+mYWsJ4i6O7GmQzZeSz9rLU=;
	b=cd5VqPdlrmzgo8K15ALLl18yAPHXp9Lf9K4IbVWVGXeZt5BqVP12Uz0uTcafCal01T
	wm2zptZgbNIajxQyk3bPpoJCPHlQHNX0IfcbtfIV4UEv9W39+1ng3pwSgKczB4P6kEll
	AVu74xhEPyWDvZXFbLq4DgfflsTxrT9KKwL1hDPXheVaBjB3xEu3FdfKrYVeq+1sgTng
	1rWRKWSsomLciWwNCBIjsn1RnqYK8OrC3aUgIi8gokqgZiPUnFX8AcVFM9PoS4iQF/oX
	u7LshUtDIBQ+RNf2ECsRIpXa/By677HMUaiz8u60Bk0LoxPCLT7edv/xEF+hHS4T3eVk
	WzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZhRcAHGJqcplv1ZuusFD+mYWsJ4i6O7GmQzZeSz9rLU=;
	b=Ugwz90++UQFcBM/cKyZwhkRXnUopSBCLX1fg6B72/Y2G8CmSE6FZR9u/HCTNg54HRt
	zCv2TI5Vu277hUNiIBzRw/n5wToH6rgr1RBUHnHG/3EE51T3N1Dwv6ZYIlFaVtj1OlYj
	4DzOaDrmU014EJotM4Q5KPiCFGP4/9JcQs4iMz7eGBwebuaYVFBnA53zu4I36HZ016UE
	+ymabRGbnbvZiqD/WH7y2ARX+SbcYaKTUTqMKZeKvSpixYHefyMEiutcVcRmf4TtxZf4
	XjN4Ii2dPL3qvpkkZAL/kugmDnVhsB9Cp+t4R/p4Bre6IvM5iDkEgusSoi1Gop5YDPvI
	Q1pw==
X-Gm-Message-State: AMke39mfdprBfAA48Ja4FPDJjYP0LkQAMn6S8zjaMmYHtJgEXLkaAj4KwxJ0TVj9uJRQoVBmZzQDhVS6ThdCKA==
X-Received: by 10.28.211.205 with SMTP id k196mr9055571wmg.124.1486403797300; 
	Mon, 06 Feb 2017 09:56:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 6 Feb 2017 09:56:36 -0800 (PST)
In-Reply-To: <CALbNGRTbQ5xN+Y+NvyVZRd_MTN4ofosx=Of3i+=sLwj=qm=UnQ@mail.gmail.com>
References: <1485374763-7114-1-git-send-email-schnitzeltony@googlemail.com>
	<1485374763-7114-2-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRRVcvt1JdHiaL4AswX1UUSTCjHgUPJXbXtUmQdRRQmUag@mail.gmail.com>
	<CALbNGRTbQ5xN+Y+NvyVZRd_MTN4ofosx=Of3i+=sLwj=qm=UnQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 6 Feb 2017 18:56:36 +0100
Message-ID: <CA+chaQe_fOuM3i2TRn+PF5BvErCxEjUTC8LcV7Ekbm7RmVqc8g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] fluidsynth: add ARM NEON support for sample interpolation
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
X-List-Received-Date: Mon, 06 Feb 2017 17:56:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks, I've just dropped it from my local master-next, so I won't forget
next time.

On Mon, Feb 6, 2017 at 6:40 PM, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com
> wrote:

> On Mon, Jan 30, 2017 at 10:41 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > On Wed, Jan 25, 2017 at 9:06 PM, Andreas M=C3=BCller
> > <schnitzeltony@googlemail.com> wrote:
> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >> ---
> >>  ...e_dsp_interpolate_4th_order-make-use-of-A.patch | 158
> +++++++++++++++++++++
> >>  .../fluidsynth/fluidsynth_1.1.6.bb                 |   5 +-
> >>  2 files changed, 162 insertions(+), 1 deletion(-)
> >>  create mode 100644 meta-multimedia/recipes-
> multimedia/fluidsynth/files/0001-fluid_rvoice_dsp_
> interpolate_4th_order-make-use-of-A.patch
> >
> > Sorry but I get the feeling that this patch does not accelerate
> > interpolation. I need to write some performance test to check (don't
> > trust optimizations without performance numbers) So for please ignore
> > this patch.
> >
> Just saw that this is still in master-next: Please take care that it
> won't be applied in master accidentally. I could create a test case
> meanwhile: This patch is crap and slows things down instead of
> accelerating.
>
> Andreas
>

