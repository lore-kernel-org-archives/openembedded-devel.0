Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9CF6E9A6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:11 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so2664731eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=m4f6FQO5UCzpp+Et8pW5pyK/U90bJwpJ5/KsbAb2zfg=;
	b=0xuqhki9Fru+/mFycKrJt6QfXTk5k5CAXHM6hLPAH9Hrh7dQCDd5ihbIQXL/xYNpRW
	cqaU29J4RcxOC1yK/o3VSjG9C2NqzIjFNeQ9NbLEhMaqxv6iZ3OJnaGKhRwdzxTYasxU
	lFaiviRBx+Zbj56rGh3PZ2a7V1e4+tATCdm9BSl41vjtYs6A85zcMxuqS3me4xELg/W8
	EwMmy3CgDxdO2XiuDkstQo0Akw16jcKhEngsVfBIDhCrJqk6MaclP3U2v29+IrMstLVq
	G51W5l2O6uIFft2YnsAybDWy4EaChpwQhzNvkt9CJ2YWXdRVlskwjugQOPOspdXAAdJ5
	Y1vQ==
X-Received: by 10.14.100.204 with SMTP id z52mr250243eef.68.1391240051779;
	Fri, 31 Jan 2014 23:34:11 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id u7sm46333845eep.11.2014.01.31.23.34.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:33:56 +0100
Message-Id: <cover.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 00/20] EFL 1.8 and friends
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:11 -0000

The following changes since commit 6572316557e742c2dc93848e4d560242bf0c3995:

  yaffs2-utils: Fix formatting, drop PR (2014-01-23 10:04:37 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Martin Jansa (20):
  efl: upgrade from separate recipes to shared efl-1.8.5
  efl: Adjust packaging to match more with old 1.7 separate recipes
  python-efl: upgrade from separate recipes to shared python-efl-1.8.1
  python-efl: update packaging to match old packages
  elementary: upgrade to 1.8.4
  elementary: Add PACKAGECONFIG for ewebkit and disable it by default
  terminology: upgrade to 0.4.0
  evas-generic-loaders: upgrade to 1.8.1
  emotion-generic-players: add recipe for 1.8.1
  e-wm: Drop evas-.*-loader.* from RDEPENDS
  e-wm: Add recipe for 0.18.2
  enjoy: switch from svn to newer git and update dependency from edbus2
    to eldbus
  edbus: remove old edbus(1) svn recipe
  webkit-efl: Add recipe with snapshot from r159807
  webkit-efl: Try to disable llint/jit to fix armv[45] build
  eve: bump SRCREV and update dependency from edbus2 to eldbus
  libeflvala: Fix build of tests
  elfe: Replace svn with git version
  packagegroup-efl-sdk: Update SDK-EFL for shared source tree efl
  expedite: Replace old svn recipe with git version

 meta-efl/conf/layer.conf                           |   1 +
 meta-efl/recipes-devtools/python/python-ecore.inc  |   5 -
 .../recipes-devtools/python/python-ecore_1.7.0.bb  |   5 -
 .../recipes-devtools/python/python-ecore_svn.bb    |   8 -
 meta-efl/recipes-devtools/python/python-edbus.inc  |  50 ++++-
 .../recipes-devtools/python/python-edbus_1.7.0.bb  |   3 +-
 .../recipes-devtools/python/python-edbus_svn.bb    |   8 -
 meta-efl/recipes-devtools/python/python-edje.inc   |   6 -
 .../python-edje/0001-fix-unicode-conversion.patch  |  38 ----
 .../recipes-devtools/python/python-edje_1.7.0.bb   |   6 -
 .../recipes-devtools/python/python-edje_svn.bb     |  10 -
 meta-efl/recipes-devtools/python/python-efl.inc    |  69 ++++--
 .../recipes-devtools/python/python-efl_1.8.1.bb    |   4 +
 .../recipes-devtools/python/python-elementary.inc  |   5 -
 .../python/python-elementary_1.7.0.bb              |   5 -
 .../python/python-elementary_svn.bb                |   8 -
 .../recipes-devtools/python/python-emotion.inc     |   5 -
 .../python/python-emotion_1.7.0.bb                 |   5 -
 .../recipes-devtools/python/python-emotion_svn.bb  |   8 -
 meta-efl/recipes-devtools/python/python-evas.inc   |   4 -
 .../recipes-devtools/python/python-evas_1.7.0.bb   |   5 -
 .../recipes-devtools/python/python-evas_svn.bb     |   8 -
 meta-efl/recipes-efl/e17/e-wm.inc                  |  18 +-
 meta-efl/recipes-efl/e17/e-wm_0.17.5.bb            |  12 +
 meta-efl/recipes-efl/e17/e-wm_0.18.3.bb            |  20 ++
 .../recipes-efl/e17/{elfe_svn.bb => elfe_git.bb}   |  11 +-
 ...position-as-percent-and-define-a-1-second.patch |  14 +-
 .../recipes-efl/e17/{enjoy_svn.bb => enjoy_git.bb} |  12 +-
 meta-efl/recipes-efl/e17/eve_svn.bb                |   4 +-
 meta-efl/recipes-efl/e17/terminology.inc           |   1 -
 meta-efl/recipes-efl/e17/terminology_0.3.0.bb      |  10 -
 meta-efl/recipes-efl/e17/terminology_0.4.0.bb      |   8 +
 meta-efl/recipes-efl/efl/ecore_1.7.9.bb            | 124 -----------
 meta-efl/recipes-efl/efl/edbus2.inc                |  11 -
 meta-efl/recipes-efl/efl/edbus2_svn.bb             |  14 --
 meta-efl/recipes-efl/efl/edbus_svn.bb              |  13 --
 meta-efl/recipes-efl/efl/edje_1.7.9.bb             |  72 ------
 meta-efl/recipes-efl/efl/eet_1.7.9.bb              |  30 ---
 meta-efl/recipes-efl/efl/eeze_1.7.9.bb             |  23 --
 meta-efl/recipes-efl/efl/efl.inc                   | 248 +++++++++++++++++++++
 ...igure.ac-Don-t-check-for-Xprint-extension.patch |  27 +++
 meta-efl/recipes-efl/efl/efl_1.8.5.bb              |  17 ++
 meta-efl/recipes-efl/efl/efreet_1.7.9.bb           |  22 --
 meta-efl/recipes-efl/efl/eina_1.7.9.bb             |  19 --
 meta-efl/recipes-efl/efl/eio_1.7.9.bb              |  15 --
 meta-efl/recipes-efl/efl/elementary.inc            |  30 ++-
 ...e-elm_prefs_cc-and-elementary_codegen-def.patch |  61 +++++
 meta-efl/recipes-efl/efl/elementary_1.7.9.bb       |   8 -
 meta-efl/recipes-efl/efl/elementary_1.8.4.bb       |  12 +
 meta-efl/recipes-efl/efl/embryo_1.7.9.bb           |  20 --
 .../recipes-efl/efl/emotion-generic-players.inc    |  12 +
 .../efl/emotion-generic-players_1.8.1.bb           |   8 +
 meta-efl/recipes-efl/efl/emotion_1.7.9.bb          |  22 --
 meta-efl/recipes-efl/efl/ethumb_1.7.9.bb           |  27 ---
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |  49 +++-
 .../recipes-efl/efl/evas-generic-loaders_1.7.9.bb  |   8 -
 .../recipes-efl/efl/evas-generic-loaders_1.8.1.bb  |   8 +
 ...s_font_load-Fix-build-with-newer-freetype.patch |  26 ---
 meta-efl/recipes-efl/efl/evas_1.7.9.bb             | 178 ---------------
 meta-efl/recipes-efl/efl/expedite_git.bb           |  11 +
 meta-efl/recipes-efl/efl/expedite_svn.bb           |  13 --
 .../efl/libeflvala/disable.eina.test.patch         |  44 ++++
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |   1 +
 .../packagegroups/packagegroup-efl-sdk.inc         |   9 +-
 ...lines.h-remove-indexingHeader-preCapacity.patch |  27 +++
 ...KitHelpers.cmake-Add-Wno-error-cast-align.patch |  29 +++
 .../webkit/webkit-efl/gcc-4.8.2.fix.patch          |  15 ++
 .../webkit/webkit-efl_2.3.2+svnr159807.bb          |  51 +++++
 68 files changed, 801 insertions(+), 879 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edbus_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_svn.bb
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.18.3.bb
 rename meta-efl/recipes-efl/e17/{elfe_svn.bb => elfe_git.bb} (41%)
 rename meta-efl/recipes-efl/e17/{enjoy_svn.bb => enjoy_git.bb} (88%)
 delete mode 100644 meta-efl/recipes-efl/e17/terminology_0.3.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.4.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus2.inc
 delete mode 100644 meta-efl/recipes-efl/efl/edbus2_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/efl.inc
 create mode 100644 meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
 create mode 100644 meta-efl/recipes-efl/efl/efl_1.8.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.8.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players.inc
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas/0001-evas_font_load-Fix-build-with-newer-freetype.patch
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_git.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_svn.bb
 create mode 100644 meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb

-- 
1.8.5.3


