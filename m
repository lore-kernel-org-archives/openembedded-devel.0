Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6B80A7E553
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 21:05:07 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id g12so3812551ild.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5iZJ9upEMGxWJiL4Ba3UhlFaisISIRieWoBkdR7TGy0=;
	b=r5W++q2sNQKMowDboul+NYMTNRL/h/Tz++wH8yL54EuIqFSt/KKlHz9CjUke1w4cAs
	B++sLX1F2W/hfyFxfNHmdQQPPJyn56ApuTwoD/KF78U3HG7sup6ovHyUfx4lPf1hrceP
	Z0UXAzV5rF9kgM731rdk9boUb84faML+CU5kNX+hLOqojboHNoxdPq2dHdEnCD2+/xjP
	b74uaFVbopn3FesNyfCXVFqM8qH6d7nUKkLDYFI1EU36NiXPJoY5oGxQ95613SeGHEJW
	Jaix/5MniUMTj2jy/tsy6NqI6bq59RhpxTINzo7/smdtMnnwgYc5Rz4BlZRsMl3wZTz+
	oOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5iZJ9upEMGxWJiL4Ba3UhlFaisISIRieWoBkdR7TGy0=;
	b=IkfqkeVh8cBunzawsV9LZym65RwSmt01Rla5RgRHRsCrakQnbf4gKhvIYIAQz9Py8k
	7Of6UKRHfvYbFpiiapDFDuQak6r0qSbkwCHIEduywSN+c340cQs3iAeZMlGDVGnLF3fK
	Y6Fs52yRiBfIgLWHXcsutXJjnCNeYmCQlmxB5sTXacmqOyozyJlmyRNFmwt2ucmSp9ut
	10Pf/WBMuRayLR1Duq95jzUBvSZOvHcqcd/0S57qyrj7iaY9kR5ktJbsNExBM9gDYM6W
	uYYw16Ui+XjQZmc3wJZYTnt4hNNqNegAWS5GIOM2CraAQeIbZi8IzBzPmaXf2aZxOWOY
	RvlQ==
X-Gm-Message-State: APjAAAXpn/+QaTlu0FbXcxiK+HuFU2SowTxWdVPpQTh5Y20nwVyaSjr9
	OWcRxNL0StmSdwgEEylMCozM43of7BEatiRGA5E=
X-Google-Smtp-Source: APXvYqxsrL88eaZQd4BI5vl4I9pYHkzLnjSZgMYgfJexjIFBQs+nk+PjIdLDSWduNCgoGca6IiFEHvFGh8/T/XRvqGQ=
X-Received: by 2002:a05:6e02:8a1:: with SMTP id
	a1mr981780ilt.108.1576443908409; 
	Sun, 15 Dec 2019 13:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sq=oFvgEtCbSOtpgLsZZow669uqadeXmf4x3ydrPBVODg@mail.gmail.com>
	<CALbNGRQwTv_GmgwjB_J7vrfQPgTsU+aGE=E8KrzfDYs9-2T-vw@mail.gmail.com>
	<CAMKF1soZmy20ojdv4_zmaThH4dsW8X5qin_A=XHH4VjVoazbJA@mail.gmail.com>
In-Reply-To: <CAMKF1soZmy20ojdv4_zmaThH4dsW8X5qin_A=XHH4VjVoazbJA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 15 Dec 2019 22:04:57 +0100
Message-ID: <CALbNGRRKQrcF5FdtLDc578Ztk+yA41RA9Lnqc6790WJZJviX9Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Sun, 15 Dec 2019 21:05:07 -0000
Content-Type: text/plain; charset="UTF-8"

>>
>> Since they include other images from within meta-mortsgna and
>> lightweight (=missing important) is not target of mortsgna, transfer
>> is not straight forward . See if I can put something together. Maybe
>> something like core-image-minimal-xfce + some wayland bits would do.
>
>
> Right that would be cool
>>
Played around with this but don't get it to start gdm.

* Even if I would manage to start gdm I cannot not guarantee that it
works for others because - as said - I use meta-mortsgna which changes
defaults.
* I would never use such image

So if this is something wanted I ask others to add it - sorry

Andreas

