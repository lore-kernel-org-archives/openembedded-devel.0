Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS4n-0005cR-Po
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:48:18 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=slBmdiEYLSSkDzYNspD8x7CzUvYo4wW/o04PcGrD2cU=;
	b=Ab/0niw479gJ4dvGT+CT9200JvQSsxGlMYNn/THjI+p+r6xWz6NXFjfsGd4/i5n7Ol
	6ywJD7ItdnrBt9yuEO6Kh/Rtp1KuJ+SmrVeDqNn/9iPoHYtd90IleVErX21UgloNcJna
	xtCX6T814a0q09bCJbG32D2YSHFdz2LzCnN5hFh+scgfb9gg/tXC324FqUdic2+gktu5
	x+sWpMYziYwWwKmT4E3o4DktBdY+NzqjZdebhZV+vqqUTTWAcbM5QWIpVEQwDsFgH9Vx
	gRxxo/Legdg7FN91NdUzoEwhI2lQYOu5hd2aDkwkMUyfM5vDik+xOVdH/AG5hr4pCYV/
	FGkQ==
Received: by 10.14.213.134 with SMTP id a6mr61935878eep.45.1354048444578;
	Tue, 27 Nov 2012 12:34:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm4533630eep.5.2012.11.27.12.34.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:34:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:37 +0100
Message-Id: <cover.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 00/21] [meta-oe][meta-efl] Upgrades to E17 alpha 5
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
X-List-Received-Date: Tue, 27 Nov 2012 20:48:18 -0000

E17 should be released Dec 21, so let's prepare meta-efl and give them a bit more testing.

Tested on armv4t, armv7a, qemux86-64.

