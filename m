Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5867E6C7FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:17:41 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so250290eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=w2oaRV/di0DifuqUoKcK1r+9NBkEynUhzocds8PWXoA=;
	b=pypZOuVdlAIgLQrALlh4I5GdhP1dhqbSLpSDx4piFbtucZ54EL7a9TeVHw0STsR7rj
	0/HYqO+qWmm383QeiroW7tgGVcamiuPF+M4418g8pwszZHr7dKn40Wh+3cou7jQER7d9
	ocT+nn1FiEflJXxB8kknc6KVdMuuqtg9WpyboxXfa4SOVBEDD4IyPFhPOw+v8ZGrDU8h
	/pmCJMl43PiRIVnaMi/lpczY1Te+44yka63nVRjgu42eJlXD8rOk+yMnr9TQ7sF2S0RO
	/4BXUGccBGQQSMkQlcKcqlV8sJvHqHMqr7ao6nLS8eCl7+LTp/9UwSLusePWJzlSmJMF
	53ZQ==
X-Received: by 10.14.101.73 with SMTP id a49mr4501518eeg.100.1389806259912;
	Wed, 15 Jan 2014 09:17:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm11759023eel.2.2014.01.15.09.17.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 09:17:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 18:17:50 +0100
Message-Id: <cover.1389805976.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [meta-efl][WIP][PATCHv2 0/7] Major efl upgrade
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
X-List-Received-Date: Wed, 15 Jan 2014 17:17:43 -0000

WIP because it's only build tested and webkit-efl is failing for armv[45].
for other architectures you need to fix cmake in oe-core:
http://lists.openembedded.org/pipermail/openembedded-core/2014-January/088218.html

Sharing as WIP, because 1.7 is pretty much dead and we need to start updating
apps to work with this 1.8 (and eventually also upgrade e-wm to 18).

Good thing is that unlike earlier elementary upgrades this really has
quite stable API, so I had to change only few SHR apps which are built with -Werror
and were using some deprecated API.

Hopefully we'll get this in shape before closing 1.6.

Testers, contributions welcome.

Does someone care about upgrade path here? See first patch it doesn't even build
correctly in incremental build (because of oe bug), so I'm tempted to ignore it this time.

