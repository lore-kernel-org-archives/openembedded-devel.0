Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD1107CCE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 17:25:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z3so2303704qkf.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 09:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XJ6qf7/XevqDBkpTJeVJ/7tpZf4UxKgRlRKoTj3pzS0=;
	b=Oi4Q6uDTYhHRAKtWbHaPoByCtl3R0qvuCK0bTUvMS6gTSjtJFHB4/djVP1OsmCZiLW
	CskdjEhEKMYsZKO/d2eduLRXqmcm7uAGgGMFkRdIHeOa0INpDGHo+oLH7QZTIInhlNyv
	k30X/Wqn6Pfrfe04iCFbPuuv1o/qqZWAhC+6yQL0acAor1yFk6i2zk+pIClUDYhy8KKZ
	thzbrqz3k+QJk/RYXaxMNVX6C+oPsDG1uiCjxWADCskP9KFK39DFvr5GYkqLh8o9Nw2K
	dJavx0xXeSJaNpG6pkFmDhiqCBlG3zblD5E5jsm8OkNS0aFjZGAaggGGRUwTaoaST4sZ
	+XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XJ6qf7/XevqDBkpTJeVJ/7tpZf4UxKgRlRKoTj3pzS0=;
	b=qyfFhfZnN5eVJ6JMaLnAAWeU4vZQajDLbiZvE9PwlZjOzH/50HBFUNCz8M0skVltt9
	jJxsRm8wXafUSb3O7WAMca6tHCzPsrL4KNNtW4sDYMyAVI/NUGQvYFldgMvAUA3H6XGF
	2gICqciYlYP/PecfltfUgcdtec69LbbhKl8hJqQYzsIOxY3ROe3SdJJ+aMWJL0whDMM8
	5cv+MmekFmg8izWhZ5SdFIz2B5CS1DX7Xqb3vzSl6lPbeBVbDz6VYTO7ZQSFRkIKM9sU
	Jain38Qk0P/qo6YC6fBG9pcOOq//FF7wany8VhjyAcQviwfLE0aDVpxElwMgPBFpIT3L
	fHqQ==
X-Gm-Message-State: APjAAAUCnK1pxr3C6mSooVsVYtyMIzminefjy+QuM6L05QrqChcNbczy
	idSofhe/MsZXYwN2lKEx2SxNL24qlwfb4MYUvinjAw==
X-Google-Smtp-Source: APXvYqzlb7VMdg7N6hANaFKFTbb1mcJP4KP346PVxcciaspbSU+AlSso61Qzfu2dGCpK108HSuIGPsiHe5DxQAqDFXc=
X-Received: by 2002:a37:4c88:: with SMTP id
	z130mr10645346qka.206.1551979559443; 
	Thu, 07 Mar 2019 09:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20190306054548.16430-1-raj.khem@gmail.com>
	<20190306054548.16430-6-raj.khem@gmail.com>
	<20190307172333.GA1278@localhost>
In-Reply-To: <20190307172333.GA1278@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2019 09:25:33 -0800
Message-ID: <CAMKF1sp-k21Pmw_soord9-Sbwj1B4QO=yhvJELtbSsT-PBhSZQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 06/12] inetutils: Fix build on RISC-V
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
X-List-Received-Date: Thu, 07 Mar 2019 17:25:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 7, 2019 at 9:23 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Mar 05, 2019 at 09:45:42PM -0800, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-connectivity/inetutils/inetutils_1.9.4.bb           | 2 ++
> >...
>
> This recipe moved to OE-core.
>

thansk of reminder, yeah it was in transition. I hoping Tom will send a
patch to delete these recipes from meta-oe repo.

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

