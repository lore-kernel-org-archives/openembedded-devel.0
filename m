Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 76B0760CBD
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2020 00:23:35 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id h3so4079788ils.3
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Mar 2020 17:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vvPVi/iEwYioR1u5nts/LjT8YjNVnoRdiAlOZLVJx/8=;
	b=upo1WDFDLUIQi/K1FMxX038MWxZ1yzhZcHlm7Tx7QgyholtEXUZPupmcnNuVC0PX04
	xy9rY2V3Lntn0cokk0Bc1/CH9rdxQM0UnsixAofqSLA2It8sMyubNiWFrzcKtGRZ3oV3
	OonZXHIeeP0Z/2s5J4q23Sc91SRYeKFOclxegCIUpRPFwLo5MT9Em8OZlTBe/z2s6+Mf
	PU5g1llKEPcXbSYnXScF/YMk02f15uP0zsDnVxgeszVtikVCLkmY61mDADMZ2we7gqEm
	dD6iva67h7Vc1Ub/8gqtABqLetsMI/zxFNEbFmxWtAS7rowuB9pyokZ01OTLTdioFyk9
	X2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vvPVi/iEwYioR1u5nts/LjT8YjNVnoRdiAlOZLVJx/8=;
	b=mnzTbX/IdF0a228u95gLRCYpl6bxMT+nS9YxuMhUX6KP3IQ0QyL74BJ9d2ewAD3BtT
	0EJcs7g3A2FZ1qB6icjVKSjx4bAK2Ee4bHil4i6rm20L+cPWINy/sSqj/4KvbaMbTf7V
	GfEyN/i7nVMIFBj3lhthVRqIuHwpRLAPr0prxpdZSfOfm2k0bTW+6L+QOluKehGLtkRl
	P3hY6ZFF45KXdxzkWMdOJqMYhbodpqvcytMgW67llHw7wNU4OgO/x0erobKUHYpZaRak
	tjKCJt5jPcI/wzwY65rcz8EieK018pBLpNCCXEXo28voRdHTExoYO/1kxYKt0vGcCWHS
	vd4w==
X-Gm-Message-State: ANhLgQ0WIrHscXwiTpUMsX1jD8SFK6K8Nz61sKUhxmW6LoPYWf8AmNyy
	SyqjVG4nkiEp+JwYxOrGCm5ik9roiul34F4fSn0=
X-Google-Smtp-Source: ADFU+vv386xfgLZ43k8CLinrEBiR+spkARqM4wPxsDgxIHknWCjZVadMsfwEMVg5P1Y/Me8ghpeVawd0hjEGlUhsd4U=
X-Received: by 2002:a92:d304:: with SMTP id x4mr5708531ila.151.1584663816286; 
	Thu, 19 Mar 2020 17:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583981708.git.akuster808@gmail.com>
	<CAMKF1sooQTeEkmOSu+torVhMZ8R_3FqCzEOWwRMT0drKpAOZDw@mail.gmail.com>
	<0eab7733-7605-ff7f-a7af-c4f8e93aa258@gmail.com>
In-Reply-To: <0eab7733-7605-ff7f-a7af-c4f8e93aa258@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 19 Mar 2020 17:23:25 -0700
Message-ID: <CANx9H-Bz_BqSYfgaXX8oXve6SsWj4yXCuBtvS++3B7dtsfTf-w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [zeus 00/13] Patch review
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
X-List-Received-Date: Fri, 20 Mar 2020 00:23:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 19, 2020 at 4:16 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 3/19/20 1:44 AM, Khem Raj wrote:
> > look
> What does that mean?


This is an all time favorite terse Khem review!


> - armin
> >
> > On Wed, Mar 11, 2020 at 7:58 PM Armin Kuster <akuster808@gmail.com>
> wrote:
> >> Here is the next set for meta-openembedded.
> >> Please have reviews back by Friday.
> >>
> >> The following changes since commit
> bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:
> >>
> >>   fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
> >>
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
> >>
> >> Adrian Bunk (1):
> >>   wireshark: Upgrade 3.0.6 -> 3.0.8
> >>
> >> Carlos Rafael Giani (1):
> >>   opencv: Enable pkg-config .pc file generation
> >>
> >> Khem Raj (2):
> >>   ade: Fix install paths in multilib builds
> >>   sanlock: Replace cp -a with cp -R --no-dereference
> >>
> >> Martin Jansa (1):
> >>   s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath, wmiconfig:
> >>     use git fetcher instead of svn fetcher
> >>
> >> Mike Krupicka (1):
> >>   mosquitto: Use mosquitto.init for daemon init
> >>
> >> Paul Barker (1):
> >>   lmsensors: Fix sensord dependencies
> >>
> >> Peter Kjellerstedt (2):
> >>   lvm2, libdevmapper: Do not patch configure
> >>   libldb: Do not require the "pam" distro feature to be enabled
> >>
> >> Ross Burton (4):
> >>   opencv: don't download during configure
> >>   opencv: also download face alignment data in do_fetch()
> >>   opencv: PACKAGECONFIG for G-API, use system ADE
> >>   opencv: abort configure if we need to download
> >>
> >>  .../mosquitto/files/mosquitto.init            |  2 +-
> >>  .../recipes-support/libldb/libldb_1.5.6.bb    |  3 +-
> >>  ...{wireshark_3.0.6.bb => wireshark_3.0.8.bb} |  4 +-
> >>  .../recipes-bsp/lm_sensors/lmsensors_3.5.0.bb |  3 +-
> >>  ...cp-a-with-cp-R-no-dereference-preser.patch | 51 +++++++++++++++++++
> >>  .../recipes-extended/sanlock/sanlock_3.8.0.bb |  4 +-
> >>  ...gure-Fix-setting-of-CLDFLAGS-default.patch | 34 +------------
> >>  ...tallDirs-for-detecting-install-paths.patch | 39 ++++++++++++++
> >>  meta-oe/recipes-support/opencv/ade_0.1.1f.bb  |  1 +
> >>  .../opencv/opencv/download.patch              | 32 ++++++++++++
> >>  .../recipes-support/opencv/opencv_4.1.0.bb    | 32 ++++++++++--
> >>  ...3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} |  7 ++-
> >>  ...3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} |  6 +--
> >>  ...ive_svn.bb => sjf2410-linux-native_git.bb} | 11 ++--
> >>  .../{usbpath_svn.bb => usbpath_git.bb}        | 10 ++--
> >>  .../{wmiconfig_svn.bb => wmiconfig_git.bb}    | 13 +++--
> >>  16 files changed, 183 insertions(+), 69 deletions(-)
> >>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb
> => wireshark_3.0.8.bb} (95%)
> >>  create mode 100644
> meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
> >>  create mode 100644
> meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
> >>  create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch
> >>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb
> => s3c24xx-gpio_git.bb} (73%)
> >>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb
> => s3c64xx-gpio_git.bb} (74%)
> >>  rename meta-oe/recipes-support/samsung-soc-utils/{
> sjf2410-linux-native_svn.bb => sjf2410-linux-native_git.bb} (72%)
> >>  rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb =>
> usbpath_git.bb} (68%)
> >>  rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb =>
> wmiconfig_git.bb} (58%)
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

