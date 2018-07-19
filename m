Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 61FAC789CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 07:23:36 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w6J7NaJp031082
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:23:36 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.44.55])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w6J7NaT5022868;
	Thu, 19 Jul 2018 09:23:36 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 558A510CD064;
	Thu, 19 Jul 2018 09:23:33 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2018 09:22:32 +0200
Message-Id: <20180719072232.14607-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] cppzmq: use cmake to install the package
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
X-List-Received-Date: Thu, 19 Jul 2018 07:23:36 -0000

This way also the required cmake configs are installed so other
packages can find it.

It seems also cleaner to use the upstream mechanism than to have our own
install script.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 4920bce8c..9aff59c6c 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -11,10 +11,7 @@ SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
 S = "${WORKDIR}/git"
 
-do_install () {
-        install -d ${D}/usr/include
-        install -m 0755 ${S}/zmq.hpp ${D}/usr/include/
-}
+inherit cmake
 
 PACKAGES = "${PN}-dev"
 
-- 
2.11.0


