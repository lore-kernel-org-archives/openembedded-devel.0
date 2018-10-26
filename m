Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0260079C64
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 14:01:11 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 20-v6so1086233oip.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vh5Iy/C7Ig60h8/jpCjAqKTo/ySFaByA93govaMfbNc=;
	b=mDB1vwf9s06TDU+DjWb5UejqT6tRJx0L37EYNH90Mcb2jXDqO84R8M6b1/EhD5Uqyt
	w0xe5SyZd3nUEU74GclRdUQ+xvfwnSNxbNHNdyC9guenYWE8YtMaB5oJrisSYtQxozlY
	OcJGT/vZRAzD1A+I4SyY3IlhTI+rm63iibAejyUg57Owltfo/cs+RbAcbjZph4zAyJ8i
	BH5HRTrBrZ4RGwG5IkLgmnC2MmOJsew9WXb2JhzbMCLCxPF1JN66FpoLZdn3DQ0vdMA9
	expQDW47TkpqjSr4ZAWJKOr/jqPk7RPFzKUUGFqNN2/TGLWt6eDCYpahCmiOA9MlaHqB
	Zgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vh5Iy/C7Ig60h8/jpCjAqKTo/ySFaByA93govaMfbNc=;
	b=Piv4BVPC7odzhLU39upQgLl/Ygpu5ZENEKWUc4LDU56/zgxWP1DziLetHEFjBV2TO0
	w35Hr9Om0e9RtlmocH1XiM0c3KisWjHST+xUoZ9ZmKIrcmziEilU+ncxN0LuJvB7C70v
	5kNn96YGMNZbWIA2idHXVAwGiumxdPpGg+FqGVBzcn4TrcKn41Aiv/OTeyUbjqLrsOBg
	rWd6sikCuepUdQmTkmWj/wYOaMl82hK6Cq8rZvrhC2d7TXPsFs0w+LrMB/Jm8W2yLM/y
	F4OrkFAx6ylW9EF0USYM8a1sZYSGNwoYgEhZoVyk3Zlj5Bo2blTAQ3eiz5B43RnRRKmt
	H/Bg==
X-Gm-Message-State: AGRZ1gKLPWu7WArLz2WVD8iK/7/cHctdaqVIo6IES9EOQZpK/e+6nKbJ
	7g1ii+KR0llEt3gNrKJeksOnHqAAj5QQGcuLgkY=
X-Google-Smtp-Source: AJdET5dxI6SoedurV2Qp/ZBgR2mKR/nzPmVTG8yHt29lCppY8Gtt/a8BceqpkchPLs2TLVj11BIBVeQ5pYdUbGjyVLU=
X-Received: by 2002:aca:2b0a:: with SMTP id i10-v6mr2233065oik.7.1540562472896;
	Fri, 26 Oct 2018 07:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
	<20181026104857.32142-7-schnitzeltony@gmail.com>
	<CAMKF1sqbZuypVK=YE9r5fb1_4gHkZhz8w1pyc3+rNhvV9mW8MQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqbZuypVK=YE9r5fb1_4gHkZhz8w1pyc3+rNhvV9mW8MQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 26 Oct 2018 16:01:00 +0200
Message-ID: <CALbNGRS96819wmfQ9EeLuuqJ1mwcQkLfEXwUVq09X5PD_cveiw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 7/8] networkmanager: upgrade 1.10.10 -> 1.14.4
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
X-List-Received-Date: Fri, 26 Oct 2018 14:01:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2018 at 2:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Oct 26, 2018 at 11:50 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > * License checksum: copyright year changed
> > * packageconfig glib: with this version (udev-)glib support hase to be =
enabled
> >   explicitly. Split this out to meta-gnome where network-manager-applet=
 lives.
> > * packageconfig netconfig: This was nonsense: netconfig is a SUSE tool =
[1]
> >   which is not found in layer index. The error was detected now because
> >   configuration checks for presence of netconfig.
> > * --disable-ifnet and --disable-ifcfg-suse are gone
> > * muse patches were aligned but have no resources to test them
> typo ^^^^
LOL: I've spent too many hours on music projects as muse, musescore...

Will send V2

Andreas

