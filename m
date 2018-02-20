Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id AAFB778771
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 18:00:21 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id z3so8897688uae.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MObDl9Vx2pyvnxLfk4bs6mHvpA0iopUmDRmNFYKHXn4=;
	b=U4crBbX+4YZ2SQTJBJ3IKQh/dGkzlnDYi5dik3mplBkA4HuUZMpU91QXn18QdFiyo2
	bYjhkkgK+5wgI4RzHKjRKGvl6RFlKmHTDjZufj3CkGhYKvxWW1GM4ljyuNyhPR7PaS4/
	GUZGKoOEuEI5cmWB/oD0T9iO133LckJCw/UBYCulDw3ahA78l4y7h4IfUwr3H+i55zrf
	rHo1iOhuvTJX7hNsOMv8TyCmFTFvA9WB30NRehPNSZPdJX+wljS1GJEs/cLyDAYfOe7U
	3+pQzx8T/eao8PrZ+DRMczRw4v4g4lPjyveXpmLJvjGjgHTwrZ+8XfpNjBbIk25rQRZB
	2bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MObDl9Vx2pyvnxLfk4bs6mHvpA0iopUmDRmNFYKHXn4=;
	b=Aas6EAL61/o4nMXAsSXUIVXfogDBNx7Ww8IZKB03cC8ohuvVSv3BEaMlsR8TwiyXuC
	JTFmchlPOrNDepHVYRs2jkd6lKpqE3ZGGMYavwBEysk1XX6GoqEEhvHBKflsD60Qazyn
	L68cgXtwvLj+aLz0oRltZZamFhGT9PQeguJxSqNTXSBp/rifp2Dxa0f72gynzW5es5cK
	XRZ9wv1S3ciYybqMoXjtFKCCtdz3IJ/pP70rvu6pf0vOzkKM3BWQaTjjF2kDkBTTVV6g
	ue+oIdIosthl0hbK8ht1rUaePz6KnfGoHHcPdjT7ofAWlCS/p9pVV8vK7GkymS5X6teM
	MJlA==
X-Gm-Message-State: APf1xPCKPsTBhlceoCDX7uHjsSPCgvo36CgTjRqtkhbz52fF8HNaIecM
	sNDb3wmkFxhFs4AUb0hjugSlC+8mZulNIUNYg+g=
X-Google-Smtp-Source: AH8x227bp62Y5CP23Ra5AegDzMNwxSKKU2D7rpM4ScfmMaigYbVkghgj6J/HCUtkEhGGrTn+h4VZTF7a0+hfLACFPnc=
X-Received: by 10.176.82.75 with SMTP id j11mr408548uaa.86.1519149622463; Tue,
	20 Feb 2018 10:00:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.168.136 with HTTP; Tue, 20 Feb 2018 10:00:22 -0800 (PST)
In-Reply-To: <1519148811.24236.321.camel@linuxfoundation.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 20 Feb 2018 10:00:22 -0800
Message-ID: <CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 18:00:21 -0000
Content-Type: text/plain; charset="UTF-8"

The recent improvements to the Auto Upgrade Helper have made maintenance of
meta-perl less effort and therefore you have seen an uptick in my updates
to recipes. I also plan to mass-add ptest to all perl module recipes
"sometime soon", which will further simplify my upgrade workflow and add to
the confidence of said recipes. My upgrade workflow touches all recipes in
oe-core, meta-oe and meta-perl that fit a lib*perl regex.

I will note, however, that we are revisiting meta-cpan and that may
ultimately be the preferred perl layer. If you really heavily on perl
modules, please comment on whether meta-cpan would fit your needs.

Derek and others have been doing a great job keeping meta-python up to
date. I mostly jump in when there are trickier failures that need more
concentrated effort. I would like to see increased testing (more packages
with ptest), but that is trickier with python recipes as there are many
more approaches to testing than there are in perl. I am happy with the
current efforts to keep recipes up to date as a priority. I would like to
see complete coverage of python3 for all recipes that are capable in
meta-python.

I am open to discussion about what direction we go. Individual layers that
are curated and built together by YP auto builders sounds like an
intriguing path. If this was coupled with increased ptest or testimage
usage, our confidence in layer quality would go up dramatically.

Cheers,

--Tim

