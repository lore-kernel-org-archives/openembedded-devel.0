Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8F07FA18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:52:56 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x129so27853333qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 23:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VdPYCufZXT6tJ2D94O3MhOFnhsND3ypSJ6G6XVAbtVo=;
	b=OlrKrbXafqLsdGuM9HzL59oLwKS8/n+QUvPlkz3xrchtop57vKlRelRlddzKl5dnL+
	chgvSucXaG5Tso+2NMI2h6tuewTbOqHtJYGOtZBJ5boAJ62dxL/Ec5eBlyDOd8vQNady
	SdfEBm1QOMTzhPsfZLDmF8caPZlMD767bAJPxi8yzAsPxG8ozwVHZk/EmGqBs8hS0Nh/
	esgFZQIfnimucsyWYvci2TSnY5pPq3geDBrPjkGNIBnfahOLqcW2j7Qr/OH6PzL4PYED
	5cXRR99ODhKDT908OAl/4n+juXZKrAxnbF/EmSx+6wX8tR29Ac/5wMLqFoTyKbErnFe+
	1ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VdPYCufZXT6tJ2D94O3MhOFnhsND3ypSJ6G6XVAbtVo=;
	b=uDtahsaHPBVXRgaCRQ2Ypg+XAVv3h7G3u12Q6olWVJFV5YGbTYt4AeDOq3tDiGOTHC
	ei9Iik/TKpn97opU1t1q2xtg1BD0QvUta3K1zYNtWHnBk7kols5oNQojuqgkVb6doDgU
	iCmxDBR5ncbZcmx1yk+UKl3VxJEAhjI9fhLQxjBXQm0UJLEvHE9b9cVEUvR57ivfTg6Z
	CE/2ugbQGlz0DvDnO1WeilHMPrdeqydnJKK76g0mu70XCtdRC5MuDGkW1ql8wSDdF1Fl
	ZfmkWBG3JtIGy1jCbGs6iW0Ggw1JVs7up2pUrU6VyIib+CKJFeVAhWkgwEYRJCSCFZ8K
	GPLQ==
X-Gm-Message-State: APjAAAVFlXf5LPBGEpHyraiWiHhs8GBuInwh3dYWNalLBZBxAc37F/lr
	b9o0AQbUiMCY5ezma8zg14LM1oHF9QlNuowwuFUhsBPA
X-Google-Smtp-Source: APXvYqwknE9CjM6h65CA2bbjEkAdxScQTsGFl/utwil3Ofk+ozggHafKJQF+nN24C3Cs4viEsToy7x9ePPJ4oYmevaY=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr56002724qkg.71.1577778777567; 
	Mon, 30 Dec 2019 23:52:57 -0800 (PST)
MIME-Version: 1.0
References: <20191231010652.3206534-1-raj.khem@gmail.com>
	<20191231010652.3206534-6-raj.khem@gmail.com>
	<20191231074037.GC934@localhost>
In-Reply-To: <20191231074037.GC934@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Dec 2019 23:52:31 -0800
Message-ID: <CAMKF1sqiyNipQ3dKcNy2DMmj_3ANm2dkYFcj6FhoGmyfmqc1Og@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 7/8] upm: Disable -Wno-misleading-indentation with clang10+
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
X-List-Received-Date: Tue, 31 Dec 2019 07:52:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 30, 2019 at 11:40 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Dec 30, 2019 at 05:06:51PM -0800, Khem Raj wrote:
> >...
> > ++# clang-10 added  -Wmisleading-indentation as well, skipp it too
> > ++if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER "9")
> > ++  list (APPEND C_CXX_WARNING_FLAGS -Wno-misleading-indentation)
> > ++endif ()
> > ++
> > + # Warnings as errors?
> > + if (WERROR)
> > +   list (APPEND C_CXX_WARNING_FLAGS -Werror)
> >...
>
> Would disabling WERROR solve this and future similar problems?
>

Upstream has a similar patch to disable this warning on gcc, so its
better to follow what
they are doing.

> cu
> Adrian

