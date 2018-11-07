Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6A87A79CF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 20:25:23 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a132so22847571qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 12:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vfV9mrq9z7XpQ7MVUrnQaT5uRv3IGAB6pYC0jh4rYb8=;
	b=Vuid981pcUBB0m4DMdnjKF52E1fGCO9oSVcIqMB+9j+hHME3c+1eJ9ZoOi3q97Z2Kq
	h0R4L2Hs+s8lrERlI1pAQUw5Ym4+N1qyg9n9HASynX9FWfEx+ht2eNh3QOZB9PHeaQSn
	cmWkh405TFD5E8C3vmhooGaBTsKB+IahZCNhV3KLmf7cDw1pFgV7HWo8DyMbl4mvvD6c
	kmMioDgENNRcY4nVvu5dK3pGVKuEGwL71vDDdBLquc9YLyDwzcJJKlzJaxOvvNE16WDV
	a+Crsx9UMwHX/Mya8GeSAU4N3cP5UWQEpGtHIku0sv0W3ssQLTSRqCPRTIV7BDILml90
	n7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vfV9mrq9z7XpQ7MVUrnQaT5uRv3IGAB6pYC0jh4rYb8=;
	b=FAkEp2cu0Wz1KSYTxUQsBA5xfIE1EMBPLpMaD6zEdY+5BMLg1mPgFudz61stymtVGW
	4UyLuyHx9wDF0mIMvUTkgHyAsNE30R0buFMk0NPQyxVkqgNJgQmFW8c7OJsu2sIbmclF
	CddYWtREoGwCU48WPfMAYYwa28jFOML3lRxJCALa546fNk5P19jNOY6xQMsVxyvHbitz
	q6LhvOaI8eOrVzzXsOL+vODQdPWwiXNha+84Kpdfo/YeqA+IPZGkUgakCJoOCUtw2/X4
	YT5RLKdfaB7cj0WgCv8dhmGdT3UKxyxIYEAzJ+5jgS8fyQCgbNvyP6/q5WFHUj12ZEur
	xTIw==
X-Gm-Message-State: AGRZ1gLMLzt6X0kI+9MU1J6yZUsB1foqYrDpjT0gW0fnkaF29I/AtuEO
	MSlQF59M+0igUh7vYxpuvuPMhZDK1LrEaYsZgNE=
X-Google-Smtp-Source: AJdET5eumTwkyQIouAUFxkYoInvmQnZJ0UEYVPHhXaAcPHwpsBWdkob1O2X8tsDbIDuwjXh1zZO9EjmgeW/ejRdzuf0=
X-Received: by 2002:a37:91c2:: with SMTP id
	t185-v6mr1621268qkd.223.1541622324089; 
	Wed, 07 Nov 2018 12:25:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<CANNYZj_L9gAfEFRMY7324CZJNvmQTFqmh_GGHFitE+P=6+LKZQ@mail.gmail.com>
In-Reply-To: <CANNYZj_L9gAfEFRMY7324CZJNvmQTFqmh_GGHFitE+P=6+LKZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Nov 2018 12:24:57 -0800
Message-ID: <CAMKF1sq0cV1W5rXFiXHVLS4NJDbQ0VdZs-hY0n0p4xWZESysVA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: Re: [RFC meta-gnome][PATCH 00/16] Add gnome-shell support
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
X-List-Received-Date: Wed, 07 Nov 2018 20:25:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 6, 2018 at 12:12 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 29 Oct 2018 at 17:41, brendank310 <brendank310@gmail.com> wrote:
> > This adds gnome3/gnome-shell support (and required dependencies)
> > to meta-gnome.
>
> It may be somewhat far-fetched, but how about taking this into oe-core
> and retiring matchbox and sato?

I would rather suggest to include QT5 if we want to include more
modern framework and may be something like LXQT as a light DM on top.
Many OE deployments that I know if OE use QT,

I think community would benefit a lot from most common use-case being in OE-Core

but I am for anything thats more modern

