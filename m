Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 44F886C1CA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:50:30 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id q19so3708288qvy.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lXz9xdXGeb6ZEwbOd02NTvmFgxbokISudAgi1lEtRFQ=;
	b=qQLXo54VfoCBEncvJZ5DXby3rVERKUPIgauzKnb9rK+MjNA9S0rjWi5jkoX14E/1rq
	JuN9iJqRGRaPUOZZY13nwRhcNgj4Pr/Bx9tHJcocXPFw6KHzTPGTJhqOcxTuHak6MQKK
	G/NXVE1plZmOB0UgOIBbP99UyjRjtkrV4qwCwdFI8/2pAiErAUxt3cRkelfIxiaJzGN6
	qQdnt1x6mYqT7dWEJDXM9TXGchv7y1+u50IXxfaT/3x0ecaxQdjGDc2DK3tzOYXAOpvS
	JQHZusZyI0otVa9Vf62O12iKTYV0Br8pcRELoLP9GF/9VaMDUjxiSA46rmGejpUJIc4V
	TgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lXz9xdXGeb6ZEwbOd02NTvmFgxbokISudAgi1lEtRFQ=;
	b=Dp63qQiRfWCMZkHa48jaTRDhPK+KRpeDCiorztz8PkZ/gZIsUK4mkCFgWnD36kAxXf
	LRKcu7bRKCFUHgLbX2gkZMCsCi166Mh79Caf1YhdqWrh2Ow1iONTQIOvByXGlZUaRdvG
	07ejwZaY26odfYFHc55s3TJlx+8yZJwMiACSl0OkccDAmGU8Y42wddumdZGWfp/kkws5
	DDIOr/lFHb+V9edNs5AvIybfUY+g4QkTrgloGMiuSPWzPHY31eUTWAEnBt8E6ysO8k0U
	bcoF+A4XtDeEPN3M32K2CAwz37sVMqvPMpPDR9fT/4jK/YNpoKvPgwWxygWy4J6nzYBr
	HFkw==
X-Gm-Message-State: APjAAAVBW5qvHlAJOS4o5i6IQCSrC9jcnBE22yYYPrBl8qUNxqcAGqSQ
	hTWAgPVUht0QX0+jTCHGeYX9noqSx1+8L7C2u5A=
X-Google-Smtp-Source: APXvYqzowIQiwKUswi2aGlQ2q6tXiyvvVx0MY9Z7qfRVMhN128BBnSspaKrPPLLKMa2cQN7QiioHpKDhXjdUZgW5jgE=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr516730qvm.206.1575226230670; 
	Sun, 01 Dec 2019 10:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
	<20191201173501.GJ4526@localhost>
In-Reply-To: <20191201173501.GJ4526@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Dec 2019 10:50:04 -0800
Message-ID: <CAMKF1sryEDaqQVfLR_JazM7npNoHdKt-xX3N6858W6BdfaE-_Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/7] libgnomekbd: cleanup DEPENDS inherit gsettings / remove unused config
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
X-List-Received-Date: Sun, 01 Dec 2019 18:50:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 1, 2019 at 9:35 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sun, Dec 01, 2019 at 05:51:17PM +0100, Andreas M=C3=BCller wrote:
> > * DEPENDS: ... gtk+3 pulls glib-2.0
> >...
> > -DEPENDS =3D "gconf glib-2.0 libxklavier gtk+3 intltool-native"
> > +DEPENDS =3D "gtk+3 libxklavier"
> >...
>
> It is better to have explicit dependencies on everything used directly
> by the recipe.
>

I would tend to agree. Since it's hard to track that once say gtk+3 drops
it for a different reason, this recipe will break


> gtk+3 -> glib-2.0 is not a dependency that is likely to go away in the
> future, but in general relying on indirect dependencies tends to break
> frequently.
>
> cu
> Adrian
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

