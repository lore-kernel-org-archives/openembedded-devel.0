Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id DDABC78B10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:24:05 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id s12-v6so2195830wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pu0KJfmWSIienCXAKqtTIeetemT0hOghhIo88vwixc0=;
	b=YD6X21lgLGeM+P3Ps4+itGPAYfy6ZCHj5iDgMNb3/QpKaEXVoMSPsyXDq3m4MhNgNI
	vygmT2wGoUitobtN3kYYkzuty8K3fQYGbgEES3zeJSuFqJ7bqFNQMFd1Spz5YlXD63Q8
	lbu/UnNZg4dlf/z/onLEUmKLU5H5axrNhDDk2CQl2DTkYweaZLOSNxonhXX+7GFGxmpY
	t245sQXxgBibD+cXMsUCQJtBWfUZvF4TrkcK7usb816z2hxmkmc7URDGBzYuTHHSlAt0
	vMrXmkmJzsrLqv636XmA+Kvl380bAm7o34T3U6MuNUm48hiBJ+pfIq7E0gViPaFgsrjA
	Uzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pu0KJfmWSIienCXAKqtTIeetemT0hOghhIo88vwixc0=;
	b=D1u10NEx7VSQOOwS7bBx8PiWo+I3LexQEchC5JkZA1uNNyLvqAzvoVOL4JDXgicLWo
	C/IqV8Ug3a2Jf6Z20gmd0EmbAwm2IkgyYV8CWYODGi+rVjSwEbjFCwzxox3GXH5KLzOu
	cpsRH2eOJZxTFsCa9hO4zBZdVIExH97dg7oQIawtjCrt0s2P+1IAhYbiRz7XCySFKu7Z
	nhe91FgK/f6+bFt3Jk5t97V9P5rQyWmwDspX83MsgP5ij6gUaHT0ltdHrKhH+quMnGMw
	YAs3t8tCaeN/2y286Tx/Op9RP8kTtEYQ2a2GN8qvWGgFo/xKiPwVue9ieqmEfokFYo0M
	MbjQ==
X-Gm-Message-State: AOUpUlFzlS9EE3DwwxdCq+5e8PlVbA9rJ9wlALpj1mwRZPUTmn6qzblq
	wVh76XnadLmsnZCJV/XzyBvI7G4tZmF8U+vp02o=
X-Google-Smtp-Source: AAOMgpcEzlUFIBbDicmNS84oqxvggV2zzEauQoKiHDCHMiM9fEpMKgQye/tFhOO/C3Jk96Op5+3yma/wUw6l9Oa/igU=
X-Received: by 2002:a1c:b484:: with SMTP id
	d126-v6mr1731699wmf.17.1532615046698; 
	Thu, 26 Jul 2018 07:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180601045815.15819-1-raj.khem@gmail.com>
	<20180601045815.15819-3-raj.khem@gmail.com>
	<CA+chaQe10kmj=fpbQ58brd1G8UfOjPB9dW8XKs1e+gYqOWCM9A@mail.gmail.com>
	<CAMKF1sqhYpv2THHc9-oWDc-5mb0hnaVazN+Q5oDNfeqiQ7N=8Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqhYpv2THHc9-oWDc-5mb0hnaVazN+Q5oDNfeqiQ7N=8Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Jul 2018 16:23:56 +0200
Message-ID: <CA+chaQfcm5Uz3vs=HsCyL6h+1PGuD9KonPH-vd4ZzL=-kkobLA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] openocd: Upgrade to latest tip of master
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
X-List-Received-Date: Thu, 26 Jul 2018 14:24:06 -0000
Content-Type: text/plain; charset="UTF-8"

I'm testing the change which just disables them, I'll send it after few
more builds with it. I'll leave enabling them to someone actually using
openocd.

