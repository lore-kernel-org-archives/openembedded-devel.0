Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 10CB3601F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2017 02:53:49 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id q29so117687uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XNsI94D0XAk6KNpXmUiawGVpRgPsdAV7quRspw0hjYo=;
	b=ZwCg5RyxJrxaAldBXs5S5ESba365V+Hx/Iy73r3t3siKa3XxSzrqJJ7Y1ykUjQkNrT
	9CigDYYYl0kassMvMUf+g7DXkMZ2fqLkY7ga1h0kZcqAby/zlR365ttB5iyrnTjTtY44
	uh31aCPKumc21JJWPgCa0GT7fz1i0/BsKDhf/QRKhjGnLXMMu+Qn+cQlN5i/fOtJKB6y
	UK303HyVimQDKZdWtmIamIWwyhmQl6IWh8jSnCzwrvpQP/OVWRbTMaQxBSWitfl4I6LG
	3FeOZ1lDOZ5P/wK0eUDgcSM1BrH2OduL1HPPnaoFjAOb3DhJGisOW9LaSYk2TqX5Y6Uk
	37Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XNsI94D0XAk6KNpXmUiawGVpRgPsdAV7quRspw0hjYo=;
	b=R+ZxgKDC9/qyrroYSC+WDzaEze/WRyY0Z+xLJ3zCB1pB7S+U98dn24NNhI24jGKHQr
	qvf/rYYHcT1km97SUEWhQhAFCtyRonu2j2Vw5DE7zoR5lw8lmwZgek0HMsoMUTNoU0Og
	fQ9viLtforcGE+LBlP5cmCjSQ690B0pfOq+a7iK+ZOzoOSeptiTicrupjewjz3eqS5of
	wgSRji590ZvqGCL++StaOiguWyiv6f8zrC0GNK0uR+VOok7qaEgog+89goTsuLB0xR7o
	0Wh/6lgLCFyYJseG16ljvhof/mAvP/efrRVwL2lgbM6U+a7SC3xQjyArVmfFwLWYIXYv
	wCfw==
X-Gm-Message-State: AHPjjUhL1tIoyRiPUApV/5IgKdIWCpH/huzulanJ3WDG5w0jVrZ/XD6p
	h2oE4BdsYmHBntGL5PfbsG7Co81WGUQSbCGOGIqW7g==
X-Google-Smtp-Source: AOwi7QBQfTKcAat+iaAnI3pBlXh+m/xpijnUGEuqQMsm0Q/peb9nBlVmZdgaj3SsKI11x9tp7H9hDUOoVJIDaXtFCI0=
X-Received: by 10.159.61.140 with SMTP id c12mr2350852uai.166.1506567230513;
	Wed, 27 Sep 2017 19:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
	<CADNbA1rjSSNANYovFMQEAW3bWHbc3Ey4JtuCUPWMrZa9--MR8w@mail.gmail.com>
	<6d06fafc-14cc-f8b1-1d73-f83b6f6436f7@guy-morand.ch>
	<48605F2E-2616-4585-9503-3C953AE0A518@linux.intel.com>
	<f4113b49-34d4-b3d9-13e6-176b2adff30c@guy-morand.ch>
In-Reply-To: <f4113b49-34d4-b3d9-13e6-176b2adff30c@guy-morand.ch>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 28 Sep 2017 02:53:39 +0000
Message-ID: <CANx9H-DBCu5LhQx_negKjjuBRJqCf-Ze_8mv2Y8pkhQGYfSmpA@mail.gmail.com>
To: Guy Morand <guy@guy-morand.ch>,
	Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/3] Add python3 matplotlib
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
X-List-Received-Date: Thu, 28 Sep 2017 02:53:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 11:40 PM Guy Morand <guy@guy-morand.ch> wrote:

> Tim,
>
>
> Ok good about matplotlib, this one is not an easy beast :p! Have you
> also planned to integrate pandas?


No plans for pandas at this time.

Otherwise I will happily just send a
> better patch just for this one!


Go ahead and send a v2. Thank you.

>

