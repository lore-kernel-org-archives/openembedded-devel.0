Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCD47F8AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:52:14 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id q1so6205594ion.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Oqkgb6yhe3AY21mFMwJljqnsS413GqbKWj8C2tI5wdc=;
	b=H4q1jdP/BVlVKYleii07ONtoS3ZyJ13Q4tCrXEuD1DdovsNrdn7MqUR3WiMAMPr73w
	G+i6FKG//K3lzezke5aIyslXoyXwRD1cr19xAX/x9YS1mHyQIN4nrzSiwRdxQHhNBR2R
	zpZ8EMDEVMGLaRR7daf0fED9mQ3LggV2ZR8QPH5B6AXeTwnlNUwc7mI8i/JrjYpp6+Hz
	KAMrcufTUCeJTxBlknx0P6UIqao1napgLkV459CFsZZ2awrStHxbYDOFNXyF6uF+3CCR
	B3afXnvR8EKHy8nVPI2otCB2ciSJGf6rQDJn+xnJ/cCn6WWLieickqOCLi+aV1avOMVu
	awuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Oqkgb6yhe3AY21mFMwJljqnsS413GqbKWj8C2tI5wdc=;
	b=YUhGo7IrBptyTLBNlBjSNRwEw8aECRuv3k2lVmbhRdrYc5/LFV5dnt1F/+0fv0/gNS
	4RWA2wqmcqNU9RnsEX7bQMHJsQoPDtYuxGJWOFTpbFxO1pgmhFO/FlixBSOnzXb+qacn
	R3llonG/q0Ayfg5Wz8Oz4TZZNBCtELnOHIjDU8dJEnhklYB0dAEql7pa06y7r9rQ4ZIi
	IkMdxTdAy7BOMt5d8M75K42PXsECfxlsSJX0C1AlQGyfOsd+B97HpR/ToiBzv8me31BW
	mTP+BaGxeiCoCR85ERd93/Qua3Y7ZbQXOswqvcO5fN92xMrylyfjyvgV7keeB3JWnpu4
	0Oaw==
X-Gm-Message-State: APjAAAVv+G2ro9f5ocwqqgDMKlLF8HlKXSdpR9be4ipsT8O4rZCFh+Vk
	z5XFTyxyDZjC4ThW2OwN/v96uXXycwXdCrkNa/g=
X-Google-Smtp-Source: APXvYqyf0Zk2TWuwp23XKjLUkTyrJ1sY0BO1vmaaDwuxW29b26okaNVjAeniDnUZ9eAGG/RmLHtO/iQ/ntvkiWRWXmI=
X-Received: by 2002:a5d:8185:: with SMTP id u5mr4207610ion.147.1572519135493; 
	Thu, 31 Oct 2019 03:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
	<CAMKF1spGD1djY6F4hMYCTMWyEm=Fdq_ZmMcWFE8rxnhe7xv-mA@mail.gmail.com>
	<CALbNGRR=kGo-Dt1VKn=2AkWQwDXHEKF2M5Hwb5y0uGVfE2yrzg@mail.gmail.com>
	<CAMKF1soAzh=sMUfuXDh=dWZEboHUO1+sSFk0Q=h_t75WD8Pn7g@mail.gmail.com>
	<CAMKF1spehH742Tu2=ke=BYzALT7uL_ZnJ5819pYEm_OV=cFnEQ@mail.gmail.com>
In-Reply-To: <CAMKF1spehH742Tu2=ke=BYzALT7uL_ZnJ5819pYEm_OV=cFnEQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 Oct 2019 11:52:03 +0100
Message-ID: <CALbNGRS4f6j7-R_2hYic88ZJ-Rkn9FaHMT_xSfO431aRui2BhQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 31 Oct 2019 10:52:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2019 at 10:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> see
>
> gcc  -LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe-s=
ysroot-native/usr/lib
>
> -LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe-sysroo=
t-native/lib
>                         -Wl,--enable-new-dtags
> -Wl,-rpath-link,TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0=
/recipe-sysroot-native/usr/lib
>
> -Wl,-rpath-link,TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0=
/recipe-sysroot-native/lib
>
> -Wl,-rpath,TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/reci=
pe-sysroot-native/usr/lib
>
> -Wl,-rpath,TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/reci=
pe-sysroot-native/lib
>                         -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3DTOPDIR/build/tmp/sysroots-uninative/x86_64-linux/l=
ib/ld-linux-x86-64.so.2
> -LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/lib
> -lgio-2.0 -lgobject-2.0 -lglib-2.0
> -LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/lib
> -llcms2 -lm -LTOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/b=
uild
> -lcolord TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/build/=
cd_idt8.o
> -o TOPDIR/build/tmp/work/x86_64-linux/colord-native/1.4.4-r0/build/cd_idt=
8
>
> it does show that we are linking -lgobject-2.0 but order seems a bit
> iffy to me. Since it should appeat after .o files.
>
> On Tue, Oct 29, 2019 at 10:37 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > it seems its not linking with gobject-2.0 properly, pango had similar
> > problem which was fixed with
> > https://gitlab.gnome.org/GNOME/pango/commit/d0cb6be7431d1a3c711bd45bcf0=
5b34601604037
> >
> > On Tue, Oct 29, 2019 at 4:43 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > On Tue, Oct 29, 2019 at 3:15 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Fails again
> > > >
> > > > https://errors.yoctoproject.org/Errors/Details/274899/
> > > >
> > > Continuing like this does not make sense any more. Need to set up an
> > > environment where I can reproduce this error - may last.
> > >
Good news: Our company's stone-age autobuilder shows the same error.
That opens me the door to a more systematic approach :)

Andreas

