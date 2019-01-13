Return-Path: <andrea.adami@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 244707C076
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 18:00:06 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y1so9054650plp.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 10:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iBeB/c5jpvpxnrxpFV8QPaQToIwWOdWDyClXGuY72jQ=;
	b=W7Oag0TAnJp08sBTta92sMbqdmcj0L6Bh9JDBhRTxojL2uCsoICyRiFoqjK8MEoxA3
	ZYhMxsXnnEWTAVPhyNu9P2p+PWe6xy+2atu/5DORAXVVGQihaEk7NDeNwKYQiww94SvA
	TigppZWuyhJapJeeg9fkOs2drObSC0ZLaptoo0GzsP6Fj8Pb9VzO3/zlLpHFEzQUEzUK
	kZYTeaszH6UYzhmCm9PjIFEtwosL5DQS2y5aBuJMOezc8Kx0q3KJMZs/QyDPx8iJwcgt
	WUxMbJ0evJB2WQZZKpoT9CvrwnySrVKb4mYjov/9Yi1ybXJf1LfHOHxRbmX4b/IInc09
	MCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iBeB/c5jpvpxnrxpFV8QPaQToIwWOdWDyClXGuY72jQ=;
	b=gBnfk/4ntINF71+HgYvslllYJvGqFWguHFZfBaRAK+FpqXBAk9rnPieRTcnJiPWzsC
	Qch71bSUeZr7Y7C5IXlv+VYGysW6t56cXtXTWKAyubYNL/A+IjWcSeuH5ZoDjjApWa8u
	GSidSQoa10HDk0A8BsPvb9qmfE/JFet3MlRJvSSQZpufAYSMrY8I+iGlbShbdm44dGlN
	GtOhVOX9uoCJAKJC8Jk48ASEOY6iLdIYDPPtjpNRioSGrIpfrmeIm7+tQ+7RTngQDPgm
	zJGF8Vq0gK7hE3aQfVDt8cJ1CtD60XBpAKWYn1x137+kl0g9t4Mr5utwjz6RdljWGHEP
	eXTQ==
X-Gm-Message-State: AJcUukfN6DlGr00RWQosUmCX4QFjF7ZXodAbhAWev6jUt5ePuPSMx10c
	mnxzyttLh/Sq+clOcaxLQ35jVlU4XeZlT4F+Nb0=
X-Google-Smtp-Source: ALg8bN5Q8hyIp1t9edSqApTnTC5gfuRDkg2dNsPj15ED/g6XfTD/2arqmu2RE8hfvaU2k2/cL8KsiGIjYXzyNitezZU=
X-Received: by 2002:a17:902:bb05:: with SMTP id
	l5mr22945063pls.230.1547402408144; 
	Sun, 13 Jan 2019 10:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20190112213132.2501-1-akuster808@gmail.com>
	<20190112213132.2501-8-akuster808@gmail.com>
	<CAAQYJAts5xaLN8NRFx=fBPeiyd-_rRpCq204XGW=mNWrDHNZfw@mail.gmail.com>
In-Reply-To: <CAAQYJAts5xaLN8NRFx=fBPeiyd-_rRpCq204XGW=mNWrDHNZfw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sun, 13 Jan 2019 18:59:57 +0100
Message-ID: <CAAQYJAsQmXe09ry7DF2z5nuSK_LpLMz==y2WYs2mT3=OHOcC5A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 8/9] meta-initramfs: add pkg group and image
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
X-List-Received-Date: Sun, 13 Jan 2019 18:00:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 13, 2019 at 6:53 PM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> On Sat, Jan 12, 2019 at 10:33 PM Armin Kuster <akuster808@gmail.com> wrote:
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  .../images/meta-initramfs-image.bb            |  8 +++++
> >  .../packagegroup-meta-initramfs.bb            | 36 +++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 meta-initramfs/recipes-core/images/meta-initramfs-image.bb
> >  create mode 100644 meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> >
> > diff --git a/meta-initramfs/recipes-core/images/meta-initramfs-image.bb b/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
> > new file mode 100644
> > index 0000000000..9d70d6d02d
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
> > @@ -0,0 +1,8 @@
> > +SUMMARY = "meta-initramfs build test image"
> > +
> > +IMAGE_INSTALL = "packagegroup-core-boot \
> > +                 packagegroup-meta-initramfs"
> > +
> > +LICENSE = "MIT"
> > +
> > +inherit core-image
> > diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > new file mode 100644
> > index 0000000000..bfede5a749
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY = "Meta-initramfs packagegroups"
> > +
> > +inherit packagegroup
> > +
> > +PROVIDES = "${PACKAGES}"
> > +PACKAGES = ' \
> > +    packagegroup-meta-initramfs \
> > +    packagegroup-meta-initramfs-devtools \
> > +    packagegroup-meta-initramfs-kernel \
> > +'
> > +
> > +RDEPENDS_packagegroup-meta-initramfs = "\
> > +    packagegroup-meta-initramfs-devtools \
> > +    packagegroup-meta-initramfs-kernel \
> > +"
> > +
> > +RDEPENDS_packagegroup-meta-initramfs-devtools = "\
> > +    libklibc  dracut \
> > +    klibc-utils-cat klibc-utils-losetup klibc-utils-readlink klibc-utils-chroot \
> > +    klibc-utils-ls klibc-utils-reboot klibc-utils-cpio klibc-utils-minips \
> > +    klibc-utils-resume klibc-utils-dd klibc-utils-mkdir klibc-utils-run-init \
> > +    klibc-utils-dmesg klibc-utils-mkfifo klibc-utils-sh.shared klibc-utils-false \
> > +    klibc-utils-mknod klibc-utils-sleep klibc-utils-fstype klibc-utils-mount \
> > +    klibc-utils-sync klibc-utils-halt klibc-utils-mv klibc-utils-true klibc-utils-ipconfig \
> > +    klibc-utils-nfsmount klibc-utils-umount klibc-utils-kill klibc-utils-nuke klibc-utils-uname \
> > +    mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
> > +    ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
> > +    ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc \
> > +    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "grubby", "", d)} \
> > +    "
> > +
> > +RDEPENDS_packagegroup-meta-initramfs-kernel = "\
> > +    kexec-klibc vmcore-dmesg-klibc \
> > +    "
> > +
> > +EXCLUDE_FROM_WORLD = "1"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> Armin,
>
> nice work, we had something similar once in oe-classic.
>
> About the klibc utilities, I fear there might be some runtime bugs
> because there are many uncommitted patches around.
> See i.e. the last one of Ben  https://salsa.debian.org/kernel-team/klibc
> Let's hope for a new release.
>
> Cheers
> Andrea

Armin,
just a small note: the other images reside in /meta-initramfs/recipes-bsp/images
Can we keep the images unified?

Cheers
Andrea

