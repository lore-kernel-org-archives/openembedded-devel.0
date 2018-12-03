Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 73F146C64B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=S/yL6i8ibCVaOymJHhLUCoNCFSifaiOx9wmPoe+KqD4=; 
	b=rR3FcoeH2F2NnbI0jfY0Lif4G/72qi6Edhn12m5Ft3Ua0V3XAXIXSgBNNS4ZAtTJ1FF7BjGFhatiAPx7TIYn91DMUSyzBRk5u0wnDbKnxoopsA+cZ1ksaPzHoe5Cn5tol/4/olOu63tNFKZdN11yovHDRYHT918hduUpIif1mmXGqxscsIt/aEEtapB0/a6PcZ07IcSbcOaoh1bvZf41j5Os43m5k8Buj7NWSTFciXcc5R7lUOAKxbaGCSKw/6R/w61zNUMxxYlItwm52HLVLnvp/K+XbfVnzQL4noy6BnLGgsYN+YoTWESgT8Cs1vMTXbNVRV2kw36ddIFWqrquvw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTnb5-0007Lt-Ii
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 13:45:11 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2018 13:45:02 +0100
Message-Id: <cover.1543840903.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-openembedded][PATCH v4 0/7] add ibus with anthy, pinyin and table support
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
X-List-Received-Date: Mon, 03 Dec 2018 12:45:13 -0000

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


