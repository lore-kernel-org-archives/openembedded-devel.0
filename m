Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 290A86C1ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=nyiCI55I2vIhBTOVE/pix2wAoMfoTgA+k+p0EIvkDag=; 
	b=WLIQe4oMCTUWslYsB9JFo3LLkwdCwgAiBSMILxb+JKMN4UZVcO81Q+f4NQe4MAAgOKAq86ifrlrIk9VaGHWFtFtuiCazVlfEeWOANa+ICz6Q7zfLJt1vjKdSqD837pdV8/n2mz4FK7OLcZX/TC0ycvd2UUi0cNhee+Phzv8O/q2RycbCvEU7UgBo5tQeKpxZHNw7/cuQuwiT67TnFgemPGM6+wmcaE8/msFnH9hgQXUk5LSRfePc/H23Ms0tmzbc6VW60LftKXevLb3II8AZn6h7PCzg4EICfFgv2BXF36bilGR2oB+JrrA78bKTX/0MmzOg5YWUFatSVC4hnxtkpw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gL6NC-0003X3-BP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Nov 2018 13:58:54 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Nov 2018 13:58:12 +0100
Message-Id: <cover.1541767729.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-openembedded][PATCH 0/6] add ibus with anthy, pinyin and table support
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
X-List-Received-Date: Fri, 09 Nov 2018 13:14:42 -0000

This serie adds IBus with support for alphabetic tables (Chinese, Korean ...),
Pinyin (Chinese), Anthy (Japanese) into meta-openembedded layer.

The following changes since commit 15141ab55be96e7255fad4a03fca69cfb2ffd3d7:

  lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1) (2018-11-03 18:10:36 -0700)

are available in the git repository at:

  git://github.com/psaavedra/meta-openembedded ibus
  https://github.com/psaavedra/meta-openembedded/tree/ibus

Pablo Saavedra (6):
  pyzy: add pyzy recipe
  ibus: add ibus recipe
  ibus-anthy: add ibus-anthy recipe
  ibus-pinyin: add ibus-pinyin recipe
  ibus-table: add ibus-table recipe
  ibus-table-chinese: add ibus-table-chinese recipe

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
 11 files changed, 3640 insertions(+)
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


