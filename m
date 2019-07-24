Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 766227F143
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:34:35 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id y26so45464569qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=61OgJM9ZLcplcRr8xVyUbwDiCnXcTrLSMz9/oL4Wbvo=;
	b=j1/fugGNomN4J0nr6YJaVcejYICurLOinmlQ4l9w6b1ygF0tyJIZ5VfTNcAQZQ+Tvv
	EtAqi5t4NB1H0YUwVVvommxzTGpRivDaQUSiJ9xxkGyiPH2mLyf2xfgo/E4pMKtdD5EI
	GyUorOUKW7uJhjlKl1t89VKPrG/0av2GoQ83roxzBjrCGq4S4E8zC8ZePJ/XQBMAHxP/
	sJ2G/IRJt9+67LwJlblGOc1UXmsSGeCJkVvx/QZ9cqUPpMduJfnvWxOhhlV3vh912EiT
	ggib35qKQSOQlgjmZEPDqRunJvlRmfmtY2znmCji1+I0NiUMIEwE+pKi3kWpYeVfFjXv
	XsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=61OgJM9ZLcplcRr8xVyUbwDiCnXcTrLSMz9/oL4Wbvo=;
	b=Y+AXFhCO9vhAn/Mxd9ah1qQItDyAeQNmsP6oChjE1z+kWWT7xhy4MlrgReLsy/b2Gq
	b7NdkSQMYT3sEVNzC3JuxNmBt1NB8bTFGLRNmW03fvfnuX+5hMGm810cRjOOAjJQeuze
	0g7oeqHhFCYavPuYg+6Q9gaCLzmJTgRFsOTx5VlQjexHf4ZZHZA3Bbf6uPEo7RE6nu1C
	9kX3JbD/NgG65dB/94Jv1oRTrSn8oXyR9nhUY725jqbWiqbD46G2sW/t4RDh397ksGn2
	OvhfGpefTzvUj7dDgMMwOunYkTbQwLnj6aRvHZgmZzzkEh0F+EUiPgv61NgTuE+Lrtey
	rx1Q==
X-Gm-Message-State: APjAAAXivzwGr8JITvUgtPr9zOlzJ7uTUww807rpm4ZKZKSs6fW3tM59
	J9TCWnVcyJIpYk9r0T9NUopEXuEbTx6VJE3kwBpSmiKg
X-Google-Smtp-Source: APXvYqwwgFXYK+IS+EqNA7rmKtE8T1GbuhQ5ENPv4B1dR1v3T0jQWajuOGIEkUx6t8joUUHa4N41w+Ef4N2nR0W2jlw=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr56548351qtr.194.1563975276105;
	Wed, 24 Jul 2019 06:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190723151649.9238-1-bunk@stusta.de>
	<CAMKF1srWP3iFCHveAGELyZzQ0QeB16PG7+2H536au1QAoWOqCA@mail.gmail.com>
	<20190724103835.GA27634@localhost>
In-Reply-To: <20190724103835.GA27634@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 06:34:24 -0700
Message-ID: <CAMKF1spNvU2v5n+_a479E5ZEjGD5nti5Wmcv2aaV07nE_kg4mg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] meta-oe: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Wed, 24 Jul 2019 13:34:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 24, 2019 at 3:38 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Jul 23, 2019 at 06:44:49PM -0700, Khem Raj wrote:
> > This causes
> > https://errors.yoctoproject.org/Errors/Details/253988/
> > maybe due to atkmm change is exposing another missing inherit
> >  gnome-system-monitor -> gtkmm3 -> atkmm
>
> Does gnome-system-monitor build for you with musl without my patches
> applied? It doesn't for me.


Yes it did and build again after reverting there is a chance of race
condition but this package has not failed before


>
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
>

