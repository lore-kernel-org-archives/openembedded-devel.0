Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id CCD186FE6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 18:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 54AAA3A070F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 14:50:02 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id SZaQJf6xXbmY
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 14:50:00 -0400 (EDT)
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.rogue-research.com (Postfix) with ESMTPSA id F15F33A070DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 14:49:59 -0400 (EDT)
Received: by mail-ve0-f172.google.com with SMTP id jz11so2741556veb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 11:49:59 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.221.44.73 with SMTP id uf9mr5465567vcb.9.1403203799299; Thu,
	19 Jun 2014 11:49:59 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Thu, 19 Jun 2014 11:49:59 -0700 (PDT)
Date: Thu, 19 Jun 2014 14:49:59 -0400
Message-ID: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: [yocto][meta-qt5][daisy] Error during bitbake of my image
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
X-List-Received-Date: Thu, 19 Jun 2014 18:50:08 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I started by adding all recipes into my image to try to test as much
as possible:

  ruby \
  qtbase \
  qtconnectivity \
  qtdeclarative \
  qtgraphicaleffects \
  qtimageformats \
  qtlocation \
  qtmultimedia \
  qtquick1 \
  qtquickcontrols \
  qtscript \
  qtsensors \
  qtserialport \
  qtsvg \
  qtsystems \
  qttools \
  qtwebkit \
  qtwebkit-examples \
  qtx11extras \
  qtxmlpatterns \
  qsiv \
  packagegroup-qt5-qtcreator-debug \
  packagegroup-qt5-toolchain-target \
  meta-toolchain-qt5 \
  maliit-framework-qt5 \
  maliit-plugins-qt5 \
  cinematicexperience \

Then start removing these with error:

ERROR: qtwebkit-examples_5.2.1.bb, do_configure) failed with exit code '1'
LOG: http://pastebin.com/qnNStaBE

Remove qtwebkit-examples
ERROR: qtgraphicaleffects not found in the base feeds
ERROR: Function failed: do_rootfs
LOG: http://pastebin.com/FTuE5xzg

Remove qtgraphicaleffects
ERROR: meta-toolchain-qt5 not found in the base feeds
ERROR: Function failed: do_rootfs
This one I was expecting it to fail since it's the toolchain...

Remove meta-toolchain-qt5
ERROR: qtwebkit not found in the base feeds
ERROR: Function failed: do_rootfs
LOG: http://pastebin.com/ZpKC5xwU

Remove qtwebkit
ERROR: qtquickcontrols not found in the base feeds
ERROR: Function failed: do_rootfs
LOG: http://pastebin.com/S2Zn1WMj

Remove qtquickcontrols
ERROR: Unable to install packages
error: Can't install qtwebkit-dev-5.2.1-r0@armv7a_vfp_neon: no package
provides qtwebkit = 5.2.1-r0
ERROR: Function failed: do_rootfs
LOG: http://pastebin.com/E7DspaJy

So I drastically remove  all these to have image that complete.
 qtx11extras
 qtxmlpatterns
 qsiv
 packagegroup-qt5-qtcreator-debug
 packagegroup-qt5-toolchain-target
 maliit-framework-qt5
 maliit-plugins-qt5
 cinematicexperience

[1] What will be the recommended recipes to enable to have an image
that contain the defaults setup settings as when we download the qt
for desktop (qt-opensource-linux-x64-1.6.0-3-online.run)?

[2] Any idea why I'm having these do_rootfs error?

[3] What I'm trying to do is replicate what QtDD13 - Andy Nichols -
Developing Embedded Linux Applications with Qt
(https://www.youtube.com/watch?v=lyQVw1RtaH4) have done with
buildroot. Any advise on how to proceed?

BR,

-KA

