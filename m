Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4095779BA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 19:30:39 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v1-v6so6468530qtq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 12:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TEoOGSC9w5tZ6Nfw8AkzLI2nfVwLZMsDcV9zvSyAtUc=;
	b=mcdAeJgeo13qOs9aFMF9AzjMwPU9HyN6NL++SMrZMXYY56clMEvOVGWgpQhZUhD9tt
	3aZ1hGJNtQBfgrlNkb/OXIz87GxLjoJunNYQ6q7IlTRogkz+rkJx7E8Gp3SGVILQ8Su8
	iZK1o+hgy/ayziTGswgGN2QxjVJovTYm1zdApyD0+02P7Q2Hr510Ud21cSlUU5GCuiy2
	OTa1leOQENvOGxAl5T/7ZxdRIfPwfc2p1w33MhcEFfzBXUsvLKTZXAi7tjUOjmGR1ngH
	OTb5VfyVMDT/e9POpAFnwWx1uW3GMrdVD8sNUVcP2FLmMkRJ4994rNE8E+/Qr11hPuvd
	dpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TEoOGSC9w5tZ6Nfw8AkzLI2nfVwLZMsDcV9zvSyAtUc=;
	b=h9yni9WfWNFDhfYFRRmkgnAmJgFYKaRDeKD3Ll26BNIVo4n/BLOivT2EQy/0IPbedi
	UCNtylpIzXyqKl/ddpxPLE1x+X5H0BIicXR7mkmcBdS990cy0ooCTi42nwg4vvFOcV0N
	F7QxLu0UjSmudmgsm4/TfBWl/lvpkLS+Yq/oIBxedfeStSBIwzkBmQB7/9/0XYXOdFHL
	U3yx1eg7a50If9n3/yQL7N072GE7lzyZlOJ8Z2E8gsuXJOAvzu3YKnog3XBC50MySfMR
	AHIY/d34NwdSu9fNKAFe5TrzfVPrfDmeq/4Upg0KsL4dB5KyXeBnECOy2b2mgo3eLS24
	V99g==
X-Gm-Message-State: AGRZ1gLOFQuth9zufzfHiCR5I5OhxE/OiAfKIZLjT1GTUA+OSDzIXujx
	IcJ1r1gBX7FDSoH2uu3UAbBh6E3PrSHlhQTC0fg=
X-Google-Smtp-Source: AJdET5feJPJTqGe2lpMAA7IsALLUJRtWp6TVvYzU9oRpHKqcdNTLhRKjUKK18Ev6M557mXpDfr2oM+kjIyPGiTY+aBY=
X-Received: by 2002:aed:3e94:: with SMTP id
	n20-v6mr13994339qtf.196.1540841439922; 
	Mon, 29 Oct 2018 12:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<4a7b04c4d262dafef02e120102f054f64bb95c69.1540830650.git.brendank310@gmail.com>
	<CAJTo0LaqiCwZXZjKwGfX8qwHLrX20_hOaOzwBs7q5XsO+fj+xA@mail.gmail.com>
	<CAKPa3c0GduyOjSnd1UQMFjNmm6B3VXHB_C-6-BUAhUuNfXG6sA@mail.gmail.com>
In-Reply-To: <CAKPa3c0GduyOjSnd1UQMFjNmm6B3VXHB_C-6-BUAhUuNfXG6sA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 12:30:28 -0700
Message-ID: <CAMKF1sqLbXb_w7Cw2Qb2kar-D7t7pV3GLmK+-tbbbN41XQHfKg@mail.gmail.com>
To: Brendan Kerrigan <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 10/16] dconf-native: add dconf-native recipe
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
X-List-Received-Date: Mon, 29 Oct 2018 19:30:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 11:27 AM Brendan Kerrigan <brendank310@gmail.com>
wrote:

> I had initially tried to get the native recipe integrated into it, by
> inheriting the native class but was unable to get that to work. Using the
> above, I get the following:
>
> ERROR: Required build target 'gdm' has no buildable providers.
> Missing or unbuildable dependency chain was: ['gdm', 'dconf-native',
> 'glib-2.0-utils-native']
>
> Any thoughts on how to resolve this? Should I also be providing a
> glib-2.0-utils-native package?
>

Just add that dependency to target only recipe via class-target override
perhaps

>
> Thanks,
> Brendan
>
> On Mon, Oct 29, 2018 at 2:06 PM Burton, Ross <ross.burton@intel.com>
> wrote:
>
> > There's already a dconf in meta-gnome, so just add
> > BBCLASSEXTEND="native nativesdk".
> >
> > Ross
> > On Mon, 29 Oct 2018 at 16:43, brendank310 <brendank310@gmail.com> wrote:
> > >
> > > From: Brendan Kerrigan <kerriganb@ainfosec.com>
> > >
> > > gdm recipe requires a native dconf tool.
> > >
> > > Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> > > ---
> > >  .../dconf/dconf-native_0.28.0.bb              | 19
> +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >  create mode 100644 meta-gnome/recipes-gnome/dconf/
> > dconf-native_0.28.0.bb
> > >
> > > diff --git a/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
> > b/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
> > > new file mode 100644
> > > index 000000000..ee78fbb66
> > > --- /dev/null
> > > +++ b/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
> > > @@ -0,0 +1,19 @@
> > > +SUMMARY = "configuation database system"
> > > +LICENSE = "LGPLv2.1"
> > > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> > > +SECTION = "x11/gnome"
> > > +
> > > +SRC_URI[archive.md5sum] = "81faa8e68e5ea71ff0ee75050fc0759c"
> > > +SRC_URI[archive.sha256sum] =
> > "61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742"
> > > +
> > > +DEPENDS = "dbus glib-2.0 intltool-native"
> > > +
> > > +GNOMEBASEBUILDCLASS = "meson"
> > > +
> > > +inherit gnomebase gsettings bash-completion vala native
> > > +
> > > +FILES_${PN} += " \
> > > +    ${datadir}/dbus-1 \
> > > +    ${libdir}/gio/modules/*.so \
> > > +    ${bindir}/dconf \
> > > +"
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

