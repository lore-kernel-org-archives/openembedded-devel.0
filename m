Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlXI-0007YZ-Nf
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:20:28 +0200
Received: by fxm19 with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=nDlkTDxBihEq2kGXBepdvqB8jHAtU1zyYRA8VkbGPpI=;
	b=tEvvIxZRr0gUmGOLGOIynyJGl9VGlQUF5XymWjK865hJaPQkbGZJnV/IMslll0R/ua
	+rMEOART+U2ZZ18yXjexOJIzgKPy2c3w0Bb/aObOy7IdEnGJrOHZ047oGRdPIcLMcnHH
	oAXdti92GHX+3oCIbaJI6RpR9oH1rqTfgkn0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kFNrJreNHfyuYlGm4y4lVb6ym/kx1IBG7n+RK+jVjD300TTr8jbxWEj3OrBGzO4qG/
	6flECBIt3RWP13pwt7U7fSzEi25ITbuOt1QDcM1hTkvO8k4o4TdKoUUqou9GcSuY8Ehr
	uHKm8mKYljlYx1DdCKQOyDbJ8N44F0V5kk6NA=
Received: by 10.223.28.19 with SMTP id k19mr4627318fac.139.1306696641048;
	Sun, 29 May 2011 12:17:21 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q10sm496711fan.32.2011.05.29.12.17.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:17:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:11 +0200
Message-Id: <cover.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-oe][PATCH 00/16] Pull request #12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 19:20:28 -0000

Hi,

please merge this patchset, after this I have working 3 gps apps 
and I'm closer to shr-full-image from shr-core.

The following changes since commit 7d6edbf446e338643542beab81fecb23340ad65b:

  policykit: drop recipes, oe-core has newer versions named right polkit (2011-05-28 16:42:55 +0200)