The following changes since commit eb63724f431a0fb6b2fec1bd84ae7f04cb8744df:

  python-cheetah : Drop RDEPENDS from native build. (2012-11-27 12:48:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Martin Jansa (21):
  efl: upgrade to bugfix release 1.7.1
  efl: EFL_SRCREV bump past 1.7.1 release and update PV in svn recipes
  eve: add edbus to DEPENDS, but use older SRCREV which depends on
    edbus1 not edbus2
  elementary-theme-efenniht: update path to shared images
  efl-from-svn-recipes.inc: update to match new version
  evas: add tiff to DEPENDS
  ecore: disable some X extensions for native recipe and add libxfixes
    to target DEPENDS
  efl: update svn recipes to use 1.7 branch
  e-base: bump EFL_SRCREV for E17 alpha2
  e-base: bump EFL_SRCREV for E17 alpha3
  e-wm: update path to icon_icon_theme.png, add some unpackaged files
    and xcb to DEPENDS
  e-wm: add work around for illume2 issues from r78978
  e-wm-theme-b-and-w: add recipe for old default theme b_and_w
  e-base.bbclass: bump EFL_SRCREV for E17 alpha4
  edje: backport patch to fix e-wm build
  edbus2: add recipe for new edbus implementation needed for eve and
    later efl-1.8
  eve: bump SRCREV back to EFL_SRCREV and add edbus2 dependency
  efl: upgrade to 1.7.2
  e-wm: add setxkbmap to RDEPENDS
  e-wm: fix file permissions on sysactions.conf
  e-base.bbclass: bump EFL_SRCREV for E17 alpha5

 meta-efl/classes/e-base.bbclass                    |  2 +-
 .../conf/distro/include/efl-from-svn-recipes.inc   | 15 ++++++-----
 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb | 31 ++++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-wm_svn.bb               | 20 +++++++++++---
 meta-efl/recipes-efl/e17/eve_svn.bb                |  2 +-
 meta-efl/recipes-efl/efl/ecore.inc                 | 19 +++++++++++--
 .../efl/{ecore_1.7.0.bb => ecore_1.7.2.bb}         |  4 +--
 meta-efl/recipes-efl/efl/ecore_svn.bb              |  6 +++--
 meta-efl/recipes-efl/efl/edbus2.inc                | 11 ++++++++
 meta-efl/recipes-efl/efl/edbus2_svn.bb             | 11 ++++++++
 .../efl/{eeze_1.7.0.bb => edbus_1.7.2.bb}          |  4 +--
 meta-efl/recipes-efl/efl/edbus_svn.bb              |  6 +++--
 .../efl/{edbus_1.7.0.bb => edje_1.7.2.bb}          |  4 +--
 meta-efl/recipes-efl/efl/edje_svn.bb               |  6 +++--
 .../efl/{edje_1.7.0.bb => eet_1.7.2.bb}            |  4 +--
 meta-efl/recipes-efl/efl/eet_svn.bb                |  6 +++--
 .../efl/{eet_1.7.0.bb => eeze_1.7.2.bb}            |  4 +--
 meta-efl/recipes-efl/efl/eeze_svn.bb               |  6 +++--
 meta-efl/recipes-efl/efl/efreet_1.7.0.bb           | 10 -------
 meta-efl/recipes-efl/efl/efreet_1.7.2.bb           | 10 +++++++
 meta-efl/recipes-efl/efl/efreet_svn.bb             |  6 +++--
 meta-efl/recipes-efl/efl/eina_1.7.0.bb             | 10 -------
 meta-efl/recipes-efl/efl/eina_1.7.2.bb             | 10 +++++++
 meta-efl/recipes-efl/efl/eina_svn.bb               |  6 +++--
 meta-efl/recipes-efl/efl/eio_1.7.0.bb              | 10 -------
 meta-efl/recipes-efl/efl/eio_1.7.2.bb              | 10 +++++++
 meta-efl/recipes-efl/efl/eio_svn.bb                |  6 +++--
 .../efl/elementary-theme-efenniht_svn.bb           |  3 ++-
 meta-efl/recipes-efl/efl/elementary_1.7.0.bb       | 10 -------
 meta-efl/recipes-efl/efl/elementary_1.7.2.bb       | 10 +++++++
 meta-efl/recipes-efl/efl/elementary_svn.bb         |  6 +++--
 meta-efl/recipes-efl/efl/embryo_1.7.0.bb           | 10 -------
 meta-efl/recipes-efl/efl/embryo_1.7.2.bb           | 10 +++++++
 meta-efl/recipes-efl/efl/embryo_svn.bb             |  6 +++--
 meta-efl/recipes-efl/efl/emotion_1.7.0.bb          | 10 -------
 meta-efl/recipes-efl/efl/emotion_1.7.2.bb          | 10 +++++++
 meta-efl/recipes-efl/efl/emotion_svn.bb            |  6 +++--
 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb           | 10 -------
 meta-efl/recipes-efl/efl/ethumb_1.7.2.bb           | 10 +++++++
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |  6 +++--
 .../recipes-efl/efl/evas-generic-loaders_1.7.0.bb  | 10 -------
 .../recipes-efl/efl/evas-generic-loaders_1.7.2.bb  | 10 +++++++
 .../recipes-efl/efl/evas-generic-loaders_svn.bb    |  6 +++--
 meta-efl/recipes-efl/efl/evas.inc                  |  4 +--
 meta-efl/recipes-efl/efl/evas_1.7.0.bb             | 10 -------
 meta-efl/recipes-efl/efl/evas_1.7.2.bb             | 10 +++++++
 meta-efl/recipes-efl/efl/evas_svn.bb               |  6 +++--
 meta-efl/recipes-efl/efl/expedite_1.7.0.bb         | 10 -------
 meta-efl/recipes-efl/efl/expedite_1.7.2.bb         | 10 +++++++
 meta-efl/recipes-efl/efl/expedite_svn.bb           |  6 +++--
 50 files changed, 271 insertions(+), 157 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
 rename meta-efl/recipes-efl/efl/{ecore_1.7.0.bb => ecore_1.7.2.bb} (50%)
 create mode 100644 meta-efl/recipes-efl/efl/edbus2.inc
 create mode 100644 meta-efl/recipes-efl/efl/edbus2_svn.bb
 rename meta-efl/recipes-efl/efl/{eeze_1.7.0.bb => edbus_1.7.2.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edbus_1.7.0.bb => edje_1.7.2.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edje_1.7.0.bb => eet_1.7.2.bb} (41%)
 rename meta-efl/recipes-efl/efl/{eet_1.7.0.bb => eeze_1.7.2.bb} (41%)
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.2.bb

-- 
1.8.0



