Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 62559747F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 01:16:48 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id r2-v6so21506884lff.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 18:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4F9uxdtcuJUk42nli03k+QCxmLQ5NdHgn78ZaO5uch0=;
	b=dPOEAmfiugB/FWN/WpbLQjuCzbuwaQ901Xz5lk4v6vI+4xUnWd7sGkb9prXaTsbgUG
	g0jABGutNRwYCIF4LT10WAaV/42XCUswAM133dLkmzmIB51QKB6edDUm6En4JsoYkkaz
	A+LGCTgOuqvSba6i1W1bEHMPrEj/Fv1E0RywZ3SC6Rt+QZD+khy6mWMmpEqS5f+faSLF
	1ux/yLELKTkjB2v/FTwmR1xotu7l6+w8IzL368+gPcrNEcdO1bc4fFs1r1MCfCPWh/ZQ
	wrCNr85oAod1DAGPBWjjv2L0LakuItwYvPddFzZtwwIQiqPBvyLeqRlTKoTbvnwgrBwX
	FwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4F9uxdtcuJUk42nli03k+QCxmLQ5NdHgn78ZaO5uch0=;
	b=Aufzc9gP+g9IwUSjyeaCM0B49/lCbNNF0Wt3Nor51VIP96Thz0qveooCfXZ9N55NzT
	BMii6I9g2Kz9iUN8w8Qt6HoGNdggpZYAr+//LMAEszXmZg6wWRaQp5VYmBUL+v4o3e2E
	Xk2TED5zZQ/oEjrwuxL1AWWBKniQyahtLbg2NAYko7jz7SVJZJniIDL3rEF9w0qa+uf0
	BGLEmbjgokdih0xkN0ojqrybYuHEzdM0SYdg1HjBH58Ym3YSyMUr9Okl0XShal2sxF/Z
	IwiGnYKIBkhPK5klkzodO3lzy3HrVL3QQrMJUatUvbrKpKDp/FNIrtMjnQJm4hDMGQTC
	4A0A==
X-Gm-Message-State: ALKqPwd4goloOhQ/QddmitYCp1oQ+a3gNmhqwS8OdY54MCjN6dgGXY6U
	Bbp6Gn3DUhNiu+Vi/bph8v/JXoOMh46Ogw7ENvk=
X-Google-Smtp-Source: AB8JxZq2ELmWRxNOewyFST3TVtufTg31chH7pBl2QEVTGU6jCLWuyqM9QERCt637NHBIraFE4JVsur+HWMne/cV+/+k=
X-Received: by 2002:a19:a70f:: with SMTP id
	q15-v6mr15590933lfe.39.1526865409534; 
	Sun, 20 May 2018 18:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb48:0:0:0:0:0 with HTTP; Sun, 20 May 2018 18:16:48
	-0700 (PDT)
In-Reply-To: <CAMKF1srEN6W4xNtmLevLG6hzpdJ60AnvEP31e+y3LBh8j0+UXQ@mail.gmail.com>
References: <20180520024130.11222-1-twoerner@gmail.com>
	<CAMKF1srEN6W4xNtmLevLG6hzpdJ60AnvEP31e+y3LBh8j0+UXQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 20 May 2018 21:16:48 -0400
Message-ID: <CAHUNapTM5xUinC=M=zhuCYSu-Ev3KPVavskWON=sqhOFO=4W2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master-next][PATCH] rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Mon, 21 May 2018 01:16:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 20, 2018 at 6:27 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Trevor
>
> On Sat, May 19, 2018 at 7:41 PM, Trevor Woerner <twoerner@gmail.com>
> wrote:
>
> > --- a/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
> > +++ b/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
> > @@ -74,7 +74,6 @@ FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
> >  FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
> >  FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
> >
> > -FILES_${PN}-dev += "${libdir}/cmake"
>
> fftw can be built using both autotools and cmake, for OE we use autotools
> therefore it does not inherit cmake, so please reinstate this change
> in next version of patch.
>


No problem; thanks for the review!

