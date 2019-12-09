Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 41EB07FC97
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 16:30:42 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id b15so13242925ila.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 08:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sLm45BkIPXtw/eWjn2BDyXhlxKPYYyCJUX0ViaFshQI=;
	b=MDCz9v5kLmHrsZ7SeIPbzLxZFGeiOuH1ed0O8W3czJVgGQYRqaijEIl1DP7MORniT6
	9GRsIDF+wzF7EhkX9YiLCv0VN1R4BFHtnYCXIYPhnMQLlAH6/g81tdS4vpPk4rpn2IR6
	5URMuTj251LxExMZEdEUWPCeHl5QLxLfiNtwL092Q7L0CcNZTbYnK5JErYjcBZhnTfz3
	GTrTQ0GA0E564xxP4UfPBH3bLz8AQw4qqZiK2ufIAxaI31GpwoQmsnpZmIf0klJnLWSl
	BQ0AXaBn/SVelLSzDbkqFN5yhmL1ua6BKTI+hpK/eD+i/UIl6ejqJv/7XnKeYdhZM2xR
	nL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sLm45BkIPXtw/eWjn2BDyXhlxKPYYyCJUX0ViaFshQI=;
	b=Nprr/NwSa3AioM5uNDi9rZCWYu/LlLW+1slpno1JvyD0H9xPXx+z7BThzjLEaMBIQh
	p0u0bq+3KJp+NwbIdcpDEeXgZTNWbMi2avwicxByjfi8BMrVwBiILOBU6q+uwtXJt7lC
	zS5SU6z8gX2YAep2KrXNJCx5XHZxSbRILYcke4ZGfX9ueSXZXl4GcV4+FZ6tyL/TGVe8
	rXrymGE4qVyVEDUqdbGG/EgV5CLkyalAz39EnTAEJaEtNOHTnGIVJz6BXUT8wRyUsaZa
	3udiAF8nEUARFJB6/GKFxcqBm3HVFnhzSgs59FZ6X0rv6sLcVi+xclp6SwLbEEJPEAYx
	VGHQ==
X-Gm-Message-State: APjAAAXMUZM++poOrjTcQyGr0kEbEAJk+gNQvRty/Ym7M+d1W+9suRom
	2jA8sCEPSPehW+Gd0vvsRGMDfHQdOfgNpVDlhMehDw==
X-Google-Smtp-Source: APXvYqyQ8fHmkGwaBvPKItTndLlCFdnmemcMK5tCleSAlkH+/YA+bwJok2YZF7ico7U5seV+8HyyPstuLmgKYIPWUpA=
X-Received: by 2002:a92:1e0a:: with SMTP id e10mr15475127ile.40.1575909043138; 
	Mon, 09 Dec 2019 08:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20191209144601.21938-1-brgl@bgdev.pl>
	<c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
	<20191209151451.GC5701@localhost>
	<e2b8239f-8d8e-c200-c072-eaa69c819f7e@denx.de>
	<CAMRc=McHkSoWOMnJbUA-kCiMynHqtQq5a_OYeAX=5JqCpNqQBw@mail.gmail.com>
	<290068ca-aabc-a871-da6b-a23ab84544b6@denx.de>
In-Reply-To: <290068ca-aabc-a871-da6b-a23ab84544b6@denx.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Dec 2019 17:30:32 +0100
Message-ID: <CAMRc=MeOnPh0s8S9fV8hPB24Ku42jMFQhLvE3wYJMQgxOXDJwQ@mail.gmail.com>
To: Stefano Babic <sbabic@denx.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] librsync: new package
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
X-List-Received-Date: Mon, 09 Dec 2019 16:30:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 9 gru 2019 o 17:23 Stefano Babic <sbabic@denx.de> napisa=C5=82(a):
>
> On 09/12/19 16:33, Bartosz Golaszewski wrote:
> > pon., 9 gru 2019 o 16:22 Stefano Babic <sbabic@denx.de> napisa=C5=82(a)=
:
> >>
> >> On 09/12/19 16:14, Adrian Bunk wrote:
> >>> On Mon, Dec 09, 2019 at 03:53:33PM +0100, Stefano Babic wrote:
> >>>> ...
> >>>> Don't you have any depends from zlib / bzip ? cmake tests it, if you=
 do
> >>>> not add it, build will be fine but without support.
> >>>> ...
> >>>
> >>> Is it also working for you?
> >>> https://github.com/librsync/librsync/blob/master/CMakeLists.txt#L53-L=
57
> >>> https://github.com/librsync/librsync/issues/8
> >>
> >> Oh, good catch, I was not aware of it. I guess not, because I saw the
> >> dependencies when I wrote the recipe, but I *never* set ENABLE_COMPRES=
SION..
> >>
> >
> > Is this really something that needs to be provided by rdiff? We can
> > just pipe the output to a compressor of your choice.
>
> Yes, I realized that it is not required by librsync - I already compress
> the output of rdiff to generate the delta, no need to integrate it.
> Sorry for noise.
>
> What about to put the binary "rdiff" into a separate "bin" package ? I
> have rescue system where footprint is an issue, and rdiff is not
> required on target.
>

But this is what I did in my patch.

Bart

> Regards,
> Stefano
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

