Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 483027F87B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 15:43:06 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p6so15277796iod.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xqgBdNcfLWoEpOaQGpGK8EEVke+y37RYIcOVVF91kxA=;
	b=kxRRy6ehTPdS6ZwGhEXFyLG/f5EURlK4BbBrgcshU9aWJTeqY7EORg9x9Qt5RLMVkP
	PfoUmSsqprV66sILSUROc34IF/vqToC4yT42Vsm4beILrFqdTJvMW9jtqUKgvwkpIZvK
	sOiY6i+WNORvmBUlICPf+dQ/F7lm0TR6+TfvpNknFWF6P0s+KPKie5lJY4QM8OphqmmR
	jMxGkt006/UPT13DBUC+R6/NN+yp38j/rFX4ztyoa1xFasZ6wZoriSAkL2qc0ZddYpzl
	xdXB8/SHYCfBmjyl0JM6l7rcNjljKaCDEaLjs8FZUsA7c+cLBPLQRSkQric0020HpqXO
	1w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xqgBdNcfLWoEpOaQGpGK8EEVke+y37RYIcOVVF91kxA=;
	b=HHnkEKZZsJjHeYpV7KjzpxGK+jKrJ2HQF9FBM9KP4DLDodx96FD8yENvlhaeCPYRUo
	fE+rs/HkIL83pbGLV3BGYyPW7zu3iLtC3InjRJ1wBDbdhcz/jlxDxesdcardBGfUXRYX
	MlTe35V23lZbSwq3Z9Ph3IvXsbh0kDCJL473kJnZPls/d745G8T+cZhH8B6em+hRQd7L
	3GOnZG539KpW9fJyOI3jIXubxpO32bXxEwVK3u2kytqeGDPeLS6CqStKSIvKEl/mnIKM
	gpgydmIT0y1kSf+8NA1Sk7i0o18H2tFGwB2qBNqFNTQHkgdtcjRoRqwDBF7RQA4JJnOH
	SWog==
X-Gm-Message-State: APjAAAU9TDIYQIBogRgmcMNRUaRLEoZ0xNJfOfBJHyf7qK4VNPBjt+lN
	3shhvkGMmLwMBgRKHbxhK+5D3Pk56O2heRhac0Y=
X-Google-Smtp-Source: APXvYqyORvix12JV/8xw4QWUhMJO82rRjcnRDZcMExxlApX1l+EeA+s7RT2ZJSjH2dDbPNfw/jS60z+ZBC1uCsZdn28=
X-Received: by 2002:a05:6638:928:: with SMTP id
	8mr22885953jak.124.1572363787249; 
	Tue, 29 Oct 2019 08:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
	<CAMKF1spGD1djY6F4hMYCTMWyEm=Fdq_ZmMcWFE8rxnhe7xv-mA@mail.gmail.com>
In-Reply-To: <CAMKF1spGD1djY6F4hMYCTMWyEm=Fdq_ZmMcWFE8rxnhe7xv-mA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 29 Oct 2019 16:42:55 +0100
Message-ID: <CALbNGRR=kGo-Dt1VKn=2AkWQwDXHEKF2M5Hwb5y0uGVfE2yrzg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v4 1/4] colord: initial add 1.4.4
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
X-List-Received-Date: Tue, 29 Oct 2019 15:43:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 29, 2019 at 3:15 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails again
>
> https://errors.yoctoproject.org/Errors/Details/274899/
>
Continuing like this does not make sense any more. Need to set up an
environment where I can reproduce this error - may last.

Andreas

