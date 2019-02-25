Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96EDE7C8DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 19:06:17 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id y140so6006905qkb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qCZugwzwZPc2WFoqoTQc4R/AC66Y6OpMuR1Q+7eZPgw=;
	b=Z1hJFlPvrtMFYqw3BEEMHBITTXUBbBcPdf+65G+bIGAW/ELsx4dlZ+lEsXqen+4FZ1
	repzr/DY1CVPmZfRmQitn0YhJU153L9fJb9frPC8B3KDM4yNClfdqlfF6ojcOZUgM12o
	3ZXBLEy0Mt/kFoMj3dnYPHxiVx3etNB2h1mt0HpiOaD9zzaxG2syLHDk4ZENJpqeLK72
	+uPIOPROe2Wqn6jlTAA47gosCg3X7Bzd4VFjFLOWumAGkdwO25LO0e6LeBr8ibOnn/B7
	lOeAytEl8OU24WpjBjh/z9K7dnRtTOBbDtsiVjczixjzsKwjM0OZKD2ruBYC+7JIyO/+
	ozDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qCZugwzwZPc2WFoqoTQc4R/AC66Y6OpMuR1Q+7eZPgw=;
	b=UtG6X1qGq4tqs9yyG4YoYS2qfk9jbgQMKraXHPHQSJ6gXJ46wF9pdadj+aUCfru9sf
	/SB2hSj1l5Li/FmZcnnnQUn4djTBoG5OGKp4SyuwsJ7a0UOCh4g86tUUCgCeA7Tr4vCX
	nMOjjQQz8qTS4f/nr7K5ZD5fzk52WS6pEPT3XRKpvcva04Wyx7IIPtYg1mE9a/sCg9WB
	6yzo72EgauUPmwH+mjxhoCBMU5rxKJD1TryCAsxt2bfZgXxd5aCWVSFj3biiGGHLQIWV
	ynp+t2dh+mR6W3kpDWmwmsT744vAmL9wfZtASVA18GLObmzuF4lnILwGeIEh8yQRIMSc
	IzQQ==
X-Gm-Message-State: AHQUAubCf1VWqJU7nmnZMsOuRxqEZaJPFdehkD6YGaYTgg0Ox3EBz4wr
	ajp7VoJiBevWM3bAtY1akuTIVQSPJUxY6PYrJhk=
X-Google-Smtp-Source: AHgI3IZNO/3N7L4HahBiAG7B5aHONspXpKE/sZ+OOfhGSUGdw8CAExi+xmhxKehXCh2aUdA/vB/7l+2f+7Lry1jcf54=
X-Received: by 2002:a37:a7ca:: with SMTP id
	q193mr14213750qke.102.1551121578453; 
	Mon, 25 Feb 2019 11:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20190225140010.19025-1-otavio@ossystems.com.br>
	<CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
	<CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
	<CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
In-Reply-To: <CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2019 11:05:52 -0800
Message-ID: <CAMKF1sqbAFbXdeJTL=gtJU4QzdPwdwEW5R01gpnUx4OhB_YtjQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Maxime Borges <maxime.borges@strataggem.com>
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
X-List-Received-Date: Mon, 25 Feb 2019 19:06:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 10:38 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Mon, Feb 25, 2019 at 2:03 PM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > The original patch doesn't explain what it's doing and is clearly
> > going to remove executable bits from directories, which clearly isn't
> > right.
> >
> > I'd say remove it, and *then* if it breaks again fix properly.
>
> I am with Ross here. It is a really ugly patch and if need, we need a
> comment on the code and a proper reason to add it back.
>

+Maxime for information on the original patch

