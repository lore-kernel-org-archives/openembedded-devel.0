Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id A547072EB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 12:11:33 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id l21so13100020lje.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2019 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w1ZI1j47KEoNisMkOuxtpFv3erRnfqU5rM6Ssz5/Ax4=;
	b=AQZ8aRdNyMxOrCdW6MPFFoiggg9qXUJg6SNrhD42vOMpemqQPyGywrOcusuOG6wd9j
	9f73El4PPUIa1LIPxfcPS5e7s+HDMLyE16RNh5ef9DO9MiZz3lumAd1eWy690TmxbQ5M
	UZShxeGzv1kL9xEHjOb4KTySrqCl7/vbdiAoyAchL32QBnGsXVLdiuhraDZ8eCBJ3FMH
	flm0Zcr+Ct9Owvf4M1qneLLmlorGrFeCNpMPVQU/Ge2KxfHW/O7gZiaQjcsYvh6ByFqT
	4McV//Mm8NqyssJgaEyBajKP7Z3sqvnvVChlT6PYo0klxZMXA/4QrQhOfdYnQVnBCCbY
	XMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w1ZI1j47KEoNisMkOuxtpFv3erRnfqU5rM6Ssz5/Ax4=;
	b=dBswzPc8zn4xmeJ/RQk29xdetAth94isNccl/x7P+mfC1bxfAvvVEDQfdDJ3MUBOfI
	8rgO1SFp8T67OkMVVgtg2B2/qvDFARx9fZcU0Nke5DOUabVnU494oBNNh2KdZkbbrbJM
	HUvxOucDDQiDhTNlXufEpcUIxT71ZvCwVnt9MVKqIJUjPc/O39GzKaQYilMeF4Nz+ZgH
	4jCx3q0xAfcrgKzyf/dWXRtbmR2KmNStpaFc1JTUhX5vpx5MekiDyO2t/AqxLLbkIcUV
	9YMFTNVdbpEAAA5HlcB6QbS78s/22Ovg1TgfHmN6xzLFjmSXdW7l+lrBFHZ+qDJET+u4
	G61A==
X-Gm-Message-State: APjAAAWhXtWfrieYVOiQ7Si+mhIivtRLgT1E9Ld/QIoRMgZirIjlQ/Fa
	4rjhSmrVmqYVBvEZU6GT+xNG7kjQJPoc6XmIPu8=
X-Google-Smtp-Source: APXvYqy58Nb9jpGWe27YeZFdLwzEOn/QMb7rsjwj3WJcPsZpNRH33sLpfJ5IOCxNJPLgj6Pd8TJe5kV4aMRQSSRjaNc=
X-Received: by 2002:a2e:63da:: with SMTP id s87mr15286142lje.79.1569931894157; 
	Tue, 01 Oct 2019 05:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWTEWCO=5CvTR8idSAGq=1LQgFpZxTSE3da8M4YgmLzpPA@mail.gmail.com>
In-Reply-To: <CAA=hcWTEWCO=5CvTR8idSAGq=1LQgFpZxTSE3da8M4YgmLzpPA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Oct 2019 08:11:22 -0400
Message-ID: <CADkTA4OLZiHoT8UBrVK+aMa0hkMXUakvQ0ZgOL1icQbjWRHN=A@mail.gmail.com>
To: JH <jupiter.hce@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Kernel 5.3 fails to compile No rules to make zImage
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
X-List-Received-Date: Tue, 01 Oct 2019 12:11:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 1, 2019 at 7:22 AM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> I am building kernel 5.3 on imx6 but failed in do_compile, is anyone
> able to compile kernel 5.3?

I don't build for the im6, but linux-yocto-dev has been building and
booting for v5.3 throughout the entire -rc and release cycle for that
version.

Bruce

>
> Thank you.
>
> Kind regards.
>
> -jh
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

