Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A36C78C12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 22:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D2C93182A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 00:14:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xBCa4FTZ1mwb
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 00:14:56 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 21EA618092
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 00:14:56 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CDC91A0AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 00:14:56 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 014291A0AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 00:14:56 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 00:14:55 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id E93D623AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 00:14:55 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w6VMEgKK021443
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Aug 2018 00:14:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w6VMEgPK021442
	for openembedded-devel@lists.openembedded.org;
	Wed, 1 Aug 2018 00:14:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Aug 2018 00:14:41 +0200
Message-Id: <20180731221441.21402-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH] vim, vim-tiny: Make vim provide xxd without vim-tiny doing it too
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
X-List-Received-Date: Tue, 31 Jul 2018 22:14:56 -0000

There is no xxd in vim-tiny, so there is no reason to provide
vim-tiny-xxd. Besides, it is typically "xxd-native" that one wants to be
able to depend on, not "vim-native-xxd" (then the old dependency on
vim-native already did the trick).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb | 2 ++
 meta-oe/recipes-support/vim/vim_8.1.0172.bb      | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb
index 84ad659e0..23f6aec49 100644
--- a/meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb
+++ b/meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb
@@ -2,6 +2,8 @@ require vim_${PV}.bb
 
 SUMMARY += " (with tiny features)"
 
+PROVIDES_remove = "xxd"
+
 PACKAGECONFIG += "tiny"
 
 do_install() {
diff --git a/meta-oe/recipes-support/vim/vim_8.1.0172.bb b/meta-oe/recipes-support/vim/vim_8.1.0172.bb
index fd2afbc5a..371fe35ee 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0172.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0172.bb
@@ -1,5 +1,7 @@
 SUMMARY = "Vi IMproved - enhanced vi editor"
 SECTION = "console/utils"
+
+PROVIDES = "xxd"
 DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
@@ -111,5 +113,3 @@ ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-
-PROVIDES += "${PN}-xxd"
-- 
2.12.0


