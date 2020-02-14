Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id C20DA610AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:06:35 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id t26so11054828ioi.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 08:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SCpqrUkrW911lWZUXLrBisvuc0bpSHCLY4pfzIyQl9k=;
	b=c9Qt6NXqnI9CDBmr3UK/MOCl78pxOc9PZSmtiYqQtt01gDFgSG+S08cD33qOLysc5+
	ZAN7G3dy16TnxwO6V+We2ghMzoFLZOlppvY8yZsaujp+mo8ZvmmsgAJZP32QY2UbgxwD
	Ew+ELSnS6w9zukSkEWLNczVMJKD8FhvGKw9d8ePhY9R0KmUmFG8eYVK/wJb6LD1T7VV4
	btzxzJRK4pX2Ok+J/2TFSyIQ/mKB0pQhTcL1Gd6SLqnG+1k+N0rFZCQlm7FO0Hk7z4EU
	+hNqB5ON/dGHjgSZRoC3VjiEIsjTbowOb+d4ylJrARb+80E9z0q/TVsWYzurgllk2pmy
	KNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SCpqrUkrW911lWZUXLrBisvuc0bpSHCLY4pfzIyQl9k=;
	b=uMPA3sIcg54zXraHbSkkC2Fdlgg3q4V6iV+1YC9Ni7NKHJ9IYY8mPstANL1uXONkiP
	mcWx7ZCP7yJ/+rYcLRpNA3tIrqNz15lBL/VqUQ/YiLkK1M7cTjxn/waHctiek8b61LAz
	t7+vKq8dI0X9JNMN2K1CGyeQ6t0SoNUrL0ZD12VkJx8ohr5LcoNyPT1eTM2eaOoyF5+O
	BjmMevfGCS1g32WmEfreMnMurip3BWznbdp5Fd4wyLVyjxs+z5C4tr9POlEuLpCm07/R
	o2GYOFurKhK1mucZgt1DA66w75ZCpvsEI0Vw43Fagbglfpewhiz3NJKnKZR73Tna5jtC
	L28g==
X-Gm-Message-State: APjAAAWXoi8k+sgT5ZNsR3hJrT+caq+UdEeSo5nmCD6AZItdit/R+hLB
	mCOSL6snPhA7ltFkCKT2GZ1pCG6UM+PypX/aU8w=
X-Google-Smtp-Source: APXvYqzPvNWZTK957v+yXUbzrmzB1mNCNUqYVncq+245HF8qi+RsKm8B/7ztkpYSTXZBEoUTKiJR+zJTk/6le6dXqBs=
X-Received: by 2002:a6b:b642:: with SMTP id g63mr2739179iof.122.1581696396833; 
	Fri, 14 Feb 2020 08:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20200213055519.1978873-1-raj.khem@gmail.com>
In-Reply-To: <20200213055519.1978873-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 14 Feb 2020 08:06:25 -0800
Message-ID: <CANx9H-CONadAvBOw-HF+HqcMm+8+_aXaQKfz07A171PDW7mpGA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH] python-grpcio: Upgrade to 1.27.1
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
X-List-Received-Date: Fri, 14 Feb 2020 16:06:37 -0000
Content-Type: text/plain; charset="UTF-8"

Thank you. I've merged this, but noticed 1.27.2 was released to patch
python. Can you have a look?
https://github.com/grpc/grpc/releases/tag/v1.27.2

On Wed, Feb 12, 2020 at 9:55 PM Khem Raj <raj.khem@gmail.com> wrote:

> Delete gettid patch, fixed differenty upstream
> Add code to use cross compiler in setup.py
>
> Define GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY so it does not use
> SYS_clock_gettime syscalls since it does not work when 64bit time_t is
> used on 32bit arches
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-Do-not-mix-C-and-C-compiler-options.patch | 44 ++++++++++++++-----
>  .../python/python-grpcio/gettid.patch         | 26 -----------
>  .../python-grpcio/ppc-boringssl-support.patch |  2 +-
>  .../python-grpcio/riscv64_support.patch       |  2 +-
>  ...pcio_1.19.0.bb => python-grpcio_1.27.1.bb} | 11 ++---
>  5 files changed, 40 insertions(+), 45 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-grpcio/gettid.patch
>  rename recipes-devtools/python/{python-grpcio_1.19.0.bb =>
> python-grpcio_1.27.1.bb} (74%)
>
> <snip>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

