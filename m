Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id E46D076809
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 12:53:46 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u7JCrkdN014856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:53:46 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.45])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id u7JCrk36021414;
	Fri, 19 Aug 2016 14:53:46 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 14:53:37 +0200
Message-Id: <1471611217-28377-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] nodejs: use shared zlib instead of bundled one
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
X-List-Received-Date: Fri, 19 Aug 2016 12:53:47 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
index 671d604..95a2048 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8e3c01094f0fcb889b13f0354e52f914"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl zlib"
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -39,7 +39,7 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --without-snapshot --shared-openssl \
+   ./configure --prefix=${prefix} --without-snapshot --shared-openssl --shared-zlib \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH', True), d)}" \
                --dest-os=linux \
                ${ARCHFLAGS}
-- 
2.1.4


