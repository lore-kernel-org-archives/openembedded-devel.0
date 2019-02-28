Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5C33E7C934
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 17:42:04 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c2so11865673qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 09:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VjLNejZRGgwoDuwA2OyW7y53qKqCrRIdFfx7XgjuLaY=;
	b=kQhteGg2kaWkRFwPZUg88786navmDYjUkDTaRhv/H8ypoXCC2I3E4PfeqIBsTFU1G7
	Sc40Ke/yP3uN8v12YSvwEecHGmhwWrMTXq2F+Dbl2qJN+ycZzYH1ExiKcvQD7Y0myLKL
	22YaqRBVIX+8yIz5wTJg130+dGqhYwDOIs7XwBhKkAh8xGdkvCd3SJ79aOEP6agUyWgv
	vE9zkEjOjlmpogajsd1LK5ON/nxigwggqhVftLLkXZoB2vYlmgyuTAUrVwrePAG+p8Jd
	Q3A4ldlaGl3Ic1VryGMK9zUTEDl73THjCICWqDWcCAx2f7RQWgCCvszyOyw1W+fLLHpo
	hN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VjLNejZRGgwoDuwA2OyW7y53qKqCrRIdFfx7XgjuLaY=;
	b=gRhD7y1oUN4dccrT9/AbKjXNOr3rVuNRdJkecWnlv+MZuMybarau8EP8yCmOtp0UOy
	NQQFBjcP64bVJhRinaH1o7gN49jKrWhOTwYB9zGf7kUgOM8v6l44nNuxYev/4s6Mduf7
	UfV2KW9iYdT/OUU7WnYA+PlvXnh/gM0tip4iqHZsfsG376nbLfGpc7Bw+cGl7ziAmJOZ
	6NNPZ0gCIXR4EXYlqcF/XagETS+d2vtoFSiFci4bXwfIBLjTsZMx8Xpj2+qXNETReE/i
	StYJOHjZpTfGkSAGkKduMEdv8uDg+nx7qSCioZcErj4Xou0Pf7smqSFUwVt6A+q0DOG+
	7GdA==
X-Gm-Message-State: APjAAAWPsvYEMB/pnwJaRfmS0JfpV3ojAAZhYKZAf+IuQEkTZDvh8ic5
	TNeOhkJCIiNJpimV7IIpfESSadVOZAzeRvb3U+lym07s
X-Google-Smtp-Source: APXvYqyKZVIIW2xFij+oCAeSmYXydETdexXA6kuS6XIwiEIwNPRHCcFJVTJmx7b0VgmoXkdC+nAjkckTH0NabPd7+8g=
X-Received: by 2002:a37:9e15:: with SMTP id h21mr575844qke.2.1551375725131;
	Thu, 28 Feb 2019 09:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20190225061757.24421-1-dan.callaghan@opengear.com>
	<CAMKF1so7ONWosmZ8ZLoESHnb9tRiWqA2tBYq=SstnoXq9CP0mw@mail.gmail.com>
	<1551245877-sup-2492@galangal.danc.bne.opengear.com>
In-Reply-To: <1551245877-sup-2492@galangal.danc.bne.opengear.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 09:41:39 -0800
Message-ID: <CAMKF1sr02V8Ngj=ou1UyukoeuMDZ3GgMuVriDxJ45vr7JRFJHQ@mail.gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] firewalld: add new recipe
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
X-List-Received-Date: Thu, 28 Feb 2019 17:42:04 -0000
Content-Type: text/plain; charset="UTF-8"

fails to configure

https://errors.yoctoproject.org/Errors/Details/230627/

On Wed, Feb 27, 2019 at 11:10 AM Dan Callaghan
<dan.callaghan@opengear.com> wrote:
>
> Excerpts from Khem Raj's message of 2019-02-26 17:36:17 -08:00:
> > Fails to build for mips
> > https://errors.yoctoproject.org/Errors/Details/230515/
>
> Ah yes. I realised that firewalld needs to be explicitly told the path
> of all the helper programs it wants to use (or told not to use them).
> I will post a v2 patch.
>
> --
> Dan Callaghan <dan.callaghan@opengear.com>
> Software Engineer
> Opengear <https://opengear.com/>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

