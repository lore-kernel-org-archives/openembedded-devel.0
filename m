Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5399B7D302
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 10:31:09 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id r22so1339620pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F2K8a+hGsmmkRQN/Xf2B7LhPd2sJ4lffemyu7lZzuAQ=;
	b=NxSmBM+gbqfBbIT7auYmdHhwr+bWXeiWn3oZQi0Iko1+6BSsknuOI6jdDahsVT3kSS
	aA9LzUgv1TLaYMxabS1EvhAc9wRNBAXMsn0RxYZbOWmi/4yvyRzqxw6m8ZGi+utBKde6
	CmaaRa4t9t95jvBmzCSYBoZBEORRT/Y5ZkPRqFV1c1g4uhHskUsKCJA2tC0BYKLYhm5v
	6NHJdQFzoSETexi06Kp5VirTXDmHVg/0KY2vy5fy8/2tuxFuNzi7Uv6Rk0Mk65NN8R/M
	3AjAM6NeJtsCCUgG4DObuDnj+Y2qbFTSEKlSq036O1A1TTGVg8ibC8NC75y8nVCXEI6a
	oAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F2K8a+hGsmmkRQN/Xf2B7LhPd2sJ4lffemyu7lZzuAQ=;
	b=ki1eHN8252NbGAILoZP//PKN7S5PrmBan0fNSQOyPRzCT40jyDl+qR8/Jy4KA1M/xW
	gCbMiRreUMZdUnXW/jqpZ+qsheMPBqjBB5XSEhAAH2cUGBlZZfW/QQkPC05UpIOFNwYC
	HkEn+8KH97Sjs05lHdQFhx2WFN8G92pSEHrvjOhg7UiiVdfGHyfxeB7Gf2rWOmIqo87I
	7HH/L7xfYRkCWd+JBNklbC60OTTipFbhO8K16txqaYnwdUreQixxMALxxLzRrcaMJntx
	fONcFYPiUl/8U7p9wqvaGdolwOVtxUIIXzP7XTs2TLba7ZRX5KzvITRmmwGNm6MtEwkq
	E8LQ==
X-Gm-Message-State: APjAAAVjTOadbVkGOPqgCmKbThjZuHbpZ9veAJuavbPkQguSVR2R4/u1
	f/VTjsNamRmAEsS3LC+1D1VoS/9IP4KLFDgTD5s=
X-Google-Smtp-Source: APXvYqxMW2t5YLFZfyc2D8LPk8YMRQYe4Jys91f8ec7U5z9mCYnCWG1CIkBSasO+RutrVEvYgtY/WYmEpLA3lEoFQx8=
X-Received: by 2002:a63:cd4c:: with SMTP id a12mr8056498pgj.362.1559125870316; 
	Wed, 29 May 2019 03:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190529084806.13342-1-ankit.tarot@gmail.com>
	<CAMKF1soiTZwgAQM3-RD6PttxUJw88rLqpvomL-0j9X1sCJn9qQ@mail.gmail.com>
In-Reply-To: <CAMKF1soiTZwgAQM3-RD6PttxUJw88rLqpvomL-0j9X1sCJn9qQ@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Wed, 29 May 2019 16:00:58 +0530
Message-ID: <CAM_RqkNM+uqH4HsM6Y=cdWpPSJLyDoXUaf5_rY++fYwXy42W5A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] safec: Initial recipe for safe C library
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
X-List-Received-Date: Wed, 29 May 2019 10:31:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Wed, May 29, 2019 at 2:45 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 29, 2019 at 10:48 AM Ankit Navik <ankit.tarot@gmail.com>
> wrote:
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
> > index 000000000..d55d081f3
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
> > +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
> > +
>
> I see its excluding mips/mips64 from core supported architectures, is
> that intentional ?
>

I'm not sure. This library is required for another component i.e. ipmctl.

Regards,
Ankit

>
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

