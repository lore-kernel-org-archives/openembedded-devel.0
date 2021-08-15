Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.13820.1629049298552283806
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 10:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dGOxejQc;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id b207so7130673qkg.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 10:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=aR3KSncYcde2gvvJO9THXeN42iX6J/2F/OqtVtEyjhM=;
        b=dGOxejQc/0jbIj60npmp7nRE3phXvh+MmZ/GyGCs63DAv9gIKItUHla7N3CM7aeoOz
         iBRfCMEk/aP1gl11yO5ZBZl6QDi5+enorF1DGp6P68MnOtsmrxNu1lSw6IKMv0PX7hcU
         9naZSjGK1nvwJm/qqdeL8EFVfCQYCg6Z5cM0nXDxs310XsJJgWiqFM/Gggf6JjJtVD1Y
         cljH3X481bLMNdM8sRpEzmeamJ/hXNyXO5Sq6fVEjFfMLfboL34yRju8wg33hRPeCcGw
         ytyudYC/9p6sleZSQY5zq724lvyEl5X62UrNIxXdAMgFFg5qF2LwhG6tU0SgC9NzMi/t
         d5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=aR3KSncYcde2gvvJO9THXeN42iX6J/2F/OqtVtEyjhM=;
        b=rJrmvKoC4m/53+QnMFTCIdNSpK9Wn+PvHSpHeUeZlICrXEvNYTYfuiiJr9tBXv1TWm
         GdyQVvxfr+1kR8bCuhTeQ5ecWeQRqKw/Z3JjyI2lHpsuiGHnwkTXsvKYM40/DmuQf9pp
         32GMUA0opAR0xpmxKSEQjc/exrFnNgYND5jPn4K8Ah7i2bOFJUm6AKo3hL1aSyKXN03/
         5mzQc7ERZ2BONmkCJFVPQI84Bm/DyIuDLdUVgqVzNv1wsr+0FtmBpiiDEUvaDN41kjOs
         sq6F7I7VPAceI8YL886Vqq34+YimoYV8qyLOfuy+Wu89lCL91J4dt4oMOoCPZs+3QULV
         yrXQ==
X-Gm-Message-State: AOAM533g6nFEKZ9/MQgpcmQqoHWQdF3bPKl5KMnrPDjDzkeWW2QjdxFb
	h0oUIutPLE4kbDKC206Jul81SxpDn+9C/Oxn4NE=
X-Google-Smtp-Source: ABdhPJyVMmzdeWu+yoWXikPWQJX6wOeLKn5LARY977m+j6BzRVRb1J9KXx2IRkpJFzpV1c8rDTBu6xB50jMbKMZTTrA=
X-Received: by 2002:a05:620a:88d:: with SMTP id b13mr12468063qka.125.1629049297589;
 Sun, 15 Aug 2021 10:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <1628871245-5054-1-git-send-email-leimaohui@fujitsu.com> <7ec64059-4784-0bbe-4ff0-49542fa645dc@gmail.com>
In-Reply-To: <7ec64059-4784-0bbe-4ff0-49542fa645dc@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 15 Aug 2021 10:41:11 -0700
Message-ID: <CAMKF1sqr=tUTE=NqN0T4e99UN5Waw3B14rGTWOQGyqhZagMA3A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] takao-fonts: It should be in ttf-fonts directory as the other ttf fonts.
To: leimaohui <leimaohui@fujitsu.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

There are additional recipes which depend on this package and they
should be adjusted accordingly as well see

  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:    takao-fonts \
 meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb:HOMEPAGE =
"https://launchpad.net/takao-fonts"
 meta-oe/recipes-support/uim/uim_1.8.8.bb:DEPENDS:append:class-target
= " intltool-native gtk+ gtk+3 uim-native takao-fonts"
 meta-oe/recipes-support/uim/uim_1.8.8.bb:RDEPENDS:uim-anthy =
"takao-fonts anthy libanthy0"

please send a v2 with these fixed to reflect the recipe rename change as well.

On Fri, Aug 13, 2021 at 9:33 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 8/13/21 9:14 AM, leimaohui wrote:
> > - Moved it to ttf-fonts directory.
> > - Rename to ttf-takao.
> > - Use ttf.inc instead of rewrite do_install.
> >
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
> >   .../ttf-takao_003.03.01.bb}                      | 16 ++++++++++++----
> >   1 file changed, 12 insertions(+), 4 deletions(-)
> >   rename meta-oe/recipes-graphics/{takao-fonts/takao-fonts_003.03.01.bb => ttf-fonts/ttf-takao_003.03.01.bb} (57%)
> >
> > diff --git a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> > similarity index 57%
> > rename from meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
> > rename to meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> > index 9ddfc6ae7..2c373f946 100644
> > --- a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> > @@ -1,3 +1,5 @@
> > +require ttf.inc
> > +
> >   SUMMARY = "Takao Fonts are a community developed derivatives of IPA Fonts."
> >   DESCRIPTION = "Takao Fonts are a community developed derivatives of IPA Fonts."
> >
> > @@ -6,14 +8,20 @@ SECTION = "User Interface/X"
> >
> >   LICENSE = "IPA"
> >   LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
> > +PR = "r0"
>
> explicit PR setting is not needed here. I have removed it before staging
> but keep this in mind for future
>
> > +
> >   SRC_URI = "https://launchpad.net/${BPN}/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
> >   SRC_URI[md5sum] = "8cd3fe724faa5034a9369e98cf108d2d"
> >   SRC_URI[sha256sum] = "e9871f72ac69acb3e277aebbee7ca01fbebf54800733e29fafdc46133fc3552f"
> >
> >   S = "${WORKDIR}/TakaoFonts_00303.01"
> > -do_install() {
> > -    install -m 0755 -d ${D}/${datadir}/fonts
> > -    install -m 0644 -p ${S}/*.ttf ${D}/${datadir}/fonts/
> > -}
> > +
> > +PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
> > +FONT_PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
> > +
> > +FILES:ttf-takao-pgothic = "${datadir}/fonts/truetype/TakaoPGothic.ttf"
> > +FILES:ttf-takao-gothic = "${datadir}/fonts/truetype/TakaoGothic.ttf"
> > +FILES:ttf-takao-pmincho = "${datadir}/fonts/truetype/TakaoPMincho.ttf"
> > +FILES:ttf-takao-mincho = "${datadir}/fonts/truetype/TakaoMincho.ttf"
> >
> >   FILES:${PN} += "${datadir}/fonts/*.ttf"
> >
> >
> >
> > 
> >
