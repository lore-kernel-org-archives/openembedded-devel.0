Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id F099360B3D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 21:15:20 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c16so9267815ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 13:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tVFYQ2ie8Kwx03hdTwDmptqtHlkLTGw1VEf36P4v43Q=;
	b=pKlvBex53zR/OmNLTqtJLgnPO4PKovexE4lXEMUCFm0NTgTnPuopOXZglOUTtlGhkd
	HhBKYsI8hhjsPnwIsUWvFsOhwD7T///yclcnOzplkhwTCX1i9Y9702Nk1fqLCJSfcOk7
	rLDxWoHq/Xex0xoxLRz/loOhTjCC5o//KSGSQ70GEF9oX/iEv9HacD8BACJj5ZR5GhIn
	tXNUY8p36C8JSF9Vo1WxAdBGkriQn31IFzkomVHDkREoI1go1kgzTWmt73fRCcIcYtQ/
	JlbWXGbLobPA6O8EYQI7oRJ3mWSpSYC3WaT5QpSCADHAgUR8FNz/+Ne5kE7tJxSKK5b7
	12ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tVFYQ2ie8Kwx03hdTwDmptqtHlkLTGw1VEf36P4v43Q=;
	b=ZYDEbHhgiuBQydHVt9ZtFOFFzH/gr/2y9ZO74wCadiTWKHdylNuE0q//JZXti/JWaF
	Fz79p8Q+emz2DqBax1MNOW9YpOnfOERNWOcHWvLmiHBY4VHpqSPyJL/QChTqyy8oLxHB
	lS4ougmxfm1zHgME2AaLGsLyHh/heFlIzzgYyO6Mk+7FHZHb5YV7te2nqd4XNPwExfRm
	XATSGMci5liEDwKdyEFkCZjn/nPBqN1QgTYMa0H7sWwyczyrXXq9ruEWSP26XznUY7y1
	hLH/LGC7jxsdgKPs4i6wzcLoSXQ+mZ8YBMn1ovQkgaT6bT2nffgj7xriJb+bo4SjZHSl
	FE8g==
X-Gm-Message-State: APjAAAVLmWlTIJ7w5KR1B2RUhCH4TEFh0zL/5MIm9J5tBhAlv1vE7I8E
	hlYyFsMeE/WXTXkRbvD9/dzn5NOf4wXTCTQ6s4kz8z8F
X-Google-Smtp-Source: APXvYqyIQM45bnEUh3tPoitcRnpyj14iTnjQz8pthYwXdq4vzzIj6oTiN6DCnZ1SoumBI8MvhNbKRZ/ixVm0tUwACsQ=
X-Received: by 2002:a02:cdcb:: with SMTP id m11mr11883741jap.125.1581369321963;
	Mon, 10 Feb 2020 13:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20200201163703.4264-1-schnitzeltony@gmail.com>
	<20200201163703.4264-2-schnitzeltony@gmail.com>
	<9f2e4677-9acd-f0d7-2eda-140b954ae58f@gmail.com>
	<CAMKF1soH7ofWsnKaT2o76VQgASxVVd+vWOSDSYnZjHS8Ott3sQ@mail.gmail.com>
In-Reply-To: <CAMKF1soH7ofWsnKaT2o76VQgASxVVd+vWOSDSYnZjHS8Ott3sQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 10 Feb 2020 22:15:10 +0100
Message-ID: <CALbNGRT=UrWpkaGGdDrvSV+Z4vy5snr04d_5cn=dL9eARDLcdw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/4] mozjs: port build to python3
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
X-List-Received-Date: Mon, 10 Feb 2020 21:15:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 9:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Andreas
>
> I am seeing failure on OE builders like below
>
> TypeError: a bytes-like object is required, not 'str'
>
> detailed log
>
> http://errors.yoctoproject.org/Errors/Details/390559/
>
>
Yeah I've seen this kind of error dozens of times.

From the first glance I think it is gold which makes the difference.
Hope to get it reproduced and fixed soon and come back

BTW / off-topic: I sent similar patch for qtwebkit. Is that part of your builds?

Andreas

