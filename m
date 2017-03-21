Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BADF719D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 21:02:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2LL2DAo020186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 14:02:13 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Mar 2017 14:02:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Mar 2017 17:02:12 -0400
Message-ID: <1490130132-15271-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] aufs-utils-native: define CC
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
X-List-Received-Date: Tue, 21 Mar 2017 21:02:13 -0000
Content-Type: text/plain

With the new host tools path filtering, aufs-utils-native fails to build
as follows:

| ERROR: oe_runmake failed
| cc
| -isystem/build/tmp/work/x86_64-linux/aufs-util-native/3.14+gitAUTOINC+b59a2167a1-r0/recipe-sysroot-native/usr/include
| -O2 -pipe -O -Wall
| -I/build/tmp/work/x86_64-linux/aufs-util-native/3.14+gitAUTOINC
+b59a2167a1-r0/git/include
| -I/build/tmp/work/x86_64-linux/aufs-util-native/3.14+gitAUTOINC+b59a2167a1-r0/git/libau
| -D_GNU_SOURCE -I./libau -DAUFHSM_CMD=\"/usr/bin/aufhsm\"
| -DMOUNT_CMD=\"/bin/mount\" -DUMOUNT_CMD=\"/bin/um
ount\"
| -L/build/tmp/work/x86_64-linux/aufs-util-native/3.14+gitAUTOINC+b59a2167a1-r0/recipe-sysroot-native/usr/lib
| -L/build/tmp/work/x86_64-linux/aufs-util-native/3.14+gitAUTOINC+b59a2167a1-r0/recipe-sysro
ot-native/lib
| -Wl,-rpath-link,/build/tmp/work/x86_64-linux/aufs-util-native/3.14+gitAUTOINC+b59a2167a1-r0/recipe-sysroot-native/usr/lib
| -Wl,-rpath-link,/build/tmp/work/x86_64-linux/aufs-util-native/3.14+gi
tAUTOINC+b59a2167a1-r0/recipe-sysroot-native/lib
| -Wl,-rpath,/build/tmp/work/x86_64-linux/aufs-util-native/3.14+gitAUTOINC+b59a2167a1-r0/recipe-sysroot-native/usr/lib
| -Wl,-rpath,/build/tmp/work/x86_64-linux
/aufs-util-native/3.14+gitAUTOINC+b59a2167a1-r0/recipe-sysroot-native/lib
| -Wl,-O1  c2sh.c   -o c2sh
| make: cc: Command not found
| <builtin>: recipe for target 'c2sh' failed

While we could get 'cc' added to the tools whitelist, it is just as easy
to redefine CC to be gcc, which is already passed through.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 3d59e50f4a30..7d5352eb4e76 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -41,7 +41,7 @@ do_compile () {
 }
 
 do_compile_class-native () {
-    oe_runmake tools CPPFLAGS="-I${S}/include -I${S}/libau"
+    oe_runmake tools CPPFLAGS="-I${S}/include -I${S}/libau" CC="${BUILD_CC}"
 }
 
 do_install () {
-- 
2.5.0


