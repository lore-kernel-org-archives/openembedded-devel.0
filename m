Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id D6C3C607A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 20:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 99B2D20AD5;
	Thu, 12 Oct 2017 20:44:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ntVs4IIhjbCb; Thu, 12 Oct 2017 20:44:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 78D672006B;
	Thu, 12 Oct 2017 20:44:56 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 03E791626E6;
	Thu, 12 Oct 2017 16:44:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Oct 2017 16:44:47 -0400
Message-Id: <1507841087-145584-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH] qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
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
X-List-Received-Date: Thu, 12 Oct 2017 20:44:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

ptest.bbclass provides a set of standard do_*_ptest_base tasks. Each of
them calls a corresponding regular do_*_ptest task, that components are
supposed to override for own implementation. When PTEST_ENABLED is not
set, an anonymous python function removes all do_*_ptest_base tasks from
the queue. qt5-ptest.inc adds a special case for do_populate_sysroot and
re-arranges the order or ptest tasks due to that. But, unfortunately,
do_install_ptest was added directly, not do_install_ptest_base, hence when
"ptest" is disabled and all other do_*_ptest_base tasks are removed, this
one do_install_ptest task is left w/o dependencies and gets scheduled for
execution very early on, even before pseudo-native gets built and stages
"fakeroot" functionality. The fix is to add do_install_ptest_base task,
which calls do_install_ptest only when "ptest" is enabled.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/qt5-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
index 4844878..480a06d 100644
--- a/recipes-qt/qt5/qt5-ptest.inc
+++ b/recipes-qt/qt5/qt5-ptest.inc
@@ -5,7 +5,7 @@ inherit ptest
 addtask do_populate_sysroot after do_install before do_compile_ptest_base
 deltask do_compile_ptest_base
 addtask do_compile_ptest_base after do_populate_sysroot before do_install_ptest
-addtask do_install_ptest after do_compile_ptest_base before do_package
+addtask do_install_ptest_base after do_compile_ptest_base before do_package
 
 do_compile_ptest() {
     cd ${S}/tests
-- 
2.7.4


