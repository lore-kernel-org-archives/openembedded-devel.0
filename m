Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 44B3977D48
	for <Openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 09:46:38 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id m81so602825ioi.13
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 04 Oct 2017 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f7I/55MnpQ3QZVsAXJWtr34dYvSNpDYxrSh+iWaRvH0=;
	b=i8AvCLhj7HzyiAHmRRak7DwHqHeOf88gQSI8/kP/BhpWXVArSMUr3nbejlaa3ZB/pq
	e4YXiFMBKaddUf3QGpsTREtkcU0bJTCs+qsWOPb0wEfHahoFBO29wkyxIIllKuR/jwZB
	T6ml6t85YiOYrPI6cvU33ELXUhMJpSKoFvOs9GTdk4/VU6NYafjIpEjpN0s6Rvl8UsWf
	eSQK8BD+bxCKWC8AYnMvHd9obK+/tX9O0vb8CJoQ+IRVsu1CQqKTsKDqDt2lWU8b6un6
	Vjwf1vLcJYcDw+dvEWF0dbTRSXVSzH6B3cXnSb2tsHczfqlv+bnlzt8jyFnaAgYuQ4ae
	xv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f7I/55MnpQ3QZVsAXJWtr34dYvSNpDYxrSh+iWaRvH0=;
	b=TERXkC08VxC8aOh8g26aieo23BLi37YyxMrPeA7zVwdqCnn3W3ls2XzukbQSjaPWft
	K1lS9w6EaPZW4nAFj47dCwreKEmDScReWyia5xzr1V5Ml7Znmb22S5HuxK291tesjEiO
	A+rpZUpkhsAOV0eP3B2Od7iXNMvc0ar9aZLd0eE3BvQHUBNDf6tHYpDIla3KGtS/Ooti
	fSGrE+TeUKLLqC875P8GsBUQxQtcslQ7km62yDxQy1SO1Gk3ahpbro5VU6plWJHAsMd9
	obA2p/0fFTvLqDumtpt0/atEbWXc2DFHcs3nULVyr0eLFilFFDsqWkv+3lR/1sfCIXve
	+EAw==
X-Gm-Message-State: AMCzsaUlzDEfOla97YpKrup2++ernl6hOZ23unexXU8MVjAHsggpWU9b
	k9ByBlOgalu7N+uAWvA3eviGScTMFHNJF6lqMN1tjA==
X-Google-Smtp-Source: AOwi7QAeexTvb3sTBHQHnOzOqGeYyOw34pzrmPTU2rGrk7mZTlTseNA7UzrcXYaJkUtr+DCOR1d+caDMGNIdRfjjODA=
X-Received: by 10.107.57.3 with SMTP id g3mr761065ioa.210.1507110400276; Wed,
	04 Oct 2017 02:46:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Wed, 4 Oct 2017 02:46:19 -0700 (PDT)
In-Reply-To: <1507109531.25153.6.camel@intel.com>
References: <20171003094039.30186-1-ricardo.ribalda@gmail.com>
	<1507109531.25153.6.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Oct 2017 10:46:19 +0100
Message-ID: <CAJTo0LagbKRTTh7VZ+LYZh91WGA7TAkwXY-TyWwWOfEP7_PfKg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <Openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS
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
X-List-Received-Date: Wed, 04 Oct 2017 09:46:39 -0000
Content-Type: text/plain; charset="UTF-8"

On 4 October 2017 at 10:32, Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Tue, 2017-10-03 at 11:40 +0200, Ricardo Ribalda Delgado wrote:
> > Without this patch bitbake cannot find sdl-config
> >
> > ERROR:  OE-core's config sanity checker detected a potential
> > misconfiguration.
> > Either fix the cause of this error or at your own risk disable the
> > checker (see sanity.conf).
> > Following is the list of potential problems / advisories:
> >
> > libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be
> > found in PATH. Please either install it, or configure qemu not to
> > require sdl.
>
> Making sdl-config available is the wrong solution. See https://bugzilla
> .yoctoproject.org/show_bug.cgi?id=11725


I've just closed that bug because I removed the sdl-config check from
sanity.bbclass back in June.

Ross

