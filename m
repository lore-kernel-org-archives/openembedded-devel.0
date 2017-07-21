Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1D2782D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:34:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6L7YnqA025493
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 21 Jul 2017 00:34:49 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:34:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:37 -0400
Message-ID: <cover.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 00/10] add 9 recipes & upgrade 1 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jul 2017 07:34:50 -0000
Content-Type: text/plain

Changed in V2:

- xmlrpc-c, satyr, usermode: fix compile failure against musl C library

- add recipe keybinder and volume-key

- Build on qemux86, qemux86-64, qemumips, qemuarm64,
  qemux86 + musl, qemux86-64 + musl

//Hongxu

The following changes since commit 1cbd1bc195017312ba8cf670b340f61a2ac6207b:

  unionfs-fuse: 0.26 -> 2.0 (2017-07-14 23:45:53 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/add-recipe2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/add-recipe2

Hongxu Jia (10):
  keybinder: add recipe 3.0
  volume-key: add recipe 0.3.9
  libgnomekbd: 2.32 -> 3.22
  python3-pykickstart: add recipe 2.35
  python3-meh: add recipe 0.45
  usermode: add recipe 1.111
  isomd5sum: add recipe 1.2.1
  satyr: add recipe 0.23
  libtar: add recipe 1.2.20
  xmlrpc-c: add recipe 1.31.0

 .../gnome-settings-daemon_2.32.1.bb                |   3 -
 .../recipes-gnome/libgnome/libgnomekbd_2.32.0.bb   |  20 ---
 .../recipes-gnome/libgnome/libgnomekbd_3.22.0.bb   |  17 +++
 .../recipes-support/keybinder/keybinder_3.0.bb     |  26 ++++
 ...ix-compile-failure-against-musl-C-library.patch |  27 ++++
 .../recipes-support/usermode/usermode_1.111.bb     |  27 ++++
 meta-oe/licenses/X11                               |  23 ++++
 ...ix-compile-failure-against-musl-C-library.patch |  52 +++++++
 .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   |  23 ++++
 .../files/0001-tweak-install-prefix.patch          |  60 ++++++++
 .../isomd5sum/files/0002-fix-parallel-error.patch  |  33 +++++
 .../recipes-extended/isomd5sum/isomd5sum_1.2.1.bb  |  35 +++++
 ...-explicitly-support-python3-by-pkg-config.patch |  56 ++++++++
 .../volume_key/volume-key_0.3.9.bb                 |  34 +++++
 .../libtar/files/0002-Do-not-strip-libtar.patch    |  25 ++++
 .../libtar/files/fix_libtool_sysroot.patch         |  19 +++
 meta-oe/recipes-support/libtar/libtar_1.2.20.bb    |  21 +++
 .../satyr/files/0001-do-not-support-python2.patch  |  84 ++++++++++++
 ...ix-compile-failure-against-musl-C-library.patch |  28 ++++
 meta-oe/recipes-support/satyr/satyr_0.23.bb        |  33 +++++
 .../files/tweak-native-language-support.patch      |  44 ++++++
 .../python-meh/python3-meh_0.45.bb                 |  17 +++
 ...0001-support-authentication-for-kickstart.patch | 151 +++++++++++++++++++++
 ...-parser.py-add-lock-for-readKickstart-and.patch |  76 +++++++++++
 ...-sections-shutdown-and-environment-in-gen.patch |  48 +++++++
 ...d.py-retry-to-invoke-request-with-timeout.patch |  82 +++++++++++
 .../python-pykickstart/python3-pykickstart_2.35.bb |  26 ++++
 27 files changed, 1067 insertions(+), 23 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
 create mode 100644 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
 create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-gnome/recipes-support/usermode/usermode_1.111.bb
 create mode 100644 meta-oe/licenses/X11
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
 create mode 100644 meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch
 create mode 100644 meta-oe/recipes-extended/isomd5sum/files/0002-fix-parallel-error.patch
 create mode 100644 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb
 create mode 100644 meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
 create mode 100644 meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb
 create mode 100644 meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch
 create mode 100644 meta-oe/recipes-support/libtar/libtar_1.2.20.bb
 create mode 100644 meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
 create mode 100644 meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-oe/recipes-support/satyr/satyr_0.23.bb
 create mode 100644 meta-python/recipes-extended/python-meh/files/tweak-native-language-support.patch
 create mode 100644 meta-python/recipes-extended/python-meh/python3-meh_0.45.bb
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
 create mode 100644 meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb

-- 
2.8.1


