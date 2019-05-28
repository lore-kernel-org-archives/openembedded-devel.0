Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7C76C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 02:40:47 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b76so10496304pfb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 19:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ktr7gIU0HUy/dCv97bqCtk5L69qxLi8UK8NUtK8yciQ=;
	b=HW9kBi4RuV/TxD7W89a14un/uJ4BEqzQli/dkCKpmOzrFsjvbOitVFiCzlY5ZPdAPt
	ViGcLA2dhdKKYqcE/FXU2vx8NIuYtxA5P9Iv9X2W0vjEDd5pE9Fe39bc8w9g2oJT641y
	dG8muUW3ksKLpOYOzrNIdCMkbIwUCC35KnJaDiX62iDMwuRql+9tSpkaBEcjm3DJHj0T
	Ta7o3UboJga5LUyTYchhb65q4xt64DlA5Llv4UzWrGh1UuQ2HFBtolj9o23br+t6rKTA
	21kr/K5KZ/3AooY4QkTctVcuuI3F/zhR3aI+qJz1pqJvnBqv6/QHARKqi+y3awfeNM7M
	bzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ktr7gIU0HUy/dCv97bqCtk5L69qxLi8UK8NUtK8yciQ=;
	b=NK4Ck/g5z8V2AthFDX7R1W/PQwRn5PPuWzRbOYIlHmOUjHtarEUs3yrLwL/hfICz1K
	v2UbIiNbXLcFgVDFIjAdPBaAtKqsQ4PrqABcH2IeGYIBGbDm2drBvpn11oZGuW9XfIh5
	8V8nCWwjwBGV7phqrDa00Mt+vuq/FiKWIuCCNmpE31pKOSDseoCrhApyMw+llh1SVxNu
	NdxQaRqwF2hRoic/b8xsvhflRh4Rp5Ego+3t5jGBtt+xYLbWTrClDE/Yc3X/lOtoA8N1
	FRkBTxqCbAuxRl2pqRt57dcZBNMHdqpzK657RAmoECXau41cjnO9l7mslaDVpnMlSIAk
	atmw==
X-Gm-Message-State: APjAAAUmOriwhoftMinIWYOLfwVuMqFQCMt6paxaQezca0F9wddqZHll
	0aB7sKJqI6i4HZMUTrPpiSPXuZ2GqIHRjhBLN5k=
X-Google-Smtp-Source: APXvYqwfgJTlncY6Zz7qGeON8MFEPrEoC2sOLbDiBgKZBNS502CPWAdayhDQKAYb6/EX/5q10UcrFlhb2aQkkLaTznQ=
X-Received: by 2002:a63:4422:: with SMTP id
	r34mr127451024pga.362.1559011249078; 
	Mon, 27 May 2019 19:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190527100610.8944-1-ankit.tarot@gmail.com>
	<CAMKF1srM7s8F-i+R+pqOwiizg7kUce8seP66vvwrvC_av0p-Kw@mail.gmail.com>
In-Reply-To: <CAMKF1srM7s8F-i+R+pqOwiizg7kUce8seP66vvwrvC_av0p-Kw@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Tue, 28 May 2019 08:10:37 +0530
Message-ID: <CAM_RqkPkOp87iszm7Vf5Cv6Ap2-usP9QJGD_1xHzukG2m3qUyQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] safec: Initial recipe for safe C library
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
X-List-Received-Date: Tue, 28 May 2019 02:40:48 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Mon 27 May, 2019, 21:10 Khem Raj, <raj.khem@gmail.com> wrote:

> On Mon, May 27, 2019 at 3:06 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > Add generic recipe for safe C library.
> > This library implements the secure C11 Annex K functions on top of most
> libc
> > implementations, which are missing from them.
> >
> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > ---
> >  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
> >
> > diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb
> b/meta-oe/recipes-core/safec/safec_3.4.bb
> > new file mode 100644
> > index 000000000..ad3c4ba74
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
> > @@ -0,0 +1,15 @@
> > +SUMMARY  = "Safe C Library"
> > +
> > +LICENSE  = "safec"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
> > +SECTION = "lib"
> > +
> > +inherit autotools pkgconfig
> > +
> > +S = "${WORKDIR}/git"
> > +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
> > +SRC_URI = "git://github.com/rurban/safeclib.git"
> > +
> > +COMPATIBLE_HOST = '(x86_64|i.86|arm|aarch64).*-linux'
>
> is it limited to these architectures ?
>

I have not verified for mips. Since I didn't have target to verify.
But let me check, whether it is feasible for mips or not.

I'll keep you posted

Regards, Ankit

>
> > +
> > +RDEPENDS_${PN} = "perl"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

