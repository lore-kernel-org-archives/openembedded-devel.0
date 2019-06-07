Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id B755E7E4FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 13:22:39 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id l21so2647860ita.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jun 2019 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XSGuEMh/fCiI87reS6xoBZV4aOKcMc0yoYZq9IgKM0g=;
	b=TsZaerqQRiRPTThFdT1hu5zxz0Ygy+hhk8E25K4E2k/3wvVbm6Kr/VTWYCnn7jBfQY
	i0/1BVlYeVSfF1zm3tKSbQhjlAdLeSOJyZKzxrD0J06h3c7jhBlIHW6I2wXAGc+KYjtG
	1X4C60C6ynAkS4+4knp4SM+buOVovD/8G2kbx9cmAKxXLif685/Rz5/ppi/cfkTxRfzF
	PIW3cT3CzgpdqVIbIIHL36ARu3xEmibLmGKQyFh/ScWier3jP0Fh98oC/9ds6xEG6MIO
	aI5Bn3sGlyHQdQSU/EkbrSQJXO0q3mYnnS6UeA+FOZAxtHe/T9wOGIFcIQT9YFcp7o+E
	rSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XSGuEMh/fCiI87reS6xoBZV4aOKcMc0yoYZq9IgKM0g=;
	b=HujYuQD1+EbazSD0V3ahouhCHazOz3igl1u/Z5z93RoHDwa7lrQPyI2ACJeyu5dvEJ
	84lDyD3zvsv0hl6OHxxsaMN7/eMt1lheyiSpHAz2ZQa6HCIl+swLCvb0v+xixNNM4Ky/
	+uWUTOHRB2aqo05bLFoQNwVCuaoYx6b0hM+ImnYyULIvagz9lyhrhelmSzs28byQ0RE4
	lRMkrob0mwoDYcJcDz+XgiWM96VGbqF/jVBFpIzCOLafI8i6cERIJAbSWmKI900AjfMN
	G+knfb6nE4BVfh9lwziKkH6bvE3C3lntOoOgD2p7DIZaso7Cnn+mFz+Dm37AYAH4khbr
	EepA==
X-Gm-Message-State: APjAAAUFyjD+rYvmiIr2NP2vlasGuTI7s8uBB9K1zpywIfk2oGNY6Mcj
	KBAdFweNIILdjvQQuvsTIK30CNnM1NVGhYLowsw=
X-Google-Smtp-Source: APXvYqyKQBQIOifCwGDFErvOp/aHEjrElDODhXx0tTxKxtSVlLur06KWtsxxrZ/tSedF/gFik6yRosNDuqem2lSwXnQ=
X-Received: by 2002:a24:3555:: with SMTP id k82mr3881691ita.51.1559913760750; 
	Fri, 07 Jun 2019 06:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190606034737.12893-1-zangrc.fnst@cn.fujitsu.com>
	<CANx9H-CoZm=_-4BDC_SEZ+SmGeADQUTp2DBhBFpXhxFsXVPwvQ@mail.gmail.com>
	<20190607075020.GA3979@localhost>
In-Reply-To: <20190607075020.GA3979@localhost>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 06:22:29 -0700
Message-ID: <CANx9H-D-hr5gzwJdptwdde4PbPuAGkpSMQZjxcN+hWi_MzwkbQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH] python-mako: upgrade 1.0.10 -> 1.0.12
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
X-List-Received-Date: Fri, 07 Jun 2019 13:22:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 7, 2019 at 12:50 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Thu, Jun 06, 2019 at 11:51:41PM -0700, Tim Orling wrote:
> > While you are at it, can you please add a python3 recipe? Python2 is EOL
> > soon and this recipe will be at risk for being dropped completely in a
> > future meta-python.
>
> This and others already have a python3 in oe-core.
>

Thank you. It was late and I forgot to look. Note to self...

>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

