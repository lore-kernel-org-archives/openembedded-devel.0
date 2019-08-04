Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id A17DF7F37D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2019 15:29:13 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id y26so78688928qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2019 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/HRt8GaFduNXBMilLZch1aNGOhiaEIe+GON76W/hBT0=;
	b=W32egQNrbZdXiRWf87R51Sdi95XkiOTwTykCC/K/sMomBDDIlise2ltfuhuHNP1KKh
	9a0O8mQa22cfJoBKN+9vtFfkdLqtFcPTJqt6ruD/X0ZTIBjwWX8D/fbDSejAYQ490EYK
	ygHPcSk12MFolnmvZw+b5+0kkvpv31jCunQLNvMPNBr8qOGdx5Qr3tT9fEZghA5sbbdt
	i552exgNs3ceigfYCEbCASk21wl2ZMpRVkWf/v8R/6vQWAvPeKUk9fWg0N8lOCZRx6mX
	+MTXdTYqKNAG4YoZexs+XHDs1/oYij9x3GYVg7ajT4fAuxoNV8va8BKhiSvAQs6L1sQC
	Dwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/HRt8GaFduNXBMilLZch1aNGOhiaEIe+GON76W/hBT0=;
	b=jwfzqJ7tiDYPLn6B3SMNxwCs/LwhK9Hr+OygsY5ROtNrC9Rz1j+RnSYmCtBIbZfIw9
	ZmmYwlPbgYLNPlWnsyJBqZWu7+MsaD3gZm7nxTKvLXIDN5NMLf6mr5Z3bKYgEHV5P/yw
	vBgR9NIttaClOQL30v7YpL9mh7m62pll7IbguVkg3qsMNpKTQvp51hYPUJw465wJDoD+
	Xdd1NA2FtdZpppSVWygFEefesHWmjgi0c7QenbePYjHLpdXvPlleWe4PgMrrv0d5R9f2
	8699yxOCeFyG+TWVaTLFotWVTHwgSg1iOqKbjDb9Z1e9i4Rvj7hfkrNYjtXLtNZkyB1n
	IcBg==
X-Gm-Message-State: APjAAAVrLBRUowtXyAR3sOTYGInII+ZCiXVaeX5ntNGAMm0OOkYptDPJ
	upkq63L/C6rRxTXpUlrThg788Vaex8ZEnJJbn7U=
X-Google-Smtp-Source: APXvYqzPFRGIDuJtmPVsc/APUGUiHimgT/7gdQmiiZMUydzoTR56UzoCIvVgbJ6/iZxtd/ldVBvqlxv/iBxwQcz/P0k=
X-Received: by 2002:ac8:525a:: with SMTP id
	y26mr102968524qtn.378.1564932554224; 
	Sun, 04 Aug 2019 08:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190731064819.134342-1-kai.kang@windriver.com>
	<20190804090528.GA18199@localhost>
In-Reply-To: <20190804090528.GA18199@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Aug 2019 08:28:57 -0700
Message-ID: <CAMKF1soDbEkd88=3F7qPaZ+ABi8B9FmvttuS7V0Yz8gazgZvyg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poppler: toggle gobject-introspection support
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
X-List-Received-Date: Sun, 04 Aug 2019 15:29:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 4, 2019 at 2:05 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Khem, did you miss this patch due to openembedded-devel@ only being in
> the Cc or other reasons?
>

it probably did not show up on patchwork.

> Thanks
> Adrian
>
>
> On Wed, Jul 31, 2019 at 02:48:19AM -0400, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > It doesn't provide a way to enable or disable gobject-introspection
> > support for poppler. Toggle it respect to variable GI_DATA_ENABLED.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >  meta-oe/recipes-support/poppler/poppler_0.79.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> > index 068433475..b285eecd2 100644
> > --- a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> > +++ b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> > @@ -34,6 +34,7 @@ EXTRA_OECMAKE += " \
> >      -DBUILD_GTK_TESTS=OFF \
> >      -DENABLE_ZLIB=ON \
> >      -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH='${STAGING_INCDIR}' \
> > +    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_GOBJECT_INTROSPECTION=ON', '-DENABLE_GOBJECT_INTROSPECTION=OFF', d)} \
> >  "
> >
> >  do_configure_append() {
> > --
> > 2.20.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

