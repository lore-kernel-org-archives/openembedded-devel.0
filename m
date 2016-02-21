Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E667A77246
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Feb 2016 10:47:22 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g62so121818706wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Feb 2016 02:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xD6my/7DDKbMt1oZaVfoq94+CBVitML1DOSlXPRP00o=;
	b=UW+I+cSjRa61POvdbXSemTgOeXEGOHDvVENh45tdyBDzarv8KLfOaTHs0AAQek8HGr
	sLAs7MlB/kBstiWLghE4VTKDbt0Y2ismBhdbVH13ZYkmPsb+p+QhocOlGonyQ6FMiAcG
	lp5FFb+RvsfkazytZY75qulKN3OM0BaNI7OUSJLml4ZYxmCtKtFyu0xp+FGJsf6DyPq8
	uVar1/9uUNMNcc9MXSYGykUjS6yXp8sC0BlOD4tCyfJb4tirfan0Apz5pPxKy08KrWdz
	65FRMNGIHv3tjY+Ny4K/Ix4kgK0exPExjnPW3CiGtuI2hp06Uc6yYC+pNVK8h/TSImH/
	MJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xD6my/7DDKbMt1oZaVfoq94+CBVitML1DOSlXPRP00o=;
	b=DxIxsz4X/QnWvgTOkg0fekgCIsxvGtYG27ki8V+qYnuRPsRdFBwsTXVoHLhRGn9rZ0
	ziMOwFpMlP/1q26IteGBKSa3k5x1Fh3MTuYKoPnc875bt7kMTgjH8CJ6pgih39i7pkRG
	MSxYa0bGa9Vccc9Bwk2OnTAABvfOS3LevQzzIggB8M0wiVuCiqljsig5lMN1kIebULUY
	WPlucTotyQrB+UclBxhbMCiBhcqEbuhE97p7aVSkuKv47A9SZ22JGIKEV+QibHDVQHiO
	VSJpicg6iZnd/F2Qpd/8vStXULZ8cCzrgaW6CDh6beqUwLx9V778Gtxo+IA0aNajlvhC
	spWA==
X-Gm-Message-State: AG10YOSkOKmqM/QSoOhzHuXZqyR9iq9/T9IQ+dr8hdXWSLx2ecvmBS81Bono1GaMsr9jf7FOPNflWOfS1WeYTQ==
MIME-Version: 1.0
X-Received: by 10.194.114.133 with SMTP id jg5mr17532506wjb.99.1456051642426; 
	Sun, 21 Feb 2016 02:47:22 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Sun, 21 Feb 2016 02:47:22 -0800 (PST)
In-Reply-To: <1456050629.28376.160.camel@linuxfoundation.org>
References: <1455815945-9857-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmnO78wfOe6p05MdU_jZ-9SqrQOAzxrqejrLBU2AXUR0Q@mail.gmail.com>
	<1456050629.28376.160.camel@linuxfoundation.org>
Date: Sun, 21 Feb 2016 11:47:22 +0100
Message-ID: <CA+chaQfOYEfP=h8U1_Q7FXLUKuqvZ=o967=5vSVf3Phqag7yyA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] fio: Remove --disable-static from EXTRA_OECONF
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
X-List-Received-Date: Sun, 21 Feb 2016 10:47:23 -0000
Content-Type: text/plain; charset=UTF-8

What's the advantage of more global .inc file?

IMHO it's only increasing chances for conflicts when merging/cherry-picking.

On Sun, Feb 21, 2016 at 11:30 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2016-02-18 at 20:43 +0000, Christopher Larson wrote:
> > I think the convention is to add such workarounds to no-static
> > -libs.inc,
> > not the recipe, at this time.
>
> This is a good question. I was just doing some world builds with meta
> -oe in and have a few more of these fixes.
>
> Referencing meta-oe recipes in OE-Core doesn't seem right somehow. We
> could create an .inc file in meta-oe included by something like
> layer.conf which set these, setting it in the recipe does somehow seem
> like the better solution though.
>
> Does anyone have any other thoughts on this?
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

