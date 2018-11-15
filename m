Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 84F156C193
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2018 05:25:45 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 189so30046004qkj.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 21:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gqaf+dvCbxIxrtQWTpKoP5OF7/ZSHvzKcAkUHTe5lUI=;
	b=Tzd8gKE369mYzTc0uUBlAWz4cfG8k3qIer+TgW17y2NtB6R+OyQMyQY4/fiquicmww
	s8V/M1eU3obnTA/25VpbeV0601UdE4+B/MIaFIjMz9WMl36rr64o8bebGLhQAJm/lWBS
	aRxijUCis9rbczI6GleDTvspxufpUbEz8gR3I1cfgiSIv6qAmXX2fbWc/e4vW8A+hcb7
	dNU66YmfA66ulvPbrLK/d/z/Dk4GtzGgpHzTeU9bA5vSR2RgjcBfwUzh7MGmbUa9k5SE
	v59PzZLDMxhVAR5ikNZGBh2wn7pGtXFoIcXNfbUtPWTckCF4u5Usq7w2Gj2DtLTtBWXo
	BjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gqaf+dvCbxIxrtQWTpKoP5OF7/ZSHvzKcAkUHTe5lUI=;
	b=kAdtkTAmmGNRGfG6QSyrhLZRcQEtXzpIh3LnqkLcJo5yDSN/slMRpYO3OJZEcUUjqV
	EIyQPFHyaqQxoeUA4B1ZSv6dGQ4O46SGf7/l2XfzSKh0o8RxHdE/SpV4/ZrYvzfx4dKo
	K9sUN/gLUb3IFYdKtgFdVxs2lIFL6kPdOvVkE7xt5wNN3HtgQP5PJIB8bILtZd6aahsV
	P3Eeg/vuC7t/PaOchoTRtyu2itBDT6npcKcqmPp2oE0MopsDMnJIZerhCNdDEPQ339Bh
	VUt8X0yxS8SpT5tml668mToI/4D2S6KajvJFQdLztzS0CjpBm7KmXGZMYj+365FvQB+E
	jLfw==
X-Gm-Message-State: AGRZ1gKNO68N0fu5vC3hFWspX8ffN1+VwdUnik0aDmlgq6BarVWbQsZ2
	mv87svZLxy0Ia63NkfuHp2zFloTTRJk1guHxiu8=
X-Google-Smtp-Source: AJdET5dPh7U9tTd21+1LDRDLj/jzB3bG0d6wJYgDvudURBsQ4WHiNIYLtfYNOOoM78HdPtM6mdXQXrl9oCOpL4rYfcw=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr4685277qka.206.1542259546122; 
	Wed, 14 Nov 2018 21:25:46 -0800 (PST)
MIME-Version: 1.0
References: <1541662837-29069-1-git-send-email-primoz.fiser@norik.com>
	<aa286fd0-cc9f-6e8c-6d92-34ca8f4bd723@gmail.com>
In-Reply-To: <aa286fd0-cc9f-6e8c-6d92-34ca8f4bd723@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Nov 2018 21:25:20 -0800
Message-ID: <CAMKF1sraOfemdMx0+AtVz-NUfrUBhRfB=46Rz5S5OmnMPOkc1w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sedutil: Add recipe
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
X-List-Received-Date: Thu, 15 Nov 2018 05:25:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 11, 2018 at 2:51 PM akuster808 <akuster808@gmail.com> wrote:
>
>
> On 11/7/18 11:40 PM, Primoz Fiser wrote:
> > sedutil is utility to manage self encrypting drives that conform
> > to the Trusted Computing Group OPAL 2.0 SSC specification.
> >
> > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > ---
> >  meta-oe/recipes-extended/sedutil/sedutil_git.bb | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/sedutil/sedutil_git.bb
>
> this seems security related. can we put it under recipes-security ?

When you move it please also look at the errors when building for big
endian platforms like mips
see errors here

http://errors.yoctoproject.org/Errors/Details/200823/

>
> - armin
>
> >
> > diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> > new file mode 100644
> > index 0000000..cec569f
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTION = "A utility to manage self encrypting drives that conform \
> > +to the Trusted Computing Group OPAL 2.0 SSC specification."
> > +SUMMARY = "The Drive Trust Alliance Self Encrypting Drive Utility"
> > +HOMEPAGE = "https://github.com/Drive-Trust-Alliance/sedutil"
> > +SECTION = "console/utils"
> > +LICENSE = "GPLv3"
> > +
> > +LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
> > +
> > +BASEPV = "1.15.1"
> > +PV = "${BASEPV}+git${SRCPV}"
> > +SRCREV = "358cc758948be788284d5faba46ccf4cc1813796"
> > +SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools-brokensep
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

