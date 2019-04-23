Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id AFC467C4E9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 11:30:48 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x3so12196865iol.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q6Xkk+E9xxrfzSYgyjJpgBf1q7eUylp2JN/Z6I85WIs=;
	b=XVsDT9MtA76MWd4BFJYyU/r7VxU8rFJ0tmgqj2Tsr/m9X4/g1ejlwHHC+aPiuqX53u
	NdsK/B3B+7cgXfObNBbiXjMSp+S8X9JOuncrU2toYQ8u4PzJWHF1SVBAAC36EVfYoxyj
	hg7wPMdhRHMSWWf72vTdN1ckRZ2DNoSTIgxUQcJ2Y9Il4XBWzvWtutes5lUEDMtBmyBn
	jxs6vTWC51gFSOs5gUUhACsrg4qTaNh+RYxS30A5Wj9tRcAwhnxLPcnUt1FvFylENtrN
	5frxYb0+gNJYHJc35+9dc8/3TLITHASzgOGcAc2uurXHzwv68mEjbOqkU/BmYMf3EjHw
	h1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q6Xkk+E9xxrfzSYgyjJpgBf1q7eUylp2JN/Z6I85WIs=;
	b=F0SsjqpE3LLsyhywWCOBy52MDm5NS6SkAIEtpNrSSaHMSrL67mL4ZyISy/thutKRJW
	FDYAG5wnYXJBkBoL2mik/AQwtoI9agoC1LebUPWxdWYnbcij+LI9Z19GUjZRhQAAoxhr
	fsdCeEAXKns/m9CgBNU+yH+vA6U/OhvnCh4THsJXjoVhzCqVaEIB9D6j4NpRMFFPdwp6
	gJNNg/x8YglIQmhYTN9mxoRvZS4cEEIS9ofdhFCGBJBuWwvTNEKY42Fm+FduqRlaf72H
	BAX1AELxkpjRpWDkAis/06ZFSlSgufx8T2MPaV2E5CmfgtAyUkDrD9jS7NaGbGSVilQm
	2cfQ==
X-Gm-Message-State: APjAAAUqA34DLisxL4IRlK3GHJgVawMHk5M4gCjTHjtjUcSG0hqh2nat
	4/+Gtq0EUWLvZuZefoQM+SYTcxEvikbrSVQ1zeyTHw==
X-Google-Smtp-Source: APXvYqzA/59FQU3zntYBR+cIMO5tY6Ckv8rffEffEKM4mlguTBusFEZBsXLWnfTPCg/l7K8Q5pAXy9GCb2BuirlFsGs=
X-Received: by 2002:a6b:f909:: with SMTP id j9mr14939185iog.272.1556019049586; 
	Tue, 23 Apr 2019 04:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190422234617.5419-1-schnitzeltony@gmail.com>
	<e9587755-4b63-90cf-1738-930b808da883@betafive.co.uk>
	<CALbNGRQdfS-xNdheKuj=AA1zaChsA_g1gb6kMkiU8jGXngfw0g@mail.gmail.com>
	<20190423060805.GD18826@localhost>
In-Reply-To: <20190423060805.GD18826@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 23 Apr 2019 13:30:37 +0200
Message-ID: <CALbNGRQ1Va=0Yn_s17mnr6YeL1V0oNFViFZzeAf1184=WtW1gg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] vlc: rework qt PACKAGECONFIG
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
X-List-Received-Date: Tue, 23 Apr 2019 11:30:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 23, 2019 at 8:08 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > Perhaps we should have qt5 as a distro feature instead?
> > Isn't that a different naming for the same thing not working properly
> > if you don't have meta-qt5 in layers?
>
> Isn't this a reason for moving vlc out of meta-openembedded?
> Or alternatively moving qt5 to meta-openembedded.
>
> > Andreas
>
> cu
> Adrian
This discussion turns into the same direction as seen before on other occasions:

My priority is building images where things work out of the box and it
seems this expectation is not common here. There are several default
configurations around reducing things down to death to save build time
and make yocto script happy. I disagree completely but won't discuss
further. So I will

* send V3 of this patch not enabling qt5 if meta-qt5 is in layers
* add a bbappend to my meta-mortsgna because that's what distro layers are for

Andreas

