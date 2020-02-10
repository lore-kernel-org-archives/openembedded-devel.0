Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5956360C75
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:23:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so8803962wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FtNkNvEe+tBMkKZmXytZ1W2u5xMOl6q/9m4Or0xk5LQ=;
	b=sNir8tFsujD2K7hG7CRbcm0Es83r+Pvh65tDDkPqx6/DtRJUHq4K1I5PoHdCx/p7ce
	LPrTL9mYgfeglZYGu5wInS0SsdICzZwpS+zYnoPlgCXaYA1x47iz69cMkyTtZVC++BeD
	8X0uY7t7nW2Stux5HyW0V5099yxTiwmHlvZ3Xp24w9u8OtcRTb/hrdj86+cY4IlOK5ca
	GqbaKwfmEbGFX4Rm8m+85YKqtCWys8euhz2M6guW4SqqEJBbO9l7qdv5UPfvhHIj7YXY
	d7xahjEM8dKHiH2VT+M9UwxFcLYWBk76iyxpFUCHkS5VMOcNsM/lOVBhejEz8nP639/W
	SNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FtNkNvEe+tBMkKZmXytZ1W2u5xMOl6q/9m4Or0xk5LQ=;
	b=AAIHjuqm6PmCiZulfb+v0wWZG7CzTTVoj36fF/bvG/YxBcMWTl5HFZVBA1rIvY0Gmn
	yw+Br3qJ52QTrzj6+cdXEOAhpPlZPBAVNbH2bkuYbQkrd5n/ltsFhaPNo+sHWxbxnFM4
	5cAhoSxq8oRhfONsHVyGdJ8EvD3CO/GG6XHlKmJtJIHRv0AQtq5ZEAlG86lyWYkA32gf
	w5zoywDl5vmhATvWleo9KJ6mXtFN+EQXviuOsM9FHEMucCtX27o/I7qdkxI0PD47ZSUJ
	Z9wW96SnAa+ffYzXjKv06MJ+xsizYSyKJluFv9vTGSpy5QPR3oEPf9Ufc5vkUZO4/bX+
	pj3g==
X-Gm-Message-State: APjAAAXhZRMLzJuFRi21/9cfFyk69NYygP3Oe7cVSrzqqG+KAvgQ5hk7
	DDuw/NETvv2bLbI5MzKx+i3rDC3rjiZXLEF/gXY=
X-Google-Smtp-Source: APXvYqzCHFRKDBxNx06ZnwDwnVB6hyLgJfgA5/dgT/I736LuUQ2tjGEJHk7pScWyMvqELb8Cj/NrA+cVzr4SEYz0VAc=
X-Received: by 2002:adf:fcc4:: with SMTP id f4mr3160200wrs.247.1581355382026; 
	Mon, 10 Feb 2020 09:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20200209034641.19378-1-okaya@kernel.org>
	<CAMKF1sorVApNQ69i3QOUiK6yF1gCvubzNvT=VMkjPcFtK+XC+w@mail.gmail.com>
	<CAMKF1sphX1U9MWnhvOhiyKNWy8BJNJtxeJuf9WOYV4qWWrXY7A@mail.gmail.com>
	<ebdd6807-4f9b-f1aa-fcdf-dba5ab71715e@kernel.org>
	<CAMKF1spONv-2fZ676CSPjAHbDwzKAABqBHa0Obj2=0+osj84ZQ@mail.gmail.com>
	<744b282f-eb9c-4831-dcf3-5fcec52958ab@kernel.org>
	<c97bd99a-ba3c-bbaa-8423-3d98196a216a@kernel.org>
In-Reply-To: <c97bd99a-ba3c-bbaa-8423-3d98196a216a@kernel.org>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 10 Feb 2020 18:22:50 +0100
Message-ID: <CAHtQpK7pqbs8uNJAPS_c2C6LnJAgeDSVYh+dULvp=j6vByX-ig@mail.gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	Changyi Li <Changyu.Li@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 10 Feb 2020 17:23:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 6:15 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 2/10/2020 11:33 AM, Sinan Kaya wrote:
> > On 2/9/2020 1:40 PM, Khem Raj wrote:
> >> python () {
> >>     arch = d.getVar("TARGET_ARCH")
> >>
> >>     if arch == "aarch64":
> >>         tunes = d.getVar("TUNE_FEATURES")
> >>         if not tunes:
> >>             return
> >>         pkgn = d.getVar("PN")
> >>         pkgv = d.getVar("PV")
> >>         if "crypto" not in tunes:
> >>             raise bb.parse.SkipPackage("%s-%s Needs support for crypto
> >> on armv8" % (pkgn, pkgv))
> >> }
> > thanks, I'm adding this now.
> >
>
> Hmm....
>
> I don't see a crypto feature on aarch64. tunes value return just
> aarch64.

AFAIK, this is a AArch64 derivative-specific tune. For example,
extracted from [meta/conf/machine/include/tune-cortexa53.inc]:
TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"

As you can see, there are 2 sets of features listed. Generic ARMv8
does not provide a Crypto extension, but individual A-profiles might
have those integrated.

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Regards,
Andrey.

