Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id A9A056B512
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 19:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=CiehkrkxzuKO0YyhjMtlD8T569CovsvmCqPMY1AGASI=; 
	b=mWhQDxvIMtXbPckvumR8RUhYHOmeylL/xs2oUIqx4vz6M10IpeldLlXve9r0mW+m/z5bNXNZ6e1ednA52P2pOSBQuTvGX6xDkdoIOvGqViD4xl3NQ4nrd4vG2JDfWo9PYCbjk3tamH9EYkKx0LZGRXjBpCfXTbpMpFg7a/ZelyKyAmkQgksVtr7/sBF2GwopaphWKIPXmGdBSUCR9/BbQpjsNUYZEBL7WoIKrO9CrhjvI0Z/hskZ8qfKjqIZtrXHT95Mb+l3Q8s6ssE7ZLxCzAdS7Z4gex2OqWfNvc3t4xnAJxObH/xE0SB4/lp3FFtB4H+tmL090moBo4qtsI79Yw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTAbN-0001Ej-QA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 20:06:53 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 20:06:29 +0100
Message-Id: <cover.1543690801.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-openembedded][PATCH v2 0/7] add ibus with anthy, pinyin and table support
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
X-List-Received-Date: Sat, 01 Dec 2018 19:06:55 -0000

This serie adds IBus with support for alphabetic tables (Chinese,
Korean ...), Pinyin (Chinese), Anthy (Japanese) into meta-openembedded
layer.

Motivation of the change in dconf is documented in:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=13040

This serie is in conflict with:

   https://patchwork.openembedded.org/patch/155947/

The following changes since commit c26b10b155cf7873ffc8e966f95fd4abed8230c6:

  opensc: 0.18.0 version fix fetch error (2018-11-16 14:46:44 -0800)

are available in the git repository at:

  git://github.com/psaavedra/meta-openembedded ibus
  https://github.com/psaavedra/meta-openembedded/tree/ibus

Pablo Saavedra (7):
  pyzy: add pyzy recipe
  dconf: remove gsettings inherit schemas
  ibus: add ibus recipe
  ibus-anthy: add ibus-anthy recipe
  ibus-pinyin: add ibus-pinyin recipe
  ibus-table: add ibus-table recipe
  ibus-table-chinese: add ibus-table-chinese recipe

 meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb     |    2 +-
 .../ibus/ibus-anthy/fix_anthy_include_in_gir.patch |   19 +
 meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb  |   37 +
 meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb  |   30 +
 .../0001-revert-CMakeLists.txt.patch               |  204 ++
 .../ibus/ibus-table-chinese/0002-add-Modules.patch | 2933 ++++++++++++++++++++
 .../0003-add-ChangeLog.prev.patch                  |   58 +
 .../0005-fix-cmake-cross-compile.patch             |  130 +
 .../ibus/ibus-table-chinese_1.8.2.bb               |   82 +
 meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb  |   29 +
 meta-oe/recipes-support/ibus/ibus_1.5.19.bb        |   97 +
 meta-oe/recipes-support/pyzy/pyzy_git.bb           |   21 +
 12 files changed, 3641 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
 create mode 100644 meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
 create mode 100644 meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb
 create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/0001-revert-CMakeLists.txt.patch
 create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/0002-add-Modules.patch
 create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/0003-add-ChangeLog.prev.patch
 create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/0005-fix-cmake-cross-compile.patch
 create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese_1.8.2.bb
 create mode 100644 meta-oe/recipes-support/ibus/ibus-table_1.9.21.bb
 create mode 100644 meta-oe/recipes-support/ibus/ibus_1.5.19.bb
 create mode 100644 meta-oe/recipes-support/pyzy/pyzy_git.bb

-- 
2.11.0


