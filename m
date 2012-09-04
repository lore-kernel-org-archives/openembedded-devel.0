Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91hR-0004XX-94
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:34:25 +0200
Received: by wgbdr1 with SMTP id dr1so4917933wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=sy2HdTqG2J/RRFuJtwPVV32OGR7WJA8veF0YpCtc/cg=;
	b=ru7ADD2TI7v8ygjjuxukQEMv20C6AE9OaRgU38shd41PrUEegAEGxyuwzUmZ0LYQtd
	2W9fF/SMCcEHLDv+SsPBPcqG29D8NDBlyNjbAVqdVad8fvPhMdefEZQGUr3u80qjGLif
	vSTQ8haTI8w8VXKGpyOVmDUFdPjhBR2Dc774uhGmt/84AL8s6Q882HbUb6w8U5H21jdw
	AW5N1BphlZjyRVUiVt9dF8E3QuMaPz0+4FMHmwM2N4O1zbcAsQaX2e0jHZdia0nxh/fL
	IjJCUFff64biLNB/vbZua99SZOk/gvztFmPaNjdldbKwPRuLhwfRYuPzZTlPjgnT/7VM
	jn2w==
Received: by 10.216.138.200 with SMTP id a50mr6246819wej.155.1346797322892;
	Tue, 04 Sep 2012 15:22:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm40132020wix.6.2012.09.04.15.22.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:22:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:12 +0200
Message-Id: <cover.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][meta-efl][PATCH 00/10] EFL upgrade to 1.7.0 and fix parse after task->packagegroup change in oe-core
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
X-List-Received-Date: Tue, 04 Sep 2012 22:34:25 -0000

Changes needed to remove task-x11 and task-x11-server 
are in separate branch jansa/packagegroup.

So this one can be merged as is and I'll send request 
for jansa/packagegroup when oe-core versions are ready.

