Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9257161919
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 17:48:30 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i14so565241qtv.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 09:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=viTnh8lJucrN21xjh6DADM57HWUDLDjxvS7oSY1cjiQ=;
	b=FqHowPb2G5V4UUh8WEMU1GTItPS1Q0AymiR/lR7U4HN2OJNve9ph7JWaOSAjn5jw/9
	NAA5c1CuvWWWrq5MEPrNV4E8RZfUfFsaM+OYQ5BqSuouX/6sWTlbvgfOw4O4VCrnhV3f
	so05yRULKu+QUnTe//F/sgmmKhdpndA9TgvZzMcMqWJcCG4aCGzjvTlB9Hv/YA70OZ9J
	U1QRytTS0naag12j+yuc2zQuZta9ulHI2PWguBByy4HP7M/UOyak40C2DZ2zhrr0iin3
	0haXafYjxKmsJaFoiEOIffq2AMetAPnFSN2o6R0Tx0pNTz9JUcRppwii57HBLEj1JKNH
	zG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=viTnh8lJucrN21xjh6DADM57HWUDLDjxvS7oSY1cjiQ=;
	b=DWfs3zVbN08VnUHSbYeQQ3c5aXiR1IlafkjYtihkCQHoDEypjE8wxECEG5PwAG5gwE
	eSYhYN2zPf7zV6pmyuE0Go2jvtLpI6sqM9gNf9yZ+XANpGodfkkkJB+LUQkbGlhh81bo
	hVe6SVAVLoo3e9kQGkOHpUqFpjHxJ5w057JGf+QvIddruOwiaOHrnx0/O7WS729ziyoI
	VPWtyP/JH1BK4xy56GbIKBmm9aGijticfn2riSVXctBijEl06J9/JBkqq4wa/jqmUTOf
	PLrrCCA02o8wgd3wcFuURVpIduGmGjm1rWfXWtnGs34zKhbsKFH4Cj7H6kCCXFvEugVm
	lUVw==
X-Gm-Message-State: ANhLgQ2jnIX7HqQ7iX50wiYzpTMB4hb8xAWBCNaCb268c7I/nOESMmmF
	mikkuDriksMc9My/114u7iB5/WN2vSTpLQ==
X-Google-Smtp-Source: ADFU+vsLG6mt28++lMNSrCaIJjIbG6j88EIylZyRycRUCWsIZthXW1m/9BxXLJD0jTmjnhjsE6b17w==
X-Received: by 2002:ac8:6697:: with SMTP id d23mr805267qtp.235.1583171311001; 
	Mon, 02 Mar 2020 09:48:31 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com.
	[209.85.222.174]) by smtp.gmail.com with ESMTPSA id
	x16sm4224767qki.89.2020.03.02.09.48.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Mar 2020 09:48:30 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f174.google.com with SMTP id e16so511709qkl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 09:48:30 -0800 (PST)
X-Received: by 2002:ae9:e509:: with SMTP id w9mr442584qkf.26.1583171309887;
	Mon, 02 Mar 2020 09:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
Date: Mon, 2 Mar 2020 14:48:18 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoF5Eg9YQTSqJmRfeDSyr0a9CtxRoHiHEtZu_JL9ABVrg@mail.gmail.com>
Message-ID: <CAP9ODKoF5Eg9YQTSqJmRfeDSyr0a9CtxRoHiHEtZu_JL9ABVrg@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Mar 2020 17:48:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bartosz,

On Mon, Mar 2, 2020 at 2:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> pon., 2 mar 2020 o 12:25 Otavio Salvador
> <otavio.salvador@ossystems.com.br> napisa=C5=82(a):
> >
> > On Mon, Mar 2, 2020 at 4:37 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > niedz., 1 mar 2020 o 14:43 Otavio Salvador
> > > <otavio.salvador@ossystems.com.br> napisa=C5=82(a):
> Khem, Armin: any thoughts?

All this sounds great, I just don't see it fitting on meta-oe. I'd
like to propose we create an orga for it, on github, and host it
there.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

