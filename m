Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9887E241
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 10:03:17 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id p24so12184678lfo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 03:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qqXCEwSkfp+b5SBuAiT52iVlSSe+tHrcWqOT5focbXQ=;
	b=GXSUlCGBuTxKc0T9xOS+MZTRdtFLmrtX3kg7CrBEB6zfHobmVGnNhfJPNLl15uDnv+
	KwKtCY1w5T01bXXGnYyb/3uUYJsPvKw+V+FNxw12uDJ1Guq67bIc+zZXvPvpmOOHkukV
	ADNo99GkFxeuZvSpzpKModuPYfHu2nvomW1f9Q9yTn6rbryiq2eSzJn6sDVUijsOvMfd
	n97wzuNdrlKa7lHKpnzeQAofjrUvQXrB+pvglzd00cHwKuPiV2MZ1JLqIDbvdBDLBcmy
	UsB2Q+aWWrHjCU0zi2hSLspGyav4wu4eeE7sH6wJkBeRFVBpNlLc8WwmywZlVP6wOLXV
	CqvA==
X-Gm-Message-State: APjAAAUsyykMvhcMiRlF0dZtGDPWxJlZMUC2/qpQaeS0mlI1AVu3Fp5Q
	vkvttMdgRUv5lu2+576IMnvf+A6P5ra8UrknJmocSaKfttQ=
X-Google-Smtp-Source: APXvYqxzlyyYY7W0pTB23QLpSv2JJ36oN0evCzbUVFMAHI9bs+r2YV/jwjASnFsVCPYcbsbx/6nbjS41G3q80JTIAiE=
X-Received: by 2002:a19:4:: with SMTP id 4mr12569560lfa.162.1561456997937;
	Tue, 25 Jun 2019 03:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190625075223.13585-1-ricardo@ribalda.com>
	<20190625075223.13585-3-ricardo@ribalda.com>
	<46a0e244-16f4-f014-bdd7-08ea31c32176@skidata.com>
In-Reply-To: <46a0e244-16f4-f014-bdd7-08ea31c32176@skidata.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Tue, 25 Jun 2019 12:03:00 +0200
Message-ID: <CAPybu_2YJ2a7FY6rziTsnzA6y-pC23hf4XLacCkaG+z1t4rh_w@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 02/23] openjd7: remove support for kerberos
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
X-List-Received-Date: Tue, 25 Jun 2019 10:03:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Tue, Jun 25, 2019 at 11:41 AM Richard Leitner
<richard.leitner@skidata.com> wrote:
>
> Hi Ricardo,
> thanks for the patches!
>
> On 25/06/2019 09:52, Ricardo Ribalda Delgado wrote:
> > It triggers a lot of dependencies, and it is no clear that
> > is needed.
>
> To be honest I don't know if it's needed or used by anybody, but would
> it be possible to create a PACKAGECONFIG for de-/selecting the
> system-kerberos?

Sure,

I am working at:
https://github.com/ribalda/meta-java/tree/v2

Do you prefer that I resend the patches after all the feedback is
fixed or you rather pull directly from there?

So far I have fix

- x11 native
-packageconfig for kerberos openjdk8 and openjdk7


>
> Furthermore if you send a v2 can you please fix the subject (openjd7 ->
> openjdk7)?
>
> Same goes for openjdk-8.
>
> Thanks & regards;Richard.L
>
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >   recipes-core/openjdk/openjdk-7-common.inc | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
> > index 794bf58..26e71ce 100644
> > --- a/recipes-core/openjdk/openjdk-7-common.inc
> > +++ b/recipes-core/openjdk/openjdk-7-common.inc
> > @@ -67,7 +67,7 @@ DEPENDS = " \
> >       jpeg libpng giflib \
> >       gtk+ glib-2.0 \
> >       cups fontconfig \
> > -    rhino krb5 \
> > +    rhino \
> >       libxt libxinerama libxrender libxtst libxi \
> >       freetype alsa-lib libffi \
> >       attr \
> > @@ -134,6 +134,7 @@ EXTRA_OECONF = " \
> >   EXTRA_OECONF += " \
> >       --disable-system-pcsc \
> >       --disable-system-sctp \
> > +    --disable-system-kerberos \
> >   "
> >
> >   do_configure_prepend() {
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda

