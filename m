Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 922366D5B1
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=S/yL6i8ibCVaOymJHhLUCoNCFSifaiOx9wmPoe+KqD4=; 
	b=KnAjOfAIJYp+B9czXrYZ3r8A+kKc1+pxKyg5XkmGgs98/p6C9ukJQJq4vnZHU6n2o2IPGHM4pLbRThGskXTgq11u1oLatweC53e8+3JIf6XKd9+MVu5RtMToFRIQtk+gq+Ns/Oxvv9WPApFrMCFsytvugNbk2GdREIPiAGmdT/r22i47tirhUhKyiewgLAqfRY5A4ZrqbBDB1UuZMyzD/u91GESaskVP+V+U0G+pkcuc6OKdHxPpKdm2QHLPnV2AvDDkY160PFabQzTSY+gVXhuxmYIc8+JMlPinVUGx5D903RDmnN3/1hvrGRZTy9LbEDlgn6xuzu+x/wemBEHRbw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTBQA-000699-Pl
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 20:59:22 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 20:59:09 +0100
Message-Id: <cover.1543694144.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-openembedded][PATCH v3 0/7] add ibus with anthy, pinyin and table support
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
X-List-Received-Date: Sat, 01 Dec 2018 19:59:24 -0000

This serie adds IBus with support for alphabetic tables (Chinese,
Korean ...), Pinyin (Chinese), Anthy (Japanese) into meta-openembedded
layer.

Motivation of the change in dconf is documented in:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=13040

This serie is in conflict with:

   https://patchwork.openembedded.org/patch/155947/

The following changes since commit ebc7b9e20ac22f6f2ad373621917f53e8a9af81c:

  poppler: Upgrade to 0.71.0 (2018-11-29 18:55:52 -0800)

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

 meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb     |    2 +-
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


