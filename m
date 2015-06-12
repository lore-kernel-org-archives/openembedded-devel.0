Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id B51B075978
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 14:51:37 +0000 (UTC)
Received: by iesa3 with SMTP id a3so26081155ies.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OyO9qbrlQn44WbDLgrrx6OFxtU+dPpQqt6z6/XLuvB8=;
	b=PlByoLhK6q5o7XnZGYaFWs2WQenPTeppokNhjnRzOoNHgHmRE2trqRIV8CieAL6NL3
	8rnNN9d0hqagIh+WaXVEM0TEEo9O2/+NOzsrCV2qMqX5hwY6cFGFjaK/9z97Nd9yRlJc
	RA46D7KOhcFp8z8ydsnP+7L0CtIcjCI/REJXIX8fbBoFCar64OCrPwQXPxQ1ByeAz99o
	+pMPQJ400vsAZXrgPLyHuqcNeqeFjqWyew+BhIiw+xq750a23q/bnWHpUCQr2DUfdOCr
	JcGI/9fk4a/LgDi0kNliRm/uGa20slYep6WSFHLGxcZxa9rlAqyoqjyc3M7ehDgo6qpo
	roXg==
X-Received: by 10.43.17.135 with SMTP id qc7mr16884366icb.14.1434120699172;
	Fri, 12 Jun 2015 07:51:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Fri, 12 Jun 2015 07:51:08 -0700 (PDT)
In-Reply-To: <CADnUhn1U1vmKZH2QcV_t9e1X9HC=BLZceB73G=zYxqpCBdFZSA@mail.gmail.com>
References: <CADnUhn1U1vmKZH2QcV_t9e1X9HC=BLZceB73G=zYxqpCBdFZSA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jun 2015 10:51:08 -0400
Message-ID: <CAMKF1sqS-dpJbFtkZwB4qVyDsCGrLROkXYPiLQ-6ugaJ+A2Hxg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: klibc_2.0.4.bb crashes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jun 2015 14:51:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 12, 2015 at 4:16 AM, matti kaasinen
<matti.kaasinen@gmail.com> wrote:
>
> klibc_2.0.4.bb recipe linking crashes with following error messages.
> arm-poky-linux-gnueabi-ld: error:
> .../sysroots/am335x-evm/usr/lib/arm-poky-linux-gnueabi/4.9.2/libgcc.a(bpabi.o)
> uses VFP register arguments, usr/klibc/libc.so does not
> arm-poky-linux-gnueabi-ld: failed to merge target specific data of file
> .../sysroots/am335x-evm/usr/lib/arm-poky-linux-gnueabi/4.9.2/libgcc.a(bpabi.o)
>
> I'm checked out fido branch of meta-openembedded.

It means that TOOLCHAIN_OPTIONS is not passed via CFLAGS when building
klibc, we have a diversion
in expectation where we do not configure toolchain to hardfp unless we
specify it via cmdline to compiler. Once you
fix that, next thing might be that klibc is not good with hardfp
itself which could be a bigger problem.

