Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Prgqr-0004tI-KG
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 02:15:41 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrgpY-0007NW-N4 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 17:14:20 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 21 Feb 2011 17:14:20 -0800
Received: from localhost.localdomain ([172.30.80.151]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Feb 2011 18:14:19 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Feb 2011 18:14:06 -0700
Message-Id: <1298337246-11794-2-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1298337246-11794-1-git-send-email-tom_rini@mentor.com>
References: <1298337246-11794-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Feb 2011 01:14:19.0771 (UTC)
	FILETIME=[D4EACCB0:01CBD22D]
Subject: [PATCH] bitbake.conf: Simplify TARGET_CPPFLAGS/LDFLAGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Feb 2011 01:15:42 -0000

This is based on poky's ba2e1f4d933c37b372d6749d64614f2510ee9d7b, which
simplifies TARGET_CPPFLAGS (and thus CFLAGS) and TARGET_LDFLAGS
based on gcc any company having --sysroot

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f005658..ec20332 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -502,7 +502,7 @@ PATCHRESOLVE = 'noop'
 
 export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
-export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${includedir}"
+export TARGET_CPPFLAGS = ""
 export SDK_CPPFLAGS = "-isystem${STAGING_DIR_SDK}${includedir} -isystem${STAGING_DIR_HOST}${includedir}"
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
@@ -520,7 +520,7 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = '${@["-L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} -Wl,-O1 ${TARGET_LINK_HASH_STYLE}", "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]}'
+export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
 
 export SDK_LDFLAGS = "-L${STAGING_DIR_SDK}${libdir} \
                          -Wl,-rpath-link,${STAGING_DIR_SDK}${libdir} \
-- 
1.7.0.4



