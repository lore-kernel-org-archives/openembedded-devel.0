Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 54CCA6E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 20:47:47 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u144so7983496wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 12:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Z5W2VPVlAYE23wssyv/1w0RkidrLJcOO3RgzsRyG0Zo=;
	b=fqn1hdhZe/MwWvdojumdcGSfkvKfXJn8f4y6ksX0Dm2GmplvdKCvbVT2v/Ta8BXKMg
	JcajM2n2QOZ1jFuWVCt13x95M+kLB9hK6w4JA7AeV1CRQdaKHAq1z86BwKpPZZaxXnuH
	Wd8DDTKf2XAQhOG05PTvrKgflwSgfP1eM3n/4SpF30+Uvp2Z16ewn6JZMzMZPYml+3WR
	G79BaYePU52rjMZbabBTZtO/CYxkdAhRRfKrKoqm+sF/FhWY/noJvOQ1spzwtummJu8N
	5fcOkEiK4zuhgcf3CSgHTJLPkOnJTghrH7nLcsFYneyoa/o1FzFQNAJybiLN5yuQpHmY
	Ft8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Z5W2VPVlAYE23wssyv/1w0RkidrLJcOO3RgzsRyG0Zo=;
	b=kg/M//UgQJe97bNUZMh/Qm1j3uG+Q09p1exMGDotwjeYnujMALd11iJ8jPERX3Ll5K
	gure9T1XGpfTTvNgK7vN425onanfYHMn75CkgmiS0k0BVvT/EcCWWNhupC71irMNQ00M
	xyO3htsQHdmlY/rNnW/Jozep4ARWGTbteLAPU7OwtWNnirP6m1Nae64T7hunaTPfD6EY
	ehErKkMC85TQWzIsIKtdT+MSiQu1dNdrw0yXu4CrvYh9zuzgG/xYmz9vK7mhXNbJXoyZ
	Z93mcXX4tl4pFpo/VQc8BXYkwOlxzAoX50EvctsYvKXa7hOAZAcjPTb2CAvj2soyZEm4
	7csw==
X-Gm-Message-State: AKaTC03hpxBoyTmvPkL0UQjmTTDk+MI0zBRlpZfRJHTpDd2Kfl11dZn+Co+Sjj+eqNX1AgbLDydzHY6QA1aLAg==
X-Received: by 10.28.39.199 with SMTP id n190mr104180wmn.124.1479847668097;
	Tue, 22 Nov 2016 12:47:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Tue, 22 Nov 2016 12:47:47 -0800 (PST)
In-Reply-To: <CAAPZna3Gw-FmHrZe-5pSD7Hsp=W-UntZ4PiOr=+aOLWfWsGXsQ@mail.gmail.com>
References: <1475714017-9205-1-git-send-email-akuster808@gmail.com>
	<20161122165203.GC3348@jama>
	<CAAPZna3Gw-FmHrZe-5pSD7Hsp=W-UntZ4PiOr=+aOLWfWsGXsQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 Nov 2016 21:47:47 +0100
Message-ID: <CA+chaQe5NfNJH102agkbQvX60b9prMa=SgVA8d7zUe50P1L5Sg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.2.1
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
X-List-Received-Date: Tue, 22 Nov 2016 20:47:47 -0000
Content-Type: text/plain; charset=UTF-8

Thanks for another quick fix!

On Tue, Nov 22, 2016 at 7:06 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> Hi Martin,
>
> I fixed this issue in libpcap recipe and I'll send a patch to oe-core.
>
>
> On Tue, Nov 22, 2016 at 2:52 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > On Wed, Oct 05, 2016 at 05:33:37PM -0700, Armin Kuster wrote:
> > > Restore PE
> > >
> > > includes 2 security fixes:
> > > wnpa-sec-2016-57. NCP dissector crash. Fixed in 2.2.1.
> > > wnpa-sec-2016-56. Bluetooth L2CAP dissector crash. Fixed in 2.2.1.
> > >
> > > see https://www.wireshark.org/docs/relnotes/wireshark-2.2.1.html
> >
> > It didn't last building for very long, now it seems to be broken by
> > libpcap upgrade in oe-core:
> >
> > http://errors.yoctoproject.org/Errors/Details/104702/
> >
> > >
> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > ---
> > >  .../wireshark/{wireshark_2.2.0.bb => wireshark_2.2.1.bb}
>  |
> > 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >  rename meta-networking/recipes-support/wireshark/{wireshark_2.2.0.bb
> > => wireshark_2.2.1.bb} (93%)
> > >
> > > diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.
> > 2.0.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > > similarity index 93%
> > > rename from meta-networking/recipes-support/wireshark/wireshark_2.
> 2.0.bb
> > > rename to meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > > index dca3be6..a5fb7f6 100644
> > > --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> > > +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> > > @@ -8,8 +8,9 @@ DEPENDS = "pcre expat glib-2.0 sbc"
> > >
> > >  SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.
> tar.bz2
> > "
> > >
> > > -SRC_URI[md5sum] = "c7de0997f74934f25b456846cf75cb81"
> > > -SRC_URI[sha256sum] = "a6847e741efcba6cb9d92d464d4219
> > 917bee3ad0b8f5b0f80d4388ad2f3f1104"
> > > +PE = "1"
> > > +SRC_URI[md5sum] = "49a1023a69ac108ca089d750eee50e37"
> > > +SRC_URI[sha256sum] = "900e22af04c8b35e0d02a25a360ab1
> > fb7cfe5ac18fc48a9afd75a7103e569149"
> > >
> > >  inherit autotools pkgconfig perlnative
> > >
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

