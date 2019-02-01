Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA1A7C3DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 08:07:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x11875Q5023227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Feb 2019 00:07:05 -0800 (PST)
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Fri, 1 Feb 2019 00:07:04 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Feb 2019 10:07:20 +0200
Message-ID: <20190201080720.23683-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201080720.23683-1-ovidiu.panait@windriver.com>
References: <20190201080720.23683-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] vim: Enable GUI support for x11 DISTRO_FEATURES
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
X-List-Received-Date: Fri, 01 Feb 2019 08:07:04 -0000
Content-Type: text/plain

Adding vim to a sato image will produce a non-working Gvim desktop entry
because GUI support is not compiled in:
# vim -g 
E25: GUI cannot be used: Not enabled at compile time 

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-oe/recipes-support/vim/vim_8.1.0347.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_8.1.0347.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
index a09582f99..0b99438b9 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0347.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
@@ -35,7 +35,10 @@ do_configure () {
 
 #Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
 PACKAGECONFIG ??= ""
-PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
+PACKAGECONFIG += " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
+"
 
 PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-- 
2.20.1


