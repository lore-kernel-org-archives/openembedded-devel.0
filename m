Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id C44D4798B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 07:06:39 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id j68-v6so6633834oib.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 00:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MLE4mCYeOHOGFhg1JU8UDuYNnnqXIPQYhClQgIyNkbQ=;
	b=VyVX8WUZruLaxMBxC8NDcFJLIjtrzJKG4ZmgLegaVhpR+wlwigcY5mfi/+mUKBnHgY
	kBKsaS3b8IuT6JDB0XX3GD3gXvAvpVQKM9vDOMXSmymq63eEQ700W2YbUsdX82ZkYFXa
	9zGjVIRQBCNQKzmDYhZhcXglu0OmEcZ3FGPmAFiAdqbjKrW/zJG7mTLmcdnryvhXprk3
	ovK2mzZY8lMkreoLArMexXZisYM+0zC3cC5U73yDCcJGlUWWkl8YXZDunWVvmuncGSd5
	A1t7pwSqW1r7zNs4c9Rc7XZdV2VSUCUjqtuGq5MSER6qGAzR4K1AG+PrknHcUgP15fQn
	q/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MLE4mCYeOHOGFhg1JU8UDuYNnnqXIPQYhClQgIyNkbQ=;
	b=bcr5AsC2RZfMZsaKkTWe6UgG4F5uOJi0ozhifh8Fu5mtBwUXf/a00WVwD3VUOtN2/w
	A1uJN9MzcElLt+klSsX6E85Yr5v4jiVSH3n8xV21O7NqCze2ftP/Ekos4Bq8aEPPJNFG
	qSem0Db+7a4hmChgg3vaFM3brHXRNh1MXNT2ysYJnnJaOCwsq9mmv2JmSiEyw/YJj97m
	zmWWBjjQeGPQTkgLY4KQXNrpXtkqz65JKJUERkANCcnXdciRgspGsTdid/5K3TJeCrZz
	yjlsjcbB8fRUxjNUtTAgBFrnIiT1i7Sh4DtYuvj1kDPW70DmfjM7Mp1eEy38GsIhXG5u
	5nNQ==
X-Gm-Message-State: ABuFfoj3ba2TAhfzNv5CCuH9xK1M98XeePdmR9gsnqrfHiDHuVCnMk5q
	jm8qFN7x/0nOMXsOk3spvZ9tklA6sIQatnqTmWs=
X-Google-Smtp-Source: ACcGV61devBHhz5A5zXWQ3e4BgFZuiWkDti8wCt4vMY3krDlGXEs46Pe8QB41Rx1rzqU3DpJbO+itERzlHgZhVdmpyg=
X-Received: by 2002:aca:6a48:: with SMTP id
	f69-v6mr2473196oic.279.1538636800691; 
	Thu, 04 Oct 2018 00:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
	<CAMKF1sotCFH3POn6S11GOdkuH2A886iKN=PGdPA_81c59TzwhA@mail.gmail.com>
	<CALbNGRR0v4Nm1O7J2RQC0-MqRVLZNpDHn1jDYVRedpttr3AY9w@mail.gmail.com>
	<ee935578-3dba-ac85-d207-9636e8916a6a@gmail.com>
In-Reply-To: <ee935578-3dba-ac85-d207-9636e8916a6a@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 4 Oct 2018 09:06:28 +0200
Message-ID: <CALbNGRS8m0j834nTdrsGrKJmWH-b8dxv4FmKQXJQdSsb_q2+9Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] libsdl-gfx: initial add 2.0.25
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
X-List-Received-Date: Thu, 04 Oct 2018 07:06:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 4, 2018 at 8:37 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>> +EXTRA_OECONF += " \
> >>> +    SDL_CONFIG=${STAGING_BINDIR_CROSS}/pkg-config sdl \
> >>
> >> is the intention to have SDL_CONFIG point to pkg-config here
> >>
> > I was under the impression it replaces sdl-config (sdl-config supports
> > for basic stuff as cflags and libs same arguments as pkg-config). Now
> > that you ask I checked and grepping did not show my why I should set
> > it (it is mentioned in the doc but...).
> > So I tested and it builds fine without setting SDL_CONFIG. So V2 is
> > near - thanks for the pointer.
>
> I was thinking it should be
>
> SDL_CONFIG="${STAGING_BINDIR_CROSS}/pkg-config sdl"
>
Sent V2: No need to set SDL_CONFIG - have tested that with master and
I grepped through the code and get the impression it is a leftover not
changing anything.

Andreas

