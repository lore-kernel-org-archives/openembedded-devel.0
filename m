Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id BF2C07FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 18:15:06 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id bx28so9362621edb.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Avq/PwdlhDOYH0sELuxRwlZ43VlS51MoJy9R/iGz3WA=;
	b=kNvloVLQjBPpRt+y3K0yx9drgefu5b1MpZvpvEk8iirRUBkHzboT2DaTUOKzNeeuec
	KGLilF2MieRN1WWTUB7yYJmbOYDS981/eH8Sp7H9fAMwg+Qyk8Ky6LKfw2l3QPjf3fBn
	Na1dBpD3XPjiDou0s+8C8INsWr8kn8LmTyzkSdfRO4pIoKXhllB1QW8TjjovqW6hm3kh
	c/nxQDi+bbVF4BNZHS8F8ZeEIgIrFP4hSXWgvFRuSgPeWfc/LM+A/p2bC0GjTS/F0P0H
	OLFEwboHqEmM3m+lsYP1FMLFt/KrTWvHnivQ3FaJ5ZBRAw8iAkTyr2yvSXrn+QRYFpi7
	gNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Avq/PwdlhDOYH0sELuxRwlZ43VlS51MoJy9R/iGz3WA=;
	b=Z7DrLzqpn5VBF0Zpi1+ZX+hTDT8fveN2DKOQQVRsSHM8h2c7O74gPCVx6hby3PwgaH
	m0mfseDecuxSHel08Wo0RBjBMDjnx8r1GypxNCDJKm7P9jQ2ARs8bPW7nwsDDdqXIf2V
	qMV1ITn2xd+eQznULAnmg5soKbbRJR2nWmWBw7f/yuWut2Ped5JYmc9+2Nbr+gGXY+qh
	Z3gJAbjVjSDwNsJUx9e2qF0PJptJ/Kiu0JWu4oX1F7OTqhta8NRq+yUPprR39wl02mee
	gxGjk3rx1QKlyb6r5g1hfBms5/NJzE0bZPVQXlIXBquIEoR9PeX+2UGwX7SRhhnGxfXf
	JhXQ==
X-Gm-Message-State: APjAAAXk/Gb4eclyHARFJjbF7X4eXmO9U8rW3C+wZ+V58/ZkCuF8UEpV
	rHt+SzwMIOCc8Eq0aLonXTrT04DZQ8+Mzflzh34=
X-Google-Smtp-Source: APXvYqxSs8HmDqdxSzCbG1ch24PvDckBMxwHBYaESn0wLiBC6lC8zZA8KH2gig5VAZo+cYqmNCTMiW0h5dsdOXYUqnI=
X-Received: by 2002:a17:906:a14:: with SMTP id
	w20mr18173397ejf.274.1578939307512; 
	Mon, 13 Jan 2020 10:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20200113170209.95601-1-alex.kanavin@gmail.com>
	<20200113170209.95601-3-alex.kanavin@gmail.com>
In-Reply-To: <20200113170209.95601-3-alex.kanavin@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Jan 2020 19:14:56 +0100
Message-ID: <CA+chaQec=MyVT6a7FkmKPG5izt5UydqhSXqv6-POKh558Y4etA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] sysprof: move from meta-oe to meta-gnome
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
X-List-Received-Date: Mon, 13 Jan 2020 18:15:07 -0000
Content-Type: text/plain; charset="UTF-8"

Why don't you add it to the right layer in the 1/3 change?

On Mon, Jan 13, 2020 at 6:03 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch  | 0
>  {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb  | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe =>
> meta-gnome}/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> (100%)
>  rename {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb
> (100%)
>
> diff --git
> a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> similarity index 100%
> rename from
> meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> rename to
> meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
> b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
> similarity index 100%
> rename from meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
> rename to meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

