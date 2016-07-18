Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A07CB606D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 09:46:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x83so11774247wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 02:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eaK61bzd7j43BZ4+adXXoe18jPHHVaE5b5PyjTG0VV8=;
	b=f80F5yz8b5WHIGqbiQrZvKSnycFzfoY7fqnCgPdWXiSVc5ONKpmvhmnRrLFoNCodHC
	XkClzdbntlkKEZZk6Y1f3danw8+75OFtau1y+lpnlyNx0iUoNRuK1wyjuHGhKO+jYg5v
	IkV7EEPV1w09nnMbvEarzrK81xdtuETO0UP7s1/GU8PB7b4x6TMTuUSZzipqmmrFiO3B
	4DBejPKVLKcpmlg0IXOrHmDkFX85RfaYqIGYwPUdkL+8eqm9c/f4rcPa2NeRvauv6pVD
	DXoDgtRgemRLJJ3WOg8JfK+9O3/D1sGVO/CZiezc59icsfT24ThmO5r9NCe3Di4lzYLj
	nkJw==
X-Gm-Message-State: ALyK8tKGSrXYCbCupsINH9sY+5gH4OlvZhO9FicX3USCZabpkXxhFo2l/iLNIEDXW9PV8g==
X-Received: by 10.194.254.130 with SMTP id ai2mr309429wjd.112.1468835206127;
	Mon, 18 Jul 2016 02:46:46 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	12sm15651179wmj.19.2016.07.18.02.46.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Jul 2016 02:46:45 -0700 (PDT)
Message-ID: <1468835203.4658.12.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2016 10:46:43 +0100
In-Reply-To: <CAJ86T=XnuktZ1DB6_Cco+0NnjFOAaa6F4+=dCW8+Pw1t_Yo4nA@mail.gmail.com>
References: <1468828968-19388-1-git-send-email-git@andred.net>
	<1468828968-19388-2-git-send-email-git@andred.net>
	<CAMKF1spStNbUubBvO1DLq86wdHRVbGvOVB7LRUVa2be0Mdes3Q@mail.gmail.com>
	<CAJ86T=XnuktZ1DB6_Cco+0NnjFOAaa6F4+=dCW8+Pw1t_Yo4nA@mail.gmail.com>
X-Mailer: Evolution 3.20.4-1 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH v2 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Mon, 18 Jul 2016 09:46:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mo, 2016-07-18 at 01:37 -0700, Andre McCurdy wrote:
> On Mon, Jul 18, 2016 at 1:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > On Mon, Jul 18, 2016 at 1:03 AM <git@andred.net> wrote:
> > 
> > > 
> > > From: André Draszik <adraszik@tycoint.com>
> > > 
> > > c-ares doesn't build if the distro has enabled usage of the
> > > security_flags.inc file as it is picky about what is placed
> > > into CPPFLAGS and CFLAGS. It complains and errors out if any
> > > preprocessor options appear in CFLAGS.
> 
> Curl (on which c-ares's configure files seem to be based) used to have
> the same problem but was fixed upstream by:
> 
>  
> https://github.com/curl/curl/commit/5d3cbde72ece7d83c280492957a26e26ab4e5c
> ca

I must say I agree with c-ares' error here, and this really highlights a bug
in how OE handles the security flags. By convention, preprocessor flags
belong into CPPFLAGS, not CFLAGS.

The real solution hence should be to have OE place -D flags (including
${lcl_maybe_fortify} into CPPFLAGS, not CFLAGS in the first place.

But that'd be a change I am not in a position to test, as it would touch
everything. E.g. there might be build-environments that (silently) ignore
user-supplied CPPFLAGS completely (cmake being one of those [1]).

a.

[1]
https://gitlab.kitware.com/cmake/cmake/issues/12928
https://cmake.org/Bug/view.php?id=12928

