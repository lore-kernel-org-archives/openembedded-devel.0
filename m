Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlKm-0005rY-LD
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:42:36 +0200
Received: by fxm19 with SMTP id 19so4758840fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=k3rRIAVBNyHox7O8KmFdNgsGDYXiaZUKOLlQhQlXNdg=;
	b=R/MYIlNPZ/oMw4r+fAd24hgDuxgYdpvgGtJwz3uHuRnHCENRZbbZ+5L0Tc7pQwkTMV
	Os0HP93571w0iyeff5ICAfVgodNeQU8g6k5j50E9Dd4vcDmcnHcCavkkv+HCpQk7j2AT
	L6pHrCReUmk9XlsJ9BCfbjUVcSnc1oZNK/kWw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=kBXJHHHq8zuS4IVFabfmJ4okpdEZNVXo36At5eLJK/2mY//g6bIQb9abXtcWcnBvp8
	SAH4tD+9RdriKgUiX4oIBn5XCXat2P1DhtpYqWHntQQ3Hd/xFLLlcv1e/XkvA4TjmDQk
	z6Bs1IgDgxAbHy9B+jyDdN+K+PEDEM6P0r88E=
Received: by 10.223.6.11 with SMTP id 11mr1396271fax.100.1305027591396;
	Tue, 10 May 2011 04:39:51 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id p16sm2344669fax.45.2011.05.10.04.39.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:39:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:39:43 +0200
Message-Id: <cover.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-oe][PATCH 0/9] Pull request #8
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
X-List-Received-Date: Tue, 10 May 2011 11:42:36 -0000

Hi,

please merge small fixes I had in contrib/shr for some time

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-oe
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (8):
  udev: drop udev-compat for zaurus devices
  libxfixes, util-macros: drop from meta-oe, now they are in oe-core
  gst-plugins-base: drop 0.10.30 from meta-oe, there is 0.10.32 in
    oe-core
  xinput-calibrator: add new version 0.7.5 and include .inc to recipe
    directly
  python-argparse: add new recipe to provide argparse module for python
    and python-native older then 2.7
  gdbus-binding-tool: bump SRCREV
  glib-2.0: add git version for 2.29.3+git, which has gdbus-codegen
    included
  connman: drop older 0.72

Simon Busch (1):
  connman: add recipe for the latest released version 0.73

 meta-oe/recipes-connectivity/connman/connman.inc   |    5 +
 .../connman/{connman_0.72.bb => connman_0.73.bb}   |    4 +-
 meta-oe/recipes-core/glib-2.0/glib-2.0.inc         |    6 +
 .../60_wait-longer-for-threads-to-die.patch        |   33 ++++++
 .../glib-2.0/glib-2.0/configure-libtool.patch      |   38 +++++++
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 +++++
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    |   24 +++++
 .../recipes-core/glib-2.0/glib-2.0/no-iconv.patch  |  104 ++++++++++++++++++++
 .../glib-2.0/remove.test.for.qsort_r.patch         |   54 ++++++++++
 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb      |   29 ++++++
 meta-oe/recipes-core/glib-2.0/glib.inc             |   37 +++++++
 meta-oe/recipes-core/udev/udev_165.bb              |   26 -----
 .../gdbus-binding-tool/gdbus-binding-tool_git.bb   |    6 +-
 .../python/python-argparse_1.2.1.bb                |   16 +++
 .../xinput-calibrator/xinput-calibrator.inc        |   12 ---
 .../xinput-calibrator/xinput-calibrator_0.6.1.bb   |   17 ---
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   22 ++++
 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb |   22 ----
 .../xorg-util/util-macros_1.13.0.bb                |   15 ---
 .../xorg-util/xorg-util-common.inc                 |   11 --
 .../gst-plugins-base-tremor.patch                  |   17 ---
 .../gstreamer/gst-plugins-base_0.10.30.bb          |   22 ----
 .../recipes-multimedia/gstreamer/gst-plugins.inc   |   41 --------
 23 files changed, 397 insertions(+), 188 deletions(-)
 rename meta-oe/recipes-connectivity/connman/{connman_0.72.bb => connman_0.73.bb} (80%)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0.inc
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib.inc
 create mode 100644 meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.6.1.bb
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-util/util-macros_1.13.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-util/xorg-util-common.inc
 delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins-base-0.10.30/gst-plugins-base-tremor.patch
 delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins-base_0.10.30.bb
 delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins.inc

-- 
1.7.5.rc3



