Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9145177E24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 23:30:47 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r190so32372443wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 16:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DSKHt9bcM8ZBAnu91X+DwYH5aMIGY4iLLwAYJiEhrNo=;
	b=NlofFIVxFhjJaOJsEEwDKp0/GhFNXspZSz/PJX7pu7h9ZDSeCtKjSz5urwFiJXsZZi
	4qryuTPfhPN3Y8/Ddu/LigP0vXAHN49oWLP4rA9Yy5BoONY8P31XpYeo2tbovZxQdh1l
	rVCn3dxAaaEP01+jreLV68XG5Lw5DagNJOXAOthK6I1ypFLhAYB/gKRQPljvCY7/Iyuh
	L1zXtFXJgXIx6Sr6lJxr70+wu3Pi9l0AKR2HJr9wghk3yWNNiWW5w4grBCxVJHvwORsz
	KNCNVH+AbTthJhbtLLjnaHpanMFYX+zH3uBdp/jMwXPZ2aWhSrW5ygj4l97szQKsGs9Y
	negg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DSKHt9bcM8ZBAnu91X+DwYH5aMIGY4iLLwAYJiEhrNo=;
	b=OxWQE/OX+QKhWBoSZ2eiNGFDoje13cRoAYxiCqCWuBUnUdq3IsNFTfqAWJXpQbKR/Y
	u9PeKrjfxOFnogyI+Dn17+FiYZtuF9UKy4z406CdMqayieh7MoE6fPcZscgsiwNCowkR
	SkcFThgmM6eq1xgNDaYo22PW06l/qQg/mpbiJb0yYPA5k4dvmNhd15tmGTpzLZp9B26w
	CqmCT5NBOP2UYtzahXuv9Jlngiyza5ww2TUzbyEwC1o+iILgkLIQzPNRiR/SHiDoqHLs
	bjCx7VINosbGVSrBU942eFrV9kaPQnYsusckf4pB9zAgtKWIvT8QFsk/k9ZAhwtt+4PG
	3rjA==
X-Gm-Message-State: AN3rC/5nNhResbfW2gRJwdHaJ7zN9wYQTRGmb4HXuxEb+o9Lx0kDFAbv
	dY5QmbavUB6deABOMsDEs4aumO+Pqw==
X-Received: by 10.80.149.181 with SMTP id w50mr6388757eda.178.1493335848364;
	Thu, 27 Apr 2017 16:30:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Thu, 27 Apr 2017 16:30:17 -0700 (PDT)
In-Reply-To: <0efff3a1-304d-750e-1675-b31c108c09f9@ettus.com>
References: <20170427211948.12255-1-andrej.rode@ettus.com>
	<20170427211948.12255-2-andrej.rode@ettus.com>
	<CAMKF1sosx80ehDcFOKdt88GDRTbW3i577y-zxFdZ4V4OuQkjYQ@mail.gmail.com>
	<0efff3a1-304d-750e-1675-b31c108c09f9@ettus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2017 16:30:17 -0700
Message-ID: <CAMKF1spEZK88v6JAsctQbX0niMUtNWnY2rs7khdPh3v2J76faA@mail.gmail.com>
To: Andrej Rode <andrej.rode@ettus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v3 2/2] python-mprpc: add new recipe
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
X-List-Received-Date: Thu, 27 Apr 2017 23:30:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 27, 2017 at 4:08 PM, Andrej Rode <andrej.rode@ettus.com> wrote:
> Hi,
>
>> I think you could just do SRC_URI += and remove patch=1 and pnum=1
>> they are defaults.
>>
>
> yeah, that would be better, but as Martin pointed out all my pending patches
> are already merged.
> Sorry for resending and not checking if they are already merged.
> I was looking at patchwork, but somewhat I missed that everything is already
> in-tree.

thats fine. Send a follow-up

>
> Cheers,
> Andrej
>

