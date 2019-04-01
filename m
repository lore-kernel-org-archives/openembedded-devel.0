Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id DBEF47D098
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:09:07 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x31E98Qk028106
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Apr 2019 16:09:08 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x31E98io014801;
	Mon, 1 Apr 2019 16:09:08 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B45E095182D;
	Mon,  1 Apr 2019 16:09:07 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2019 16:08:20 +0200
Message-Id: <20190401140821.2226-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190401140821.2226-1-andrej.valek@siemens.com>
References: <20190401140821.2226-1-andrej.valek@siemens.com>
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-java][PATCH 1/2] openjre-8: allow build from hosttools
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
X-List-Received-Date: Mon, 01 Apr 2019 14:09:08 -0000

From: Peter Marko <peter.marko@siemens.com>

Buildding whole native openjdk toolchain takes very long time
as is a waste of resources.

Following layer configuration allows to build from hosttools:
HOSTTOOLS += "java javac pack200"
ASSUME_PROVIDED += "openjdk-8-native"

Fow this, special native directory overrides need to be removed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index d04b0d3..a2bfa27 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -40,6 +40,8 @@ PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
 
 PACKAGECONFIG[repack] = ",,,"
 
+PACKAGECONFIG[hosttools] = ",--with-tools-dir=${STAGING_DIR_NATIVE} --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native --with-cacerts-file=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/jre/lib/security/cacerts,,"
+
 CACHED_CONFIGUREVARS = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_includes=${STAGING_INCDIR}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_libraries=${STAGING_LIBDIR}', '', d)} \
@@ -57,9 +59,6 @@ EXTRA_OECONF_append = "\
     --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
     \
     --with-sys-root=${STAGING_DIR_HOST} \
-    --with-tools-dir=${STAGING_DIR_NATIVE} \
-    --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native \
-    --with-cacerts-file=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/jre/lib/security/cacerts \
     \
     --disable-precompiled-headers \
     --disable-zip-debug-info \
-- 
2.11.0


