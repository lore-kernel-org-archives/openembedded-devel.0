Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3417FA4C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 13:22:09 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id z10so5682697ilo.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R/olEno0naWk8l22zGc/6frG74VP7GnbugxquSKhiqA=;
	b=jvFVxZ08aQZWuvU2E/xtSKZ172Q9yiE2tNXlU05QzYZavUQJFNuKMPWk38t5eSwnaF
	+3plSDu7I/ZU61b3AOirmLWLILd4V6DGM2WJEzMlKqpf6MMoy1YhUjLa9Shj9ENaJ1RS
	AGZWV9wrU0hx8XG5NI7zRW3STNNPx1IIyLpooJxW0kWc0tIaAFasuI9LNhbF+OI3g4i5
	gc3UWkeHt4OmwYeebJdadtsKPA30YTv47CeWi+C/xjTIOzn+NfG3FYbBMFEJbihRxifS
	DeAmfaSANZa5+q+gGCezzHPI9sNYMickpT622HYMBCOlDNl0BDJq5/ieSWpyAiacRz+k
	nuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R/olEno0naWk8l22zGc/6frG74VP7GnbugxquSKhiqA=;
	b=Md4TlU/PkJeeFXoxQXi2f89Pit9uEr9NWl/0dCBe6eaYJsKjCAZzoTQlQ0w73TKHyU
	ttOT2PVbfRXr27U+aSuVo5e5DaczJfJRrzfDNruhKhwyiUoOd2hmRE10Y9EjaS6ioZZc
	q/h21oW5gnOzeh5N4pa63g7F5gfUgM022mHBqVqO9lFXBKrLpnqxAfbKdoVzLi55bZDV
	4E9TOoFM42Lii8kVMNcwQLSiuZ0V2F4PZEIYFC4uhrQuyRgTcjdiPFvWfUJ7BDqmvg7h
	nOgjBU3Wk9fUVFGMu25ozhv8KQeHBgqHDy/GszcWWiAiqDGYhGaJrkTFmtyP1U0I7FIz
	N09g==
X-Gm-Message-State: APjAAAU5rHIDTB4KU8PG8tsVhauMe3QWyYRSR/C2KNcjG4c1SBfyK6Xk
	D+PedIQukE61VJ+TQMCbrYnMxsT5AatjqWoRCDI=
X-Google-Smtp-Source: APXvYqzF+o3aQ963m2gmX13Q3HjFL+VzXjTkYwL4T3nVct+IkFEVsxCGql2G8oUAikDiHlHj6RqgZuJCoIfjC+66TDI=
X-Received: by 2002:a92:c04f:: with SMTP id o15mr5356516ilf.267.1572182530658; 
	Sun, 27 Oct 2019 06:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-2-schnitzeltony@gmail.com>
	<CAMKF1srE3x_69uh=YwVSoCH+MT8ZKQixedh02=Aq3JXikh3dtw@mail.gmail.com>
In-Reply-To: <CAMKF1srE3x_69uh=YwVSoCH+MT8ZKQixedh02=Aq3JXikh3dtw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 27 Oct 2019 14:21:59 +0100
Message-ID: <CALbNGRRT1Uhp+kioNT+dEkAfqBMGgmUSFvAOL-PN1AuUeb5uSQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] colord: initial add 1.4.4
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
X-List-Received-Date: Sun, 27 Oct 2019 13:22:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 26, 2019 at 8:15 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> OK a bit better, native seems to build but target one fails when
> building for non-systemd distros
> see https://errors.yoctoproject.org/Errors/Details/274721/
>
> > +PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=true, systemd"
^ Caused by typo here

sorry for wasting your time - V3 arrives soon

Andreas

