Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 44919784B5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 18:59:18 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id q29so3491999uaf.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=acbLnLj0VNBjGGDCXLM5u1eVJBkzY0DzI8uJxH3+Iek=;
	b=l02cR/PJywyFJGZIvy4q4JDp0/5nlBpbkjkHzNm9Zj4WS+GQhduHZM6dxwDF8tQowj
	EJ/AxlKrXldcWgQsG1FFHQO3ZcwmqxqroEwW9JlUGythDrE0vx+FuGpXClCKTeHWUe7O
	Qk28IQtnSOY36NMVHCtVTGlS+OecGTw2CHoaar6EmgvigzyEM024ii72sw2DkWTV6dMz
	TSD5th9WfJ1b/B1XNJqjuIrZQnt5HvZzztkGIVFD1WCYnUXlVkTxdMPdyUVmfmYyRM5R
	n6tvuWO+6inTmugrFqurO/kuAuILNSADVhcNeT1w3GgholjGjgD6UEKr/ZZyta43iTFi
	eOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=acbLnLj0VNBjGGDCXLM5u1eVJBkzY0DzI8uJxH3+Iek=;
	b=FZXEevoE5RBJI9V10TSPne2tAIOc1P2sFvEtC9DDCzFhche8a1ynJLy6dZ8hS6i/jx
	asExyEjkwDOoM2IOqYKnZOdr4y+XxH5H9BAPy7jphRHuUcpLtK/eQMZJeNjflwtKGiN1
	zXeLMNUmYpeguuK4aBa+L4lLyaz/p7qhqoFPwqpr1Rn19jfx9FLht+A2PwRvNHpEbT3Y
	7JWZdgrknCP9pxra+WIF6cFD4clP+/HL8QznPDqbys2qQG8A3L7hO+IsFgi9+8Zbe1ZQ
	R7kppAbajsIwHJMZBCfh32dM+hRF4UOW7UNoTqj63hi3JGTGbMy6dTGC91evZgAD8SSN
	DEBA==
X-Gm-Message-State: AHPjjUjZdsbvh4TQGo3k6ORTAOR+cA66t6fsyAo3jb4w2XgM+AMmbEKK
	SSeAZfrnZVltybDvpPWnqlJCsVk/mQ==
X-Google-Smtp-Source: ADKCNb4xkzZmi2x5xS6qQXQ2lidT5YM4FieAuImGxJOCbDyy1kJtLHz9N/xDBmnVoSwS5wtDlb/EJTSWjLjBvDY5Erw=
X-Received: by 10.176.75.25 with SMTP id h25mr12596726uaf.102.1505242760084;
	Tue, 12 Sep 2017 11:59:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Tue, 12 Sep 2017 11:59:19 -0700 (PDT)
In-Reply-To: <CAJ86T=UQtomn1KeUuUBaSnqmhofieCOWz9WEAUTLqR2FDTqzWA@mail.gmail.com>
References: <20170911151056.4577-1-raj.khem@gmail.com>
	<20170911151056.4577-4-raj.khem@gmail.com>
	<CAJ86T=UQtomn1KeUuUBaSnqmhofieCOWz9WEAUTLqR2FDTqzWA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Sep 2017 20:59:19 +0200
Message-ID: <CA+chaQfuF=3F59upaJ7eO980G0-a4DDwrtK=gpxCf8BhQnixLg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 4/5] klibc.bbclass: Use forcevariable override to define flags
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
X-List-Received-Date: Tue, 12 Sep 2017 18:59:19 -0000
Content-Type: text/plain; charset="UTF-8"

One of these last changes seems to cause:

http://errors.yoctoproject.org/Errors/Details/155766/

On Mon, Sep 11, 2017 at 8:47 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Sep 11, 2017 at 8:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > This is required so it can override the CC settings when
> > clang is used because meta-clang uses toolchain-clang
> > override to set CC and friends so we need to use higher
> > order override, forcevariable is highest order.
>
> Just for reference, ${LIBCOVERRIDE} is the highest order over-ride,
> forcevariable is second.
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-initramfs/classes/klibc.bbclass | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-initramfs/classes/klibc.bbclass
> b/meta-initramfs/classes/klibc.bbclass
> > index f864104cf..2aacf241e 100644
> > --- a/meta-initramfs/classes/klibc.bbclass
> > +++ b/meta-initramfs/classes/klibc.bbclass
> > @@ -3,13 +3,12 @@ DEPENDS =+ "klcc-cross"
> >
> >  # Default for klcc is to build static binaries.
> >  # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
> > +CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
> > +CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc
> ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
> >
> > -export CC = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
> > -export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc
> ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
> > -
> > -export CPP = "${CC} -E"
> > +CPP_forcevariable = "${CC} -E"
> >
> >  # klcc uses own optimizations by default. See klcc(1) man file.
> > -export CFLAGS=""
> > -export CPPFLAGS=""
> > -export LDFLAGS=""
> > +CFLAGS_forcevariable=""
> > +CPPFLAGS_forcevariable=""
> > +LDFLAGS_forcevariable=""
> > --
> > 2.14.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

