Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5E560135
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 20:08:25 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id f12so1606040wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=mOi6dCHqJhDNwwiysPsuFVi9pcYjMTbz7T2FBni7+JY=;
	b=uQK9LOkgyeMWHBd8DKmVlBme3jGtgqg68g7dUvucEp+JZxiYARr/yS01Ws4nxgTyLy
	phQLZQP67vo+IU7WrXIpfKHwasFpsQR35Qfvo57LpNSyPfOFPqJHAjotdVYzQ8dJQH56
	K7NScnIlbmAVZ/jblnGZuYS/R9ldyoK8KQOONcjGTzx58uJXo3Tdd0w5LD6Jonnt1RiT
	HG5Ftmckck9ecY0jypJ7kt9a2yf2xJ0+FLe0zOGtlAAu3EHHTtywnYNTaGU6o0SocP+N
	DSSn+ylG131qLmtJRiiPLWvRSvERTjjfPqluN+/vRJagP9SqB0IjVGfPRf7GDi2UQcb4
	Lo+A==
X-Received: by 10.194.77.167 with SMTP id t7mr12352002wjw.27.1379102906016;
	Fri, 13 Sep 2013 13:08:26 -0700 (PDT)
Received: from turn.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id b11sm5826444wik.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 13:08:25 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2013 21:08:22 +0100
Message-Id: <1379102902-3192-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH] vim: upgrade to v7.4.27 and refactor
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
X-List-Received-Date: Fri, 13 Sep 2013 20:08:26 -0000

'vim.inc' is merged into the new recipe 'vim_7.4.27.bb', the recipe is slightly
reorganised and a minor omission in the comments is corrected.

DESCRIPTION is replaced with SUMMARY. PR and INC_PR values are dropped. The
variable PV_MAJOR is also dropped as it isn't used.

LIC_FILES_CHECKSUM is updated as an address and version number given in the
license have been modified. The main license text itself is unchanged.

The setting of PARALLEL_MAKE to force single-threaded compilation is removed as
there is no justification in the git history for this being needed and the
compilation completes fine without it.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/vim_7.3.1314.bb           |  7 -------
 .../recipes-support/vim/{vim.inc => vim_7.4.27.bb}    | 19 ++++++++-----------
 2 files changed, 8 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vim/vim_7.3.1314.bb
 rename meta-oe/recipes-support/vim/{vim.inc => vim_7.4.27.bb} (87%)

diff --git a/meta-oe/recipes-support/vim/vim_7.3.1314.bb b/meta-oe/recipes-support/vim/vim_7.3.1314.bb
deleted file mode 100644
index 1be5a91..0000000
--- a/meta-oe/recipes-support/vim/vim_7.3.1314.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ${PN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCREV = "v7-3-1314"
-
-SRC_URI += "file://configure.in_remove_CC_quotes.patch;patchdir=.."
diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim_7.4.27.bb
similarity index 87%
rename from meta-oe/recipes-support/vim/vim.inc
rename to meta-oe/recipes-support/vim/vim_7.4.27.bb
index 991ba74..77507d4 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim_7.4.27.bb
@@ -1,20 +1,19 @@
-DESCRIPTION = "Vi IMproved - enhanced vi editor"
+SUMMARY = "Vi IMproved - enhanced vi editor"
 SECTION = "console/utils"
 DEPENDS = "ncurses"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=4c91d841bb7b75f68b5bb8ad7118f5b8"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc770691c967b8f8"
 
-PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-VIMDIR = "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
-
-INC_PR = "r13"
-
-SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim"
+SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
+	file://configure.in_remove_CC_quotes.patch;patchdir=.."
+SRCREV = "v7-4-027"
 
 S = "${WORKDIR}/${PN}/src"
 
+VIMDIR = "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
+
 inherit autotools update-alternatives
 
 # vim configure.in contains functions which got 'dropped' by autotools.bbclass
@@ -28,7 +27,7 @@ do_configure () {
     touch auto/config.mk auto/config.h
 }
 
-#Available PACKAGECONFIG options are gtkgui, x11, tiny
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
 PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
@@ -76,5 +75,3 @@ ALTERNATIVE_${PN} = "vi"
 ALTERNATIVE_TARGET[vi] = "${bindir}/${PN}"
 ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
 ALTERNATIVE_PRIORITY[vi] = "100"
-
-PARALLEL_MAKE = ""
-- 
1.8.4


