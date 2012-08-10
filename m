Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpgW-0001GZ-VI
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:55:29 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MJOvRy7NBYEHe7P2yZCyacUZvNMMsJIhVmQBkWlR6KM=;
	b=F5ALNFKms5G5SBmlJVUZPeb2WS3UwdIm0djWUKVNUemECKV8V16Q4jRYZkRqwTJZnD
	Ux8UNtZjqXESGuN5MKvZ0NoncseA7rQJSOuPYH8XORb3Khu+YjyvM5kL7dhS2ck0/SSJ
	GZzovTDYi/nZkiBBV5K/6Rvg9lxY8uL6aTSrIv9CrI1ZroLFFWDxzzN95awiyReElVdh
	4MwEANZPl79iPnKxNLa2cJno1oSxrAmhN8OTin24qpCmeqbPpvsFbt3wfx9H7kZLOjDf
	/++V9L5LeRVwzkFEpi/tF19y5EehGkBRPxokKIp5yupxylUUhR6MIih4KyogaAnauQ4/
	nuYA==
Received: by 10.180.107.103 with SMTP id hb7mr6271643wib.3.1344606221390;
	Fri, 10 Aug 2012 06:43:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm7830092wiz.4.2012.08.10.06.43.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:43:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:55 +0200
Message-Id: <cover.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 00/46] EFL upgrade
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
X-List-Received-Date: Fri, 10 Aug 2012 13:55:29 -0000

