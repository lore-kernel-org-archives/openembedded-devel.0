Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3716FA8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:26:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,780,1389740400"; d="scan'208";a="43723400"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 02 Apr 2014 14:26:09 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 2 Apr 2014 14:26:08 +0200
Received: from u75.usr.ingenico.loc (10.23.7.75) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 2 Apr 2014 14:26:07 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Apr 2014 14:24:26 +0200
Message-ID: <1396441466-14563-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] zsh: upgrade to 5.0.5
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
X-List-Received-Date: Wed, 02 Apr 2014 12:26:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Recipe cleanup:
- Add missing license in meta-oe/licenses
- Add DESCRIPTION
- Use ${BP} and ${SOURCEFORGE_MIRROR}

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/licenses/zsh                      | 37 +++++++++++++++++++++++++++++++
 meta-oe/recipes-extended/zsh/zsh.inc      | 14 +++++++-----
 meta-oe/recipes-extended/zsh/zsh_5.0.0.bb |  5 -----
 meta-oe/recipes-extended/zsh/zsh_5.0.5.bb |  5 +++++
 4 files changed, 50 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/licenses/zsh
 delete mode 100644 meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
 create mode 100644 meta-oe/recipes-extended/zsh/zsh_5.0.5.bb

diff --git a/meta-oe/licenses/zsh b/meta-oe/licenses/zsh
new file mode 100644
index 0000000..1fb1fc4
--- /dev/null
+++ b/meta-oe/licenses/zsh
@@ -0,0 +1,37 @@
+Unless otherwise noted in the header of specific files, files in this
+distribution have the licence shown below.
+
+However, note that certain shell functions are licensed under versions
+of the GNU General Public Licence.  Anyone distributing the shell as a
+binary including those files needs to take account of this.  Search
+shell functions for "Copyright" for specific copyright information.
+None of the core functions are affected by this, so those files may
+simply be omitted.
+
+--
+
+The Z Shell is copyright (c) 1992-2009 Paul Falstad, Richard Coleman,
+Zoltán Hidvégi, Andrew Main, Peter Stephenson, Sven Wischnowsky, and
+others.  All rights reserved.  Individual authors, whether or not
+specifically named, retain copyright in all changes; in what follows, they
+are referred to as `the Zsh Development Group'.  This is for convenience
+only and this body has no legal status.  The Z shell is distributed under
+the following licence; any provisions made in individual files take
+precedence.
+
+Permission is hereby granted, without written agreement and without
+licence or royalty fees, to use, copy, modify, and distribute this
+software and to distribute modified versions of this software for any
+purpose, provided that the above copyright notice and the following
+two paragraphs appear in all copies of this software.
+
+In no event shall the Zsh Development Group be liable to any party for
+direct, indirect, special, incidental, or consequential damages arising out
+of the use of this software and its documentation, even if the Zsh
+Development Group have been advised of the possibility of such damage.
+
+The Zsh Development Group specifically disclaim any warranties, including,
+but not limited to, the implied warranties of merchantability and fitness
+for a particular purpose.  The software provided hereunder is on an "as is"
+basis, and the Zsh Development Group have no obligation to provide
+maintenance, support, updates, enhancements, or modifications.
diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-extended/zsh/zsh.inc
index 03201d6..db51f39 100644
--- a/meta-oe/recipes-extended/zsh/zsh.inc
+++ b/meta-oe/recipes-extended/zsh/zsh.inc
@@ -1,14 +1,16 @@
-DESCRIPTION = "UNIX Shell similar to the Korn shell"
-HOMEPAGE="http://www.zsh.org"
+SUMMARY = "UNIX Shell similar to the Korn shell"
+DESCRIPTION = "Zsh is a shell designed for interactive use, although it is also a \
+               powerful scripting language. Many of the useful features of bash, \
+               ksh, and tcsh were incorporated into zsh; many original features were added."
+HOMEPAGE = "http://www.zsh.org"
 SECTION = "base/shell"
 
-
-LICENSE = "ZSH"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=ad234d4b46db63491c4a9789da4fb341"
+LICENSE = "zsh"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b7bc853894664be455a922db9805288e"
 
 DEPENDS = "ncurses bison-native"
 
-SRC_URI = "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
 inherit autotools gettext update-alternatives
 
diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb b/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
deleted file mode 100644
index 3421d95..0000000
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require zsh.inc
-DEPENDS = "ncurses libcap libpcre gdbm groff-native"
-
-SRC_URI[md5sum] = "01df38e4aa34aa227462fdf2f6d4c5cd"
-SRC_URI[sha256sum] = "835194ea83abd812b5fdb1d2bfa6427c4c4e95e771c4a75e9006037af8efd264"
diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
new file mode 100644
index 0000000..a7170dc
--- /dev/null
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
@@ -0,0 +1,5 @@
+require zsh.inc
+DEPENDS += "libcap libpcre gdbm groff-native"
+
+SRC_URI[md5sum] = "6fb0e3e52a0f8de5ca63138391b81ce0"
+SRC_URI[sha256sum] = "b35cf19e4a6ba39fd03c6372b8a8760a491cc2e2e4aba3d15023ff291c2894b4"
-- 
1.8.5.4


