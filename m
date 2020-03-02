Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 75F9B6062D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 11:25:47 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id r8so1127080qvs.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 03:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IpEN2FToe6jhwhFS54XXCdl9HTsByKfMmVLA72znuc0=;
	b=MHv9ALL9A5SwWSnoaCiFospk/G87ErIzyhyUdBSryIUkoq7vR0Mj7hzN0/UzHsrZEC
	TsXo01E6ixSj1lbc7kTl7+KYTQbhar11SnB10ei9KQd4Bqs/rwUXJlNfDXYQ5vnoZAC6
	rHfeNmdZZVkCRwsp56k22zIypxhIjFC/QM8ujHJ7fv21EkQhNBHGXHw9i7cFnyZuyxgV
	1EIfuIXQP4WK94b45VNX3hOBYPktjG0/T8FguFVTLPUBZh8wBilbn6dui911mKuZNkcn
	SV6q7w73+Nz5sZtMR5zlC7tH1++nlg+zH1FfL+6GfMsuhz7jWcywy2DNSKpUHRymEBov
	mR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IpEN2FToe6jhwhFS54XXCdl9HTsByKfMmVLA72znuc0=;
	b=nQCmMj8fIIRSZRvdFjwUj40oCjiDDPyHucmSCzDhrDoJ6mfQ1RafaGbm0uyEIr205b
	atiecdmn6GjRBSNnYXOZcmnPts+e0xZcz0dM2CIK8B+dXBgFq/a2bLWAookXnkAaLZQ6
	f8MJqcGN/Zv+njKD+W/U/A01QPcSOfc7U4B6w7391g64nOBjPI6rDEWPsRuV7ZEx1SFR
	Bq/V/s5Th246nQ5zpJGspB+aaxp13IzOQA8n2kZUx5NqQiSnSdN+aypHQVJYLVmLr7P8
	npI1/Em1LiVZpG3MT0ygXPqEjqg2m1ksyiW53lNZB0EPjM/rzPZyJIrlMFmikKR6ylH1
	XC/g==
X-Gm-Message-State: ANhLgQ38E4RpiYpShtOQj2bdFb4WC/XKivig2+crKGN+XyTW2SNpfIf0
	EHGvRqlw7/i7s6eXe9+HxJtVtWK+pg8m9Q==
X-Google-Smtp-Source: ADFU+vtY+T7HKCS2y05qLKwrW8xaB4vSUngckawM+zhgrR6bI3mTjcFaeGBOCxJufBPJMs9lSJdw/g==
X-Received: by 2002:a0c:f892:: with SMTP id u18mr4020960qvn.159.1583148347632; 
	Mon, 02 Mar 2020 03:25:47 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com.
	[209.85.222.173]) by smtp.gmail.com with ESMTPSA id
	j17sm10319785qth.27.2020.03.02.03.25.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Mar 2020 03:25:46 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f173.google.com with SMTP id m9so9584224qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 03:25:46 -0800 (PST)
X-Received: by 2002:a37:551:: with SMTP id 78mr15169392qkf.46.1583148346461;
	Mon, 02 Mar 2020 03:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
In-Reply-To: <CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
Date: Mon, 2 Mar 2020 08:25:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
Message-ID: <CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Mon, 02 Mar 2020 11:25:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2020 at 4:37 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> niedz., 1 mar 2020 o 14:43 Otavio Salvador
> <otavio.salvador@ossystems.com.br> napisa=C5=82(a):
> This single class surely doesn't justify a new layer but I have a
> bunch of other stuff lined up for upstreaming if this is accepted.
> This is thematically separate from most of the recipes in meta-oe too.

So please give us an idea of what are your plans, so we can understand
it better.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

