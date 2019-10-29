Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0475C7FB40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:52:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x14so372009qtq.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=893IbYY4uy+lSwzodXiWy3WFjWbDLsgTTxENXftedPo=;
	b=EiyKUfL9DBhCigAgCzwEQz9RVh0JxqbC1jXOpVZE43cFdXs+6tnXY5Ciyhzwo+E7Mb
	Pv1CysnEctVQ1YEwIbdBb2c6k3LvaeZ2BNHPDVF8gu4scuLHmyf5pWbxvoHvqC/AU5l3
	b2g4eiabq+ULyFasPLK1cE+he2HbTSvHGyCkkYvnl+rIygDaQGo9mKyjycPdoMPZb5AL
	JGfszGKhUEC6kUwjK2z2ZaMn6HaZRWfIo0ixPS37zINXfqaZEQVDh6EkFurMYCTWBLJo
	eKJXh7Z4p8m6mYAorxwr4qkJIedXlyyxhkLjMBjfqLR+JNWVLonyLigS+LlnZDCPs7em
	+PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=893IbYY4uy+lSwzodXiWy3WFjWbDLsgTTxENXftedPo=;
	b=KjKnRCJbzhLnh/31YTl2Hwfnmo/ARTRGvIAipMKl1IU/+05Kcs84RSAQ7IXPltNnUI
	1FkW1njjBCmpT4Yc6pOxsFXvv9r79zvnuh12Rp84IPXZkKJCuRPc4R2dABkJvlm5M/Ej
	w0nl2qIPTHB5km/R3u5iq0bzQqst92Y2n01vCVaEMAsxMTZ7LxHleyNAmAIpZEYIA3nD
	yCPs7l94ICjL+3Y7qq1MWSTIkAVaU5cnd2V/6Jnj+KJiWqYsJepmN96MArryZFJJPeBQ
	uXYLCD7sLcAr+wdJa0rVc2A2ahKAAClMmyvLctU5FNt1b1wWYHrcjL+mjhzGprZGDZd4
	D2AA==
X-Gm-Message-State: APjAAAXfff34uToL0sVy6e/MMPRcb8HstxaCpOm1gKD8R2Grj9MPseXC
	SG7cQ+sUHpSbJhSBr6iTtincoMjBWGBOWCqSJ10=
X-Google-Smtp-Source: APXvYqwv/F12eEkuE99N15jern88ywXP9NibIOkBp/2yWrSN/Axn1GXX1m7eV4Y83mMwsF6h//b7OPwC4hMzwH3V59U=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr18099138qvy.109.1572385941584; 
	Tue, 29 Oct 2019 14:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
	<CAMKF1spGD1djY6F4hMYCTMWyEm=Fdq_ZmMcWFE8rxnhe7xv-mA@mail.gmail.com>
	<CALbNGRR=kGo-Dt1VKn=2AkWQwDXHEKF2M5Hwb5y0uGVfE2yrzg@mail.gmail.com>
	<CAMKF1soAzh=sMUfuXDh=dWZEboHUO1+sSFk0Q=h_t75WD8Pn7g@mail.gmail.com>
In-Reply-To: <CAMKF1soAzh=sMUfuXDh=dWZEboHUO1+sSFk0Q=h_t75WD8Pn7g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2019 22:51:55 +0100
Message-ID: <CAMKF1spehH742Tu2=ke=BYzALT7uL_ZnJ5819pYEm_OV=cFnEQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v4 1/4] colord: initial add 1.4.4
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
X-List-Received-Date: Tue, 29 Oct 2019 21:52:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

see

gcc  -LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe-sys=
root-native/usr/lib

-LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe-sysroot-=
native/lib
                        -Wl,--enable-new-dtags
-Wl,-rpath-link,TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/r=
ecipe-sysroot-native/usr/lib

-Wl,-rpath-link,TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/r=
ecipe-sysroot-native/lib

-Wl,-rpath,TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe=
-sysroot-native/usr/lib

-Wl,-rpath,TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe=
-sysroot-native/lib
                        -Wl,-O1 -Wl,--allow-shlib-undefined
-Wl,--dynamic-linker=3DTOPDIR/build/tmp/sysroots-uninative/x86_64-linux/lib=
/ld-linux-x86-64.so.2
-LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/lib
-lgio-2.0 -lgobject-2.0 -lglib-2.0
-LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/lib
-llcms2 -lm -LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/bui=
ld
-lcolord TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/build/cd=
_idt8.o
-o TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/build/cd_idt8

it does show that we are linking -lgobject-2.0 but order seems a bit
iffy to me. Since it should appeat after .o files.

On Tue, Oct 29, 2019 at 10:37 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> it seems its not linking with gobject-2.0 properly, pango had similar
> problem which was fixed with
> https://gitlab.gnome.org/GNOME/pango/commit/d0cb6be7431d1a3c711bd45bcf05b=
34601604037
>
> On Tue, Oct 29, 2019 at 4:43 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Tue, Oct 29, 2019 at 3:15 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Fails again
> > >
> > > https://errors.yoctoproject.org/Errors/Details/274899/
> > >
> > Continuing like this does not make sense any more. Need to set up an
> > environment where I can reproduce this error - may last.
> >
> > Andreas

