Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id B70697CAF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 17:03:42 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id r136so8066067iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 09:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jEKqrxLbNvhnnKXPWCuAhKaDo5WNQ2bZ+b8I8ghILbU=;
	b=P5aKCWj2ugpE7uQBdWwvEcZuIPw/J4KpsAu89LgqwjyURqRC//vTWlS+CeL0Saufpm
	h8jFraq1UCFG4uhYFI/aLIxbY095gIGPfOJja/S4iqH7uxL0WjUIzYqixE9uzd/tt4MI
	DXy143v486pZFsWq9ps5+UhhGcgOLCIvoJDjd+tuutBlxcTn9DumQpGf3TYnyF620BcL
	vxlYhYyln6PyGgg3FlRu4c+hcXy4QOIdqLlwhrHj+iGMIerNYwMeUMBYadNzrWnn7DZi
	GheV/dpL4LhS/CZDY5iZhXgyO2jjiralnwP4tYYVX0ZbFnD6kIJ3aEWmVZhvG3rKocyR
	hyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jEKqrxLbNvhnnKXPWCuAhKaDo5WNQ2bZ+b8I8ghILbU=;
	b=o6ehfURhLgzglwFI+MWU6sW62+GEXIHGWApHiW8TOktKaWXlmTkMEdSNrtF2HAxudF
	H5kaiqOM0KfFOxx8il764rqXIeOJP5DqdHbTd7k1NZw0eWPSWiR9bbmpWViAJTgw4zm2
	kdoRXgUAY7LbsqudpAsEmXHoJccaZYJH1gNCN7Hn2ZhVVzpfv1ueQNQz6Zc549j++cTQ
	SdgV0SDhROcaoAou9UTee6D6gH7S7oIg0yqE+RzzcfLOWrGH0mCc3Mm6SJHKwxUR/bQI
	a1Rs+5kzSCeYKpDxDW85Yy9VnpUMt3wubynZC/H47nKD4cWC4QxALLb6alESLWYam0+w
	yUDQ==
X-Gm-Message-State: AHQUAuaxXekmH8g2zdzmm1SVotV7dhtxmNlsTR7FdETZN/sg7eP+vtfj
	CmPONI50+GVVXmCkP1Km13EZPMTvx2EpZmadksrjr7RS
X-Google-Smtp-Source: AHgI3IY48Vcqb+IF8VhtUQjwCcybKVvcbiF7dvPECAPi7x+Ulz7tMy8klESfD5Viyx2xhiV597upNLsQuh/B2N6RobY=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr9699351ion.20.1551114223522; 
	Mon, 25 Feb 2019 09:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20190225140010.19025-1-otavio@ossystems.com.br>
	<CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
In-Reply-To: <CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Feb 2019 17:03:32 +0000
Message-ID: <CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' from `.egg-info/` directory
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
X-List-Received-Date: Mon, 25 Feb 2019 17:03:43 -0000
Content-Type: text/plain; charset="UTF-8"

The original patch doesn't explain what it's doing and is clearly
going to remove executable bits from directories, which clearly isn't
right.

I'd say remove it, and *then* if it breaks again fix properly.

Ross

On Mon, 25 Feb 2019 at 15:07, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Feb 25, 2019 at 6:00 AM Otavio Salvador <otavio@ossystems.com.br> wrote:
> >
> > The chmod was removing the executing bit from the directory and then
> > the native version was failing to build.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> >  meta-python/recipes-devtools/python/python-idna.inc | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
> > index 436b58606..519812ddc 100644
> > --- a/meta-python/recipes-devtools/python/python-idna.inc
> > +++ b/meta-python/recipes-devtools/python/python-idna.inc
> > @@ -16,7 +16,3 @@ do_compile_prepend() {
> >  }
> >
> >  BBCLASSEXTEND = "native nativesdk"
> > -
> > -do_install_append() {
> > -    chmod 664 -R ${D}${PYTHON_SITEPACKAGES_DIR}/*.egg-info/
> > -}
>
> this overturns a prior fix
> https://git.openembedded.org/meta-openembedded/commit/?id=79bb01985260800f80b393e73b387543f86f9e62
>
> I think it would be better to resolve the original issue before reverting
> it or maybe just appy this for target recipe alone
>
> > \ No newline at end of file
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

