Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0085E77D81
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 20:58:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q132so6498594wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 13:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ser5Y176Ld2Pn44B6gxJm2UBkrjS6sc3vsPzZ7se2Mo=;
	b=CmkJ86pxTS6lK+POVbGjbmXFQHK8BFTc4JxFxgT6bbJzggqN8pzGmPt1D3IPtZMolg
	er/NNpr0dEm2R6J8qZtH1oJlnuwkN5WeR6pBX2J9rJj1J8yXQSmCwpFzAkAOTOX4o6Xu
	ZxJCHX+0YJbboXzRRWZCB/ao8iSpsAdz1lBrodH+SCqa2E1+FmxI4NHSyVFmzOd8BWPK
	uUvNU8Vr273lb6t2B+NS/X8zyjFTUOr6Zc8JgrRVMH8qs/dN4hI6SD3yn2X+RnBFjehe
	ThFZsZWkqA8SiznlLdq+98/dr2r95vG8a7Hi5RbwgM85c60XQ2H4OF+S4eMGWDPN63Dl
	YcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ser5Y176Ld2Pn44B6gxJm2UBkrjS6sc3vsPzZ7se2Mo=;
	b=qUGT2ZtaUrPC4hCukgw1tE0Mti8rEPi75drfofQQ2arp7tIo5Kc52GlLbZRmFGqlaZ
	OStqQtIHi7MgE6GtZ+k2kTI2F1MSXXu1LLIqQnKHC3Zj5OQOpdbzagKfnUTp3BSY08xI
	Dp9aWMguHP5ZKnI+1WuKOIH+iiC53IyvFDhswmaobHO9ZC9qZqRo/qG/7aRw2XCS86pO
	kylNFNfMBPirIeMZagb96UU7dKlKGdiLC2JKAqus2Nmc0R8dFoNhvV5hA/ThAub28C+9
	xZeNUmyEEh6wFOgkNvEVjI/DRUhizwWlXDYtRwJKIX582XaQ6oZiSdxFz39YV9KWURTD
	o8KQ==
X-Gm-Message-State: AMCzsaUV+bubhiLcTABK3ebbZRFo8Hn49KlcML0HDRlA0an6AEfrq5HH
	Gk/iWvN0507MzIU6+dHKQAJ3IfICd4wIciR/fKQ=
X-Google-Smtp-Source: ABhQp+Td5jIAy/ZXk8IvUbY0bXuTWnsNJO56ZWmmUpPb+KKO3rWjn7RzQMFkgx+m3t4CraZNPrL6FQ0hRHOCDx0/MAY=
X-Received: by 10.28.175.1 with SMTP id y1mr1778512wme.50.1508187526918; Mon,
	16 Oct 2017 13:58:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Mon, 16 Oct 2017 13:58:46 -0700 (PDT)
In-Reply-To: <795c3189-db80-f81d-ce03-48bf93bed653@gmail.com>
References: <20171016164336.150658-1-mark.hatle@windriver.com>
	<20171016181421.GW9221@denix.org>
	<795c3189-db80-f81d-ce03-48bf93bed653@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2017 22:58:46 +0200
Message-ID: <CA+chaQeg+ehWRaaoOpoSQC9V6RARAGcEbh_Qf-d7bD6fvXB_-Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hostapd: fix WPA2 key replay security bug
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
X-List-Received-Date: Mon, 16 Oct 2017 20:58:46 -0000
Content-Type: text/plain; charset="UTF-8"

it's already in master and rocko now

On Mon, Oct 16, 2017 at 10:57 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 10/16/2017 11:14 AM, Denys Dmytriyenko wrote:
> > Can we also prioritize backporting this to older releases as well - pyro,
> This should apply directly to pyro as its the same version.
> I will wait for this to land in master.
>
> > morty?
> They may apply to morty  as it is version 2.5 and this against 2.6.
> >
> > Armin, Martin,
> >
> > Do you need separate patches submitted? Please let me know if you need
> help.
> pyro no, don't know about morty.
>
> - armin
> >
> > Thanks!
> >
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