The following changes since commit a1b6699ad26e1035f5c29918e059b8b57fde57ff:

  add libcrypt-openssl-rsa-perl (2014-01-13 09:59:45 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Martin Jansa (7):
  meta-efl: Add efl 1.8.4, elementary 1.8.3, terminology 0.4.0 and
    python-efl 1.8.0 recipes
  webkit-efl: Add recipe with snapshot from r159807
  enjoy: Upgrade to version from git
  libeflvala: Fix build of tests
  eve: bump SRCREV to catch up with edbus2 -> eldbus rename
  e-wm: Drop evas-.*-loader.* from RDEPENDS
  webkit-efl: Try to disable llint/jit to fix armv[45] build

 meta-efl/conf/layer.conf                           |   1 +
 meta-efl/recipes-devtools/python/python-ecore.inc  |   5 -
 .../recipes-devtools/python/python-ecore_1.7.0.bb  |   5 -
 .../recipes-devtools/python/python-ecore_svn.bb    |   8 -
 meta-efl/recipes-devtools/python/python-edbus.inc  |  50 +++++-
 .../recipes-devtools/python/python-edbus_1.7.0.bb  |   3 +-
 .../recipes-devtools/python/python-edbus_svn.bb    |   8 -
 meta-efl/recipes-devtools/python/python-edje.inc   |   6 -
 .../python-edje/0001-fix-unicode-conversion.patch  |  38 -----
 .../recipes-devtools/python/python-edje_1.7.0.bb   |   6 -
 .../recipes-devtools/python/python-edje_svn.bb     |  10 --
 meta-efl/recipes-devtools/python/python-efl.inc    |  36 ++---
 .../recipes-devtools/python/python-efl_1.8.0.bb    |   4 +
 .../recipes-devtools/python/python-elementary.inc  |   5 -
 .../python/python-elementary_1.7.0.bb              |   5 -
 .../python/python-elementary_svn.bb                |   8 -
 .../recipes-devtools/python/python-emotion.inc     |   5 -
 .../python/python-emotion_1.7.0.bb                 |   5 -
 .../recipes-devtools/python/python-emotion_svn.bb  |   8 -
 meta-efl/recipes-devtools/python/python-evas.inc   |   4 -
 .../recipes-devtools/python/python-evas_1.7.0.bb   |   5 -
 .../recipes-devtools/python/python-evas_svn.bb     |   8 -
 meta-efl/recipes-efl/e17/e-wm.inc                  |   4 -
 ...position-as-percent-and-define-a-1-second.patch |  14 +-
 .../recipes-efl/e17/{enjoy_svn.bb => enjoy_git.bb} |  12 +-
 meta-efl/recipes-efl/e17/eve_svn.bb                |   4 +-
 meta-efl/recipes-efl/e17/terminology_0.3.0.bb      |  10 --
 meta-efl/recipes-efl/e17/terminology_0.4.0.bb      |  10 ++
 meta-efl/recipes-efl/efl/ecore_1.7.9.bb            | 124 --------------
 meta-efl/recipes-efl/efl/edbus2.inc                |  11 --
 meta-efl/recipes-efl/efl/edbus2_svn.bb             |  14 --
 meta-efl/recipes-efl/efl/edbus_svn.bb              |  13 --
 meta-efl/recipes-efl/efl/edje_1.7.9.bb             |  72 ---------
 meta-efl/recipes-efl/efl/eet_1.7.9.bb              |  30 ----
 meta-efl/recipes-efl/efl/eeze_1.7.9.bb             |  23 ---
 meta-efl/recipes-efl/efl/efl.inc                   | 145 +++++++++++++++++
 ...igure.ac-Don-t-check-for-Xprint-extension.patch |  27 ++++
 meta-efl/recipes-efl/efl/efl_1.8.4.bb              |  17 ++
 meta-efl/recipes-efl/efl/efreet_1.7.9.bb           |  22 ---
 meta-efl/recipes-efl/efl/eina_1.7.9.bb             |  19 ---
 meta-efl/recipes-efl/efl/eio_1.7.9.bb              |  15 --
 meta-efl/recipes-efl/efl/elementary.inc            |  29 ++--
 ...e-elm_prefs_cc-and-elementary_codegen-def.patch |  61 +++++++
 meta-efl/recipes-efl/efl/elementary_1.7.9.bb       |   8 -
 meta-efl/recipes-efl/efl/elementary_1.8.3.bb       |  12 ++
 meta-efl/recipes-efl/efl/embryo_1.7.9.bb           |  20 ---
 .../recipes-efl/efl/emotion-generic-players.inc    |  10 ++
 .../efl/emotion-generic-players_1.8.0.bb           |   8 +
 meta-efl/recipes-efl/efl/emotion_1.7.9.bb          |  22 ---
 meta-efl/recipes-efl/efl/ethumb_1.7.9.bb           |  27 ----
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |   2 +-
 .../recipes-efl/efl/evas-generic-loaders_1.7.9.bb  |   8 -
 .../recipes-efl/efl/evas-generic-loaders_1.8.1.bb  |   8 +
 ...s_font_load-Fix-build-with-newer-freetype.patch |  26 ---
 meta-efl/recipes-efl/efl/evas_1.7.9.bb             | 178 ---------------------
 meta-efl/recipes-efl/efl/expedite_1.7.9.bb         |   8 -
 .../efl/libeflvala/disable.eina.test.patch         |  44 +++++
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |   1 +
 ...lines.h-remove-indexingHeader-preCapacity.patch |  27 ++++
 ...KitHelpers.cmake-Add-Wno-error-cast-align.patch |  29 ++++
 .../webkit/webkit-efl/gcc-4.8.2.fix.patch          |  15 ++
 .../webkit/webkit-efl_2.3.2+svnr159807.bb          |  51 ++++++
 62 files changed, 563 insertions(+), 850 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edbus_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje/0001-fix-unicode-conversion.patch
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_svn.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_svn.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_svn.bb
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
 create mode 100644 meta-efl/recipes-efl/efl/efl_1.8.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.8.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players.inc
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.8.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas/0001-evas_font_load-Fix-build-with-newer-freetype.patch
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb

-- 
1.8.5.2