are available in the git repository at:
  git+ssh://git@git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/git+ssh://git@git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (16):
  farsight2: fix LICENSE and add LIC_FILES_CHKSUM
  libnice: improve LICENSE and add LIC_FILES_CHKSUM
  tangogps: add LIC_FILES_CHKSUM and drop distro override
  pidgin: add LIC_FILES_CHKSUM
  evtest: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  gpsd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  foxtrotgps: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d
  tiff: add bbappned with native BBCLASSEXTEND
  gd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  librsvg: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  imagemagick: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d
  portaudio: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d
  alsa-oss: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  flite-alsa: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d
  espeak: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  navit: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d

 .../alsa/alsa-oss-1.0.17/libio.patch               |   43 +
 meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb |   22 +
 .../recipes-multimedia/libtiff/tiff_3.8.2.bbappend |    1 +
 meta-oe/recipes-support/espeak/espeak-data_1.37.bb |   27 +
 meta-oe/recipes-support/espeak/espeak.inc          |   10 +
 meta-oe/recipes-support/espeak/espeak_1.37.bb      |   42 +
 meta-oe/recipes-support/evtest/evtest_1.25.bb      |   15 +
 .../recipes-support/farsight/farsight2_0.0.22.bb   |    4 +-
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |    7 +-
 .../flite-alsa-1.3/flite-1.3-alsa_support-1.2.diff | 6615 ++++++++++++++++++++
 .../flite-alsa-1.3-configure-with-audio.patch      |   12 +
 meta-oe/recipes-support/flite/flite-alsa_1.3.bb    |   12 +
 meta-oe/recipes-support/flite/flite.inc            |   34 +
 .../recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb |   16 +
 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb  |   24 +
 .../recipes-support/gpsd/gpsd-2.95/60-gpsd.rules   |   47 +
 meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd        |  136 +
 .../recipes-support/gpsd/gpsd-2.95/gpsd-default    |    5 +
 .../recipes-support/gpsd/gpsd-2.95/libtool.patch   |   16 +
 meta-oe/recipes-support/gpsd/gpsd_2.95.bb          |  102 +
 .../imagemagick-6.4.4/PerlMagic_MakePatch.patch    |   11 +
 .../imagemagick/imagemagick_6.4.4.bb               |   34 +
 meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb  |   42 +
 meta-oe/recipes-support/navit/navit-fpu.inc        |    6 +
 meta-oe/recipes-support/navit/navit-icons/GPL-2    |  339 +
 .../recipes-support/navit/navit-icons/configure.in |   70 +
 meta-oe/recipes-support/navit/navit-icons_svn.bb   |   35 +
 meta-oe/recipes-support/navit/navit.inc            |   93 +
 meta-oe/recipes-support/navit/navit/maps.xml       |   24 +
 meta-oe/recipes-support/navit/navit/navit.xml      |   45 +
 meta-oe/recipes-support/navit/navit/osd.xml        |   15 +
 meta-oe/recipes-support/navit/navit/plugins.xml    |    6 +
 meta-oe/recipes-support/navit/navit/speech.xml     |    8 +
 meta-oe/recipes-support/navit/navit_svn.bb         |    8 +
 meta-oe/recipes-support/pidgin/pidgin.inc          |    3 +-
 .../recipes-support/portaudio/portaudio-v19_svn.bb |   27 +
 meta-oe/recipes-support/tangogps/tangogps.inc      |   15 -
 .../recipes-support/tangogps/tangogps_0.99.4.bb    |   18 +-
 38 files changed, 7968 insertions(+), 21 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/alsa/alsa-oss-1.0.17/libio.patch
 create mode 100644 meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
 create mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend
 create mode 100644 meta-oe/recipes-support/espeak/espeak-data_1.37.bb
 create mode 100644 meta-oe/recipes-support/espeak/espeak.inc
 create mode 100644 meta-oe/recipes-support/espeak/espeak_1.37.bb
 create mode 100644 meta-oe/recipes-support/evtest/evtest_1.25.bb
 create mode 100644 meta-oe/recipes-support/flite/flite-alsa-1.3/flite-1.3-alsa_support-1.2.diff
 create mode 100644 meta-oe/recipes-support/flite/flite-alsa-1.3/flite-alsa-1.3-configure-with-audio.patch
 create mode 100644 meta-oe/recipes-support/flite/flite-alsa_1.3.bb
 create mode 100644 meta-oe/recipes-support/flite/flite.inc
 create mode 100644 meta-oe/recipes-support/foxtrotgps/foxtrotgps_1.0.1.bb
 create mode 100644 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
 create mode 100644 meta-oe/recipes-support/gpsd/gpsd-2.95/60-gpsd.rules
 create mode 100755 meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd
 create mode 100644 meta-oe/recipes-support/gpsd/gpsd-2.95/gpsd-default
 create mode 100644 meta-oe/recipes-support/gpsd/gpsd-2.95/libtool.patch
 create mode 100644 meta-oe/recipes-support/gpsd/gpsd_2.95.bb
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
 create mode 100644 meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb
 create mode 100644 meta-oe/recipes-support/navit/navit-fpu.inc
 create mode 100644 meta-oe/recipes-support/navit/navit-icons/GPL-2
 create mode 100644 meta-oe/recipes-support/navit/navit-icons/configure.in
 create mode 100644 meta-oe/recipes-support/navit/navit-icons_svn.bb
 create mode 100644 meta-oe/recipes-support/navit/navit.inc
 create mode 100644 meta-oe/recipes-support/navit/navit/maps.xml
 create mode 100644 meta-oe/recipes-support/navit/navit/navit.xml
 create mode 100644 meta-oe/recipes-support/navit/navit/osd.xml
 create mode 100644 meta-oe/recipes-support/navit/navit/plugins.xml
 create mode 100644 meta-oe/recipes-support/navit/navit/speech.xml
 create mode 100644 meta-oe/recipes-support/navit/navit_svn.bb
 create mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
 delete mode 100644 meta-oe/recipes-support/tangogps/tangogps.inc

-- 
1.7.5.rc3



