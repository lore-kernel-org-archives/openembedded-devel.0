Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAE87C349
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 08:07:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1187304009187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Feb 2019 00:07:03 -0800 (PST)
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Fri, 1 Feb 2019 00:07:03 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Feb 2019 10:07:19 +0200
Message-ID: <20190201080720.23683-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] vim: Fix "--enable-gtk2-test" unrecognized option error
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
X-List-Received-Date: Fri, 01 Feb 2019 08:07:03 -0000
Content-Type: text/plain

Fix the following build error when vim PACKAGECONFIG[gtkgui] is enabled:
...
ERROR: vim-8.1.0347-r0 do_configure: QA Issue: vim: configure was passed
unrecognised options: --enable-gtk2-test [unknown-configure-option]
ERROR: vim-8.1.0347-r0 do_configure: Fatal QA errors found, failing task.
ERROR: vim-8.1.0347-r0 do_configure: Function failed: do_qa_configure
...

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-oe/recipes-support/vim/vim_8.1.0347.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_8.1.0347.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
index 46d229e03..a09582f99 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0347.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
@@ -37,7 +37,7 @@ do_configure () {
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
+PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
-- 
2.20.1


