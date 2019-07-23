Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6624E7D718
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 13:58:47 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w190so31153362qkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B+8aAQHlsYdfS54GT2YnVimUdabT2QUElEZukKFUXR0=;
	b=ceNQ5Yx7O4ih02Ztx/66fEJ1yFuM2JbXUCThr9KeRBJpn/yBEMNniu/OHu9fKkA5lB
	HKFLyln39ohPPso8yrHuZ8lO/yXL0k+sLUVlB9UGUkSesNPJWlbxffsUshN+UghIaGhD
	DsAlkfg0aeKpfaihP45ZC2pITaUohP4Ldmw1YNZlkdsfLkCUnC8QTn9vVPrEdu7Frk93
	TKLPKfBhEzbE1s0SvQrCsEFOhbwje0eLIRkTr/gSE1bbNykFJisT9oDc+JLrnr/c/0L7
	xYfZDZK/S8NoO+/QqGqvEi9a45bB7jwMyV2TKzhfcQiF/Loi39iM1LQm23V+3m6Q6EWd
	bP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B+8aAQHlsYdfS54GT2YnVimUdabT2QUElEZukKFUXR0=;
	b=pEQTZcxFSowW+6EFdFGSiAuTJQobItYD1fhldDeLwuMfRqUIvqRJulDqYrXt4RP3HX
	P/HP3HLAQ7L3byrKW4b6b8AqXjtO5zDSaLvtY1SwiI/2bbiNlgSh3RPuUlJk2W7Fx0bp
	AP/8YEOadystdUT1m5bDoJeZquusKONtR3qX6oI1cCM94H2cfENMUfpxWZK5ZvPQ5kMi
	gwfsjow88bhhrr0ZzQ7+w0bWE9JTM+MnFxopzgbgz5MO9pEmqDToNRetA1kYrgdi9TzO
	fXFZlQv0ZbukgWkBZDVriE/gAjcX+18MQuOu6HD9vdsi5Umsrb2z3x6srODkfEKFFLU6
	/WCA==
X-Gm-Message-State: APjAAAV8FUWZNySu0C4o17UW09N7IroAn030i/R4PL4tTJBI6TNH9jQb
	woX7NjuacEjE+JmuQ7jp1v3qLc1tbFHfepTRrhq4AIYb
X-Google-Smtp-Source: APXvYqxJd0NjqDCqB2Hd0IHPxs94iV8c/BIyk6vPBD7lvl4Y9/2Jtx8baWwtZxe6uyA6loXdOuN7za6RjfeoCXnx+Ys=
X-Received: by 2002:a37:7083:: with SMTP id l125mr48778439qkc.71.1563890328028;
	Tue, 23 Jul 2019 06:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190722211814.14237-1-raj.khem@gmail.com>
	<20190722211814.14237-2-raj.khem@gmail.com>
	<20190723075341.GB27144@localhost>
In-Reply-To: <20190723075341.GB27144@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jul 2019 06:58:32 -0700
Message-ID: <CAMKF1soNwAgvn1mCQPcA4ugCtMvq1k7kWr8A4dWbafCofcV5EA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] log4cplus: Fix build with gold linker
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
X-List-Received-Date: Tue, 23 Jul 2019 13:58:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 23, 2019 at 12:53 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Jul 22, 2019 at 02:18:14PM -0700, Khem Raj wrote:
> > Fixes a potential linker error and eventual linker crash when using gold
> > linker [1]
> >
> > [1] https://errors.yoctoproject.org/Errors/Details/253440/
> >...
>
> AFAIR these build logs are not permanently stored, so quoting the error
> message might be more useful than a soon defunct URL in the git history.
>

thats a good point

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

