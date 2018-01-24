Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1A2786A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 15:39:24 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id t16so4463734wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 07:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T9EkOqRMGpoCZoPXX+btHni+VfVTePVhWFDMftIGyqo=;
	b=IRuswsWC37yZ5OYrvqfqrn0DxcOTITlmfb7KH2ShUmD8XR5TKNBbWhMj0/cDat8YUw
	dwWph5uhCiRQC3e03pmSPIoO9Gb9/LJ4CvH/iFGBByZDubPe1ujkA4flt0ku0ABsxX+7
	BeC8yGdyPG/GlcDtUhnT8/Q0p7XH9wqyImnmj2NN0QBgZrdvXXeUeMcDalPYYUTOTXi6
	HeXYtPJHqAG8L8j2afmiguQJpAHZyKOifkAG845JFtsYO4agW97VUDTlP8xcbzfyfeIM
	6XqdRyTm+9y7t09WzOuFLGXr7dDBrScHlzOlHTSTxbw8HTeutp76KKROLFSv/dMiy/y1
	BR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T9EkOqRMGpoCZoPXX+btHni+VfVTePVhWFDMftIGyqo=;
	b=O5/U75mtQfTcJ9I2FWqRDbBUfScK0OdN4Ep/z+pYIqVPHmscxQJwzE/60/GHMPuooU
	xyaagHMg5Q8CmooY1nBaN4Vezkp6xZBBOnH742siZbE43RqOu82r3KhKCQXqva4W0Yr8
	9hIAZmeQtzNmTt40iJ2PfckW3MHtrcSQ5iO3SUFN6K7JhFbUIe1+9XKKE8UKCtJ1GmQs
	PSpqcmNrTwjuO/uQRy0c7kT8NvwOqRS/K6oYF764vSdbqy9oHAAAWxqVtARyDAtuPa37
	aSF8cWTY1PxJoovCkaTmn5oi6i3mQ//VBq4lZQ8roXxSmU8CHkI0diQaoGqhzuj269op
	MnHw==
X-Gm-Message-State: AKwxyteaKsYZr+kAWB1YAgruV76PDLE98Qh9dkopqGX3Zqngs9vbcHt6
	uiUIykA7VTrr1WwTLnwBcPaVVlITW7BKA+HMxao=
X-Google-Smtp-Source: AH8x225lUehIxvrl4xSC7T9DzeFiY2wKzYs9FD9gfgFJGg9z5atEOgI4mTR69Pp1HjMd8EdkeWZo9qWSvnuWsTg1t68=
X-Received: by 10.223.177.158 with SMTP id q30mr6120115wra.206.1516808364973; 
	Wed, 24 Jan 2018 07:39:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 24 Jan 2018 07:39:24 -0800 (PST)
In-Reply-To: <CALbNGRSuQkYnh22ChTz3g9HcZrjRbf0FzQJrUbZwES-Jm21Cog@mail.gmail.com>
References: <20171130081026.25414-1-schnitzeltony@gmail.com>
	<CALbNGRSuQkYnh22ChTz3g9HcZrjRbf0FzQJrUbZwES-Jm21Cog@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Jan 2018 16:39:24 +0100
Message-ID: <CA+chaQfUH4js3Ed90Rz6FKbaZke-BZQakArASai9cWnjiqRvRA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qwt-qt5: rewrite completely
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
X-List-Received-Date: Wed, 24 Jan 2018 15:39:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't have problem with that, but I don't use qwt-qt5 anywhere so I'll
let other to test it in master for a bit later.

Maybe send the patch for rocko, so that more people might notice that it
will land there.

Regards,

On Wed, Jan 24, 2018 at 4:27 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Thu, Nov 30, 2017 at 9:10 AM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
> wrote:
>
> > * install pkgconfig
> > * fix examples
> > * DESCRIPTION -> SUMMARY
> > * overall cleanup
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> >
>
> Is it possible to get this into rocko?
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

