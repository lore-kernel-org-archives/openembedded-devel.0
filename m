Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id B949875580
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:29:05 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id d5-v6so6651084oib.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5vzdhkZ8SqI0fiu7P17txlcCPanqTiGeW0j3COD7tOU=;
	b=LMTOH95kD89OxEIVXg0lXKWwsC/bYJLzRG4gJ25kljXot44/6t2NDW//viDjqqTJ5w
	czZ/bVysPgd1GzX273ZmbDHE1QK0ONxNFtNOZXUZqoKuGG4FO85k7yD2mJTFNObRxPHl
	8St0Ub4iUo35Ox52+azKvoMK8ZMNKyePat+B5SsWrKANix0nW8/ATBoYbM7jr6iPB7Zx
	WYXCweb5blSaJzbxOUCgG3XnGvOAFrEnjmTmjMpJhxQ4NJpBM9syIkAyNi/IoS4k8Del
	khaADT0xvC4gQC/Jm74bwiuWBormcfLShMW1u3/gmsNgoZC1JL81Qr5fWfoD/LjNv91Q
	vkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5vzdhkZ8SqI0fiu7P17txlcCPanqTiGeW0j3COD7tOU=;
	b=sTAbl8vKL7exD9P4Qne0cK7F3J7QZnzYyO5xKQ/YNb5XUMA7KtDM+05X7Eh/Nx2go2
	4roVe8Ucym175EoPyV8xIpqiu7xhLFVil3DbVmA8RXPr0zW+OLoi7W46y8VvVUCuj8AD
	XVfxfcxpNZwysuzHX3g6jFGWdxpdlyqY8OfM6SaiO0oQ34ipv7s+TODg5HQ3JP8eOe/r
	Fvu/pf4lHQrRmQbiEuOIfx3vN2ONxnqfus5G2X/YcbtaDdS072Aj4FfSSHabeCe0WLSW
	8vBzdnM5ywEzOVet8oAVX7nlxUabt0boP7KikuuK/VplrZt4TqZ0lBJ9qhtFNtGdDQCW
	y7Bw==
X-Gm-Message-State: APt69E1HNuUQwHU5LEO+ceQ3gCn7eUZyhVGUblsrPxXfSWjl+RUio+uX
	Mj/jKnVwecuHkw3AQmB9n9+nhm6SAN0K9OHVnxU=
X-Google-Smtp-Source: ADUXVKKY3pAb8w/6asFSm7lnR22ez6HqCBWyxHib9abHjlzNW34H4mS3lt6/qj4NQWqxcHPgkMuG8WG8UpLHQk8dKJ4=
X-Received: by 2002:aca:55c6:: with SMTP id
	j189-v6mr2491677oib.53.1528320546776; 
	Wed, 06 Jun 2018 14:29:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 14:29:06 -0700 (PDT)
In-Reply-To: <CA+chaQdCMFngAwgV2+5XY6RWf1qUTHzDpdJgFAjpyFe0RL62Eg@mail.gmail.com>
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
	<CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
	<CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
	<CAMKF1so+ux5C6v3x_uBqiF1PjrjuYBtT7ViayqMez-oS6SbwLA@mail.gmail.com>
	<CALbNGRRt+-YK_T60D-Cz-NfEbDZTRLy7bUCVgkqCyftGkshM9w@mail.gmail.com>
	<CA+chaQdCMFngAwgV2+5XY6RWf1qUTHzDpdJgFAjpyFe0RL62Eg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 6 Jun 2018 23:29:06 +0200
Message-ID: <CALbNGRQxWvxbwc0UMwe7D1W9XhmWh3vHgb2exC2y6xNd3SE57Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Wed, 06 Jun 2018 21:29:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 8:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> It's not in oe-core master yet, there is branch from Khem I was using to
> start the testing with gcc8.
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>
OK - gcc8 - off to new challenges

Andreas