The following changes since commit a81cdc840c1dfca2bd0cb4ddd6e4bc1488286649:

  gtk-xfce-engine: fix staticdev warning (2012-08-31 09:06:17 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (10):
  e-base: bump EFL_SRCREV to 1.7.0 release and update PV in svn recipes
  terminology: add version 0.1.0, negative D_P to svn and bump PE
  recipes-efl: upgrade from 1.7.0-beta to 1.7.0
  e-wm: update RRECOMMENDS_-config-mobile
  task-x11-illume: update default ECONFIG
  python-efl: upgrade svn recipes to 1.7.0+svn
  python-efl: upgrade recipes to 1.7.0
  xf86-video-glamo: add xserver-xorg-module-exa to RDEPENDS
  task*: rename to packagegroup to match oe-core
  packagegroup: add RPROVIDES/RREPLACES/RCONFLICTS and bump PR to get
    some upgrade path

 meta-efl/classes/e-base.bbclass                    |  2 +-
 .../conf/distro/include/efl-from-svn-recipes.inc   |  4 +++-
 meta-efl/recipes-core/meta/meta-toolchain-efl.bb   |  2 +-
 .../python/python-ecore_1.6.99-beta.bb             |  6 ------
 .../recipes-devtools/python/python-ecore_1.7.0.bb  |  5 +++++
 .../recipes-devtools/python/python-ecore_svn.bb    |  2 +-
 .../python/python-edbus_1.6.99-beta.bb             |  6 ------
 .../recipes-devtools/python/python-edbus_1.7.0.bb  |  5 +++++
 .../recipes-devtools/python/python-edbus_svn.bb    |  2 +-
 .../python/python-edje_1.6.99-beta.bb              |  7 -------
 .../recipes-devtools/python/python-edje_1.7.0.bb   |  6 ++++++
 .../recipes-devtools/python/python-edje_svn.bb     |  2 +-
 .../python/python-elementary_1.6.99-beta.bb        |  6 ------
 .../python/python-elementary_1.7.0.bb              |  5 +++++
 .../python/python-elementary_svn.bb                |  2 +-
 .../python/python-emotion_1.6.99-beta.bb           |  6 ------
 .../python/python-emotion_1.7.0.bb                 |  5 +++++
 .../recipes-devtools/python/python-emotion_svn.bb  |  2 +-
 .../python/python-evas_1.6.99-beta.bb              |  6 ------
 .../recipes-devtools/python/python-evas_1.7.0.bb   |  5 +++++
 .../recipes-devtools/python/python-evas_svn.bb     |  2 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |  4 ++--
 meta-efl/recipes-efl/e17/terminology.inc           | 23 +++++++++++++++++++++
 meta-efl/recipes-efl/e17/terminology_0.1.0.bb      | 10 +++++++++
 meta-efl/recipes-efl/e17/terminology_svn.bb        | 22 +++-----------------
 .../efl/{ecore_1.6.99-beta.bb => ecore_1.7.0.bb}   |  6 ++----
 meta-efl/recipes-efl/efl/ecore_svn.bb              |  2 +-
 meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb      | 12 -----------
 meta-efl/recipes-efl/efl/edbus_1.7.0.bb            | 10 +++++++++
 meta-efl/recipes-efl/efl/edbus_svn.bb              |  2 +-
 meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb       | 12 -----------
 meta-efl/recipes-efl/efl/edje_1.7.0.bb             | 10 +++++++++
 meta-efl/recipes-efl/efl/edje_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb        | 12 -----------
 meta-efl/recipes-efl/efl/eet_1.7.0.bb              | 10 +++++++++
 meta-efl/recipes-efl/efl/eet_svn.bb                |  2 +-
 meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb       | 12 -----------
 meta-efl/recipes-efl/efl/eeze_1.7.0.bb             | 10 +++++++++
 meta-efl/recipes-efl/efl/eeze_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb     | 12 -----------
 meta-efl/recipes-efl/efl/efreet_1.7.0.bb           | 10 +++++++++
 meta-efl/recipes-efl/efl/efreet_svn.bb             |  2 +-
 meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb       | 12 -----------
 meta-efl/recipes-efl/efl/eina_1.7.0.bb             | 10 +++++++++
 meta-efl/recipes-efl/efl/eina_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb        | 12 -----------
 meta-efl/recipes-efl/efl/eio_1.7.0.bb              | 10 +++++++++
 meta-efl/recipes-efl/efl/eio_svn.bb                |  2 +-
 meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb | 12 -----------
 meta-efl/recipes-efl/efl/elementary_1.7.0.bb       | 10 +++++++++
 meta-efl/recipes-efl/efl/elementary_svn.bb         |  2 +-
 meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb     | 12 -----------
 meta-efl/recipes-efl/efl/embryo_1.7.0.bb           | 10 +++++++++
 meta-efl/recipes-efl/efl/embryo_svn.bb             |  2 +-
 meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb    | 12 -----------
 meta-efl/recipes-efl/efl/emotion_1.7.0.bb          | 10 +++++++++
 meta-efl/recipes-efl/efl/emotion_svn.bb            |  2 +-
 meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb     | 12 -----------
 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb           | 10 +++++++++
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |  3 +--
 .../efl/evas-generic-loaders_1.6.99-beta.bb        | 12 -----------
 .../recipes-efl/efl/evas-generic-loaders_1.7.0.bb  | 10 +++++++++
 .../recipes-efl/efl/evas-generic-loaders_svn.bb    |  2 +-
 meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb       | 12 -----------
 meta-efl/recipes-efl/efl/evas_1.7.0.bb             | 10 +++++++++
 meta-efl/recipes-efl/efl/evas_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb   | 12 -----------
 meta-efl/recipes-efl/efl/expedite_1.7.0.bb         | 10 +++++++++
 meta-efl/recipes-efl/efl/expedite_svn.bb           |  2 +-
 .../packagegroup-efl-sdk.bb}                       |  9 ++++++--
 .../packagegroup-efl-sdk.inc}                      |  0
 .../packagegroup-efl-standalone-sdk-target.bb}     |  9 ++++++--
 meta-efl/recipes-efl/tasks/task-x11-illume.bb      |  6 ++----
 .../packagegroup-basic.bb}                         | 11 ++++++----
 .../packagegroup-boot.bb}                          |  8 ++++++--
 .../packagegroup-cli-tools.bb}                     | 11 ++++++++--
 .../packagegroup-sdk-target.bb}                    |  8 ++++++--
 .../packagegroup-fonts-truetype.bb}                | 24 ++++++++++++++++------
 .../xorg-driver/xf86-video-glamo_git.bb            |  3 ++-
 .../packagegroup-qte-toolchain-target.bbappend}    |  0
 .../packagegroup-basic.bbappend}                   |  0
 .../packagegroup-xfce-base.bb}                     |  8 ++++++--
 .../packagegroup-xfce-extended.bb}                 | 10 ++++++---
 83 files changed, 314 insertions(+), 285 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/terminology.inc
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.1.0.bb
 rename meta-efl/recipes-efl/efl/{ecore_1.6.99-beta.bb => ecore_1.7.0.bb} (46%)
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.0.bb
 rename meta-efl/recipes-efl/{tasks/task-efl-sdk.bb => packagegroups/packagegroup-efl-sdk.bb} (65%)
 rename meta-efl/recipes-efl/{tasks/task-efl-sdk.inc => packagegroups/packagegroup-efl-sdk.inc} (100%)
 rename meta-efl/recipes-efl/{tasks/task-efl-standalone-sdk-target.bb => packagegroups/packagegroup-efl-standalone-sdk-target.bb} (58%)
 rename meta-oe/recipes-core/{tasks/task-basic.bb => packagegroups/packagegroup-basic.bb} (84%)
 rename meta-oe/recipes-core/{tasks/task-boot.bb => packagegroups/packagegroup-boot.bb} (86%)
 rename meta-oe/recipes-core/{tasks/task-cli-tools.bb => packagegroups/packagegroup-cli-tools.bb} (72%)
 rename meta-oe/recipes-devtools/{tasks/task-sdk-target.bb => packagegroups/packagegroup-sdk-target.bb} (73%)
 rename meta-oe/recipes-graphics/{tasks/task-fonts-truetype.bb => packagegroups/packagegroup-fonts-truetype.bb} (42%)
 rename meta-oe/recipes-qt/{tasks/task-qte-toolchain-target.bbappend => packagegroups/packagegroup-qte-toolchain-target.bbappend} (100%)
 rename meta-systemd/meta-oe/recipes-core/{tasks/task-basic.bbappend => packagegroups/packagegroup-basic.bbappend} (100%)
 rename meta-xfce/recipes-xfce/{tasks/task-xfce-base.bb => packagegroups/packagegroup-xfce-base.bb} (85%)
 rename meta-xfce/recipes-xfce/{tasks/task-xfce-extended.bb => packagegroups/packagegroup-xfce-extended.bb} (84%)

-- 
1.7.12



