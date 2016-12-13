Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1833771E01
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 22:37:16 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id j10so337544wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 14:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=WD/DPBFI6wdqubssbqzlB2KPJ6dgqLPMfokDVk29jsM=;
	b=m6NRdcStgxl3tlOgh3LA0lzcScN+MZYBlJVWGBxcNrxnrhGq8+0U0vqTfxqMhGCCWC
	c1KhsXzYx5iA94YX9rxGJ/Z3Fqa1H1visJ21+vIe4c3xQn0o2gZvnrkOTfD4kAdQKyCC
	fvSm+lo5Lih6VuT7spSMBkaQ7yAMolkz9jkCtevMorzLRkEMx8OJpDxE/2+LoraBzCz1
	laIaMIawoL1IpSAl4WrmkiGg06JdcXPfMPKRh3XnWCsTYM+hpAfkQ4py8DmdfaNuxiKj
	EKIHHY5EUOez8iBhZAtCjbMqNNh81sR6iUuUnHcJ/kZ2M/2HvJEv/2/A2jaQh+56KCkA
	SWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=WD/DPBFI6wdqubssbqzlB2KPJ6dgqLPMfokDVk29jsM=;
	b=JWD9uk2ml5EGJ7WhUKFduMxmbyKCQ6oBYUTzHFfLLhq+Zr3u5tKQmUD1CclmqIgHMq
	Ar307qsm/wDzj9waDq7VWCk1mziAwyceTN4IVWM5iAwzrSy4ctCm5F/7pL0iJeM1Vij+
	5Dvh0jzjApSYag1QAYMCgHpldcexzOhc4cvi0ldczgc8L3NPvYc2j5baLPVtMUkUE/nb
	x8kcI8oBK+FTQQjKcFVhP8JjgXgo8AnbJ/z0jSmUhKXB13zoHomIHXUS1kfvf47GzSce
	hXjEtK/TV/5aUYqy7/PbosO/gKJz4bnwlXtNS2wZAqecVMPQj3cZmUCwZ7Y7h9978F5g
	YDXQ==
X-Gm-Message-State: AKaTC02ET+WUXoNaV/sBufCbkj5Wb5AaMYRt5gbKlHJvdn/909ZPvMpqogbXV8SIMd/YbaOaTVKzAWKidSUlVA==
X-Received: by 10.28.184.88 with SMTP id i85mr4233861wmf.49.1481668637379;
	Tue, 13 Dec 2016 14:37:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Tue, 13 Dec 2016 14:37:17 -0800 (PST)
In-Reply-To: <CAPybu_3fk_MvXWQ-++XruYCqwHAsC5r-GMv0Hbx+O9jaj5UqHg@mail.gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
	<20161213210404.6940-7-ricardo.ribalda@gmail.com>
	<CAMKF1soyeu_47SQ3GyjOCOEiuOX=NxzahEAd+d2GOwdaiUj0Wg@mail.gmail.com>
	<CAPybu_3fk_MvXWQ-++XruYCqwHAsC5r-GMv0Hbx+O9jaj5UqHg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Dec 2016 23:37:17 +0100
Message-ID: <CA+chaQdhYEi2kVhefPQfFdK4xWkq23Sb2gj7LuU_wK9BbPEeyQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 7/8] opencv: Add new PACKAGECONFIG lapack
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
X-List-Received-Date: Tue, 13 Dec 2016 22:37:17 -0000
Content-Type: text/plain; charset=UTF-8

Definitely not RDEPENDS (that would make it even worse by not ensuring that
lapack is staged soon enough to be detected during opencv configure).

Best way is to patch the configure to support WITH parameters like for
other optional dependencies.

On Tue, Dec 13, 2016 at 10:30 PM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Hi Khem
>
>
>
> On Tue, Dec 13, 2016 at 10:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> >
> > not that this problem does not exist right now but this is a dangling
> dependency
> > what happens if I  dont have lapack in PACKAGECONFIG but lapack
> > package is staged
> > already may be via other deps
> >
>
> What is the proper way to to it? Add it as an RDEPENDS?
>
> Sees a bit too much to require lapack for every build if it is only
> used by an optional package.
>
> Thanks!
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

