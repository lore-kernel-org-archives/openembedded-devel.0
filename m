Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 463637DCDE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 19:29:17 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c3so3863588iok.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 12:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cgre5kfBGZoD9e8iWMoqvfavdspKtzQB+qo5oJJFJ4w=;
	b=YqtDX3ULQVc8Hh/1o/YNQ859/zqmky66et2mx5hlTQk8kQjK30E/LVEFL0gpyaOqZ+
	6Npj9/qpHxJUnfZ4DUyXgIRjV9vPZHZZcMTtQRoZqFnwyhDTbHje84Kgwdi3Gxt6wSzz
	haFrV8scc7j52YZjx5re3RhvnVHIFETVQ2+8OmQ85vx7SS7yuyvhPJ8CaKUd90qPNlyx
	vw9P/PXJvr0rOaa4Bscw6L+YhlEFs9Y4BwfYMN93n3yZ9HVAK9t8OnObDfqu7GYFmwTs
	uRUK8B1UbJ1giE/y4jSMEieH1xe3CntKXWvwuX5SsQ/G8LZG4FSJ5YiPxm1O738tl1cc
	z77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cgre5kfBGZoD9e8iWMoqvfavdspKtzQB+qo5oJJFJ4w=;
	b=oixxqqkGKV6e39KVywtY3iVjIZ1bEbKtftrYueYRosHGevuik5Sp8nUjlVe4KgIZcd
	vBOSKFf9I6Y9i8L9HA6TAHyfCCZ1sSm+xzcD0JxX3FAcns3IYr1MGIjeLsqjjTpUkUg9
	wM/dSOGTl5NMJQVcazYkEvuN+Er7L8Eg1pb73rlYjuBJ14d/VCVd3HtRUd78gjImB3ev
	HywZ7j1LlfklQP1gmU7C8oai/z37FkOZ+ob6Qgv/Yek/PuEUoNn2SH3bFPrma5GxIoqB
	gj2iDYWqLIjShcs/YMcY5R4O1Pf0YW38LoSF88sMD455cE3kg+3yhuUQoYloSZhHfcmc
	3P3w==
X-Gm-Message-State: APjAAAVWl9E2aRFn0RR8aWqB+MqK4fpqrXYYPTDVbCAmoqfsaj+Mkjqw
	j5d7x7MGjAqHkN6DbC7ZJT9ZhHabwQnHDOmZfM0=
X-Google-Smtp-Source: APXvYqz1DEOROoUB96+fLTi/9Z714428vIUSH4mylXwdyke7nQy3GFe9jYQ1p5X4u6cKUd/nxveDTKgCE9HBHK93Ui0=
X-Received: by 2002:a6b:b745:: with SMTP id h66mr1252628iof.107.1556306958223; 
	Fri, 26 Apr 2019 12:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190411213317.20935-1-alistair.francis@wdc.com>
	<CAKmqyKPqaiZprZwD6nPxpuUEMm6jh4UgJfyPLh+-Fxcu7ZXOtg@mail.gmail.com>
In-Reply-To: <CAKmqyKPqaiZprZwD6nPxpuUEMm6jh4UgJfyPLh+-Fxcu7ZXOtg@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 26 Apr 2019 21:29:08 +0200
Message-ID: <CAB2nKc-oX=ATOgmDTswmsdEWaD3yxy-XBoT3-CTLsor4w1pQdQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>,
	Otavio Salvador <otavio.salvador@gmail.com>, 
	richard.leitner@skidata.com, henning@itconsulting-heinold.de, 
	"Maxin B. John" <maxin.john@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] layer.conf: Mark warrior as supported
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
X-List-Received-Date: Fri, 26 Apr 2019 19:29:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francis,

it's not that urgent Warrior is not released yet but just in case, I added
meta-java maintainers to current thread, If anyone can merge this patch ;)

Best regards,
Vincent

Le jeu. 25 avr. 2019 =C3=A0 20:27, Alistair Francis <alistair23@gmail.com> =
a
=C3=A9crit :

> On Thu, Apr 11, 2019 at 2:34 PM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> Ping!
>
> > ---
> >  conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index b03a608..90236be 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
> >  BBFILE_COLLECTIONS +=3D "meta-java"
> >  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-java =3D "10"
> > -LAYERSERIES_COMPAT_meta-java =3D "thud"
> > +LAYERSERIES_COMPAT_meta-java =3D "thud warrior"
> >
> >  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> >
> > --
> > 2.21.0
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

