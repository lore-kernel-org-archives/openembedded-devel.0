Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id D79626026C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 07:37:25 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id o18so4510986ilg.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2020 23:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nbGkaAxDkmRdauJfNAwOTdLPCQ4T63EN/stmtYQ7yXU=;
	b=Wu+ea9yipqYbVrD9HJzWlZ3FjjU1jRAu8PxxL3bY+A+DuPxqdz3D72jdH651qpoJlc
	nzE/iMQh58vgO9uHLDWhsyLAhpSf8b5owWHb6n8ZvKAWBRiOVOcNP6R9WhHeNeGR4+74
	hG3AKps42eRflt6mb4cbV3f5AzCqW+yBS72ZDlVX2In+/s1sZaBjUnd5ln1A75ObaCXf
	kfFjYNzmO5Erj8rgKAiLaNWFrMBscctvrVaN6o1MIfKg1ZR1C8tW9mrCv9HAEcL1R0uc
	5OVZ+U3H3eT957qw0fjcgtk4ona91cyWI4bpDGguaXo+DwnexuAvPQcIOaF9pQkguNiV
	zY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nbGkaAxDkmRdauJfNAwOTdLPCQ4T63EN/stmtYQ7yXU=;
	b=e80ewdyK3blEcM+0T0SSZrb2txoHe4z4PVVXtmMUPxtZRkM7vkN56BqtBCksnJOrrB
	ucVMMfjJ40pbP1ZIGllLEe/OJYdhERYOnjbjY1PDHbZVXga9RZXFH5yno6Gl7W3XacxR
	3RzOh3mCEiN72NjmY4g/67wT6nGDP9+F3Kz5ZZSIK8jqNZI1IGzGZsUxTVEv2IGPJubl
	s4j3n4rxTJQUt4vNtXOQtAKjfvfRqO0gA7b4sL9rT1XVVNSt5rsrraiA/ggzHHMUsG5U
	nqxLvtR9mPVcLMXowyj/HD0cFUdUposAz3K7gKBc11hzNb19ghTMlwxJ9uwXOMdibo40
	k+Dw==
X-Gm-Message-State: APjAAAWj2pNQVT8yFR+bkODaxAJZW6Uw2LshB7F3nMfGC0NOmbnbc+xq
	PQSoFQ8u1kdP3TRPK5uSrJOaGzkx3Cb/FnmmRkLf9A==
X-Google-Smtp-Source: APXvYqy9gwZRRlUiM4UWN8UC042eartHuQz0sFZU5mWiFTAkRkfY7yYZqganSooSELFEbb7yMn+se1yeJobI7XjMlQo=
X-Received: by 2002:a92:8117:: with SMTP id e23mr12729458ild.220.1583134646655;
	Sun, 01 Mar 2020 23:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
In-Reply-To: <CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Mar 2020 08:37:15 +0100
Message-ID: <CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Mon, 02 Mar 2020 07:37:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 1 mar 2020 o 14:43 Otavio Salvador
<otavio.salvador@ossystems.com.br> napisa=C5=82(a):
>
> Hello,
>
> On Fri, Feb 28, 2020 at 12:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> ...
> > Over-The-Air updates are a crucial part of IoT systems based on linux.
> > There are several OTA update frameworks available and many offer some
> > sort of support in yocto (e.g. meta-mender, meta-rauc). There are certa=
in
> > operations that are common to all of them such as: generating binary
> > delta patches, system recovery, creating provisioning images etc.
> >
> > This patch proposes to add a new layer in meta-openembedded dedicated t=
o
> > OTA. As the first functionality it adds a bbclass for generating binary
> > delta images using two popular algorithms - vcdiff and rsync.
> >
> > Such images can then be easily packaged in update artifacts for differe=
nt
> > OTA frameworks.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I see the value of this, as we are also doing OTA update framework
> development, however I wonder if it is worth a new layer for this. For
> now, I'd say to put it inside meta-oe directly.
>

This single class surely doesn't justify a new layer but I have a
bunch of other stuff lined up for upstreaming if this is accepted.
This is thematically separate from most of the recipes in meta-oe too.

Bartosz

