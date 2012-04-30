Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkK5-000464-AD
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:43:01 +0200
Received: by wgbdr1 with SMTP id dr1so2077776wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=M5+huoVZCCx3JE4krpfw/u3y6XiUDpcmR7lJWDvBlVQ=;
	b=FrejWTXQNbQcvUiazxzDDBwHTQKEbFx3WMzySe0UFre0ALXGdJ1tYgNwe6AqRHkomG
	rpU2D5+CHirQjzhiwgoV3seXbSdUhjXFET7U+1q2xq/4lplp8AmwHVdBCEGd1mrKVW40
	+XnvaJlVmX/br0khE5vL+NbmpqsOwCy0siaPh9XdTYgSDsGD3TItfSAsJQRXlrxj4vLQ
	yS8lJYxrbHh1efJacHKT2/KbC1weU3wsPNKVxvMKw5CK1WovmiVBiwyOFXehJ9tM4iG3
	aQPnLgv50kZePSYvfEt3O7+sgWyLo7thizfoVi8v+HesVen4G6MtUgh44ntGSG1uRKZ5
	I7sg==
Received: by 10.216.141.134 with SMTP id g6mr962999wej.12.1335767599892;
	Sun, 29 Apr 2012 23:33:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 6sm26400808wiz.1.2012.04.29.23.33.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:33:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:32:57 +0200
Message-Id: <cover.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 00/16] gpsd upgrade
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
X-List-Received-Date: Mon, 30 Apr 2012 06:43:01 -0000

Scons build is a bit mess, that's why I've kept most changes as separate patches
to make review easier and provide reasoning for each change in commit message.

Some changes seem more like distutils/scons.bbclass fixups which should be fixed
elsewhere, but this makes it built with only QA warning about hotplug script
accessing prefix from base_prefix, which I'm not going to fix. (there was about 20
QA errors about rpaths etc before..)

I've also kept 3.5 and git recipe, because only 3.4 was tested in runtime by Denis
and 3.5+git need a bit different set of patches.

The following changes since commit 8f9b2e3a102e66426ce5b269a6827fc6a3218bef:

  kernel bbclass: recreate uImage unless KEEPUIMAGE is set (2012-04-27 21:57:32 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/gpsd
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/gpsd

Denis 'GNUtoo' Carikli (1):
  gpsd: update to 3.4

Martin Jansa (15):
  gpsd: move files to gpsd dir as they are not version specific
  gpsd-3.4: minor style issues
  gpsd-3.4: drop pkgconfig=''
  gpsd-3.4: fix DSO build correctly
  gpsd: pass sysroot param to scons and fix SConstruct to respect that
  gpsd: export PKG_CONFIG with PKG_CONFIG_SYSROOT_DIR
  gpsd: use gpsd.service and gpsd.socket from source tree, drop local
    files
  gpsd: replace whole do_install from scons.bbclass
  gpsd: remove RPATH from binaries instead of replacing it with
    redundant /usr/lib
  gpsd: add recipe for 3.5 with negative D_P for testing
  gpsd: add git recipe with negative D_P for tests
  gpsd-3.4: fix python paths and RPATHs
  gpsd: fix python paths and RPATHs
  gpsd: add chrpath-native to depends
  gpsd: disable docs generation

 .../recipes-navigation/gpsd/gpsd-2.96/gpsd.service |    9 --
 .../recipes-navigation/gpsd/gpsd-2.96/gpsd.socket  |    9 --
 ...t-fix-DSO-build-for-ntpshm-garmin_monitor.patch |   41 ++++++
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |   72 +++++++++++
 ...disable-html-and-man-docs-building-becaus.patch |   49 ++++++++
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |   72 +++++++++++
 ...respect-sysroot-setting-when-prepending-L.patch |   36 ++++++
 ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |   29 +++++
 ...strptime-prototype-is-not-provided-unless.patch |   39 ++++++
 .../gpsd/gpsd/0004-SConstruct-remove-rpath.patch   |   41 ++++++
 .../gpsd/{gpsd-2.96 => gpsd}/60-gpsd.rules         |    0
 .../gpsd/{gpsd-2.96 => gpsd}/gpsd                  |    0
 .../gpsd/{gpsd-2.96 => gpsd}/gpsd-default          |    0
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |  127 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |  128 ++++++++++++++++++++
 .../gpsd/{gpsd_2.96.bb => gpsd_git.bb}             |   87 ++++++++-----
 16 files changed, 688 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.service
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.socket
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0004-SConstruct-remove-rpath.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.96 => gpsd}/60-gpsd.rules (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.96 => gpsd}/gpsd (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.96 => gpsd}/gpsd-default (100%)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
 rename meta-oe/recipes-navigation/gpsd/{gpsd_2.96.bb => gpsd_git.bb} (53%)

-- 
1.7.8.6



