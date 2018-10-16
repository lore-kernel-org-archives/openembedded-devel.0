Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id C891460064
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 13:47:06 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id q41-v6so25670508qtq.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 06:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3C6VUq5WiFiKlNw6Tmy1p66BJh3/WeBfyRa0PGfrhTA=;
	b=Wse0cP9Lm3SurOqf4B8DoDbIo4cYyk5pGMkSK/9Pq9r2IZFZJZNG7nT5uW8JdIiKUE
	ch4MxAtLrPrU60wP0wsypFAejkfYuKvgImobfc5rML04ZJw6px8iTHB1qwGizPKjXabL
	tmJECwR9LluvF5GsKiEddFkiyyIZoNkhdXMbbqlVkDKrRPec0QTz7vC2+qemkj24AhBo
	DqNFndgE6X0vuLchkq9nVOZONEM6kOJ23NoMxVuGCAyT5wK45vKOC9VoNNVZfePiBKzI
	CVUfFnIHxTUWwoczNWL7mvzpBE3kGD5CGgbBp6zFyu7tu8P53t8iV7JGJzRjQzNWvCQF
	0DMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3C6VUq5WiFiKlNw6Tmy1p66BJh3/WeBfyRa0PGfrhTA=;
	b=TAhDMaUJR/4JCZwqupEcc+dN2u8ICYC423CP3wGsnl7U45BcwRH1ZfeDpq/FOE5Lda
	jwwsfON5XPMOqtLE012E10GZYRFj6NS/h01S8h78zJYHwuK9JuMSLhwrZKYnnaJ5yxio
	scuumIOs17lqZiYocGKWQb031ItTAIuE4PnTDKK7y+a+yAbOcUTmXo3Oz+bBQlpLgvpl
	nZGk1b5h9tXm+aJnpaPXRxcm1EdWvUo/j19Mh9lj/HW+hb6VSswp80FZNv+ywT3u8mfa
	0w7ja9FWA2hbNq9jdSe8GWb+CMZKdpCCV9oTOR+OsREVA5O73BhUXCCdl7ZMTWe231dD
	HZUw==
X-Gm-Message-State: ABuFfohhyVMO2YYt6eVXfbi+ck43ysBao7gLrMoo0BJdS2yTUayOC3Q+
	/aQKmrrUCnpXBPzUA5x+VVaF+3Pg9UMnN6JsF+M=
X-Google-Smtp-Source: ACcGV63lQOh2B4BZSNoFbjXsfTCLukvZoAlulMc6Pz9mxEjStvvhpoDWul+zzWP9GCuyBW+dpL7g1Yyxx7YeD/YFgzE=
X-Received: by 2002:aed:3eac:: with SMTP id
	n41-v6mr20274440qtf.196.1539697627237; 
	Tue, 16 Oct 2018 06:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <1539664828-29601-1-git-send-email-ankit.tarot@gmail.com>
	<CAJTo0Lba-jQYe5W99ZA3zLCqNQiFeRhM7m8zipRTCon5cKA4sw@mail.gmail.com>
	<CAM_RqkOR+WeyxbrGm5FEThYOELNABzcWt6KTmj-A+JyZ1hvYxA@mail.gmail.com>
In-Reply-To: <CAM_RqkOR+WeyxbrGm5FEThYOELNABzcWt6KTmj-A+JyZ1hvYxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 06:46:41 -0700
Message-ID: <CAMKF1socKGKNmOROX0-isBt47hj+z1r7YyKxt+TKYDs0XZe=ZQ@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Tue, 16 Oct 2018 13:47:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 5:37 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Hi Ross
> On Tue, Oct 16, 2018 at 5:01 PM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > On Tue, 16 Oct 2018 at 05:43, Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > > +do_install () {
> > > +       install -d ${D}${includedir}/CL/
> > > +       install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
> > > +}
> >
> > -D to install is 'create directories' which you've already done in the
> > previous line, so that can be removed.
> >
> > If you're removing -D then a more idiomatic form would be:
> >
> > +       install -d ${D}${includedir}/CL/
> > +       install -m 0644 ${S}/CL/*.h ${D}${includedir}/CL
> Opps, missed -D.
> Cool. I will use your suggestion.

you just need single line there in do_install

 install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h


>
> Thanks, Ankit
> >
> > Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

