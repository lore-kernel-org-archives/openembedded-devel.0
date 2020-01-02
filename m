Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 17F277F9A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:35:37 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id y8so15271434qvk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 09:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=I8R3LLN9KPKyLEGJ6nmto2xyQZrx8eFAhVGhxjtnFq4=;
	b=ZjH4aOVadH17hcI9XNeWceeWEu91k/yYvtXXVR9gOY/+dRHJCAZ2XzY7Md8mk/B9KE
	nSX29x7FU26v9K8vmRCeG8V8WRFvRckrLloPcNbECTtQyVm2LDPrzAV+VaRuD3wtpu0+
	2om+I3ViQrtEF2oKgsb+Y3HmojQ9I+elqAZzAxppiJQxXhFrAKnwcoxxTC4tTIJwvMEd
	2qcVr0Fwkxe2d53yfAR6XOfUg3jL9FXrlWpuYDH+Oe96FcF9GjTDHV2kfISZHHQSbKzw
	+qXWkm+l01QMvgnUQNDe5Nn/5NhpKzS/kRwB9EHVGi/yjqdpx/YkMbf/9+SFu0trLM6k
	fNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=I8R3LLN9KPKyLEGJ6nmto2xyQZrx8eFAhVGhxjtnFq4=;
	b=GSLvPsyROWwNjlC096drVPPuR6fN1lYN6E9Xx0vvh3rkte5C9IShI6Jx6BtKIoGsGI
	yoNPYLgmcTYbn6tbgqKchezGC68/JmRj58CpijWJ3/v8QDbY4C2ldK0gaCmTbbvJiiXk
	6zUZAPWNBKtCc0tfXPLmrxKexlbn/w1ytp7JX7XKn7fwDawbI+H+mhZGGKcuGIIHpmch
	vvId+bvHKS3erIjEYfekHqMcBLuu6dSQ/GZAYpe9BOJA2smvBLJDHOuDZrmDnfxJe+UH
	9i1pDmit1f295Pf5HUfuG8PDMAQR03XVYHlNMnfo6+jTC9OTgINx8XzFRxbrYD8BO+PY
	HxBQ==
X-Gm-Message-State: APjAAAU0pCKAMKAyynKUlllHXC12dZbvKJ8uEDWdDeiK5DkOksV1bJYY
	wxTZv1ZIKwc/bKDkBi+0l8R9/nlCNV4JHO/3uKE=
X-Google-Smtp-Source: APXvYqwUmoRFFUoqlKfgNHB4qOemM0VNx0bneDrAj3/97tpZeiQ6vWwPo9TnNJjTUK1xAkYgDfUQDczr7Qb/J/+AI9w=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr63860411qvm.206.1577986538650;
	Thu, 02 Jan 2020 09:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20200102061330.480482-1-raj.khem@gmail.com>
	<20200102061330.480482-3-raj.khem@gmail.com>
	<20200102105520.GA11760@localhost>
	<CAMKF1srXvYy9QT8DvfbH2Pe1hRn9wCkg5n3__O5cMm1HiRTLcw@mail.gmail.com>
In-Reply-To: <CAMKF1srXvYy9QT8DvfbH2Pe1hRn9wCkg5n3__O5cMm1HiRTLcw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2020 09:35:11 -0800
Message-ID: <CAMKF1sqT_xahigfaFW=fs=fLBnoV5m0ONYsDfX=5zG=zL6BuJQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/6] gtkperf: Fix build with latest gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 17:35:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2020 at 8:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Thu, Jan 2, 2020 at 2:55 AM Adrian Bunk <bunk@stusta.de> wrote:
>>
>> It might be time to remove gtkperf?
>>
>> It is a benchmarking tool for the old GTK+2, and with no upstream
>> release in 15 years there is not much chance that gtkperf will get
>> ported to more recent GTK versions
>
>
> I think that=E2=80=99s reasonable. I will perhaps prefer to remove it as =
well
>

we still carry gtk+2 in meta-gnome. On second thought I think now that we
have fixed it for this case, I will keep it until it breaks next time.

>> cu
>>
>> Adrian

