Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0590A70195
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 22:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 4A0423A15D08
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 18:30:14 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id h1OCTFSsBTqn
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 18:30:09 -0400 (EDT)
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.rogue-research.com (Postfix) with ESMTPSA id BC58B3A15CFC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 18:30:09 -0400 (EDT)
Received: by mail-ve0-f171.google.com with SMTP id jz11so4127662veb.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 15:30:09 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.58.246.132 with SMTP id xw4mr5441675vec.2.1403303409077;
	Fri, 20 Jun 2014 15:30:09 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Fri, 20 Jun 2014 15:30:09 -0700 (PDT)
In-Reply-To: <20140620081307.GW2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
Date: Fri, 20 Jun 2014 18:30:09 -0400
Message-ID: <CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jun 2014 22:30:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 20, 2014 at 4:13 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> PACKAGECONFIG_append_pn-qtbase = " icu"
>

Thank you very much for that example!

> You'll probably want also gl and accessibility.

Since I'm trying to build it for arm/omap3, gl should be replace for gles2!?

qtbase.inc
PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"

So far here what my image contain and gives me successful image:

PACKAGECONFIG_append_pn-qtbase = " \
  developer \
  tests \
  examples \
  icu \
  alsa \
  gles2 \
  accessibility \
  glib-2.0 \
  tslib \
  linuxfb \
  sqlite3 \
"

IMAGE_INSTALL += " \
  bzip2 \
  u-boot \
  u-boot-fw-utils \
  psplash \
  ruby \
  qtbase \
  qtbase-fonts \
  qtbase-fonts-ttf-vera \
  qtbase-fonts-ttf-dejavu \
  qtbase-fonts-pfa \
  qtbase-fonts-pfb \
  qtbase-fonts-qpf \
  qtbase-tools \
  qtbase-plugins \
  qtbase-dev \
  qtdeclarative-qmlplugins \
  qtdeclarative-tools \
  qtdeclarative-plugins \
  qtdeclarative-dev \
  qtdeclarative \
  qtscript \
  qtsensors \
  qtserialport \
  qtsvg \
  libxslt \
  icu \
  glib-2.0 \
  sqlite3 \
  qtxmlpatterns \
  qtquick1 \
  tiff \
  qtimageformats \
  qtmultimedia \
  alsa-lib \
  qtlocation \
  qt3d \
"

[1] I still don't understand why adding qtwebkit IMAGE_INSTALL make my
build fail with:
ERROR: qtwebkit not found in the base feeds
LOG: http://pastebin.com/fx2Zi9vW
Any clue what I'm doing wrong?

BR,

-KA

