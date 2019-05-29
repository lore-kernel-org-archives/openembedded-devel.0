Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC417E043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 09:04:39 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id b18so919948qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z0rH3TUSGlHeoQgt+xfh7SSk8IzogVHPEjXA2my6PV4=;
	b=i6bysl2uTgCbYnACIb8I6d1Kc4/BD2Z04JTY3khksTmIffyVxOAWZD4WQpL650o8/7
	JuZWPQ4ewA4q3SRsXpCUc6CzTRPl7Cj8cScwf8RysXOG+PWGs7TM2IjflJ/uTjPHcUfC
	YxdQqoBb6DypFWqCgxAxy6JXyP4u8Q+36ccWVIjjgOKjGSThuCwjngKfHnE0/us7bbsZ
	L8CiczzNWxU8QcaCqsSaNrbDeI/J4JQzdq3s22+hTWHFVBmptz5wlw04kTXses9tkMHQ
	hotmSXlCaK+HmcGEUz5nzbEjKZP/Ec//5XJOQNo9hbyZvGLV7H/8/LuewGGsjyZouzJ/
	JU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z0rH3TUSGlHeoQgt+xfh7SSk8IzogVHPEjXA2my6PV4=;
	b=KjfITGNRQrWo7xMqtJJaA28UPBmJlzUFb4LreY1wuYbmWgHg335OlEb90hfmfMAY5B
	Aaj3iweJA7oRT985UG2K2fglYOhCK29q3FOrfLUdsI64Bl+t4AC9uYBXe4Wc5Is7BAc2
	qotizq83DCQ4hIDVFJsj+4xrUZN1LjQ910vYTso/f8nzgqlszFxxtcvJmMCjmXLT9S4a
	FdLFUBk5NojWDenhDrduZ6MawUJqG5/GwfsA1aW59EzFifdQGixUSpSFXEj63Q2aPeUl
	ZVhQpOmr5D1xFgh/gIWIveq/eTdcn2jkd8ffkdheMbHbgyqcFgJsvyXqDuHLfJ8z87Rk
	UQ3g==
X-Gm-Message-State: APjAAAWc7TXB+oeHOu87IvfjJSk4copsjQg9TSAii2KmHLh752Nd8dpO
	uKIhvqys3nzR1ADZCGRXcwSawDaDQAxgot1NpQ74vpT9us0=
X-Google-Smtp-Source: APXvYqx1SQG5UvUfs39y8MljoxIGqMskLdrbB4kz5dNjkq5w5HnCQkkcADSfKcne4qEOiusk/tJS4eaXmiYgTTMhJEY=
X-Received: by 2002:a37:a017:: with SMTP id j23mr14073689qke.258.1559120680150;
	Wed, 29 May 2019 02:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190522131345.10392-1-andrei@gherzan.ro>
	<CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
	<119819b9-eee8-442e-f4bd-b4005b0a1a6d@gherzan.ro>
	<CAMKF1srx8acL-pQu6HWt3KutcvTNu=X-Fweos2XZ6vO-mLyK7Q@mail.gmail.com>
	<20190528180655.GA14708@localhost>
	<CAMKF1sqAzXc+iMFqqWU_-p_3e5aifuQtZWMPwxcBghwrPm9vmA@mail.gmail.com>
	<20190528212043.GA23804@localhost>
In-Reply-To: <20190528212043.GA23804@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2019 11:04:14 +0200
Message-ID: <CAMKF1spQymu=5un3uRgO7Wp-OUEZV0bRHDC2ME5Liu4ZZ1QewQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Wed, 29 May 2019 09:04:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 28, 2019 at 11:20 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, May 28, 2019 at 01:37:21PM -0700, Khem Raj wrote:
> >...
> > That could be improved. Probably adding this function to musl is not a bad idea
> >
> > something like
> >
> > char *secure_getenv(const char *name)
> > {
> >  return issetugid() ? NULL : getenv(name);
> >...
>
> I didn't know that musl adds non-standard functions like issetugid()
> that are not in glibc.

I don't think its stated as such anywhere in musl design guidelines,
however they do
try to implement defined behavior for POSIX functions which is a good thing.

>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

