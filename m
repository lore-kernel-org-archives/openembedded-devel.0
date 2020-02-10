Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 559D360926
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 21:17:57 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id dc14so3926339qvb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4VCUzZmoi3r7lQj+yjaxJ8fhfFYyHFbOIxB0l0cJyqc=;
	b=B/s18LYlX0e/WBokD5AoVr8EcVwX//egRwaDMLQ9IElPPBWUAQeE2V+RnjXvcVDeS6
	ZEyPVRaTNeE0e7KuA+KCbO2q8NXAfvWk3ruXQs8VEp7Oc54qZd2u02XlPExECk2bnTY9
	+UytXH+jZ1N86QoCK8KKLh7YdtFqKgnlVwtIfNZvvnHf3fuOTOxYO01c1pgmvVmUlYDP
	e1LNpU3iK8tyPMr4K+RC1s0PW/iqYsCtSbFv1OUBtTmryOZiy7jlF4+HqvdP8jnlems3
	RV2QfPdJIgwOOLlifgjrvIKMyxQUiEKM74Cl7oCE1c0Qt/sN2KMzQvvjB2iXs5flA7HG
	8cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4VCUzZmoi3r7lQj+yjaxJ8fhfFYyHFbOIxB0l0cJyqc=;
	b=e8jn0S8Ss3fZWyE2e0E2q8FDthFgrgDsnLH493xx9n97iOSkZPNwg5QmzH+W66+cYd
	tO4fDBiXeCPUaGcpjxJm2OvwrR9RBHZgBk+QlFOgFlK7kmcRVEuhUoiN+IV9lGYDu+la
	CIHnIEnw86/wVLEi8vNCLZMnqHQHFaaj/8/Ck9vVnKNFkNuyucqFDDlyY1jYLJeyTsGI
	ztsRCVZDRT6bu62oNN8CzKEN4C/FtGEV2JUdzOvSiE/aFmGf3mH7Mjnwqr78Qp9TYl/d
	fYHiZq2Li5i/5tDaZw48/X8V2SDqWvXg/BEEso40h40jDsG08SjxzlCI5cypNl+Zw0F5
	wgaQ==
X-Gm-Message-State: APjAAAWF3A+MLzetnoqtkOcxTbw1/u76GX44y9a1XM+0iTRXPwRG0Ikm
	PTBq/JmTfQC/lODQ2r0n6QhycgPDWb4wNbuNolg=
X-Google-Smtp-Source: APXvYqxDH9tLsBaXWXYpH8c6z+VX1Z93YezC69abwpqbB3/9kIRpsic8C7tOfYcTVBzEERdYt9j/e95DH9MU9rPMHys=
X-Received: by 2002:ad4:4d94:: with SMTP id cv20mr11310960qvb.99.1581369477958;
	Mon, 10 Feb 2020 13:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20200201163703.4264-1-schnitzeltony@gmail.com>
	<20200201163703.4264-2-schnitzeltony@gmail.com>
	<9f2e4677-9acd-f0d7-2eda-140b954ae58f@gmail.com>
	<CAMKF1soH7ofWsnKaT2o76VQgASxVVd+vWOSDSYnZjHS8Ott3sQ@mail.gmail.com>
	<CALbNGRT=UrWpkaGGdDrvSV+Z4vy5snr04d_5cn=dL9eARDLcdw@mail.gmail.com>
In-Reply-To: <CALbNGRT=UrWpkaGGdDrvSV+Z4vy5snr04d_5cn=dL9eARDLcdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2020 13:17:31 -0800
Message-ID: <CAMKF1sos4GO87TD-sSZKYP11faP6=p9XdzUpMgFemuswFxtuag@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Mon, 10 Feb 2020 21:17:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 1:15 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Feb 10, 2020 at 9:11 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Andreas
> >
> > I am seeing failure on OE builders like below
> >
> > TypeError: a bytes-like object is required, not 'str'
> >
> > detailed log
> >
> > http://errors.yoctoproject.org/Errors/Details/390559/
> >
> >
> Yeah I've seen this kind of error dozens of times.
>
> From the first glance I think it is gold which makes the difference.
> Hope to get it reproduced and fixed soon and come back
>
> BTW / off-topic: I sent similar patch for qtwebkit. Is that part of your =
builds?
>

I use master-next of meta-qt5 so it does get built on some builders
but on some where
not enough compute is available, meta-qt5 is disabled.

> Andreas

