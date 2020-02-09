Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id D319160CD0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 18:41:23 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w8so3472268qts.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 10:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RIi74W338uTQwc/z/KOm3Wq5ACSpZvjmLQwfwNoulLA=;
	b=DhR1Hh83WTLvlM8A55N0kR0oImG7YMxT9kq9LOz2/xICFxvpu2Be7mYaWxiPciLC/4
	aGXMcGCmmVylrqSQsa2k3WfsbvD8Hwxh0C7pm6PkGB6FKp0oavz1REIL6xW9ghQjpCn9
	fBm93L0sg37s8ztQAKatfnkajFqzX3C6b5g9MBLDg2sGEvUFezioTReuO72hW90Tner/
	gfgZ4T0VHJm5MBnE07ZKkgC8BkosLZF3RdtQ9Uj8pD4w64WrEib4k/lVmjW8aca+9ZAT
	8bbJWBFGJpS8x64mtNhG2E7bTUNIF2NkUhm/oO1JjUJnakZD03FdZJ7M/2zft6B3vTUy
	uCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RIi74W338uTQwc/z/KOm3Wq5ACSpZvjmLQwfwNoulLA=;
	b=m75TABU1tTsGvkPNI+jeDYMuEl/GgST/ZlRr9MBEpjbqDNWE2IdiLvCfac9qAR9oZ2
	Ahn12ijisgKoV3MdfW5cQGNurp00qy2dPjMK0i5hve/PNNLEAxyP60Qb+j65HGFgioWJ
	NarOP7rCyXX7g4bbt9xNVkglghDMz+Cz5ZF/kStO8uXU1MVzl8XN42wGR/L1uq3d6thz
	xLUHZCDMc0eybNA71vkaUPPCh3DwE/BTx5RXWB93yoSt2tmWzOqjCkX8Ggi1GqP7jkiN
	PBPjspg06KOWM3hXubEFUhkzUd9g8/r/59lPG1MiUjD45CIbALeNZcvMv6MjNvhI4Bno
	hzKg==
X-Gm-Message-State: APjAAAV9J/ctoZQye06Y2KSQ0hea3qLP6sEVkW7NpWy5cxmLmI3ldPNH
	viI1cA9y3ehxBR2g7RvlJH3YjDgzwq9q7gJ0Frs=
X-Google-Smtp-Source: APXvYqx49dqlRIMbhR4vXxhL/zlwvs5vnvl26D9b13B92Iwl+j8IxD/9A+xSngAngiEJT8lDy2MA5Yu6WZK62esSHlk=
X-Received: by 2002:ac8:60c8:: with SMTP id i8mr2636185qtm.53.1581273684376;
	Sun, 09 Feb 2020 10:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20200209034641.19378-1-okaya@kernel.org>
	<CAMKF1sorVApNQ69i3QOUiK6yF1gCvubzNvT=VMkjPcFtK+XC+w@mail.gmail.com>
	<CAMKF1sphX1U9MWnhvOhiyKNWy8BJNJtxeJuf9WOYV4qWWrXY7A@mail.gmail.com>
	<ebdd6807-4f9b-f1aa-fcdf-dba5ab71715e@kernel.org>
In-Reply-To: <ebdd6807-4f9b-f1aa-fcdf-dba5ab71715e@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Feb 2020 10:40:58 -0800
Message-ID: <CAMKF1spONv-2fZ676CSPjAHbDwzKAABqBHa0Obj2=0+osj84ZQ@mail.gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Changyi Li <Changyu.Li@microsoft.com>
Subject: Re: [meta-oe][PATCH] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Sun, 09 Feb 2020 18:41:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 9, 2020 at 9:45 AM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 2/9/2020 11:56 AM, Khem Raj wrote:
> > It also fails to build on musl
> > https://errors.yoctoproject.org/Errors/Details/390527/
> >
> > On Sat, Feb 8, 2020 at 11:53 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
> This library requires "-march=armv8-a+crypto"
>
> -fvisibility-inlines-hidden
>
> Yet, it is getting compiled with: -march=armv8-a+crc
>

This means the recipe should be checking for crypto being present in
TUNE_FEATURES
and be marked incompatible if this is not available.

mark it compatible only on architectures where
it works which it seems are only arm/x86, and on aarch64 particularly
check for CPU feature it requires
something on the lines below

python () {
    arch = d.getVar("TARGET_ARCH")

    if arch == "aarch64":
        tunes = d.getVar("TUNE_FEATURES")
        if not tunes:
            return
        pkgn = d.getVar("PN")
        pkgv = d.getVar("PV")
        if "crypto" not in tunes:
            raise bb.parse.SkipPackage("%s-%s Needs support for crypto
on armv8" % (pkgn, pkgv))
}

> What's the bet way to handle this

