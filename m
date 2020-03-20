Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 81EAF611CD
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2020 01:40:57 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d11so5406366qko.3
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Mar 2020 18:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=33rqAlOswivNGqW8hv2SnO2HFKDAIng3eVH4/U9yZXY=;
	b=H2OVkqZ/lJ0A2ZenLxQmKZB+hBeAP+Eusfhh/20Z6tzMYuOKHvaExvd9aV6uH1WkWY
	hgeSiOJgW0XYFgmyjN953wk2i9dH5oyv+lrM9H+m58X1fl6xi6fQA9ep+3NQuFsxe26u
	G6rt8ex959sfrBP8yEH5YutPzxhcQvBTXduO1yrfxXo3H8uO/Kf9v7opER0cV45rwRXz
	6Gbd2wS6Vzhjp8vDlFNkzmr8SeXXi9YCNo/jq8uG0o3/s7w8UG1PDxfVpskxzRL+k7+h
	BPeC/d1jRo8xtJcaLscWtP/NmKZeKD0HSQk7KiOuUqJNCEgUrtoP+ApPE1feWyYIL4bS
	n6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=33rqAlOswivNGqW8hv2SnO2HFKDAIng3eVH4/U9yZXY=;
	b=YO/JeS2n1RTjrwB4DQGN1izkQ6zxPyhEAhnKoYv1IJWxT/M70B7n2dmKE71v4Thjkx
	hyiWyGJKQOBmRvjNfL1O7rdC3exg40oZrWtc44GoDIvyIewAHE1I8s8UVDJHulw7bM6G
	IRQSu2uTYXDpHkcMrG6Wkin371W/aENuwkI3vt72JXDF5S54R3olUmzfSVvxoFjSi4bK
	lTEwZ102hnx3ZEC615oIagcZZ/9AF+uMP00EGZYAOOwFJIceQ6j1/Xuo6VVQHpCYbzGI
	7GA/O0u6HAEWEonhvMbJyWw/yZuymdorg+1Ro4Qe6exJB/fjG0QZUB1LqaPwyHnq3j27
	Ub/A==
X-Gm-Message-State: ANhLgQ1xi/d4yPzT8XjNeolMB+qrTncDL0GR/m+yR5bwafT2e25RvN7Y
	mKtICjYjeN6F9O1A+Ksd0WsfvgEPeUdUDmSgKPI=
X-Google-Smtp-Source: ADFU+vtxmi14GcztEDkGOPo+rCHRoeb/0HkJGlUKoo//gn/78x7mcjFu7fVrEZB2H/YbSTspd7uvFFgXozNP3seJHD0=
X-Received: by 2002:a37:bd81:: with SMTP id n123mr1775942qkf.431.1584668458052;
	Thu, 19 Mar 2020 18:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583981708.git.akuster808@gmail.com>
	<CAMKF1sooQTeEkmOSu+torVhMZ8R_3FqCzEOWwRMT0drKpAOZDw@mail.gmail.com>
	<0eab7733-7605-ff7f-a7af-c4f8e93aa258@gmail.com>
In-Reply-To: <0eab7733-7605-ff7f-a7af-c4f8e93aa258@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Mar 2020 18:40:31 -0700
Message-ID: <CAMKF1sph-7S8LzrPJyFujvpQdhtuoKtBiaQY5Dxz4RXz5GL0ww@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Fri, 20 Mar 2020 01:40:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 19, 2020 at 4:16 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 3/19/20 1:44 AM, Khem Raj wrote:
> > look
> What does that mean?

`s OK` got stuck in transmission.

>
> - armin
> >
> > On Wed, Mar 11, 2020 at 7:58 PM Armin Kuster <akuster808@gmail.com> wrote:
> >> Here is the next set for meta-openembedded.
> >> Please have reviews back by Friday.
> >>
> >> The following changes since commit bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:
> >>
> >>   fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
> >>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut
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
> >>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb} (95%)
> >>  create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
> >>  create mode 100644 meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
> >>  create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch
> >>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} (73%)
> >>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} (74%)
> >>  rename meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb => sjf2410-linux-native_git.bb} (72%)
> >>  rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb => usbpath_git.bb} (68%)
> >>  rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb => wmiconfig_git.bb} (58%)
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

