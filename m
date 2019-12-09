Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 802187FC8B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:33:33 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z26so15176835iot.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 07:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AAffzjFWfTHwr5yNTCKLw272XPdhkBEtRuey1VAet+A=;
	b=RssxGDLGiAkD+Z6PQdUPmler0zPBi4NfAVPe/IXDF1ngtIbgk3k5jm/jkqUJB7T8SX
	9ifyuhOwzf8rABVwu6wX51zQu66P+U0kURLfLq3F5GRKa4XoQKbFyFIhrM6mFtaDVrCS
	3J5aIHpp6mUsig23G6qUvDBgdlxiySZheSpE37fsNXLdVjdRMvBYdwY/BNAnZt9Cs7Wb
	H0U2J4l6DVzk0ebw1uGRRamGaAXG1Z50tBby/aRIWLuF4itn3pRebQCWhj1Z44oQmSd5
	SbP73jsRHB82NKwnpyQoDzs9rpmetT9CB9T7UK4xNg5hVMpFWIc9o/kdu95LDVBDOQ51
	JGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AAffzjFWfTHwr5yNTCKLw272XPdhkBEtRuey1VAet+A=;
	b=X9xPc05D1yx71UjYkz7B0Swtbs2UvHqccbECDb4qs8Y6his9dWvjYEN/1RyP4FjG6R
	Z5Au6UXnJxxseLqgVz2wycmV0EJ07I51odBMCaxBojVP/I9sqI+Rz0e4VA9ht4HmUsgp
	9odWKy8r8Phqtej63kukYozcAQwgXCL1UpOj16vEmgVrgZPM1xA8Ij6Vh4QKr2KVoWP7
	SQbKvOKwcPRwGEE6kCBj5HIChgu91dc/VgHf/Sj0glmCMPmI4kihq644o7soGs5JxK52
	EA180peB1WVT0OwxJY2sZNzJGFjtVOq1JHyb0xQ2G9f1ljI0fcqjERd2BAylntCJXgwP
	+NLA==
X-Gm-Message-State: APjAAAUinuquKDDIzqi9UmgGOa5L3FUjTWYjoMarZEGB3EZ5qE7ao0FZ
	HmVynnMkxgA+Rx919kxgfWsSdAjYQs1MWAub4jTWLw==
X-Google-Smtp-Source: APXvYqyK06VK+P/B2WSS+ivevOl8QbNG+UkqWcwpufKjQKUx4IXRQuBH7NF+AQI28utscwHHUna9/P7PB/DHidauP+w=
X-Received: by 2002:a02:cca4:: with SMTP id t4mr26839238jap.57.1575905614444; 
	Mon, 09 Dec 2019 07:33:34 -0800 (PST)
MIME-Version: 1.0
References: <20191209144601.21938-1-brgl@bgdev.pl>
	<c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
	<20191209151451.GC5701@localhost>
	<e2b8239f-8d8e-c200-c072-eaa69c819f7e@denx.de>
In-Reply-To: <e2b8239f-8d8e-c200-c072-eaa69c819f7e@denx.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Dec 2019 16:33:23 +0100
Message-ID: <CAMRc=McHkSoWOMnJbUA-kCiMynHqtQq5a_OYeAX=5JqCpNqQBw@mail.gmail.com>
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
X-List-Received-Date: Mon, 09 Dec 2019 15:33:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 9 gru 2019 o 16:22 Stefano Babic <sbabic@denx.de> napisa=C5=82(a):
>
> On 09/12/19 16:14, Adrian Bunk wrote:
> > On Mon, Dec 09, 2019 at 03:53:33PM +0100, Stefano Babic wrote:
> >> ...
> >> Don't you have any depends from zlib / bzip ? cmake tests it, if you d=
o
> >> not add it, build will be fine but without support.
> >> ...
> >
> > Is it also working for you?
> > https://github.com/librsync/librsync/blob/master/CMakeLists.txt#L53-L57
> > https://github.com/librsync/librsync/issues/8
>
> Oh, good catch, I was not aware of it. I guess not, because I saw the
> dependencies when I wrote the recipe, but I *never* set ENABLE_COMPRESSIO=
N..
>

Is this really something that needs to be provided by rdiff? We can
just pipe the output to a compressor of your choice.

Bart

> Stefano
>
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

