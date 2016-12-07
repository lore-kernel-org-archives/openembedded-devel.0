Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5046FF80
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 13:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uB7DwYK4016012; Wed, 7 Dec 2016 13:58:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CKRM6uK5AhRF; Wed,  7 Dec 2016 13:58:34 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uB7DwWEI016007
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Dec 2016 13:58:33 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cEcjw-0001M7-7I; Wed, 07 Dec 2016 13:58:32 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2016 13:58:28 +0000
Message-Id: <1481119108-5173-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] subversion: Fix issues in LDFLAGS sed manipulation
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
X-List-Received-Date: Wed, 07 Dec 2016 13:58:37 -0000

The existing sed expression can match expressions like
--sysroot=/some/path/xxx-linux/ which clearly isn't intended and
injects incorrect paths into LDFLAGS.

Fix this in the same way we address the problem in CFLAGS. This fixes corrupt
build paths and incorrect paths in .la files amongst other issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/subversion/serfmacro.patch          | 22 ++++++++++++++++++++++
 .../subversion/subversion_1.9.4.bb                 |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/serfmacro.patch

diff --git a/meta/recipes-devtools/subversion/subversion/serfmacro.patch b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
new file mode 100644
index 0000000..9a45cb9
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
@@ -0,0 +1,22 @@
+The existing sed expression can match expressions like 
+--sysroot=/some/path/xxx-linux/ which clearly isn't intended and 
+injects incorrect paths into LDFLAGS.
+
+Fix this in the same way we address the problem in CFLAGS.
+
+RP 2016/12/7
+Upstream-Status: Pending
+
+Index: subversion-1.9.4/build/ac-macros/serf.m4
+===================================================================
+--- subversion-1.9.4.orig/build/ac-macros/serf.m4
++++ subversion-1.9.4/build/ac-macros/serf.m4
+@@ -171,7 +171,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
+           SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_pc_arg --cflags | $SED -e 's/ -D[^ ]*//g' -e 's/^-D[^ ]*//g'`]
+           SVN_SERF_LIBS=`$PKG_CONFIG $serf_pc_arg --libs-only-l` 
+           dnl don't use --libs-only-L because then we might miss some options
+-          LDFLAGS=["$LDFLAGS `$PKG_CONFIG $serf_pc_arg --libs | $SED -e 's/-l[^ ]*//g'`"]
++          LDFLAGS=["$LDFLAGS `$PKG_CONFIG $serf_pc_arg --libs | $SED -e 's/ -l[^ ]*//g' -e 's/^-l[^ ]*//g'`"]
+           break
+         else
+           AC_MSG_RESULT([no])
diff --git a/meta/recipes-devtools/subversion/subversion_1.9.4.bb b/meta/recipes-devtools/subversion/subversion_1.9.4.bb
index fa6a7f2..3e35940 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.4.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://0001-fix-svnadmin-create-fail-on-x86.patch \
+           file://serfmacro.patch \
            "
 
 SRC_URI[md5sum] = "29121a038f87641055a8183f49e9739f"
-- 
2.7.4