The following changes since commit e26fe501dd5258b99d5f1ec1167ed2a890210b78:

  libxml++: New recipe - C++ bindings for libxml (2012-08-08 09:39:43 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Martin Jansa (46):
  meta-efl: unify tabs/spaces usage
  e-base: bump EFL_SRCREV
  ecore: update fix-ecore-fb-initialization.patch for svn recipe
  efl: update PV in svn recipes to sort higher then release
  efl-from-svn-recipes: update to match PV from svn recipes
  terminology: add recipe for terminal emulator
  evas: package cserve2 and its loaders
  efreet: inherit gettext
  e-wm: update LIC_FILES_CHKSUM
  e-wm: packaging: include flags in PN-images, add catch-all
    PN-backgrounds package
  terminology: add terminology-themes to RDEPENDS
  edbus: add eina to DEPENDS
  eve: drop patch applied upstream
  edbus: add patch to fixup performance_test autotools config and
    disable it
  e-wm: add eio to DEPENDS
  e-base: bump EFL_SRCREV again
  edbus: drop patch applied upstream r74447
  python-edje: add evas to DEPENDS
  e-base: bump EFL_SRCREV
  elementary: add eio to DEPENDS
  meta-efl: evas-generic-loaders: add new recipes to cope with missing
    SVG support in newer evas
  evas: add evas-loader-generic + evas-generic-loader-svn to
    RRECOMMENDS in svn version which doesn't support librsvg loader
  meta-efl: efl.bbclass: package only ${datadir}/${PE} in ${PN}-tests,
    it was stealing files from ${PN}-locale-*
  e-base: bump EFL_SRCREV
  edje: add unpackaged /usr/share/mime/packages/edje.xml to PN
  edbus: option to disable performance-test was renamed and package
    logo.png in PN
  emotion: add eio dependency
  e-wm: add elementary dependency
  e-wm: add some evas-loaders to RDEPENDS
  evas: use PN instead of BPN?
  e-base: bump EFL_SRCREV
  enjoy: update LIC_FILES_CHKSUM, typos fixed in r74611
  edje: add eio to DEPENDS
  eet: move eet binary to own PN-utils package
  e-base: bump EFL_SRCREV
  e-wm: include unpackaged data/favourites in PN
  ecore: add gnutls to DEPENDS
  e-base: bump EFL_SRCREV
  e-base: bump EFL_SRCREV
  e-wm: illume2 profile was renamed to mobile
  e-base: bump EFL_SRCREV
  elsa: rename to entrance
  meta-systemd: elsa: rename to entrance
  e-base: bump EFL_SRCREV for 1.6.99-alpha
  meta-efl: introduce 1.6.99-alpha releases
  efl-from-svn-recipes: update P_Vs, now all svn recipes have
    1.6.99+svn

 meta-efl/classes/e-base.bbclass                    |    5 ++-
 meta-efl/classes/e.bbclass                         |    4 +-
 meta-efl/classes/efl.bbclass                       |   10 ++--
 .../conf/distro/include/efl-from-svn-recipes.inc   |   19 ++++----
 .../recipes-devtools/python/python-edje_svn.bb     |    2 +-
 meta-efl/recipes-devtools/python/python-efl.inc    |   30 +++++++-------
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    6 +-
 meta-efl/recipes-efl/e17/e-wm/applications.menu    |    6 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   26 ++++++++---
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |   12 +++---
 .../eve/0001-eve-update-for-newer-webkit-efl.patch |   38 ----------------
 meta-efl/recipes-efl/e17/eve_svn.bb                |    2 -
 meta-efl/recipes-efl/e17/exalt-client_svn.bb       |    4 +-
 meta-efl/recipes-efl/e17/exalt_svn.bb              |   12 +++---
 meta-efl/recipes-efl/e17/expedite_1.2.0.bb         |   10 ----
 meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb  |   12 +++++
 meta-efl/recipes-efl/e17/expedite_svn.bb           |    2 +-
 .../recipes-efl/e17/illume-keyboards-shr_git.bb    |    4 +-
 meta-efl/recipes-efl/e17/news_svn.bb               |    4 +-
 meta-efl/recipes-efl/e17/places_svn.bb             |    2 +-
 meta-efl/recipes-efl/e17/rain_svn.bb               |    4 +-
 meta-efl/recipes-efl/e17/screenshot_svn.bb         |    2 +-
 meta-efl/recipes-efl/e17/terminology_svn.bb        |   25 +++++++++++
 meta-efl/recipes-efl/efl/ecore.inc                 |    6 +-
 ...01-ecore_exe-fix-compilation-on-fedora-18.patch |   45 --------------------
 .../efl/ecore/fix-ecore-fb-initialization.patch    |   24 +++++-----
 meta-efl/recipes-efl/efl/ecore_1.2.1.bb            |   12 -----
 meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb     |   13 ++++++
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edbus.inc                 |    6 ++-
 meta-efl/recipes-efl/efl/edbus_1.2.0.bb            |   11 -----
 meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb     |   12 +++++
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edje-fpu.inc              |    6 +-
 meta-efl/recipes-efl/efl/edje.inc                  |   19 ++++----
 meta-efl/recipes-efl/efl/edje_1.2.1.bb             |   10 ----
 meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb      |   12 +++++
 meta-efl/recipes-efl/efl/edje_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eet.inc                   |    6 +++
 meta-efl/recipes-efl/efl/eet_1.6.1.bb              |   10 ----
 meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb       |   12 +++++
 meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/eeze.inc                  |    2 +-
 meta-efl/recipes-efl/efl/eeze_1.2.0.bb             |   10 ----
 meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb      |   12 +++++
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/efreet.inc                |    2 +-
 meta-efl/recipes-efl/efl/efreet_1.2.0.bb           |   10 ----
 meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb    |   12 +++++
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/eina_1.2.1.bb             |   10 ----
 meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb      |   12 +++++
 meta-efl/recipes-efl/efl/eina_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eio_1.0.1.bb              |   10 ----
 meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb       |   12 +++++
 meta-efl/recipes-efl/efl/eio_svn.bb                |    2 +-
 .../efl/elementary-theme-efenniht_svn.bb           |    6 +-
 meta-efl/recipes-efl/efl/elementary.inc            |    4 +-
 meta-efl/recipes-efl/efl/elementary_1.0.1.bb       |   10 ----
 .../recipes-efl/efl/elementary_1.6.99-alpha.bb     |   12 +++++
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    2 +-
 meta-efl/recipes-efl/efl/embryo_1.2.0.bb           |   10 ----
 meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb    |   12 +++++
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/emotion.inc               |    4 +-
 meta-efl/recipes-efl/efl/emotion_1.0.1.bb          |   10 ----
 meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb   |   12 +++++
 meta-efl/recipes-efl/efl/emotion_svn.bb            |    2 +-
 ...am-use-common-auth-instead-of-system-auth.patch |   19 ++++-----
 .../efl/{elsa_svn.bb => entrance_svn.bb}           |    4 +-
 meta-efl/recipes-efl/efl/ethumb.inc                |    2 +-
 meta-efl/recipes-efl/efl/ethumb_1.0.1.bb           |   10 ----
 meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb    |   12 +++++
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |   33 ++++++++++++++
 .../efl/evas-generic-loaders_1.6.99-alpha.bb       |   12 +++++
 .../recipes-efl/efl/evas-generic-loaders_svn.bb    |   11 +++++
 meta-efl/recipes-efl/efl/evas.inc                  |   20 ++++++++-
 meta-efl/recipes-efl/efl/evas_1.2.1.bb             |   10 ----
 meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb      |   12 +++++
 meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    4 +-
 .../efl/{elsa => entrance}/xserver-nodm.service    |    4 +-
 .../{elsa_svn.bbappend => entrance_svn.bbappend}   |    0
 84 files changed, 427 insertions(+), 369 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch
 delete mode 100644 meta-efl/recipes-efl/e17/expedite_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/e17/terminology_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch
 delete mode 100644 meta-efl/recipes-efl/efl/ecore_1.2.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.2.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.6.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.2.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb
 rename meta-efl/recipes-efl/efl/{elsa => entrance}/0001-pam-use-common-auth-instead-of-system-auth.patch (64%)
 rename meta-efl/recipes-efl/efl/{elsa_svn.bb => entrance_svn.bb} (92%)
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders.inc
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.2.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb
 rename meta-systemd/meta-efl/recipes-efl/efl/{elsa => entrance}/xserver-nodm.service (55%)
 rename meta-systemd/meta-efl/recipes-efl/efl/{elsa_svn.bbappend => entrance_svn.bbappend} (100%)

-- 
1.7.8.6



