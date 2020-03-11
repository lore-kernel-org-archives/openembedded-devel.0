Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 26E7861BB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 23:03:51 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id l17so1718688qvu.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 16:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aYmQ9vDU1SUhqk6ywoJbMbWZPXeyq2MecfNtXBMQiiY=;
	b=QsxWQDmFZa5TplNyltSeYhpnCC7g2g0L8vPBuInJ27A0Stf4EBr2nNOInVs6FeRbn3
	bYMDoKM7uHNnxKiSGV7Br4kefSVrZl+OiSdUDrHPUE6v69SJivmlM3537aksahC0B6l/
	ElnfBxlkFJi0dZBHXrBFTrepiF5rPOY+41txpeu2ezqTT5sv35Huii3cnQI5JRHFa9Dz
	PcKWVn8BMNTmCm27YbwnzdUeN4OoRee3JOdQiFAYIrc12+6ZNp96p0z898BXW8SxTKil
	cU2cVqF2hFe07z5W8EBMpgFOl78pEeQL0yLpvANBG/ucAg91vXuu69DtIPWPYBNRP7uP
	Rkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aYmQ9vDU1SUhqk6ywoJbMbWZPXeyq2MecfNtXBMQiiY=;
	b=UdDU+zPA1gfISCrsQIefwsYeX2qAOiQyjBgw3CdlJvGD8bdKKfYxhbcYmkHBs0bba9
	CjRQ6O/sQJSJse9Zv81YmamteyF6+ChmffXmm3L5bsXtGRJUe/kidtBDlDY7lN6mVbMI
	8sohbwIr72zJTtGfBkmgWuj2V4sMiUZ7SbSVUEnEHjP7V64sItIxD7R/YY8BiuFXjcNi
	EINvDtploBvNLRLBEgun6tO/B6sZGavkU6LYjp4aLrhRo5mugxjOkuZUgb0TPLO3AX0z
	AirHCdFaasyC14DYZmIRUyN5mMISC4bkD15noDszkypBIWOYLuQXKXshImPnYcF959aZ
	yV7w==
X-Gm-Message-State: ANhLgQ2aK0XnojXadg5cryRIle+oHU91D+U8u1V4mr75GDVnpBJObzVr
	1YKI3L7UGpMhi2xUGre7hGYChx5EFNIxBg==
X-Google-Smtp-Source: ADFU+vscm43JcMROs5bO+ctYx3IQoP9Hx5kePUYp9Q0/ofzYlNS8c6Fh3bwfl145BBJqIUUxbyUsKA==
X-Received: by 2002:ad4:588e:: with SMTP id dz14mr4986182qvb.103.1583967832342;
	Wed, 11 Mar 2020 16:03:52 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com.
	[209.85.222.174]) by smtp.gmail.com with ESMTPSA id
	y60sm2109969qtd.32.2020.03.11.16.03.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 16:03:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f174.google.com with SMTP id e16so3869814qkl.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 16:03:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2209:: with SMTP id
	m9mr4911624qkh.71.1583967830921; 
	Wed, 11 Mar 2020 16:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
	<dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
	<CAMRc=MevN3tAfBkLZuOiW0BVbOWkq_T_HiD6XTMwh5d32xrGeQ@mail.gmail.com>
	<CAMRc=MehBSu1RpPkzP=xiFqt3wpJrf4FhV889jcPxUHPnf0GLg@mail.gmail.com>
	<CAP71Wjz1n_Csm762xbsxUK-3i3OYm-rfh=9Ccf28USLgJjRiFQ@mail.gmail.com>
In-Reply-To: <CAP71Wjz1n_Csm762xbsxUK-3i3OYm-rfh=9Ccf28USLgJjRiFQ@mail.gmail.com>
Date: Wed, 11 Mar 2020 20:03:39 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrUcXcvrgWP1DpE=yDaoBcNSo=7fDd+y7jZZ9zcLQYuNQ@mail.gmail.com>
Message-ID: <CAP9ODKrUcXcvrgWP1DpE=yDaoBcNSo=7fDd+y7jZZ9zcLQYuNQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Wed, 11 Mar 2020 23:03:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 10:28 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Wed, Mar 11, 2020 at 9:04 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>> wt., 3 mar 2020 o 14:56 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82=
(a):
>> >
>> > If this is not something that should be part of meta-openembedded - is
>> > there any way to have it hosted at https://git.yoctoproject.org/cgit/
>> > as an official yocto layer? I'm sorry if this is a dumb question, I
>> > don't know exactly what the policy is for that.
>> gentle ping on this. What is the procedure of hosting a layer at OE?
>
> it depends what you mean here.
>
> 1. Hosting on git.yoctoproject.org is mostly for layers supported by YP m=
embership, these layers are under the responsibility of the YP TSC [1]
> 2. Hosting on git.openembedded.org is under the responsibility of the OE =
TSC [2]
>
> We recently started an initiative using gitlab, to host layers: https://g=
itlab.com/openembedded/community, though it's not picking up much for now. =
But that would be another option, Paul B. or myself could give you access
>
> You might want to host the layer on your own (github, gitlab or anywhere =
else). I understand why you think that hosting on yoctoproject.org would ma=
ke it 'more' official, however hundreds of layers are 'self hosted' and it'=
s usually not a big concern.
>
> In any case you should register your layer in the OE layer index.
>
>
> [1] https://wiki.yoctoproject.org/wiki/TSC
> [2] https://www.openembedded.org/wiki/TSC

I've been preferring github over gitlab but either works. I also think
we ought to put it under one of those platforms and rely on those for
future.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

