Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDBFD79BE3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 20:34:54 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id l58so13571303otd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FFI8Cbvlewwlt6+kwGjRmOmp2XA+UZh0ABVDg3VjX4U=;
	b=nzOBmsfDsN3xxha70OPTCy6iiohqsOo3vpVo4wjZnBpZZ4t1V4ZhZ0z27hfZ18Fuu9
	Kq5rQ9jKMXPw0heRFbmMR4sVKf8hiakq4Jrz0DRMqAM1Pcq3pbhILrmh34D/YJHTHZx4
	sShtHvZu4Ao1Nn6PzHNdWyt+kSiFH3kSbdKTBTPwbGKUStLOLJ3FXBpJOLbpAqPGTlWx
	+yJ6YJxa3DUfpDEuYqITUJ89TNvZQGbzmxnrWmVNiWu+ZKlpqj+O3LSAElkOeJ+rSI1S
	zvGGhUOYexvNrCnEBdq+7IIFN6ojrfX6U7WbHvNZPbwihe9b6eM0kIHscRtuyXczml1C
	finw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FFI8Cbvlewwlt6+kwGjRmOmp2XA+UZh0ABVDg3VjX4U=;
	b=Ozq+/JPyl07M/Q79bNKqdp4VEPVsYoMozEr4e1dazSsvyv0KhvKD/QoUPZtacCr64m
	5KnQif3bDa+I8ZJIp4dxpPhrtKDRh859c9+gZlXHL2vk1iPRP3FZ5tgAoEvQiN6RcBe9
	y9ZZbG4s3+ofovbd+m2qyuqU5vr4W6ue8Wr52akRS9uAy3sLNWT+M2eWICgT0DdFXKB/
	XeNac5NLXNSFly4ZD/9GJowRJk8uENkzhB8ps5rEALYinfnS7zbwPQJnZXLznN3PuSlj
	xMDkXQUk5NviBLsqSdvMdZyZKYflQYRObY2rz4vnsF5fYu8X0cXLrWNcrdrNSRDDWrVz
	VNFw==
X-Gm-Message-State: ABuFfohF+eSqBuiTbeHwn5bZc+cSn6Z+OpdvGtkulMgJZomKQS8Uk88p
	BamUNsR1VBCVUPscdWEPiRxyvKj3eGA8CjmhjDjhiw==
X-Google-Smtp-Source: ACcGV60xXaQh/sf3IegMiwsZlanOdDI1ZMPamhryqhuJpoGWdAi4hWWFIe15Du4hRrrOn1zLBoEksujUGbv1C8r7PxM=
X-Received: by 2002:a9d:30ae:: with SMTP id s46mr5177253otc.132.1539376495698; 
	Fri, 12 Oct 2018 13:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
	<1539357981-3675-2-git-send-email-akuster808@gmail.com>
	<0256528b-d1aa-75f2-f660-b5e37fddecf3@gmail.com>
In-Reply-To: <0256528b-d1aa-75f2-f660-b5e37fddecf3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Oct 2018 21:34:44 +0100
Message-ID: <CAJTo0La5pEgF85tQ1wjJ86L0d-TKENXogpnQ7GGi0kGQhR2KoQ@mail.gmail.com>
To: dachaac@gmail.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/5] directfb: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 20:34:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DirectFB depending on X11 would be *very wrong*.

Ross
On Fri, 12 Oct 2018 at 18:52, Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@gma=
il.com> wrote:
>
> On 12/10/2018 18.26, Armin Kuster wrote:
>
> > package has depends on vlc and gtk
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >   meta-oe/recipes-graphics/directfb/directfb.inc | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/r=
ecipes-graphics/directfb/directfb.inc
> > index 96aa311..cf8f19a 100644
> > --- a/meta-oe/recipes-graphics/directfb/directfb.inc
> > +++ b/meta-oe/recipes-graphics/directfb/directfb.inc
> > @@ -32,7 +32,8 @@ LDFLAGS_append_arm =3D "${@bb.utils.contains('DISTRO_=
FEATURES', 'ld-is-gold', ' -f
> >
> >   BINCONFIG =3D "${bindir}/directfb-config"
> >
> > -inherit autotools binconfig-disabled pkgconfig
> > +inherit autotools binconfig-disabled pkgconfig distro_features_check
> > +REQUIRED_DISTRO_FEATURES =3D "x11"
> >
> Wrong method?
>
> Quote from:
> https://github.com/DirectFB/directfb
>
> "Optionally, depending on the configuration you want:
>
>     FBDev
>       - Linux kernel 2.2.x or newer with working frame buffer device
>         (check /proc/fb) for the fbdev system.
>
>     SDL
>       - libSDL (Simple Direct Media Layer) for the sdl system.
>
>     X11
>       - libX11 (X11 client library) for the X11 system (libx11-dev and li=
bxext-dev packages)."
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

