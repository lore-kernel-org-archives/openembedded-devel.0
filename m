Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE17B6B51A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 21:00:03 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id h138-v6so3419852ywa.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 13:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iyBiJJQV4xy+vu31hCkoypfRzG8LHhzxu4xTniVLhPI=;
	b=XhnPvCInxzrrSPSTmr/RZA+7qrPyS10IHY1GPpqWcgiH1gJT7ykg7PKFpHLDEwBrf8
	mFPabioTheYyhy93OLTyWDhM/r+48Y4r/RjESE67VDKqlGz4gsXFxPbT5nSUaFmb0Hqy
	cDC7cEaO5HqP86QB96GkrOFWe3AMQWEcfbpFrJGDaPVz5Ky5IKkSy/jvoiKJcaSm4Pvs
	+yLky9fyKM1/9/nweJwVCIgEc1qd2i1T6TOWaSixKRHhaSnyTpgPi7fzxYAerE46zYJX
	YxNUWzGZ/TieRGUaZddsCe5Tbx6TqpJoempj2rU7ol4SAFVVxykL2ovCpGtuSPsU1jm6
	Rmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iyBiJJQV4xy+vu31hCkoypfRzG8LHhzxu4xTniVLhPI=;
	b=L8gsLAu82ckL51S7a8tT5LY/B39Jr+wFiEH6ksWTdFlebEEhuxLNXtcYisM60w8dZy
	AR+drDZGCzV9fIl5sGTppw0A+ZqxxOBDrVOBAt6GSbnJDdZXqJbgaJyJIvoXPnkfYRj6
	oxamURXgo4oe4X8Mdmm4tmsYDHm+vt6rEjibMjF9ua9xygtYwIzUbyuwGEioKvvHv9kI
	nih8V1vf18hBeGkJv/+xiOaI7QGztmqzA6bVSK2E7HyYBF1zSy1dRT8OLowCdhV9jCwT
	NqBRhqzk43BbZebX8RSSkkylZt3blz9IKPyGIy8GKLdCx2eQ25qrbS69/7/XJkJ6tfMv
	8okg==
X-Gm-Message-State: AA+aEWYye3Y/wgrvd1VlkXgGP0LijPoFN7lKFfqtcSra0sZ39yVoEMZa
	Kv0WydWPHbIg3qX0SxJz9LrI+2kpr1dTcV84v38=
X-Google-Smtp-Source: AFSGD/Wqx3QWuUYOiohgcqA4eyBidWkYpBGE2XELgAKuj/FDeuHsRhU0aa+MtEi8ZldUrHj0iYoVCTs7bklItoE9nms=
X-Received: by 2002:a81:3e07:: with SMTP id l7mr8629050ywa.447.1543006804756; 
	Fri, 23 Nov 2018 13:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
In-Reply-To: <20181123153941.10186-1-brgl@bgdev.pl>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 23 Nov 2018 21:59:52 +0100
Message-ID: <CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
To: brgl@bgdev.pl
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 23 Nov 2018 21:00:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 23, 2018 at 4:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This series adds recipes for libsigrok and accompanying libraries and
> tools. The eventual goal is to add pulseview - the graphical interface
> for sigrok - to meta-qt5-extra.
I had started this at meta-qt5-extra but... Did you prepare already
something for sigrok? If yes: Would be happy to receive your patches -
if no I can try the recipe already started together with the recipes
you sent here.

Andreas
>
> First two patches add external packages used by libsigrok. The third
> patch adds a recipe for native doxygen, which is needed to generate
> libsigrok C++ bindings which will in turn be necessary to build
> pulseview.
>
> Last three patches add recipes for the sigrok suite including the
> command-line utility - sigrok-cli.
>
> Bartosz Golaszewski (6):
>   libzip: new package
>   libserialport: new package
>   doxygen: new native package
>   libsigrok: new package
>   libsigrokdecode: new package
>   sigrok-cli: new package
>
>  .../doxygen/doxygen-native_1.8.14.bb          | 15 ++++++++
>  .../0001-build-don-t-look-for-Iconv.patch     | 36 +++++++++++++++++++
>  .../libserialport/libserialport_0.1.1.bb      | 12 +++++++
>  .../recipes-extended/libzip/libzip_1.5.1.bb   | 18 ++++++++++
>  .../sigrok/libsigrok_0.5.1.bb                 | 23 ++++++++++++
>  .../sigrok/libsigrokdecode_0.5.2.bb           | 14 ++++++++
>  .../sigrok/sigrok-cli_0.7.0.bb                | 18 ++++++++++
>  7 files changed, 136 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
>  create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
>  create mode 100644 meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
>  create mode 100644 meta-oe/recipes-extended/libzip/libzip_1.5.1.bb
>  create mode 100644 meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
>  create mode 100644 meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
>  create mode 100644 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