On Thu, Jul 26, 2018 at 4:21 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jul 26, 2018 at 4:21 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > It probably isn't caused by this upgrade, but openocd is using git
> submodules which are checked out during do_configure:
> >
> > http://repo.or.cz/openocd.git/blob/refs/heads/master:/bootstrap#l37
> >
> > Would it make sense to call bootstrap with nosubmodule?
>
> I think so, we can explicily fetch the submodiule and place it where its
> needed.
>
> >
> > It seems to be used by internal_jimtcl
> > http://repo.or.cz/openocd.git/blob/refs/heads/master:/configure.ac#l574
> > and internal_libjaylink
> > http://repo.or.cz/openocd.git/blob/refs/heads/master:/configure.ac#l679
> >
> > I don't use openocd, I've just noticed random build failure:
> >
> > Makefile.am:23: installing './texinfo.tex'
> > Setting up submodules
> > Submodule 'jimtcl' (http://repo.or.cz/r/jimtcl.git) registered for path
> 'jimtcl'
> > Submodule 'src/jtag/drivers/libjaylink' (
> http://repo.or.cz/r/libjaylink.git) registered for path
> 'src/jtag/drivers/libjaylink'
> > Submodule 'tools/git2cl' (http://repo.or.cz/r/git2cl.git) registered
> for path 'tools/git2cl'
> > Cloning into 'jimtcl'...
> > fatal: unable to access 'http://repo.or.cz/r/jimtcl.git/': Could not
> resolve host: repo.or.cz
> > Clone of 'http://repo.or.cz/r/jimtcl.git' into submodule path 'jimtcl'
> failed
> > WARNING: exit code 1 from a shell command.
> >
> > On Fri, Jun 1, 2018 at 6:58 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Fix build with new libusb and gcc8
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  ...2-deprecated-libusb_set_debug-with-l.patch | 39 +++++++++++++++++++
> >>  .../recipes-devtools/openocd/openocd_git.bb   |  5 ++-
> >>  2 files changed, 42 insertions(+), 2 deletions(-)
> >>  create mode 100644
> meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
> >>
> >> diff --git
> a/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
> b/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
> >> new file mode 100644
> >> index 0000000000..c5b9083dca
> >> --- /dev/null
> >> +++
> b/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
> >> @@ -0,0 +1,39 @@
> >> +From b95a996bfb281104b68ec66f32ebb79db519a4a8 Mon Sep 17 00:00:00 2001
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Thu, 31 May 2018 21:06:46 -0700
> >> +Subject: [PATCH] Fix libusb-1.0.22 deprecated libusb_set_debug with
> >> + libusb_set_option
> >> +
> >> +libusb_set_debug is deprecated in libusb >= 1.0.22 therefore replace
> >> +with equivalent libusb_set_option()  API
> >> +
> >> +see libusb commit for more details
> >> +
> >> +
> https://github.com/libusb/libusb/commit/539f22e2fd916558d11ab9a66f10f461c5593168
> >> +
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> +Upstream-Status: Submitted [http://openocd.zylin.com/#/c/4540/]
> >> + src/jtag/drivers/xds110.c | 5 ++++-
> >> + 1 file changed, 4 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/src/jtag/drivers/xds110.c b/src/jtag/drivers/xds110.c
> >> +index 90b699027..9bfe02ea8 100644
> >> +--- a/src/jtag/drivers/xds110.c
> >> ++++ b/src/jtag/drivers/xds110.c
> >> +@@ -367,8 +367,11 @@ static bool usb_connect(void)
> >> +
> >> +               /* Set libusb to auto detach kernel and disable debug
> messages */
> >> +               (void)libusb_set_auto_detach_kernel_driver(dev, 1);
> >> ++#if LIBUSB_API_VERSION >= 0x01000106
> >> ++              libusb_set_option(ctx, LIBUSB_OPTION_LOG_LEVEL,
> LIBUSB_LOG_LEVEL_NONE);
> >> ++#else
> >> +               libusb_set_debug(ctx, LIBUSB_LOG_LEVEL_NONE);
> >> +-
> >> ++#endif
> >> +               /* Claim the debug interface on the XDS110 */
> >> +               result = libusb_claim_interface(dev, INTERFACE_DEBUG);
> >> +       } else {
> >> +--
> >> +2.17.1
> >> +
> >> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> >> index 67abeede93..84727bf970 100644
> >> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> >> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> >> @@ -5,8 +5,9 @@ DEPENDS = "libusb-compat libftdi"
> >>  RDEPENDS_${PN} = "libusb1"
> >>
> >>  SRC_URI = "git://repo.or.cz/openocd.git \
> >> -"
> >> -SRCREV = "3737dd69e73816d186ba418d7b833462a8041079"
> >> +
>  file://0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch \
> >> +          "
> >> +SRCREV = "cdf1e826eb23c29de1019ce64125f644f01b0afe"
> >>
> >>  PV = "0.10+gitr${SRCPV}"
> >>  S = "${WORKDIR}/git"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

